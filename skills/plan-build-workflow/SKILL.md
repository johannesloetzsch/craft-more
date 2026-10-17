---
name: plan-build-workflow
description: Use when starting or continuing one unit of work — a goal to plan and to build. Runs the unit as an explicit state machine: announce the state each turn, do what it expects, hand on a contract, resolve the next edge, and report. The machine is the two tables here; the data model is in CONTRACT.md. Load it when a session begins to plan or build something.
---

# Plan-Build Workflow (PoC)

You are the executor of a state machine. Which states exist, how they move and what
guards them is the two tables below; the data model behind the moves — the contract,
its result, the context, the run state and the budget — is defined in `CONTRACT.md`
(§Contract · §Result · §Run state · §Budget), with the derived schema in
`contract.schema.json`.

Every turn is one loop: announce your state, do what it expects, hand on a contract,
resolve the next edge, report — and hand back to the user. The machine never
terminates by itself.

This is a PoC/mock: guards marked 📌 are **pass-through** (treat them as satisfied),
and the instance lives in context only — nothing is persisted. The mechanics the tables
do not carry — phases, gating, idempotency and the open questions — are in `MACHINE.md`
(§Phases · §Gating · §Idempotency · §Parked).

## States table

The two tables cover **states and their transitions only** — never goal-tree nodes;
`node_type` belongs to `CONTRACT.md`. Values are **provisional until CHECK 1** fills
the state inventory, and stay **summary-level**: anything not said here lives one hop
away in the per-state detail file.

Columns: `Expected` (what it must produce) · `Allowed` (static tool whitelist,
default-deny) · `Must not` (additional validation, never a permission) · `Guard` (the
standing guard, valid on every path into this state) · `Idempotency` (rule for this
state) · `Reset` (permission to reset the run context).

On arrival a state first completes the edge's `To guard` — that closes the
transition — then its own `Guard`, the standing one that holds however the state was
reached. Where a guard belongs is decided case by case: holds it on every incoming
edge → `Guard` here; differs it per edge → `To guard` in the transitions table.

Reset values are parked 📌: a context reset is only allowed on a user re-plan, and
which state executes it is still open.

| State | Expected | Allowed | Must not | Guard | Idempotency | Reset |
|---|---|---|---|---|---|---|
| `parse` | read input, re-orient, enter here | read · search · ask | write anything | 📌 | read-only — none | 📌 |
| `schedule` | pick `next_step`; rule-reinjection hub | read · search | ask the user, act | 📌 | read-only — none | 📌 |
| `grill` | put the frontier to the user | read · ask | decide alone, write | 📌 | read-only — none | 📌 |
| `investigate` | gather findings | read · search | write | 📌 | read-only — none | 📌 |
| `suggest` | propose suggestions | read · search | implement | 📌 | read-only — none | 📌 |
| `approve` | accept or reject with reason, grant, declare idempotency | read · ask | run the step | 📌 | declares `exec`'s rule | 📌 |
| `exec` | run the approved step | commands · edits (⊆ permissions) | retry autonomously | 📌 | **declare** — `retry` + `cleanup` | 📌 |
| `validate` | verify, verdict + evidence | commands · read | edit, self-certify | 📌 | **always** — artifact-idempotent 📌 | 📌 |

## Transitions table

Entry, as its own line before the rows:

    Entry: parse — Cold-Start · Resume · Fallback

A fresh run, a restored run and a fallback all begin at `parse`. A fallback
**re-orients**: `context`, `run_state`, snapshot and budget are preserved. It may fire
automatically only when the fallback is lossless (reported as a warning in the
handback); anything that touches data, budget or executed work is only **offered** to
the user.

Columns: `Condition` (which edge is selected — cheap, read from the `from` contract's
result and context) · `From guard` (what the leaving state must still do before it
hands over) · `To guard` (what must hold on arrival before the `to` state may act).

| from → to | Condition | From guard | To guard |
|---|---|---|---|
| `parse → schedule` | parse produced its result | 📌 | 📌 |
| `schedule → grill` | `next_step = grill` | 📌 | 📌 |
| `schedule → investigate` | `next_step = investigate` | 📌 | 📌 |
| `schedule → suggest` | `next_step = suggest` | 📌 | 📌 |
| `investigate → grill` | findings delivered | 📌 | 📌 |
| `suggest → grill` | suggestions delivered | 📌 | 📌 |
| `grill → parse` | frontier **not** empty — plan reshaped, frontier recomputed | 📌 | 📌 |
| `grill → approve` | frontier empty | finalize — prepare the approval: files, counts, required grants and their explanations | 📌 |
| `approve → exec` | granted 📌 | permissions and idempotency declared 📌 | 📌 |
| `approve → parse` | rejected 📌 | reason produced 📌 | 📌 |
| `exec → validate` | `exit_code` present | writes flushed, artifacts saved 📌 | 📌 |
| `validate → parse` | unconditional | verdict and evidence complete 📌 | 📌 |
| `* → parse` | no row applies, or a guard fails | — | — |

**The catch-all row.** If no condition above applies, or any `From guard` /
`To guard` / state `Guard` fails, the machine does not search further and does not
guess: the contract the failing state received is passed **1:1, unchanged, no new
fields** to the entry state, `parse`. `parse` diagnoses which edge failed from
`from` + `result` + `context` (and the run state), reports the why to the user and
re-orients; the handback warns. `parse` is therefore the state to implement most
robustly: if it fails too, the user still gets a report and can debug. Any different
error handling must be declared as its own row above — this one rule is unlike every
other transition and is stated here on purpose.

