# tool-selection

Move towards the goal with the right instrument — deliberately chosen by requirements.

This is a standalone skill from the [craft-more](<../../README.md>) skill collection. Install and usage: [Getting started](../../GETTING_STARTED.md) · [Install](../../INSTALL.md)

## Goal

A reader reaches a goal with instruments chosen for the requirement each step actually serves. Habit and availability stop deciding: every tool choice carries the reason it was made, so the work moves with the right instrument and each choice is easy to review and justify.

## Strategy (mock)

### The rule

Choose tools by requirement — never by availability, and never by what is already loaded.

- **Requirement-first** — name what the step needs before naming any instrument.
- **No loaded-tool shortcut** — the tool already in hand is not a decision.
- **Ask for the right tool** — if the best instrument for the requirement is missing, ask the user to provide it; absence is a supply question, not a reason to downgrade.
- **Dependencies are decided** — stdlib versus a common library is a grilled choice, not a default: simpler when that is genuinely better, otherwise agree the library with the user rather than reinventing it.
- **Availability is supply** — discovering and providing tools is a separate concern.

### The decision (six steps)

1. Name the requirement — what this step of the goal actually needs.
2. Collect candidate instruments.
3. Weigh each against the requirement — pros and cons.
4. Prefer the generic or the specialised tool, whichever the requirement favours.
5. Decide dependencies — stdlib or an agreed library.
6. Settle availability with the user — if the right tool is absent, ask for it and decide together.

### Writing the instrument

When the chosen tool is a script, the decision does not end at the choice:

- follow the prevailing best practices for that language
- add comments where they serve review
- enforce proper typing where the language offers it

### Evidence

Each choice carries its reason, and confidence follows the collection's existing labels — reused, never redefined. A tool decision is a claim like any other: state the requirement, the candidate, and why it wins.

### Related

- [language-selection](../language-selection/) — choosing the language of the thing the user is building; this skill covers the instruments used on the way there.
- [environment-discovery](../environment-discovery/) — finding and supplying the tools an environment offers.
