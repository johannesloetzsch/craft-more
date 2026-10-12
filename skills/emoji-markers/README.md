# emoji-markers

A fixed marker vocabulary for conversational output — one status marker (emoji plus uppercase word) tags each paragraph, and each [parse-back](../parse-back/) node.

- **Purpose:**
  - make the status of each paragraph — and each parse-back node — immediately legible
  - define a precise vocabulary for building protocols via skills
- **Maturity:** mvp — in first trial operation
- **Files:**
  - `README.md`: human-facing
  - `SKILL.md`: agent-facing

## Protocol, not style

This skill is the *state layer*: a closed set of markers with their general meanings — the shared, unambiguous language a conversation runs on. Like a programmer designs data structures and APIs before implementation, context engineers may fix a clear language before behaviour; the markers are the states — rules in skills use them to be precise, and users are encouraged to communicate with the same vocabulary.

A rule belongs here only if it changes a marker's general meaning or its general validity.
How a marker is used inside a specific protocol — its start-marker sense and its place in the sibling order, as in [parse-back](../parse-back/) — is defined by that protocol.
How output is rendered around the markers — formatting, language, naming — is the *style layer* (a sibling skill, `communication-style`).

## Road to mature

Before `emoji-markers` may be called **mature**, it needs:

- test, test, test — more real sessions in this repo
- testing on other systems
- testing with other models and other harnesses
- sufficient install documentation — [Getting started](../../GETTING_STARTED.md) and [Install](../../INSTALL.md) are a prerequisite for mature, and `emoji-markers` depends on them

Maturity model: see [maturity-model](../maturity-model/).
