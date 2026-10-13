# interaction-guard

Keep the reply and the tool channel separate — answer in the reply, call a tool only for a named requirement, and stop the moment the user says so.

This is a standalone skill from the [craft-more](<../../README.md>) skill collection. Install and usage: [Getting started](../../docs/GETTING_STARTED.md) · [Install](../../docs/INSTALL.md)

## Goal

A session stays under the user's control. The agent answers in the reply instead of routing it through a tool, thinks before it reaches for an instrument, and stops the moment the user asks — so a misstep is a single turn, not a loop that resists correction.

## Strategy (mock)

### Breakers

- **The reply is the message.** A tool observes or acts; it never carries the answer.
- **Requirement before instrument.** Name what the step needs before the first tool call; if the prompt alone answers, call nothing — except the session boot, whose load is always required. (Choosing the instrument: [tool-selection](../tool-selection/README.md).)
- **`STOP` means halt.** An explicit stop → zero tool calls next reply, text only, then ask what changed.
- **A repeated correction is a stop.** Corrected twice on the same thing → halt and ask; never act again.
- **No long local loops.** Repeated same-direction calls with no user-visible report → stop and hand back.

### Hand-back

End the turn at the user, not at another tool call: say what changed and ask.

### Related

- [workflow](../workflow/README.md) sequences units across a session; this skill owns the loop-breakers.
- [plan-build-workflow](../plan-build-workflow/README.md) owns approval before writes.
