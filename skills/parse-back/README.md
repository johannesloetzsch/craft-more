# parse-back

See the whole task at a glance — a live, marker-annotated outline opens every reply, so the goal, the settled facts, and the open questions are all visible in one look.

This is a standalone skill from the [craft-more](<../../README.md>) skill collection. Install and usage: [Getting started](../../GETTING_STARTED.md) · [Install](../../INSTALL.md)

## Goal

`parse-back` turns every answer into a structured readback: the first thing the reader sees is a parse of the request and the current work, as a nested outline. Each node carries a status marker from [emoji-markers](../emoji-markers/); remembered facts and new acknowledgements are told apart, and every open question stands out as the frontier. The prose then stays short — the outline carries the detail.

## Strategy (mock)

### Shape

- The reply opens with a blank line, then the message separator (`---`, see [communication-style](../communication-style/)); the outline's root node is the next line, with no label, title, or sentence before it.
- The parse-back is a **nested markdown outline**: each unit of work is a **node**, nested by containment; every further unit of work nests below the root.
- Each node is **one short line** and carries a **start-marker**: `EMOJI [WORD] text`, drawn from [emoji-markers](../emoji-markers/).
- The reply **terminates at the active task's frontier**: on an open ❓ `[DECIDE]` or 🔐 `[APPROVE]` when a decision is pending, or on the settled node (✅ `[OK]` / 🏁 `[FINISH]`) when nothing is open — never on a bare body node.

### Telling the rounds apart

- Each round, a still-relevant ✅ `[OK]` becomes 📎 `[EVIDENCE]`; if it is no longer needed, it is dropped.
- Facts come before inference: 📎 `[EVIDENCE]` before ✅ `[OK]`.

### Start-markers: order and meaning

These markers may open a node. Their **general** meanings live in [emoji-markers](../emoji-markers/); their **start-marker semantics** — what they mean when they open an outline node — live here. Within a parent, siblings appear in this order:

1. 📋 `[FINALIZE]` — a branch is settled and waits to be closed (it may depend on another branch or an 🔐 `[APPROVE]`)
2. 📎 `[EVIDENCE]` — a confirmed fact carried from a previous round
3. ✅ `[OK]` — a new acknowledgement this round
4. 🧾 `[REPORT]` — a prose report follows
5. ⚠️ `[WARN]` — uncertainty or correction; active until the user resolves it
6. ❓ `[DECIDE]` — an open question; the leaves are the frontier
7. 🏁 `[FINISH]` — the main goal and its abort condition
8. 🚧 `[CHECK]` — a checkpoint (subgoal); a deliberate pause
9. 🧲 `[STEER]` — a subtask steering a parent
10. 🧠 `[PLAN]` — plan once the needed information exists, before costlier tasks
11. 🔨 `[EXEC]` — execution (of tools)
12. 🔎 `[INSPECT]` — name the information to gather; walk the source ladder (👤 User → 💻 Local → 🔍 Web search → 📄 Fetch)
13. 🧪 `[LAB]` — a throwaway trial in a safe environment; gated by a 🧠 `[PLAN]` or 🔐 `[APPROVE]`
14. ✂️ `[CLEAN]` — cleanup / minimization / removal
15. 🔐 `[APPROVE]` — any human sign-off; it carries subnodes stating what it is for
16. 🌙 `[NIGHTSHIFT]` — an approved batch run; only after an explicit 🔐 `[APPROVE]`
17. 📌 `[PIN]` — a deferred task; once acknowledged it becomes a new 🏁 `[FINISH]` / 🚧 `[CHECK]` / 🧲 `[STEER]`, or an ⏰ `[REVISIT]`

Only the markers above may open a node.

### Definitions

