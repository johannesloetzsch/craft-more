# Machine definition (static mechanics)

> The static state-machine mechanics the tables do not carry: the phases, the gating
> composition and the idempotency rules — the source for how a move resolves. The two
> tables themselves live in `SKILL.md`. Like `CONTRACT.md`, this document is the
> source; nothing is derived from it.

## Scope and precedence

Three documents, three jobs — each points at the others instead of repeating them:

- **`DESIGN.md`** — the principles (why gating, budget, survival, decay, verification).
- **`CONTRACT.md`** — the data-model semantics (goal tree, snapshots, contract,
  results, run state, budget).
- **`MACHINE.md`** (here) — the static mechanics: which states exist, which moves
  exist, what guards them, and what a state may do.

Where two overlap, the narrower document wins and the other points to it: data-model
questions answer in `CONTRACT.md`, mechanics here, principles in `DESIGN.md`. The
contract schema (`contract.schema.json`) is derived from `CONTRACT.md`; the two tables
live in `SKILL.md` — the authoritative router (CHECK 1).

## Phases

`plan` and `build` are **phase groupings, not states**:

- **plan** — `parse`, `schedule`, `grill`, `investigate`, `suggest`
- **build** — `approve`, `exec`, `validate`

## Where the tables live

The two tables — the states table (with its column legend) and the transitions table
(with the entry line, its column legend, the catch-all row and the resolution
discipline) — live in `SKILL.md`, the authoritative router (CHECK 1); they are not
repeated here. The mermaid diagram in `README.md` is human-facing and non-authoritative
— where it disagrees with `SKILL.md`, `SKILL.md` wins. Per-state detail lives in the
per-state files, not here.

## Gating

- The `Allowed` column is a **static whitelist per state**: default-deny, tool names
  only, and it never says anything about goal-tree nodes.
- `approve.permissions` is the **dynamic narrowing** — concrete tool/path globs for
  this run: effective = `Allowed ∩ permissions`. A grant can never widen the static
  list. It is re-granted at every `approve` crossing and carried in the run state, so
  it dies with the run. 📌 Empty-permissions semantics for `exec` is still open.
- `Must not ∩ Allowed` = **inconsistency**, checked in CHECK 1. `Must not` is
  additional validation; it never grants anything by omission.
- `exec` is the only state that may mutate the workspace; everything upstream of it
  is reversible by construction.

## Idempotency

The artifact surface is one state, so the rule is local:

- **`approve` declares it** as part of the contract handed to `exec`:
  `idempotency: { retry: <safe | unsafe>, cleanup: <string | none> }`. 📌 Proposed
  semantics for `cleanup` — the compensating action that must run before any
  re-attempt makes it legal: `safe` + `none` re-applies and converges; `unsafe` +
  action retries only after the action ran; `unsafe` + `none` never retries
  autonomously — hand back to the user.
- **`validate` is always artifact-idempotent**: it reads and produces a verdict as
  result data. 📌 Tool byproducts it triggers (coverage files, caches) are regenerated,
  not authored — where that line sits is still open.
- **`REPORT` is exempt** — it is a display monad; displaying is not persisting
  (`CONTRACT.md`). Anything report-side that persists is no longer a report but an
  `exec` action.
- **Every other state** is idempotent by construction: read-only states, decisions as
  contract data, snapshots immutable. Run state and budgets are contract data, not
  artifacts. 📌 Persisting them is never automatic — only the user or `schedule` may
  persist, which is what makes a re-entry point unique.

## Parked

- Bootstrap rule-injection: on the first entry to `parse` only, or on every entry.
- The rejected-approve contract fields: are `decision` and `reason` always required?
  (Until then the `approve` rows carry their conditions as 📌.)
- The `Reset` column values (which state executes a context reset).
- Guard values marked 📌 in both tables.
- Empty `permissions` semantics · `validate` byproducts · run-state persistence.
