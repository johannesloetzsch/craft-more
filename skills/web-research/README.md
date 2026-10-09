# web-research

Research strategy — set the goal first, then walk the source ladder from the cheapest to the most expensive source, naming each step along the way.

This is a standalone skill from the [craft-more](<../../README.md>) skill collection. Install and usage: [Getting started](../../GETTING_STARTED.md) · [Install](../../INSTALL.md)

## Goal

Research with this skill starts from a precise goal and follows a structured path from the cheapest to the most expensive source.

- Start with a goal in one sentence — "ready when …" — and stop the moment it is met.
- Ask the user first: the cheapest, most reliable source.
- Work local, read-only, before spending any web tokens.
- Name each step you take, so the loop stays transparent and interruptible.
- Treat results as hypotheses until a live check confirms them.
- When required: use an interactive loop of the source ladder steps.

## Strategy (mock)

### The source ladder

1. 👤 **User / live** — ask first. Cheapest and most reliable. Stays in the loop until the problem is solved.
2. 💻 **Local** — read-only checks of files, docs, configs. Zero web tokens.
3. 🔍 **Web search** — one query, at most one follow-up, always bound to the goal.
4. 📄 **Fetch** — retrieve a concrete page only when the previous stages justify it.

### 🏁 FINISH and 🏳️ CHECK

<!-- Rendering quirk: the white flag (U+1F3F3 + FE0F) may not render inline, especially after list punctuation. Keep it at the start of its own line, outside "- " list items. -->

🏁 `[FINISH]` — the goal and its abort condition: "ready when …", and we stop as soon as it is reached.

🏳️ `[CHECK]` — a checkpoint on the way: pause ("firepause"), check whether something can be achieved here, then stay neutral and re-evaluate the strategy. When racing for the FINISH, sometimes we should not rush…

### Rules

- core vs. nice: nice-to-haves are parked until the core question is closed
- live test beats static docs: verify by running or asking, not by forensics
- results are hypotheses, not facts: check age and version against our setup, confirm by a live trigger before claiming
- negative statements: "not found" ≠ "doesn't exist", following [uncertainty-and-verification](../uncertainty-and-verification/)
- method serves the goal: every step relates back to the core question
