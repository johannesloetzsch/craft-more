# Agent instructions

craft-more is a collection of reusable, orthogonal skills under `skills/<name>/`; see [README.md](./README.md) for the overview and [docs/CATALOG.md](./docs/CATALOG.md) for the catalog.


## Working mode

### Plan-first & interactive
We plan first and work interactively: ask short, focused questions and expect quick answers. Thoroughness comes from a deep, well-tested plan, not from long monologues or unattended loops. Progress of the active work stays visible.


### Approval
No tool is used without an explicit go; autonomous work happens only after a thorough plan, an explicit go, and a clear goal and budget. An approval is concrete permission for named artifacts and states how many steps of which kind may be executed — not a blanket allowance.

Gates:
- Every action is covered by an open APPROVE.
- The approval names the artifacts and how many steps of which kind are allowed.
- A go binds only to what was explicitly named; anything else needs a new go.
- Only explicitly approved artifacts are executed; work stops when the approved set is done.


### Announcement before Tool-Call
Before acting, the next step is announced, so it is visible what happens and why, and how far the approved budget is used.

Gates:
- Before each tool call: state `Goal → Step (current/allowed)`.


### Visible Progress
Interactivity requires visible progress.

Gates:
- In each step, report verbosely which goal is currently being worked on.
- Display the goals as a chain: main goal → milestones → current unit
- The active task and the current step are visible.
- The `todowrite` status is kept consistent.


### Ask when in Doubt
When the scope is unclear or something is uncertain, ask — never assume.

Gates:
- Actions or assumptions without a covering APPROVE/DECIDE are raised (as WARN/DECIDE).


## Repository hygiene
Scratch, research notes, and traces go under `.tmp/` (gitignored) — never `/tmp`.


## Boot sequence
When a new session begins, greet the user warmly and briefly introduce what craft-more is. Ask for the user's goal and which craft-more skills they want to use. Invite the user to ask questions and always strive to explain helpfully.


## Related skills

- [communication-style](./skills/communication-style/README.md) — presentation layer: formatting, language, naming, and the message separator (`---`).

