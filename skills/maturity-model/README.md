# maturity-model

Make the maturity of a project — or any part of it — visible and honest: one status label from planned to mature, so quality claims are recognizable at a glance.

This is a standalone skill from the [craft-more](<../../README.md>) skill collection. Install and usage: [Getting started](../../docs/GETTING_STARTED.md) · [Install](../../docs/INSTALL.md)

## Goal

This skill serves every project that uses or considers using the skills of this collection.<!-- — not only the collection itself-->

AI tends to produce slop; vibecoding can be fun and beautiful, but it must be reviewed carefully.
Quality needs honesty: which project, and which part of it, is at which state?
We do not want agents to consume slop and produce more slop — we want the promised quality to be recognizable at a glance, for users and agents alike. <!-- (a thorough audit is still run on top)-->

With this skill:

- any part of any project can carry a maturity state
- the states form a strict order from planned to mature
- the labels are the single source for status signals (catalog traffic light, HISTORY entries, discussions)

## Strategy (mock)

### The ladder (7 states)

The states work for any content — a project, a skill, any part of it. One status per part; a state is reached when its exit evidence holds.

| status | meaning |
|---|---|
| ⚪ planned 📄 | the idea exists, no implementation details yet |
| 🟣 draft 📐 | a first implementation details are drafted |
| 🔴 mock 🌱 | interfaces defined, real implementation missing |
| 🟠 poc 📡 | proof of concept, solved hard technical questions |
| 🟡 prototype 🧩 | the parts are assembled, rough edges allowed |
| 🟢 mvp 🏁 | tested, works for real usecases |
| 🔵 mature 🏆 | stable, well documented, portable, maintained |

<!-- exit evidence (kept for maintainers, out of view for readers):
- ⚪ planned: a line in a catalog
- 🟣 draft: working tree changes, in review
- 🔴 mock: a commit that documents the approach
- 🟠 poc: a demo or spike that ran
- 🟡 prototype: survives first real use
- 🟢 mvp: in daily use
- 🔵 mature: proven across systems and models, docs solid
-->

### Status light

A state can be shown with a color or with an icon — both describe the same ladder, so choose what fits your context:

- colors: the fastest signal for the eye, great for grouping
- icons: the symbols carry the meaning

<!-- When both are shown together, keep them comparable: color before the name, icon after the name. -->

## Rules

- maturity labels are only ever upgraded by an experienced developer — never by the tooling itself
- one state per part — no intermediate shorthand
- evidence over claims: a state is only as good as its exit evidence
- labels live once (SSOT) — catalogs reference this ladder, never duplicate it
- a part moves one state up at a time; downgrades happen when evidence is no longer met
- the catalog is updated whenever a skill changes — the skill README is the source of truth
