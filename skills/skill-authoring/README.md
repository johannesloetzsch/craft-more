# skill-authoring

Author new skills without drift — each one self-contained, reader-first, and every rule in a single home.

This is a standalone skill from the [craft-more](<../../README.md>) skill collection. Install and usage: [Getting started](../../docs/GETTING_STARTED.md) · [Install](../../docs/INSTALL.md)

## Goal

Use this skill when a skill is created or reshaped. It makes authoring and refactoring easy and mostly automatic — so lessons learned in the history (via evaluation-report) can be persisted into a skill instead of evaporating.

The split is deliberate:
- **Grilled with the author:** the goal and the one-liner — the judgement calls.
- **Automated:** boilerplate, and folding in already-approved rule proposals.

<!-- Long-term coherence of a growing collection is a separate concern — that belongs to skill-evolution. -->

- **Reader-first.** Each skill is written for the person deciding whether to adopt it — what they get first, how it works last.
- **Self-contained.** One folder per skill; relative links within the collection, no cross-repo references.
- **Draft first.** A draft is a human-facing `README.md`; a `SKILL.md` (name, description, the instructions the agent loads when the task matches) is added once the skill leaves draft status.
- **One home per rule.** A rule is stated once and lives where it *acts*: pick the home by when it fires — a runtime behaviour lands in `workflow`, an authoring concern in `skill-authoring` — not by the topic it touches. Everywhere else references it by relative link, never duplicates it.

## Strategy (mock)

### README rules

Derived while authoring the first skill READMEs and still `mock`:

- audience: humans interested in adopting the skill — the README must stand alone
- structure: `# name` → one-liner → standalone-links line → `## Goal` → `## Strategy`
- one-liner: the reader's outcome first, the mechanism last; ecosystem benefit at the end, if at all
- section order: reader-first — outcome, then interaction, then mechanics; internal mechanism goes last or stays hidden
- `## Goal` names what changes for the reader, phrased positively — how the skill works with them, not what breaks without it; `## Strategy` describes the means
- standalone links: [craft-more](../../README.md) · [Getting started](../../docs/GETTING_STARTED.md) · [Install](../../docs/INSTALL.md)
- language: English, English quotes ("…"), no language mix
- paths: `~/`, never usernames or private info; when in doubt, grill it — assume nothing
- harness-neutral: tool names stay out — say "web search", not `websearch`
- never break a rule in the same artifact that states it — stating a rule is not applying it
- unvalidated content is labeled `mock` or hypothesis, never silently claimed as fact
- closure over enumeration: state the rule that implies the rest; do not enumerate what the closure already covers
- distinct names: give a generic atom and its structural term separate words — `unit` for the atom, `node` for the tree — never one name for both

### Authoring workflow

1. start with a `README.md` — it carries the skill while it is a draft
2. grill it first — a relentless interview in rounds that sharpens the design: decide before writing
3. write the README
4. let the user edit quietly — watch, don't police
5. verify with a single read-through pass
6. the user stages and commits themselves
7. a draft needs no `SKILL.md` — the README stands in until validation
