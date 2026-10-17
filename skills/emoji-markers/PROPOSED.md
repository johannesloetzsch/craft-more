# Proposed markers

## resolved

These previously proposed markers are now part of the canonical set in [SKILL.md](SKILL.md):

- 🏁 `[FINISH]`, 🚧 `[CHECK]`, 🧲 `[STEER]` — goals, checkpoints, steering
- 🔎 `[INSPECT]`, 🧪 `[LAB]`, 📎 `[EVIDENCE]` — inspecting, testing, evidence
- 🌙 `[NIGHTSHIFT]`, 📦 `[PACKAGING]` — batch runs, packaging

<!--
Symbol history: [CHECK] was originally shown with the white flag (U+1F3F3 + FE0F), which failed to render on several systems; it now uses the construction site 🚧. Either way the symbol is only a memory aid — the meaning of CHECK is the deliberate pause and re-evaluation.
-->

## Categories

The emoji vocabularies of the collection, side by side. Only the emoji and the
`[WORD]` identifier are shown here — every meaning stays in its home.

| Category | Home | Surface | Role | Opens | Authority | Notes |
|---|---|---|---|---|---|---|
| Chat / node markers | [`emoji-markers/SKILL.md`](SKILL.md) | chat reply · parse-back outline | tags one unit | chat unit · node | canonical (closed, 21) | the chat vocabulary |
| Result markers | [`plan-build-workflow/CONTRACT.md`](../plan-build-workflow/CONTRACT.md) | machine report (result line) | tags a contract's `result` | node (cross-context) | role over the closed set | ✅ `[OK]` · ⚠️ `[WARN]` · 🧾 `[REPORT]` · 📋 `[FINALIZE]` · 🔐 `[APPROVE]` |
| Machine markers | [`plan-build-workflow/SKILL.md`](../plan-build-workflow/SKILL.md) §Output | machine report | frames one report line | machine line | local | 🚀 🏷️ 👀 💾 💰 ⏩ 🤝 📚 💬 🚨 + 👍 👎 🤷; disjoint from the closed set |
| Entry-log / domain vocabulary | [`evaluation-report/README.md`](../evaluation-report/README.md):29 | log entry | tags one part of an entry | log entry | domain | 🤒 🩺 🎯 🔧 💡 ♻️ ⏰ · never opens a chat unit |
| Source ladder | [`parse-back/README.md`](../parse-back/README.md):40 | inside 🔎 `[INSPECT]` | ordered sources to walk | none | **non-marker** | 👤 💻 🔍 📄 |
| Ad-hoc evaluation circles | [`emoji-markers/SKILL.md`](SKILL.md):77 | evaluation tables only | quick color coding | none | **non-protocol** | 🔴 🟡 🟢 |
| Confidence | [`uncertainty-and-verification/README.md`](../uncertainty-and-verification/README.md):21 | chat reply | confidence on a statement | via the closed set | reuse | ✅ verified · ⚠️ uncertain |

### Rendering

Prefer **default-emoji-presentation** codepoints; symbols carrying the variation
selector U+FE0F render inconsistently — in some surfaces they need an extra space.
Two markers were replaced for this:

- 🏳️ `[CHECK]` (U+1F3F3 + FE0F) → 🚧
- ⚖️ `[VERDICT]` (U+2696 + FE0F) → 👍 / 👎 / 🤷
