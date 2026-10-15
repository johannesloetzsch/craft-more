# evaluation-report

A structured report of finished work with built-in reflection — whose proposed rules feed [skill-evolution](../skill-evolution/README.md).

This is a standalone skill from the [craft-more](<../../README.md>) skill collection. Install and usage: [Getting started](../../docs/GETTING_STARTED.md) · [Install](../../docs/INSTALL.md)

## Goal

Finished work turns into durable insight. This skill gives it a fixed home:
- a report template for finished work
- an explicit reflection — what was applied, what worked, what to improve
- comparable reports, so rules and insights accumulate instead of evaporating

## Strategy (mock)

Planned approach, not implemented yet:
- a report template with a fixed entry structure
- a built-in reflection section with four fixed parts:
  - applied rules
  - strengths with evidence
  - improvements with fixes
  - proposed rules with an implementation target
- reports are invoked by the [workflow](../workflow/README.md) meta-skill; their proposed rules are the input for [skill-evolution](../skill-evolution/README.md)

## Entry format

The single source of truth for the report entry format — logs reference it, never duplicate it.

Domain vocabulary per entry: 🤒 [SYMPTOM] → 🩺 [DIAGNOSIS] → 🎯 [ROOT-CAUSE] → 🔧 [FIX] → 💡 [LEARNING] → ♻️ [REFLECTION] → ⏰ [REVISIT]

Entries are read by people who were not in the session: each entry must stand alone — names and context are introduced, session-only jargon explained, nothing assumed from memory.

Three rules keep an entry public and durable:
- **English only.** An entry is written in English; a quote is translated, not left verbatim.
- **Durable references only.** An entry names only durable repo artifacts and durable conventions. A session-scratch (`tmp`) path may appear only with explicit user approval; anything outside the repository or otherwise private never appears in the log.
- **Purpose-bound.** An entry carries only what the repository's purpose requires, and never leaks otherwise potentially sensitive data.

Status and action markers come from [emoji-markers](../emoji-markers/README.md) — referenced, never duplicated.

Every entry ends with a reflection, in this order:
- applied rules
- strengths (one line each, with evidence)
- improvements (each with a fix)
- proposed rules (each with an implementation target)

This collection's [HISTORY.md](../../docs/HISTORY.md) is the running log of this format.

## Writing an entry

An entry is written like a unit of work — see [plan-build-workflow](../plan-build-workflow/README.md). The steps that have proven useful:

1. reflect on the session and collect the candidate lessons
2. classify each against the existing log: already recorded, changed, or new
3. keep only the changed and new lessons, prioritised
4. draft the entry for a content-go
5. once the go is given, run the pre-write audit — language (English only) · paths (durable only) · privacy (purpose-bound, no otherwise-sensitive data) · standalone (readable without the session) — then write it and verify
6. triage the proposed rules

Entries hold meta-level lessons for future collaboration; content changes live in git, not here.

A reflection exists to find gaps; its proposed rules are the backlog — a running requirements analysis. After writing, triage each rule: if it is implementable now — its home exists and no questions are open — propose the extension concretely and grill it before writing; otherwise it stays in the backlog. Deciding where a rule belongs is [skill-evolution](../skill-evolution/README.md); persisting it is [skill-authoring](../skill-authoring/README.md).