- **parse-back** — the structured summary that opens every reply and shows the whole task at a glance.
- **outline** — the short, structured lines of the parse-back: a nested tree, one node per line.
- **node** — one line of the outline.
- **marker** — the tag that opens a node and represents what the node is. 🧲 `[STEER]` represents a task; ❓ `[DECIDE]` represents a question.
- **dependency** — how the tree is ordered: a parent node depends on its subnodes, so it is solved only once all of its subnodes are solved. Independent siblings sit next to each other; dependent nodes nest one layer deeper. This ordering turns the outline into a plan.
- **task** — a unit of work, of one of three types:
  - 🏁 `[FINISH]` — the root: the overall goal that outlives any child node and changes only on an explicit user decision; the highest priority while planning, and the task solved last, because it depends on every task below it.
  - 🚧 `[CHECK]` — a checkpoint, or subgoal, that verifies progress toward its parent.
  - 🧲 `[STEER]` — a subtask that steers its parent: unlike a 🚧 `[CHECK]`, it retrieves information and plans how to solve the parent task.
- **question** — an open decision not settled yet, represented by a ❓ `[DECIDE]` node. A question that depends on other questions nests them as its children.
- **frontier** — the open questions whose subnodes are all solved, so they have no unanswered dependency and can be asked right now.
- **grilling** — the relentless interview that sharpens a plan or design and reaches a common understanding of goals, concepts, and vocabulary.
- **prose** — the section below the outline. The prose is the list of bodies, each belonging to a node of the outline and appearing in the same order as that node. Every body has a matching node — none stands alone — and opens with that node's start-marker. For each frontier question it carries a report with the context needed to answer it, grouped by topic.
- **body** — the block belonging to one node below the outline. Every task modified in the round (🏁 `[FINISH]`, 🚧 `[CHECK]`, 🧲 `[STEER]`) and every marker used for interaction between agent and human (🧾 `[REPORT]`, ⚠️ `[WARN]`, 🧠 `[PLAN]`, 🧪 `[LAB]`, ❓ `[DECIDE]`) must carry a body; every other node may stay self-contained.

### The active task

- Exactly one task is active at a time.
- The active task may be a parent task together with its subtasks.
- At the start of each round, re-plan which task is active.
- The active task is marked **bold** in the outline.

### Changing the plan

- New information can re-plan any task, not only the active one.
- A task that follows from the user's intentions is added automatically: create it, then announce it in the prose.
  - It speeds the work and structures the plan.
  - Removing or moving an empty task is cheap for the user in case an undo is needed.
- Changing the active task happens often and is already in user focus: a prose announcement is enough.
- Modifying an existing task outside the active task is the user's decision: nest a 🔐 `[APPROVE]` under the task to change and wait.

### Placing answers in the parse-back

- Each grilling appears as a 🧲 `[STEER]` node.
  - The node steers a parent task.
  - Its name summarizes how it contributes to solving that parent.
  - If the steering node a grilling needs does not exist yet, the parse-back creates it.
- The grilling's questions are ❓ `[DECIDE]` nodes under the steering node.
  - A question that depends on other questions nests them under itself.
- Each topic gets one 🧾 `[REPORT]` node as its context.
  - It sits just before that topic's questions.

### Controlling the questioning

- The parse-back only outlines; it never answers.
- Questions of one parent task are asked together.
- Independent questions are grouped by topic and asked together in the same round.
- The frontier is what is asked next: the open questions whose subnodes are all solved.
- The prose presents the frontier, each question beside the report that carries its context.
- After each round, answers settle some questions and open others; the parse-back recomputes the frontier.

### Pre-send audits

Run before every send; fix the outline until each holds.

- **Opening (fires first).** The parse-back is the first content of the reply, and its opening matches [§Shape](#shape): a blank line, then `---`, then the root node. It fires before anything else is written, so it must survive compaction.
- **Approval.** Every node that proposes an action (write, delete, run) is carried by an open 🔐 `[APPROVE]`. If a proposed action lacks one, add it or drop the action.
<!--
- **Terminal.** The reply ends at the active task's frontier: on an open ❓ `[DECIDE]` or 🔐 `[APPROVE]` when a decision is pending, otherwise on the settled node (✅ `[OK]` / 🏁 `[FINISH]`) — never on a bare body node.
-->

## Related

- [emoji-markers](../emoji-markers/) — the state layer: the closed marker set and its meanings.
- [communication-style](../communication-style/) — the style layer: the `---` separator and formatting.
- [web-research](../web-research/) — the source ladder walked by 🔎 `[INSPECT]` nodes.
