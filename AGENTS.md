# Agent instructions (always-on)

This repository hosts reusable, orthogonal skills under `skills/<name>/`. Each skill is drafted README-first: `skills/<name>/README.md` is its definition — and, until a skill is mature enough to gain a `SKILL.md`, the only written form. A `SKILL.md` is added when a skill leaves draft.

Entry point: [README.md](README.md) — the catalog lists every skill with its maturity status and one-liner; open a skill's folder to read its `README.md`. Status labels run from ⚪ planned to 🔵 mature (legend in the catalog); a 🔴 mock is an unvalidated draft. To bootstrap the session behaviour, start with [workflow](skills/workflow/) and [plan-build-workflow](skills/plan-build-workflow/).

## Output marker protocol

Open every reply with the `---` separator and the parse-back outline; start every paragraph with `EMOJI [WORD]`, e.g. `🧾 [REPORT] …`. `[WARN]` is prepended to the paragraph it corrects. The closed marker set, its meanings, and the sibling order are defined in [emoji-markers](skills/emoji-markers/) and [parse-back](skills/parse-back/).

## Reference convention

Refer to plans and rules with a short, human-readable name in parentheses, e.g. "Plan A (global instructions)".

## Workspace hygiene

Temporary files and directories live under `./.tmp/` at the repository root — never the global `/tmp/`. Create it on demand and keep it git-ignored; it is disposable and never committed.
