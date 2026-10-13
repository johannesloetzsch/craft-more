# session-archaeology

See how a codebase was built — read session exports alongside git history and the repository's history log to trace provenance, order, and gaps, with honest confidence.

This is a standalone skill from the [craft-more](<../../README.md>) skill collection. Install and usage: [Getting started](../../docs/GETTING_STARTED.md) · [Install](../../docs/INSTALL.md)

## Goal

A reader holding one or more session exports can see how they relate to your codebase: which session produced the current state, which is newer, and in what order — each claim carrying its evidence and an honest confidence label.

## Strategy (mock)

### Method, cheapest first

1. Metadata first — read each export's identity and time span cheaply; extract its text once and reuse it.
2. Intent read — fresh start or resume.
3. Reference cross-check — take the candidate names from the checkout (its tracked files and history-log headings), then scan the extracted text once for them; a mention is a signal, not proof — it may be planned, not present.
   Before trusting a miss, confirm the search works — a faulty query and a true absence return the same empty result.
4. Time cross-check against git history.
5. Infer provenance and the total order across exports.
6. Report with evidence and one confidence label per claim; end with one focus question.
7. Optional last step — when the cheap evidence leaves a claim unverified, offer a deeper semantic analysis of the histories; offered, never started silently.

### Features

- evidence and confidence about provenance
- cross-reference against the git tree and the history log
- ordering
- gap analysis

### Limits of the record

The export is evidence with blind spots — name them before trusting a claim:

- **the base may be no commit at all** — a session can start from an uncommitted working tree; provenance by commit hash is inference, so diff the session's earliest full reads against candidate commits to find, or rule out, the base
- **the log is incomplete** — a human edits out-of-band, with no recorded operation; a whole-file read that changes with no intervening op is a human-edit gap, not a tool op
- **reads drop the trailing newline** — treat it as an artifact, not a content change, before drawing a conclusion
- **operations are the mechanism; reads are the ground truth** — reconstruct and verify from whole-file reads
- **a session is a branch of history, not necessarily an ancestor** — allow divergence between the session's tree and the repository's later main

### Related

The exports are produced by a harness (for example, `opencode export`); read the files directly — query the JSON, never a session database. A repository's history log (for example, [HISTORY.md](../../docs/HISTORY.md)) is written by [evaluation-report](../evaluation-report/README.md).
