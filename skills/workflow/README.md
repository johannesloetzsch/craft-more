# workflow

Read back, think in the open, review early — your goal, your plan, your every step; craft, not slop.

This is a standalone skill from the [craft-more](<../../README.md>) skill collection. Install and usage: [Getting started](../../docs/GETTING_STARTED.md) · [Install](../../docs/INSTALL.md)

## Goal

A whole session, not a single task: this skill keeps a long collaboration under the user's control, from the first plan to the last hand-back.

- **Review from the first line.** The user can begin reviewing at the earliest moment — never waiting in silence for an answer that has not started.
- **Control of the goal, the plan, and every step.** Work moves one unit at a time; nothing is built before it was grilled and agreed.
- **Craft, not slop.** The outcome is work the user can trust, not output to be redone.

## Strategy (mock)

### The session loop

A session is a repeating loop of small units. A larger task is broken down into subtasks (divide and conquer), and each unit runs the same loop: plan → build → verify and hand back. The details of a single unit live in [plan-build-workflow](../plan-build-workflow/README.md); this skill sequences the units. Only the commissioned work is done — see there for the scope rule. When one unit is done, the next planning phase begins immediately — the session never simply stays in build.

### Backlog instead of batch

When several tasks arrive at once, they become a numbered backlog: mirror them back, ask which one comes first, then work one task per answer. Motto: grill instead of toast 🍞→🔥. A batch run — "night shift" — is a rare exception: only after an explicit go, and only for the stretch that was agreed — never silently.

### Keeping the user in the loop

- **Read back first.** Every answer opens with the [parse-back](../parse-back/README.md) outline.
- **Think in the open when it helps.** Surface the reasoning for complex or ambiguous work; give just the result when it is simple.
- **Review early.** No silent waiting — the user should be able to step in from the first line.

The loop-breakers live in [interaction-guard](../interaction-guard/README.md); this skill references them.

### Missing skills

When a skill would be useful or required but has no `SKILL.md` yet, say so briefly — then continue.

### Checkpoints and budget

Work with more than three steps gets announced pause points — after each segment, a short report, and the user can correct before the next. Every goal and every checkpoint carries an announced token budget; overshoots are reported.

<!--
### Portable mechanism

The mechanism is generic: goal sentence → catalog lookup → name the step → user in the loop → verify before claiming. This repository appears only as a marked example, never as part of the mechanism.
-->
