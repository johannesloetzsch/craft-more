# session-replay

Rebuild what a session produced — reconstruct files and understanding from an export, choosing deliberately between 1:1 replay and interactive re-authoring, verified against the session's own records.

This is a standalone skill from the [craft-more](<../../README.md>) skill collection. Install and usage: [Getting started](../../GETTING_STARTED.md) · [Install](../../INSTALL.md)

## Goal

A reader holding a session export can reconstruct missing or old state — and can use the session's own records to review, evaluate, and refine an existing codebase. This skill lays out the replay approaches and their differences first, so the choice is informed; the chosen path then runs, and every result carries evidence and a confidence label, never a silent claim.

## Strategy (mock)

### Step 0 — Reconnaissance

Read the session and the tree first: [session-archaeology](../session-archaeology/) establishes provenance, order, and gaps. Referenced here, not restated.

### Step 1 — The approach decision

The first step is a decision, not an action. The approaches are presented with their differences; the user chooses; the skill then follows the chosen path.

- **(a) Mechanical 1:1 replay** — replay the recorded `write`/`edit` operations against a fresh clone at the common ancestor commit. Cheapest when it works; fidelity bounded by faithful application; verified by ground-truth diff.
- **(b) Interactive replay** — read the session export, summarize it for the user, then grill the user through the session's intentions and progress, re-authoring together. More expressive: it builds understanding, not only files.

### Mechanical 1:1 replay

The tool:

- **anchored** — finding the common ancestor is step one: the commit both the session's base and the current tree share; the conflict pre-check and the clone both hang off it
- **generic** — any repo, any session export, any git ancestry; the export is read as a file, never a session database
- **ordered** — operations replay in their recorded time order
- **conflict pre-check** — intersect our changes since the common ancestor with the files the session touched; new paths cannot conflict, the overlap is reported before anything runs
- **isolated** — replay happens on a feature branch in a fresh clone at the common ancestor; merging is a separate step and belongs to the user
- **faithful** — each `edit` demands a unique `oldString`; a miss or multiple matches is a divergence signal, not a normal input: stop and involve the user, quick recommendation first, then one grilled question
- **byte-identical by target** — correct means reproducing the recorded file state exactly
- **fail-fast** — the first divergence aborts the run with a report
- **verified by ground truth** — compare the result against the export's own reads taken after the last edit; report newline deltas; reuse the existing confidence labels (verified / likely / unverified / assumption), define none
- **seeded when the ancestor does not exist** — when no common-ancestor commit can be found, materialise the base from the session's earliest full pre-op reads, seeding only files whose base differs from the checkout, and restore the trailing newline a read drops
- **re-anchored on a human edit** — a missing `oldString` is an out-of-band human edit, not a bug: re-anchor from the latest whole-file read taken after the last applied operation, never reverting replayed work; when none exists, adopt the file's final read as a labelled read-grounded result
- **scoped to tracked artifacts** — scratch and `.tmp` files cannot be replayed or verified; skip them by default
- **previewed faithfully** — a dry-run shares the apply code path (an in-memory store), so a divergence surfaces before anything is written

### Merging a replay

Merging is reconciliation, not overwrite: the reconstructed tree may parallel the target's later history. Keep target-only files, adopt the reconstructed artifact, and resolve shared files deliberately — the base-snapshot commit is meaningless in the target, so squash the reconstruction into one commit. Merging stays a separate step and belongs to the user.

### Interactive replay

1. read the session export
2. summarize it for the user
3. grill the user

### Related

- [session-archaeology](../session-archaeology/) — Step 0: provenance, order, gaps
- [uncertainty-and-verification](../uncertainty-and-verification/) — the reused confidence labels
- [plan-build-workflow](../plan-build-workflow/) — grilling is the default planning mode