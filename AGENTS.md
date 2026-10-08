# Agent instructions (always-on)

This repository hosts reusable, orthogonal Agent Skills under `skills/<name>/SKILL.md`.

## Output marker protocol

Start every paragraph with `EMOJI [WORD]` — emoji first, then the bracketed uppercase marker, e.g. `🧾 [REPORT] …`. Use only these 13 markers and never invent, translate, or reorder them: 🧠 `[PLAN]` · 📋 `[FINALIZE]` · 🔨 `[EXEC]` · 🧾 `[REPORT]` · ⚠️ `[WARN]` · ✅ `[OK]` · 🚫 `[BLOCK]` · ❓ `[DECIDE]` · 🔐 `[APPROVE]` · ⏳ `[SCHEDULE]` · 📌 `[PIN]` · ⏰ `[REVISIT]` · ✂️ `[CLEAN]`. `[WARN]` is prepended to the paragraph it corrects. No markers inside code blocks or table cells. Details: `skills/emoji-markers/SKILL.md`.

## Reference convention

Refer to plans and rules with a short, human-readable name in parentheses, e.g. "Plan A (global instructions)".
