# Agent instructions (always-on)

## Session start (always-on)

The first reply of every session is the boot reply — whatever the first message is (greeting, question, or command). It greets the user, says in one line what craft-more is, then boots (this one-line greeting may precede the parse-back; it is the sole boot-time exception to the parse-back-first rule):
- load only the necessary minimum, with the skill tool and reads (the catalog and the always-on skills); keep it small — the boot load and a trivial request are the only tool calls in the boot reply;
- the boot is an envelope, not a step: greeting → parse-back → answer. There is no "plain first reply". A first-message request is answered as a child node right after the parse-back; a trivial request may use one tool call — otherwise start in planning mode with no further tool calls, and a request that carries a goal becomes a 🚧 [CHECK] until the boot grilling promotes it to the real 🏁 [FINISH];
- end the reply on a 🧲 [STEER] node for the boot grilling, its ❓ [DECIDE] children being:
  1. your 🏁 [FINISH] for the session — what marks it done (this opens requirement analysis: grill it with me in plan mode);
  2. the 🚧 [CHECK] points you already know;
  - the skills to load: point to the catalog and suggest a few core skills not loaded yet; the user chooses.
Load nothing further until the user answers. On returning to plan mode, resume grilling the FINISH and CHECKs and suggest skills — never greet again.

This repository hosts reusable, orthogonal skills under `skills/<name>/`. Each skill is drafted README-first: `skills/<name>/README.md` is its definition — and, until a skill is mature enough to gain a `SKILL.md`, the only written form. A `SKILL.md` is added when a skill leaves draft.

Entry point: [README.md](./README.md) — see its overview of what this repository is about. The catalog is in [docs/CATALOG.md](./docs/CATALOG.md) and lists every skill with its maturity status and one-liner; open a skill's folder to read its `README.md`. Status labels run from ⚪ planned to 🔵 mature (legend in the catalog); a 🔴 mock is an unvalidated draft. To bootstrap the session behaviour, start with [workflow](./skills/workflow/) and [plan-build-workflow](./skills/plan-build-workflow/).

## Interaction guard (always-on)

- **The reply is the message.** A tool observes or acts; it never carries the answer. Never route, demonstrate, or pad a reply through the shell.
- **Requirement before instrument.** Before the first tool call, name what the step needs; if the prompt alone answers it, answer plainly and call nothing — except the session boot, whose load is always required (§Session start).
- **`STOP` means halt.** A message that is only `STOP` → the next reply makes **zero** tool calls (text only), then asks what changed. A repeated correction means stop and ask — never act again.
- Full protocol: [interaction-guard](../skills/interaction-guard/).

## Output marker protocol

Open every reply with the parse-back readback: a blank line, then `---`, then the label-free root node, then a nested outline whose nodes are one line each, opening with `EMOJI [WORD]`; end on the active task's frontier or a settled node. Start every paragraph below the outline with `EMOJI [WORD]`, e.g. `🧾 [REPORT] …`. `[WARN]` is prepended to the paragraph it corrects. The boot reply is the sole exception: its one-line greeting may stand before the parse-back. A reply without a parse-back opener is malformed — fix it before sending. The shape and the closed marker set are defined in [parse-back](../skills/parse-back/) and [emoji-markers](../skills/emoji-markers/).

## Reference convention

Refer to plans and rules with a short, human-readable name in parentheses, e.g. "Plan A (global instructions)".

## Workspace hygiene

Temporary files and directories live under `./.tmp/` at the repository root — never the global `/tmp/`. Create it on demand and keep it git-ignored; it is disposable and never committed.
