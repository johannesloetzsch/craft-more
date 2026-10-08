---
name: emoji-markers
description: Use when formatting conversational assistant output to signal status per paragraph, and apply it to every paragraph of every response. Defines a fixed, closed marker set (emoji followed by an uppercase bracketed word marker) for planning, finalized plans, executed steps, reports, warnings, verification, blockage, decisions, permissions, scheduling, pinning, revisiting, and cleanup. Triggers on pin, park, defer, resume, revisit, remind, or clean up.
---

# Emoji Markers

A fixed status-marker protocol for conversational output. Apply it to the first line of every paragraph in every response.

## Canonical form

Start every paragraph with `EMOJI [WORD]` — the emoji first, then the bracketed uppercase word marker, then the text:

```
🧾 [REPORT] The build finished with two warnings.
```

- Emoji comes first; the bracketed word marker comes second. This order is fixed.
- Show both parts by default.
- Only when the surface cannot render emoji (plain terminals, logs, diffs), fall back to the bare word marker: `[REPORT]`.

## Marker set (closed)

Use only these markers. Never invent, abbreviate, translate, or reorder them.

| Emoji | Word marker | Meaning |
|---|---|---|
| 🧠 | `[PLAN]` | Planning / outlook |
| 📋 | `[FINALIZE]` | Finalized plan |
| 🔨 | `[EXEC]` | Executed step |
| 🧾 | `[REPORT]` | Report / summary |
| ⚠️ | `[WARN]` | Uncertainty / correction |
| ✅ | `[OK]` | Verified |
| 🚫 | `[BLOCK]` | Blocked |
| ❓ | `[DECIDE]` | Decision needed |
| 🔐 | `[APPROVE]` | Tool call needs permission |
| ⏳ | `[SCHEDULE]` | Plan a resource-intensive task (time and tokens) |
| 📌 | `[PIN]` | Pin a task |
| ⏰ | `[REVISIT]` | Revisit a pinned task when timely |
| ✂️ | `[CLEAN]` | Cleanup / minimization / removal |

## Rules

- Exactly one marker per paragraph, placed at the start.
- The word marker is mandatory, uppercase, and in square brackets: `[REPORT]`, never `REPORT:`.
- `[WARN]` is prepended to the paragraph it corrects.
- No markers inside code blocks or inside table cells. The reference table above is the only exception.

## Anti-patterns

- `REPORT: text` — missing emoji and missing brackets.
- `🧾 REPORT text` — word marker not bracketed.
- `REPORT 🧾 text` — emoji placed after the word marker (wrong order).
- `note: text` — invented marker, wrong case.
- Emoji with no word marker while emoji are renderable.

## Synonyms

- "pin", "park", "defer" all mean `[PIN]`.
- "revisit", "resume", "remind" all mean `[REVISIT]`.
- "clean up", "tidy", "prune", "minify" all mean `[CLEAN]`.

## Not part of the protocol

Ad-hoc colored circles used only inside evaluation tables carry no marker: 🔴 (bad/blocked), 🟡 (medium), 🟢 (free/good).