Resolution discipline:

- Rows are worked **top to bottom; only the `Condition` selects** — first applicable
  wins. Guards never select; failing one is the catch-all's case.
- On arrival: `To guard` first, closing the transition, then the state's own `Guard`.
  Costs follow the same order: `From guard` is charged to `from`, `To guard` and the
  state's `Guard` to `to`.
- A state hands off only when its `From guard` holds; a state acts only when its
  `Guard` holds.
- The `transitions` budget bounds any catch-all loop; the machine never terminates by
  itself.

## Turn protocol

One turn, in order:

1. **Read back** — open with the `🏷️ [STATE]` line (§Output): the state you are in.
2. **Do what the state expects** — the `Expected` column of the states table.
3. **Hand on a contract** — `{ from, result, context }` per `CONTRACT.md` (§Contract ·
   §Result); `context` carries `focus_id`, `snapshot_id`, `remaining_budget`.
4. **Resolve the next edge** — work the `from`-block of the transitions table top to
   bottom; the first row whose `Condition` holds wins. Guards marked 📌 are
   pass-through. No row applies, or a guard fails → the catch-all `* → parse`, the
   contract forwarded 1:1.
5. **Set your state** to the row's `to`.
6. **Report** — emit the turn's lines (§Output); each hop is its own `⏩ [TRANSITION]`
   line, never a chain — and close every resolved edge with the `🤝` and `📚` lines.

## Instance

The instance is what you hold and advance — in context only:

    { state, run_state, context }

- `state` — the current state's name (a row of the states table).
- `run_state` — the list of contracts of started tasks (`CONTRACT.md` §Run state);
  process the first.
- `context` — `{ focus_id, snapshot_id, remaining_budget }` (`CONTRACT.md` §Contract).

No persistence for the PoC: nothing is written to disk, the instance lives in the
conversation.

## Boot

Entry is `parse` (transitions table, Entry line). On a cold start, open with the
`🚀 [BOOT]` line (§Output); then:

1. Read the user's first message. If it carries no goal, ask — `parse` re-orients, and
   asking is within its `Allowed` (read · search · ask).
2. Create the initial context: one goal node, one snapshot and an initial budget —
   minimal tokens, per `CONTRACT.md` (§Goal tree · §Snapshot · §Budget · §Bootstrap).
3. Start the first turn at `parse`: parse the input, hand on its contract, resolve.

## Output

Every **machine line** carries exactly one **machine marker**; ordinary prose (findings,
suggestions, a recap) is written as plain text. Only the markers below may appear.

| Output | Marker |
|---|---|
| Boot | 🚀 `[BOOT]` |
| State readback | 🏷️ `[STATE]` |
| Focus | 👀 `[FOCUS]` |
| Snapshot | 💾 `[SNAPSHOT]` |
| Budget | 💰 `[BUDGET]` |
| Result | one per `result_type`: ✅ `[OK]` · ⚠️ `[WARN]` · 🧾 `[REPORT]` · 📋 `[FINALIZE]` · 🔐 `[APPROVE]` |
| Approval | 🔐 `[APPROVE]` |
| Transition | ⏩ `[TRANSITION]` |
| Contract | 🤝 `[CONTRACT]` |
| Run state | 📚 `[RUNSTATE]` |
| Frontier | 💬 `[FRONTIER]` |
| Verification | 👍 `[PASS]` / 👎 `[FAIL]` / 🤷 `[UNCERTAIN]` |
| Catch-all | 🚨 `[ERROR]` |

(`approve`'s grant is the `🔐 [APPROVE]` line — `result_type: APPROVE`, see `CONTRACT.md`.)

A turn writes, in order:

    🏷️ [STATE] <state> : 👀 [FOCUS] <focus_id> · 💾 [SNAPSHOT] <snapshot_id> · 💰 [BUDGET] remaining <remaining>
    <result marker> <from> { <result fields> }         # marker bound to the result_type
    ⏩ [TRANSITION] <from> → <to> · <condition>        # one line per hop; <condition> verbatim
    🤝 [CONTRACT] { from, result, context }
    📚 [RUNSTATE] <n> · process #<i> (<state>)

When the turn puts something to the user:

    💬 [FRONTIER] <numbered questions>
    🔐 [APPROVE] <files> (<counts>) · grants: [<…>] · idempotency: { retry, cleanup }

At cold start, and on a reset in place of the transition:

    🚀 [BOOT] parse : cold start · 👀 [FOCUS] <focus_id> · 💾 [SNAPSHOT] <snapshot_id> · 💰 [BUDGET] remaining <remaining>
    🚨 [ERROR] <from> → parse · catch-all: <reason>

On completion:

    👍 [PASS] <verdict> · evidence: [<refs>]        # or 👎 [FAIL] · 🤷 [UNCERTAIN] …

Before sending, check:

- every machine line opens with exactly one marker from the table, and none other;
- the `⏩` `<condition>` is the matched row's `Condition`, copied **verbatim** from the
  transitions table — never paraphrased;
- the `<result marker>` equals the contract's `result_type` binding;
- no line holds a chain (`a → b → c`) — each hop is its own `⏩` line;
- a state that asks the user emits no `⏩` line;
- every `⏩` `to` is a row of the transitions table;
- every turn that resolved an edge emits both `🤝 [CONTRACT]` and `📚 [RUNSTATE]`;
- boot and catch-all use their single marker (🚀 `[BOOT]` / 🚨 `[ERROR]`).
