---
name: interaction-guard
description: Use when about to call a tool — especially when the reply could answer without one — or when the user has said stop, corrected the same thing twice, or the run risks a long local loop. Keeps the reply and tool channels separate, gates the first tool call by a named requirement, turns an explicit stop into zero tool calls, and escalates repeated corrections instead of acting again. Triggers on stop, halt, enough, "no more", "use no tools", or a repeated correction.
---

# Interaction Guard

Keep the collaboration under the user's control: answer in the reply, call tools only for a named requirement, and stop the moment the user says so.

## Breakers

- **The reply is the message.** A tool observes or acts; it never carries the answer.
- **Requirement before instrument.** Name what the step needs before the first tool call; if the prompt alone answers, call nothing — except the session boot, whose load is always required. (Choosing the instrument: [tool-selection](../tool-selection/).)
- **`STOP` means halt.** An explicit stop → zero tool calls next reply, text only, then ask what changed.
- **A repeated correction is a stop.** Corrected twice on the same thing → halt and ask; never act again.
- **No long local loops.** Repeated same-direction calls with no user-visible report → stop and hand back.

## Hand-back

End the turn at the user, not at another tool call: say what changed and ask.

## Related

- [workflow](../workflow/) sequences units across a session; this skill owns the loop-breakers.
- [plan-build-workflow](../plan-build-workflow/) owns approval before writes.
