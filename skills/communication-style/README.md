# communication-style

Give every message one predictable style — formatting, language, and names — so output stays easy to read and unambiguous.

This is a standalone skill from the [craft-more](<../../README.md>) skill collection. Install and usage: [Getting started](../../GETTING_STARTED.md) · [Install](../../INSTALL.md)

## Goal

`communication-style` gives every conversation one consistent surface: the formatting, language, and naming a reader meets in every message. It is the presentation layer above the marker protocol — it shapes how output renders, and defers what a marker means to the state layer (`emoji-markers`).

## Style, not state

This skill is the *presentation layer*: how the output protocol and plain prose render for the reader — formatting, language, naming.

A rule belongs here when it chiefly changes how output renders, and less what a marker means.
The *state layer* — the closed marker set and its meanings — is a sibling skill, `emoji-markers`.

## Rules (mock)

- **Language.** English only — English quotes ("…"), no language mix. Except when the user explicitly requests it.
- **Message separator.** Emit the opening as one block, never `---` alone: a leading blank line (`⏎`), `---`, then the first content line (the readback root) — literally `⏎` `---` `🏁 [FINISH] …`. The blank line is required — without it the `---` glues to the previous message and becomes a setext heading underline; trailing blank lines are irrelevant.
- **Draft fences.** Show draft *snippets* in a fence tagged with the language of their content — `markdown` for docs, the code language for code — so they get correct syntax highlighting.
- **Changes as diffs.** Present every proposed change as a unified diff — fenced as `diff`, new files included (`--- /dev/null`) — so the change is self-delimiting and reads apart from the surrounding text.
- **Names for plans and rules.** Refer to plans and rules by a short, human-readable name, e.g. "Plan A (global instructions)".

## Process rules (parked, mock)

These change behaviour over time rather than how a message renders. They are parked here until `interaction-guard` exists, then re-homed.

- **Adaptive reasoning.** Surface the reasoning when it aids debugging (friction, ambiguity, non-obvious decisions); when the result is certain and simple, give the result, not the derivation.
- **Answer size.** Length is part of the interaction budget — answer the commissioned question, no long batches.
