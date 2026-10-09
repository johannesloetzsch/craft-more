# skill-authoring

Author new skills as self-contained folders — one SKILL.md for the agent, one human-facing README, referenced by relative links instead of duplicated rules.

This is a standalone skill from the [craft-more](<../../README.md>) skill collection. Install and usage: [Getting started](../../GETTING_STARTED.md) · [Install](../../INSTALL.md)

## Goal

With this skill, every skill is authored the same way:

- a folder `skills/<name>/` — as a draft it carries a `README.md` that stands in for the skill; a `SKILL.md` (machine part: name, description, instructions the agent loads when the task matches) is added once the skill leaves draft status
- rules live exactly once — in this repo's global files (AGENTS.md, emoji-markers, …) — and are referenced by relative links, never duplicated

## Strategy (mock)

### README rules

The rules below were derived while authoring the first skill READMEs (uncertainty-and-verification, evaluation-report, web-research) and are still `mock`.

- audience: humans interested in adopting the skill — the README must stand alone
- structure: `# name` → one-liner → standalone-links line → `## Goal` → `## Strategy`
- one-liner rule: what the skill **does** first; ecosystem benefit at the end, if at all
- standalone links: `[craft-more](../../README.md)` · `[Getting started](../../GETTING_STARTED.md)` · `[Install](../../INSTALL.md)`
- language: English, English quotes ("…"); no language mix
- paths: `~/`, never usernames or private info
- harness-neutral: tool names stay out of docs — say "web search", not `websearch`
- unvalidated content is labeled `mock` or hypothesis, never silently claimed as fact

### Workflow

1. begin with a README.md — it carries the skill while it is a draft
2. use the README to grill: a relentless interview that sharpens the plan or design — decide before writing
3. write the README.md
4. let the user edit quietly (watch, don't police)
5. verify by reading through, one pass
6. user stages and commits themselves
7. a draft needs no SKILL.md — the README takes over its role, enough to test