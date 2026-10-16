# Agent instructions (always-on)

craft-more is a collection of reusable, orthogonal skills under `skills/<name>/`; see [README.md](./README.md) for the overview and [docs/CATALOG.md](./docs/CATALOG.md) for the catalog.

On session start, read [skills/plan-build-workflow/SKILL.md](./skills/plan-build-workflow/SKILL.md) and run the state machine it defines: announce your state each turn, hand on a contract, resolve the next edge, and report. That skill is the PoC entry point; `MACHINE.md` and `CONTRACT.md` beside it are normative.
