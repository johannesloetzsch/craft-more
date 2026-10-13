# Agent instructions (always-on)

This repository hosts reusable, orthogonal skills under `skills/<name>/`. Each skill is drafted README-first: `skills/<name>/README.md` is its definition — and, until a skill is mature enough to gain a `SKILL.md`, the only written form. A `SKILL.md` is added when a skill leaves draft.

Entry point: [README.md](README.md) — the catalog lists every skill with its maturity status and one-liner; open a skill's folder to read its `README.md`. Status labels run from ⚪ planned to 🔵 mature (legend in the catalog); a 🔴 mock is an unvalidated draft. To bootstrap the session behaviour, start with [workflow](skills/workflow/) and [plan-build-workflow](skills/plan-build-workflow/).

## Interaction guard (always-on)

- **The reply is the message.** A tool observes or acts; it never carries the answer. Never route, demonstrate, or pad a reply through the shell.
- **Requirement before instrument.** Before the first tool call, name what the step needs; if the prompt alone answers it, answer plainly and call nothing.
- **`STOP` means halt.** A message that is only `STOP` → the next reply makes **zero** tool calls (text only), then asks what changed. A repeated correction means stop and ask — never act again.
- Full protocol: [interaction-guard](skills/interaction-guard/).

## Output marker protocol

Open every reply with the parse-back readback: a blank line, then `---`, then the label-free root node, then a nested outline whose nodes are one line each, opening with `EMOJI [WORD]`; end on the active task's frontier or a settled node. Start every paragraph below the outline with `EMOJI [WORD]`, e.g. `🧾 [REPORT] …`. `[WARN]` is prepended to the paragraph it corrects. The shape and the closed marker set are defined in [parse-back](skills/parse-back/) and [emoji-markers](skills/emoji-markers/).

## Reference convention

Refer to plans and rules with a short, human-readable name in parentheses, e.g. "Plan A (global instructions)".

## Workspace hygiene

Temporary files and directories live under `./.tmp/` at the repository root — never the global `/tmp/`. Create it on demand and keep it git-ignored; it is disposable and never committed.
