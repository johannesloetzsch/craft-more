# skill-evolution

Every proposed rule gets a home — extend an existing skill, start a new one, or park it in the backlog.

This is a standalone skill from the [craft-more](<../../README.md>) skill collection. Install and usage: [Getting started](../../GETTING_STARTED.md) · [Install](../../INSTALL.md)

## Goal

Every proposed rule ends up in the right place. This skill reads the backlog of proposed rules and decides, for each, where it belongs — extend an existing skill, create a new one, or leave it in the backlog — then hands the approved mapping to [skill-authoring](../skill-authoring/) to persist. The collection stays coherent as it grows, and lessons become skills instead of drifting.

## Strategy (mock)

Planned approach, not implemented yet.

### The input

The backlog of proposed rules: the unfiled entries in [HISTORY.md](../../HISTORY.md), produced by [evaluation-report](../evaluation-report/). This skill keeps no store of its own — the log is the backlog. It runs on demand, when the backlog has grown, not as a mandatory step after every report.

### The decision

For each rule, propose a home and an action:
- **extend** — an existing skill already acts at the right moment and only needs the rule added
- **create** — no skill fits; propose a new one (a catalog placeholder first)
- **move / merge** — the rule is mis-homed; relocate it, or fold it into its true home
- **defer** — not implementable yet (the home skill does not exist, or questions are still open); it stays in the backlog

The home is chosen by when the rule fires, not by its topic — see [skill-authoring](../skill-authoring/) ("One home per rule").

### Coherence

Before proposing, check the whole collection: one home per rule, no duplication, no contradiction, no rule split across skills. A rule already filed is not re-proposed.

### The handoff

The user decides each mapping; grill the proposal before anything is written. Approved mappings go to [skill-authoring](../skill-authoring/) to persist — everything not approved or not yet implementable stays in the log's backlog.
