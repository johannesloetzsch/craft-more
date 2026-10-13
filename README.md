# craft-more

**`slop less and vibe :) but craft more…`**

**`slop-less && vibe|bat && craft|more`**

Tools that show how we learn together.

<!--
TODO (later / website): live-develop the hero line token-by-token with a small JavaScript snippet.
Idea: an animated morph `slop-less` ↔ `slop|less`, like a loading bar.
-->

## Skills

Status: ⚪ planned · 🟣 draft · 🔴 mock · 🟠 poc · 🟡 prototype · 🟢 mvp · 🔵 mature — see [maturity-model](skills/maturity-model/).

### Core workflow
- 🔴 [`workflow`](skills/workflow/) 🌱 — Read back, think in the open, review early — your goal, your plan, your every step; craft, not slop
- 🔴 [`plan-build-workflow`](skills/plan-build-workflow/) 🌱 — One unit of work, done in the open: plan and grill it first, then build in small approved steps — nothing written without a go
- ⚪ [`cost-budget-guardrails`](skills/cost-budget-guardrails/) 📄 — Token/permission budget, cheapest source first
- 🔴 [`tool-selection`](skills/tool-selection/) 🌱 — Move towards the goal with the right instrument — deliberately chosen by requirements

### Research
- ⚪ [`environment-discovery`](skills/environment-discovery/) 📄 — Resource-efficient, non-intrusive environment probing
- 🔴 [`web-research`](skills/web-research/) 🌱 — Research strategy — set the goal first, then walk the source ladder from the cheapest to the most expensive source, naming each step along the way
- ⚪ [`info-source-index`](skills/info-source-index/) 📄 — Entry point: where to look first

### Session forensics
- 🔴 [`session-archaeology`](skills/session-archaeology/) 🌱 — See how a codebase was built — read session exports alongside git history and the repository's history log to trace provenance, order, and gaps, with honest confidence
- 🔴 [`session-replay`](skills/session-replay/) 🌱 — Rebuild what a session produced — reconstruct files and understanding from an export, choosing deliberately between 1:1 replay and interactive re-authoring, verified against the session's own records

### Learning loop
- 🔴 [`evaluation-report`](skills/evaluation-report/) 🌱 — A structured report of finished work with built-in reflection — whose proposed rules feed skill-evolution
- 🔴 [`maturity-model`](skills/maturity-model/) 🌱 — Make the maturity of a project — or any part of it — visible and honest: one status label from planned to mature, so quality claims are recognizable at a glance

### Meta & wrap-up
- 🔴 [`skill-authoring`](skills/skill-authoring/) 🌱 — Author new skills without drift — each one self-contained, reader-first, and every rule in a single home
- ⚪ [`skill-discovery`](skills/skill-discovery/) 📄 — Find top skills from leaderboards and curators
- 🔴 [`skill-evolution`](skills/skill-evolution/) 🌱 — Every proposed rule gets a home — extend an existing skill, start a new one, or park it in the backlog
- ⚪ [`name-discovery`](skills/name-discovery/) 📄 — Interactive naming: criteria, conflict and domain checks

### Behavior & guardrails
- 🔴 [`uncertainty-and-verification`](skills/uncertainty-and-verification/) 🌱 — Verify whenever the actual purpose requires it — a protocol for keeping a shared, honest picture of how valid the information we process is
- ⚪ [`step-sequencing`](skills/step-sequencing/) 📄 — Order steps for resource efficiency and interactivity
- 🟠 [`interaction-guard`](skills/interaction-guard/) 📡 — Keep the reply and the tool channel separate — answer in the reply, call a tool only for a named requirement, and stop the moment the user says so

### Audit
- ⚪ [`audit-consistency`](skills/audit-consistency/) 📄 — Check the collection against its own conventions (headings, quotes, paths, links, catalog)

### Communication & style
- 🔴 [`parse-back`](skills/parse-back/) 🌱 — See the whole task at a glance — a live, marker-annotated outline opens every reply, so the goal, the settled facts, and the open questions are all visible in one look
- 🟢 [`emoji-markers`](skills/emoji-markers/) 🏁 — A fixed marker vocabulary for conversational output — one status marker (emoji plus uppercase word) tags each paragraph, and each parse-back node
- 🔴 [`communication-style`](skills/communication-style/) 🌱 — Give every message one predictable style — formatting, language, and names — so output stays easy to read and unambiguous
- ⚪ [`language-selection`](skills/language-selection/) 📄 — Choose programming languages with justification
- ⚪ [`coding-style`](skills/coding-style/) 📄 — Coding style conventions

Installation: see [`GETTING_STARTED.md`](GETTING_STARTED.md).


<!-- TODO: filename for this configuration is missing, but as far as I know there is no generic solution for different harnesses. may want use the codencode config file? -->
```jsonc
{
  "skills": { "paths": ["~/src/craft-more/skills"] }
}
```

<!-- TODO: research how common/curated skill repos document installation, then revisit this snippet. -->


## Why

`less slop → better vibe → more craft`

**less slop, a better view, more craft** — tools that show how we learn together.


## Maturity

🔴 mock 🌱 — The repo is new and under active development. <!-- Repo-level label; individual skills may deviate. -->

Works for me already better than the other tooling I know.

Glad if it is useful for you too…
…when you have questions feel free to ask.
When you have suggestions how to improve: I'll be happy.

The suggested markers and protocols can be understood as a draft for an RFC ;)
