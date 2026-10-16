# Contract (draft)

> Semantics of the contract model. The JSON schema is *derived* from these
> definitions, not the source; it lives in `contract.schema.json`.
>
> The static machine mechanics — the two tables, guards, entry, gating composition —
> live in `MACHINE.md`; the principles in `DESIGN.md`. On overlap the narrower
> document wins: data-model questions here, mechanics in `MACHINE.md`, principles in
> `DESIGN.md`.

## The model in one breath

The machine advances as **contracts** handed from one state to the next, resolved
against a **static machine definition**. The plan is a **goal tree**, captured in
immutable **snapshots**. The contracts of started tasks live in a small, separate
**run state**.

## Goal tree

The plan is a **goal tree**: every node is a subgoal. Nodes are canonical and durable.

    node = {
      id,          // "node_0001" — stable; survives renames; referenced by a contract's focus_id
      label,       // human-readable, one line; may change freely
      node_type,   // durable role (see below)
      goal,        // string — the subgoal; canonical, present even before the node starts
      abort,       // string — the local abort condition for this node/branch
      budget,      // the ALLOWED allocation (see Budget)
      children     // ordered array of goal nodes (inline); the structure link
    }

- `children` are inline goal nodes, so the tree is nested; renaming a parent keeps its children.
- `goal` and `abort` live here only — the canonical source. They are not mirrored into the context.

## node_type

The durable node types map the goal tree (the parse-back outline):

    FINISH, CHECK, STEER, DECIDE, EVIDENCE, PIN, PLAN, EXEC,
    INSPECT, LAB, CLEAN, APPROVE, NIGHTSHIFT          (13)

The remaining parse-back markers are **transient**; they are not nodes but **result**
content:

    OK, WARN, REPORT, FINALIZE                        (4)

Which state may act on which durable `node_type`, and which `result_type` a state's
`result` may carry, is defined together with the state machines.

## Snapshot

A **snapshot** is an immutable, versioned capture of the goal tree. It is an artifact
(an artifact): a small file. A plan change creates a new version; older versions stay
readable (undo, diff, recovery, audit) and may be pruned.

    snapshot = {
      id,       // "snapshot_0007" — prefix + zero-padded counter (width 4)
      created,  // RFC 3339, UTC, seconds — e.g. "2026-10-16T14:40:00Z"
      root      // the root goal node of the captured tree
    }

## Identifiers

Identifiers are readable strings, not bare numbers:

    node.id      = "node_0001"       // "node_"     + zero-padded counter (width 4)
    snapshot.id  = "snapshot_0007"   // "snapshot_" + zero-padded counter (width 4)

- `node` and `snapshot` have **separate** counters.
- The prefixes are a **convention** (not schema-enforced), for logs, prose and arguments.
- `created` is **RFC 3339, UTC, seconds** — e.g. `2026-10-16T14:40:00Z`.

## Contract

A **contract** is the transient hand-off between two states.

    contract = { from, result, context }

- `from` — the state that produced this contract (the predecessor). The guard reads it
  to select the transition and to detect an illegal move.
- `result` — what `from` produced. An object `{ result_type, … }`: the transient marker
  `result_type` plus the named, state-specific fields (see Result). Transient: one hop,
  the smallest thing the successor needs.
- `context` — the run context of this task's machine:

    context = {
      focus_id,          // node.id of the goal node this task works on
      snapshot_id,       // snapshot.id this contract is bound to
      remaining_budget   // what is left of the focus node's allowed budget
    }

- `focus_id` — a pointer into the goal tree; the named node carries the canonical goal/abort.
- `snapshot_id` — the contract is **bound** to a snapshot (pinning): it isolates
  in-flight tasks when the plan changes, and is what later concurrency needs.
- `remaining_budget` — the still-available budget of the focus node.

## Bootstrap

The first state has no predecessor, so its input is not a result but a **boot contract**:
a defined contract carrying the initial `context` (focus, snapshot, remaining budget),
supplied by the always-on layer. The machine definition is static and does not travel; the
agent re-reads and re-injects it (see the re-injection hub).

## Result

`result` is what `from` produced: an object whose first field is the transient marker
`result_type`, followed by named, state-specific fields.

    result = { result_type, … }

    result_type ∈ { OK, WARN, REPORT, FINALIZE }

The named fields, per `from` state:

    parse        { text: [string] }                        // text passages
    schedule     { next_step: <grill | investigate | suggest> }
    grill        { exchanges: [ { question, answer } ] }
    investigate  { findings: [string] }
    suggest      { suggestions: [string] }
    approve      { permissions: [string] }                 // tool/path globs
    exec         { exit_code: integer }                    // larger output is an artifact
    validate     { verdict: <pass | fail | uncertain>, evidence: [string] }   // refs

`from` discriminates which variant of `result` is valid.

## Run state

The **run state** is the set of contracts of **started** tasks — one contract per
started task. It is a list, not a map.

    run_state = [ contract, … ]

The **instance** — the state actually executing — is the current state plus this run state.

- start a task → its contract enters the list; finish → it leaves.
- primitive, single-threaded: process the **first** contract.
- **scheduling** is a state: the `schedule` state may reorder the list (and, later,
  select more than one contract for concurrency).
- recovery reads this list.

## Budget

`budget` is the **allowed** allocation; it is durable on the node and changes only on
re-plan.

    budget = { tokens, seconds, tool_calls: [ { tool, count } ], transitions }

- `tool_calls` is an array of `{ tool, count }` — a map would not be structured-output
  compatible.
- `transitions` bounds loops — the machine does not terminate by itself.
- children **partition** the parent: `Σ children.budget ≤ node.budget`.
- **remaining** is transient and lives in the contract's `context`; consumed = allowed −
  remaining. The tree stays immutable between plan changes.

## Produced data, three kinds

- **Artifact** — durable, outside the model's context (files; includes snapshots).
- **Result** — transient, one hop (in the contract).
- **Report** — what the user sees; displaying is not persisting.

## Structured-output compatibility

The schema must be compatible with the host's [structured outputs](https://developers.openai.com/api/docs/guides/structured-outputs).

## Deferred / open

- `state → node_type / result` correspondence: defined with the state machines.
- `tool`: host tool name vs portable class.
- `permissions` glob grammar (tool/path globs): refined with the state machines.
