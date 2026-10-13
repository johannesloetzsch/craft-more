# HISTORY

Continuous log of the collaboration on this skill collection.
English — this repo is public. Latest entries at the bottom (log semantics).

## Conventions

Entry format — domain vocabulary, markers, and the reflection structure — is defined once in [evaluation-report](skills/evaluation-report/); this log references it, never duplicates it.

---

## 2026-10-09 · Repo foundations: vibe-less → craft-more

🩺 [DIAGNOSIS] The repo was renamed from `vibe-less` to `craft-more`; install docs (`GETTING_STARTED.md`, `INSTALL.md`) point to `~/src/craft-more/skills`. A stale absolute path (`~/src/vibe-less/skills`) still lives in the global opencode config (`~/.config/opencode/opencode.jsonc`) — changing it remains an open user decision.

🎯 [ROOT-CAUSE] Absolute paths in configs go stale silently when a repo is renamed or moved.

🔧 [FIX] ✅ [OK] Install paths rewritten to `~/src/craft-more/...`; README title, catalog line for `uncertainty-and-verification`, and install path references updated.

💡 [LEARNING] Docs must never contain usernames or absolute home paths — `~/` only.

♻️ [REFLECTION]

Applied rules: skill-authoring (README conventions) · communication-style (English) · uncertainty-and-verification (verify before claiming)

Strengths
- ✅ [OK] Path audit was local and read-only (rg), zero web tokens. (cost-budget-guardrails)
- ✅ [OK] The stale path was flagged as an open decision, not silently changed. (interaction-guard)

Vorgeschlagene Regeln (proposed rules)
- 📌 [PIN] Paths in docs use `~/`, never usernames or absolute homes. Implementation: `skill-authoring` README rules.

⏰ [REVISIT] Decide whether to update the global `skills.paths` in `~/.config/opencode/opencode.jsonc`.

---

## 2026-10-09 · Mock READMEs and session conventions

💡 [LEARNING] Four mock READMEs were authored and committed — `uncertainty-and-verification`, `evaluation-report`, `web-research`, `skill-authoring`. The `workflow` mock is drafted and in review.

Conventions derived while authoring (now in `skill-authoring`):
- README structure: `# name` → one-liner → standalone-links line → `## Goal` → `## Strategy (mock)`
- one-liner rule: what the skill does first; ecosystem benefit at the end, if at all
- audience: humans considering adoption — README must stand alone
- language: English, English quotes ("…") — public repo
- harness-neutral: no tool names — say "web search", not `websearch`
- relative links within the collection; no cross-repo references
- unvalidated content is labeled `mock` or hypothesis
- a skill draft needs no SKILL.md — the README stands in until validation

Marker proposals: six proposed markers are collected in `skills/emoji-markers/PROPOSED.md`, status `pending`. Principle: decide on a marker only where a real skill needs it.

♻️ [REFLECTION]

Applied rules: emoji-markers (closed set, proposals parked) · cost-budget-guardrails · skill-authoring (grill-first) · plan-build-workflow (approval before write)

Strengths
- ✅ [OK] Grill-first: every mock was grilled in chat before a deterministic write phase; all written READMEs were committed 1:1, no rewrite rounds. (skill-authoring workflow)
- ✅ [OK] Resource ladder in conversation: read-only local checks (git status/diff, rg, wc) instead of guessing; 0 web tokens this session. (cost-budget-guardrails)
- ✅ [OK] Marker discipline: no new markers invented in session traffic; proposals collected, pending. (emoji-markers)
- ✅ [OK] Code hygiene: never staged or committed without the user. (interaction-guard)

Improvements
- ⚠️ [WARN] One-liner and catalog drifted apart; catalog kept old wording. Fix: catalog lines adopt the README one-liner. (skill-authoring)
- ⚠️ [WARN] `INSTALL.md` had an unclosed HTML comment hiding the rest of the file. Fix: close `-->`; check rendered output in audits. (consistency audit, see last entry)

Proposed rules
- 📌 [PIN] Grill until the draft is sharp, then write deterministically. Implementation: `skill-authoring` workflow.
- 📌 [PIN] Ask before reading large files (~2.5k+ tokens); offer skim first. Implementation: `cost-budget-guardrails`.

⏰ [REVISIT] Marker decision (none needed yet — decide where a skill requires one) · question-tool wish parked for later reflection.

---

## 2026-10-09 · Portability error in the workflow draft

🤒 [SYMPTOM] The first `workflow` draft hardcoded this repo as the mechanism: dispatch steps named `web-research`, `evaluation-report`, `interaction-guard`, and the wrap-up was tied to the repo's evaluation-report → skill-evolution → skill-authoring chain — unusable outside craft-more.

🩺 [DIAGNOSIS] Anchor effect: the whole session revolved around this repo, so "orchestrate the other skills" was read as "the other craft-more skills". The standalone rule (READMEs must serve adopters in any collection) was under-applied — the same error class as harness-neutral wording, which had been applied to tool names but not to repos.

🎯 [ROOT-CAUSE] Context-over-fit: repo internals were treated as mechanism instead of as examples.

🔧 [FIX] Rework the draft with a generic mechanism (goal sentence, catalog lookup, name the step, user in the loop, verify before claiming) and keep this repo's skills only as marked examples. Draft is pending review.

💡 [LEARNING] Portability rules apply to every artifact, not only to tool names.

♻️ [REFLECTION]

Applied rules: skill-authoring (README-first) · emoji-markers (no new markers) · uncertainty-and-verification (treat the draft as hypothesis until grilled) · plan-build-workflow (grill before write)

Session reflection — what worked well
- ✅ [OK] Grill-first with relentless interviews; all four written READMEs survived the write phase unchanged.
- ✅ [OK] Resource discipline: read-only local checks, estimates instead of guessing (wc), 0 web tokens.
- ✅ [OK] Marker and commit hygiene: closed set held, proposals parked, never staged without Go.
- ✅ [OK] Context continuity: session memory plus the Firefox HISTORY.md as the log template carried decisions across turns.

Where user correction first produced the target quality
- `web-research`/`Problem` described the state WITHOUT the skill → user: positive framing of how research works WITH the skill; renamed to Goal.
- `[CHECK]` as a list item hid the white flag → rule: full-width line, no list prefix, HTML comment about the rendering quirk.
- ladder as its own line-by-line subsection with emoji → user structure choice.
- PROPOSED.md rebuild: FINISH first (goal-first), TEST → LAB, HTML comment — a substantial quality jump.
- language consistency: German quotes and parentheticals out; English only, public repo.
- portability itself: the workflow error was caught by the user before a single write.

Improvements
- ⚠️ [WARN] Context-over-fit in the workflow draft. Fix: portability gate for every artifact (proposed rules). (skill-authoring)
- ⚠️ [WARN] Catalog-vs-one-liner drift and unclosed HTML comment survived several reviews. Fix: dedicated consistency audit (proposed rules).
- ⚠️ [WARN] My audit impulse was "invent a skill" before checking the catalog — no audit skill existed. Fix: check the catalog first, then propose a placeholder. (skill-authoring)

Fun fact: the `~/`-only path rule was proposed in the very entry that had leaked an absolute home path (`/home/vibe/...`, fixed to `~/`). Stating a rule is not applying it — the audit, not the sentence, is what guards.

Proposed rules
- 📌 [PIN] Portability gate: every line of every artifact must survive a foreign skill collection. Implementation: `skill-authoring` (portability section).
- 📌 [PIN] Mechanism generic, repo names only as marked examples. Implementation: `skill-authoring` / `workflow`.
- 📌 [PIN] Fixed grill question per mock: "does it work without this repo?" Implementation: `skill-authoring` workflow.
- 📌 [PIN] Consistency audit checklist: Goal norm across READMEs, English quotes only, no stale paths/names, no unclosed HTML comments, catalog equals one-liner, correct label order, Title Case. Implementation: new skill (name pending) with README placeholder in catalog.
- 📌 [PIN] History stays in English — public repo. Implementation: this file.

⏰ [REVISIT] workflow rework (portability fix) · audit skill name + README placeholder · global `opencode.jsonc` stale path · AGENTS.md hint about HISTORY.md (open) · question-tool reflection (parked).

---

## 2026-10-09 · Maturity model, workflow rework, interaction rules

🤒 [SYMPTOM] Two relapses into batch mode despite the grill discipline: the `maturity-model` draft was scoped to this collection's skills only, although it must serve every project adopting the skills; and the `workflow` README was written in a single silent shot — the user had stated a goal ("backlog-statt-batch into the workflow"), not given a write-Go. A session recap was also written into the repo (`.opencode/summaries/LATEST.md`) without announcement.

🩺 [DIAGNOSIS] Goal statements were executed as commands the same turn; scope claims outran their mechanisms; internal recap files landed in a public repo.

🎯 [ROOT-CAUSE] Context-over-fit again (maturity scoped to "our" skills), plus a missing gate between aim and act: a stated goal reads like an approval.

🔧 [FIX] `maturity-model` rewritten (project-wide scope, slop-honesty motivation, 8-state ladder per user spec, rule "catalog updated when a skill changes — skill README is the source of truth") · `workflow` README written (plan/build phases, planning = grilling, build interactive by default, `night shift` batch only on explicit approval, backlog-statt-batch hosted here until `interaction-guard` exists) · `emoji-markers`: **mvp** + "Road to mature" · `PROPOSED.md`: CHECK 🏳️→🚧 (meaning-first, "stay neutral" removed), new section "Execution modes" with 🌙 `[NIGHTSHIFT]`.

💡 [LEARNING] A stated goal is not a write-Go — ask when unsure. Scope claims must match the mechanism underneath (Goal vs ladder). "Done" claims need verification, my own included. Internal notes never enter a public repo unannounced.

♻️ [REFLECTION]

Applied rules: skill-authoring (grill-first) · emoji-markers (closed set, proposals pending) · plan-build-workflow (approval before write — violated once) · uncertainty-and-verification (verify before claiming — violated once, "stay neutral")

Strengths
- ✅ [OK] User edits integrated: ladder honesty comment, mvp row de-skillified. (user-correction → quality)
- ✅ [OK] Interaction reset held: every answer since shows 🏁 [FINISH]/🚧 [CHECK], one focus question, all open questions visible. (interaction rules)
- ✅ [OK] Staging stayed the user's job all session. (interaction-guard)

Improvements
- ⚠️ [WARN] Workflow written without write-Go. Fix: distinguish a stated goal from a write-Go; ask when in doubt. (interaction-guard / workflow)
- ⚠️ [WARN] "Inconsistency gone" claimed while "stay neutral" remained. Fix: verify done-claims with evidence. (uncertainty-and-verification)
- ⚠️ [WARN] Recap file in public repo. Fix: summaries stay out of the repo — decision pending. (LATEST.md)

Proposed rules
- 📌 [PIN] Maturity upgrades only through an experienced developer — never by the agent. Implementation: `skill-authoring` + `maturity-model`.
- 📌 [PIN] A stated goal is not a write-Go — and a write-Go is not a content-Go: content choices (names, translations) are proposed first. Implementation: `workflow` / `interaction-guard`.
- 📌 [PIN] 🏁 / 🚧 for goal and checkpoint; token budget per goal and checkpoint. Implementation: `PROPOSED.md` + `workflow`.
- 📌 [PIN] All open questions listed, one focused at a time. Implementation: `interaction-guard`.
- 📌 [PIN] Symbol is only a mnemonic — semantics first. Implementation: `PROPOSED.md`.

⏰ [REVISIT] 🏳️→🚧 in web-research mock · LATEST.md decision · ladder generalized to projects · workflow portability grill · ampel design · `interaction-guard` fill · anti-batch evaluation · checkpoint/token details

---

## 2026-10-10 · Coaching rules, report–history split, ampel settled

🤒 [SYMPTOM] Two coaching-mode relapses in one session: a `git diff` review turned into a wall of output, and the user had to say "toast mode — no long batches" twice. A rule candidate ("own history skill") was proposed for the wrong home, and scope drifted into extra interpretations where only the commissioned step was asked. The maturity ladder needed several rounds before it landed.

🩺 [DIAGNOSIS] Anti-batch had only covered file writes, not the answer itself; length was treated as harmless while it was the thing eroding the loop. Planning lacked a gate between "explicitly commissioned" and "might additionally be wished for", and the user had no cheap way to verify my parse before a long turn.

🎯 [ROOT-CAUSE] "Grill instead of toast" was applied to actions but not to prose; a named rule was mistaken for an applied one (again). Parsing and reasoning stayed implicit, so misreads surfaced only after expensive output.

🔧 [FIX] Meta decisions: the report/entry format moved to `evaluation-report` as SSOT, with `HISTORY.md` referencing it (one line); the maturity-upgrade rule was rehomed into `maturity-model` Rules; new session rules adopted — adaptive reasoning, parse-back, planning-mode discipline. Content changes (ampel ladder/scales, catalog one-liners, `PROPOSED.md`, 🏳️→🚧) — details in git, not here.

💡 [LEARNING] Anti-batch includes the answer: length is part of the interaction budget, and a stated rule ("no long batches") is not an applied one. A short parse-back in the user's own words buys cheap verification before expensive reasoning. Report and history teach meta-lessons; diffs belong to git. A rule needs one correct home before it needs wording.

♻️ [REFLECTION]

Applied rules: evaluation-report (entry format, now SSOT) · emoji-markers (closed set, no new markers) · maturity-model (7-state ladder) · skill-authoring (user-first docs) · workflow (plan/build, approval before write) · uncertainty-and-verification (verify before claiming)

Strengths (what worked, with the user's satisfaction as evidence)
- ✅ [OK] Parse-back and honest uncertainty in the reasoning were explicitly praised — "das hätte ich künftig gerne immer sofort". (coaching rules)
- ✅ [OK] No quick shot under uncertainty: paused and asked instead — "gut, dass du das schreibst". (uncertainty-and-verification)
- ✅ [OK] Collisions found instead of acted on: 💡 [LEARNING], 📌 [PIN], 🧪 [LAB] ruled out; 📦 reserved → `[PACKAGING]`; catalog duplicate `plan-build-workflow` vs `workflow` flagged, not rewritten — "gut dass du … nicht direkt geschrieben hast". (interaction-guard)
- ✅ [OK] Reasoning on HISTORY ↔ evaluation-report led to a clean split — "gutes reasoning :)"; both files staged by the user without changes. (evaluation-report)
- ✅ [OK] Staging stayed the user's job the whole session. (interaction-guard)

Improvements (what did not work, each with a fix)
- ⚠️ [WARN] Toast mode twice — long answers where one focused result was asked. Fix: answer size is part of anti-batch; parse-back first, adaptive reasoning, only commissioned work. (coaching rules)
- ⚠️ [WARN] The maturity ladder took several rounds. Fix: present the option set once with a collision pre-check; iterate only on request. (maturity-model)
- ⚠️ [WARN] Rule candidate proposed for the wrong home ("own history skill"). Fix: name one home per rule and correct it by question, as the user did. (evaluation-report)
- ⚠️ [WARN] The open-question list appeared in every turn — useful but noisy. Fix: keep all open items, but one focus; trim the rest to a word. (interaction-guard)

Proposed rules (behavior first; file homes open unless noted)
- 📌 [PIN] Adaptive reasoning: surface the reasoning when it aids debugging (friction signals, complex or ambiguous asks, non-obvious decisions); when the result is certain and simple, give the result, not the derivation. Implementation target: open.
- 📌 [PIN] Parse-back: always open with a short summary of the task in own words and bullets, before any long reasoning. Implementation target: open.
- 📌 [PIN] Planning mode: do only what was explicitly commissioned — no extra interpretations; when unsure what is wanted next, ask directly. Implementation target: open.
- 📌 [PIN] Report and history focus on meta-level learnings for future collaboration; content diffs live in git. Implementation target: `evaluation-report`.
- 📌 [PIN] Point out briefly when a skill would be useful or is required but has no SKILL.md yet. Implementation target: `skill-authoring`.

⏰ [REVISIT] Skill-tool wiring + context costs (when READMEs become SKILL.md) · `plan-build-workflow` → `workflow` merge · LATEST.md decision · anti-batch evaluation · `interaction-guard` fill · checkpoint/token details · second half of the write-Go rule ("stated goal ≠ write-Go") → `workflow`

---

## 2026-10-10 · Grilling becomes the default planning mode

🤒 [SYMPTOM] Grilling — the substance behind `grill-me` — was only a placeholder word in the workflow ("planning = grilling"), with none of its mechanics; the split between meta-orchestration and a single unit of work was still open. Then, for the first time in a long while, the readback failed to appear (likely after a context compaction).

🩺 [DIAGNOSIS] Naming a behaviour is not the same as specifying it. And a coaching rule that lives only in session context can be silently dropped by a compaction.

🎯 [ROOT-CAUSE] A named rule mistaken for an encoded one (again): until a rule has a home in an artifact, it is not durable.

🔧 [FIX] Created `plan-build-workflow` (one unit of work: plan / build / verify-and-hand-back; grilling as the default planning mode — design tree, rounds, frontier, numbered questions with recommended answers, whole frontier shown with one asked concretely, the harness question tool on an explicit "grill-me"; approval flow with stage/commit owned by the user and an immediate return to planning after every build). `workflow` keeps the meta-orchestration and hands off. Content details in git.

💡 [LEARNING] The home choice is the anchor — grilling now lives where planning happens. A rule not encoded in a file can be lost to compaction, so coaching rules must be filed, not just adopted.

♻️ [REFLECTION]

Applied rules: plan-build-workflow (grill before write, approval before write) · evaluation-report (entry format) · emoji-markers (closed set) · maturity-model (status labels) · skill-authoring

Strengths
- ✅ [OK] Grilling mechanics captured completely, in the right home, after a coverage check — the user approved the draft ("der entwurf ist gut") and staged it unchanged. (plan-build-workflow)
- ✅ [OK] Both extra constraints were incorporated before writing: stage/commit owned by the user, and an immediate return to planning after each build. (approval flow)
- ✅ [OK] When told to "behave exactly as described", the fresh skill was adopted as the anchor instead of improvising. (plan-build-workflow)
- ✅ [OK] Staging stayed the user's job — "I staged without changes". (interaction-guard)

Improvements
- ⚠️ [WARN] Readback-first dropped after long use — the user had to remind. Fix: readback is the first move of every task, and must be filed, not only known. (coaching rules)
- ⚠️ [WARN] Overthinking in the grilling round — more questions than the decision needed. Fix: keep the frontier small; when an answer already implies the rest, propose the artifact instead of grilling on. (plan-build-workflow)

Proposed rules
- 📌 [PIN] Readback first: open every task with a short own-words summary before any long reasoning. Implementation target: open.
- 📌 [PIN] Grilling is the default planning mode, not an invoked one: show the whole frontier, ask one focused question concretely, use the harness question tool on "grill-me". Implementation: `plan-build-workflow`.

⏰ [REVISIT] "Facts = the agent's job" — possible conflict with other rules (parked) · catalog status for `plan-build-workflow` (planned → mock) · `workflow` → `plan-build-workflow` handoff wiring

---

## 2026-10-10 · Reader-first authoring and DX

🤒 [SYMPTOM] The rebuilt `workflow` meta-skill first landed with a mechanism-first one-liner ("orchestrate a session … backlog, checkpoints, handing each unit to plan-build-workflow") and duplicated the plan/build phases that `plan-build-workflow` now owns. After the write, the catalog line and the README one-liner briefly drifted apart.

🩺 [DIAGNOSIS] The README was written for the mechanism, not for the reader deciding whether to adopt the skill: internal how-to was foregrounded, and the skill's promise in the user's own terms was missing. Duplication crept in because the home of the phase details had only just been split.

🎯 [ROOT-CAUSE] Authoring defaulted to "describe how it works" instead of "state what the reader gets". A rule with a fresh home is not yet respected everywhere.

🔧 [FIX] `workflow` rewritten: one-liner now the reader's outcome ("Read back, think in the open, review early — your goal, your plan, your every step; craft, not slop"); the unit phases reference `plan-build-workflow` instead of repeating it; sections reordered reader-first ("Keeping the user in the loop" before checkpoints and budget); the internal "Portable mechanism" section commented out; catalog line aligned. Content details in git.

💡 [LEARNING] The one-liner is the skill's promise to the reader — outcome first, mechanism last. Sections are ordered by what the reader cares about; internal mechanism goes last or stays hidden. DX is a first-class goal: never leave the user waiting — read back, think in the open when it helps, review early.

♻️ [REFLECTION]

Applied rules: skill-authoring (README rules) · plan-build-workflow (grill before write) · evaluation-report (entry format) · emoji-markers (closed set) · workflow (read back first)

Strengths
- ✅ [OK] Several grilling rounds moved the one-liner from mechanics to the user's goal, folding in the user's own DX definition ("control of the goal, the plan, and every step", "craft, not slop"). (plan-build-workflow / DX)
- ✅ [OK] The user's reader-first reprioritising was recognised as the real signal and reflected, not merely accepted. (skill-authoring)
- ✅ [OK] Content changes stayed in git; only meta-lessons are logged here. (evaluation-report)

Improvements
- ⚠️ [WARN] First one-liner was mechanism-first and needed user correction. Fix: open with the reader-outcome framing. (skill-authoring)
- ⚠️ [WARN] Catalog line and README one-liner drifted for one step. Fix: align both in the same pass. (skill-authoring)

Proposed rules
- 📌 [PIN] One-liner = the reader's outcome first, mechanism last. Implementation: `skill-authoring` README rules.
- 📌 [PIN] Order README sections reader-first; internal mechanism last or hidden. Implementation: `skill-authoring` README rules.
- 📌 [PIN] DX — read back first, think in the open when it helps, review early. Implementation: `workflow` (hosted), later `interaction-guard`.

⏰ [REVISIT] `skill-authoring` README rules update (the three proposed rules) · commented-out "Portable mechanism" section (restore or relocate?) · "Facts = the agent's job" conflict (parked) · `interaction-guard` fill

---

## 2026-10-10 · Workflow rules sharpened; history written as a process

🤒 [SYMPTOM] Several workflow lessons were already logged, but in a weaker form than the skills now state: the two-level split (workflow meta vs plan-build-workflow unit) was only noted in passing; checkpoints and token budget sat as an open item; the DX idea was split across parse-back and adaptive-reasoning notes; and "stage/commit is the user's job" was softer than the file now reads.

🩺 [DIAGNOSIS] A lesson noted once is not yet specified where it acts — half-filed rules keep resurfacing. And the log was written by feel, with a risk of repeating what earlier entries already captured.

🎯 [ROOT-CAUSE] "Logged" is not "specified", and a log written without a delta-check accumulates near-duplicates.

🔧 [FIX] Sharpened in the skills themselves (content in git): the unit phases moved out of `workflow` into `plan-build-workflow`, leaving `workflow` as the meta layer that references it; checkpoints and token budget are now specified in `workflow`; DX became an explicit goal (read back first, think in the open when it helps, review early); the approval flow now states that stage and commit are the user's tasks — never attempted or suggested except on explicit command.

💡 [LEARNING] Prioritised:
1. **DX is the core interaction goal** — never leave the user waiting: read back first, think in the open when it helps, review from the first line.
2. **One rule, one level** — meta vs unit, and every rule where it acts.
3. **Approval wording matters** — "the user's job" must read "never attempt or suggest".
4. **Checkpoints are only real once specified**, not while they are an open item.
5. **History is written as a process** — before a new entry, classify each lesson against the existing log (already recorded / changed / new) and log only the delta, prioritised; the entry is grilled, drafted, approved, then written, like any unit.

♻️ [REFLECTION]

Applied rules: evaluation-report (entry format) · plan-build-workflow (grill, propose before write) · workflow (read back first) · emoji-markers (closed set) · skill-authoring

Strengths
- ✅ [OK] The delta-check turned a vague "reflect" into a concrete, prioritised list instead of a repeat of the log. (evaluation-report)
- ✅ [OK] Only changed and new lessons were written — the log stays non-redundant and comparable. (evaluation-report)
- ✅ [OK] The entry's scope was grilled (new vs extend, which lessons) before any writing. (plan-build-workflow)

Improvements
- ⚠️ [WARN] Earlier entries repeated lessons already logged at a shallower level. Fix: classify against the log before drafting. (evaluation-report)

Proposed rules
- 📌 [PIN] Before a history entry, classify each lesson as already recorded / changed / new; log only changed and new, prioritised. Implementation: `evaluation-report`.
- 📌 [PIN] Treat a history entry as a unit: grill the scope, draft, content-Go, write, verify. Implementation: `evaluation-report` / `plan-build-workflow`.

⏰ [REVISIT] "Facts = the agent's job" conflict (parked) · commented-out "Portable mechanism" section · `interaction-guard` fill · divide & conquer (content-only so far)

---

## 2026-10-10 · Rule audit and answerable grilling

🤒 [SYMPTOM] A check of the recent "proposed rules" against the skills found five rules that had been learned and logged but specified nowhere — including a planning rule the user called "sehr wichtig". While settling their homes, the flat list of questions was hard to answer until the questions were grouped by theme with the problem stated up front.

🩺 [DIAGNOSIS] "Logged" is still not "filed": the log accumulates rules that no skill contains, and the gap surfaces only under an explicit log-to-skill audit. And grilling optimised for completeness, not for answerability — each question left the reader to reconstruct why it was being asked.

🎯 [ROOT-CAUSE] The log and the skills were never reconciled against each other; and a rule's home was chosen by topic rather than by where the rule actually fires.

🔧 [FIX] Mapped every recent PIN to a skill, closed the five gaps by grilling (grouped by theme, with context), and filed them: `plan-build-workflow` gained the "only the commissioned work" scope rule; `workflow` the missing-skill nudge and a scope reference; `evaluation-report` the "Writing an entry" process (delta-check, entry-as-unit reference) plus the meta-level/diffs-in-git rule. Content details in git.

💡 [LEARNING] Prioritised:
1. **A rule is filed where it acts** — the home is decided by when it fires (runtime → `workflow`; authoring → `skill-authoring`), not by which topic it touches. (The missing-skill nudge moved from `skill-authoring` to `workflow` for this reason.)
2. **Grilling must be answerable** — group questions by theme and state the problem and the proposed rule change before each question; completeness is secondary.
3. **Audit the log against the skills** — a logged rule is not a filed one; mapping each PIN to its skill surfaces the unfiled gaps.

♻️ [REFLECTION]

Applied rules: evaluation-report (entry written as a unit, delta-check) · plan-build-workflow (grill before write; proposal → content-Go → write → verify) · workflow (read back first) · emoji-markers (closed set) · skill-authoring

Strengths
- ✅ [OK] The delta-check was applied to this very entry: lessons were classified against the log before drafting. (evaluation-report)
- ✅ [OK] A generic "continue" prompt was not treated as a write-Go — stopped and asked instead. (plan-build-workflow)
- ✅ [OK] Five rules went from logged to filed with one home each, after grilling their homes. (evaluation-report)
- ✅ [OK] Staging stayed the user's job. (interaction-guard)

Improvements
- ⚠️ [WARN] Answering the first grill round was hard until the questions were grouped with context — the user had to ask for it. Fix: group by theme, give the problem and the proposed change up front. (plan-build-workflow)
- ⚠️ [WARN] One rule was first homed by topic (`skill-authoring`) instead of by fire time (`workflow`). Fix: pick the home by where the rule acts. (plan-build-workflow)

Proposed rules
- 📌 [PIN] Group grill questions by theme; state the problem and the proposed rule change before each question. Implementation: `plan-build-workflow`.
- 📌 [PIN] File a rule where it acts: the home is decided by when it fires (runtime vs authoring). Implementation: `plan-build-workflow` / `skill-authoring`.
- 📌 [PIN] Audit the log against the skills: map each PIN to its skill; unfiled rules are the gap list. Implementation: `evaluation-report`.

⏰ [REVISIT] `interaction-guard` fill (scope rule to be mentioned there) · "Facts = the agent's job" conflict (parked) · commented-out "Portable mechanism" section · `audit-consistency` still only a catalog line

---

## 2026-10-10 · The learning loop closes

🤒 [SYMPTOM] A new skill was authored from a gap found in the log, but its first Goal draft opened negatively ("Without a link … this fails"), repeating a lesson learned once for `web-research`. And the report → skill-link → skill-authoring chain, until now only hinted at in comments, had never run end to end.

🩺 [DIAGNOSIS] The positive-Goal lesson was logged as a one-off fix for one skill, not as a general README rule, so it was not applied when a new skill was written. The chain among the three skills existed only as cross-references, not as a defined flow.

🎯 [ROOT-CAUSE] A lesson fixed in one artifact is not a rule until it is written as one; and a chain of skills is not a process until each hand-off is stated.

🔧 [FIX] Authored `skill-evolution` (draft): goal and one-liner grilled first, then written deterministically; catalog line aligned in the same pass. Added the triage step to `evaluation-report`'s "Writing an entry" — reflection finds gaps, proposed rules are the backlog, implementable ones are proposed and grilled, the rest stay deferred. Content details in git.

💡 [LEARNING] Prioritised:
1. **Goals are framed positively** — they describe how the skill works with the reader, not what breaks without it. (Now a general `skill-authoring` README rule; the Goals of `plan-build-workflow` and `evaluation-report` still open negatively and should follow.)
2. **The learning loop is closed** — `evaluation-report` finds gaps, `skill-evolution` maps them, `skill-authoring` persists them; the report is a running requirements backlog.
3. **Deferral is a feature** — rules not implementable now stay in the backlog by design; a deferred rule is not a gap.

♻️ [REFLECTION]

Applied rules: skill-authoring (grill goal + one-liner first; one home per rule) · evaluation-report (entry as a unit, delta-check, triage) · plan-build-workflow (grill before write; proposal → content-Go → write → verify) · workflow (read back first) · emoji-markers (closed set)

Strengths
- ✅ [OK] The authoring sequence was applied to a brand-new skill: goal and one-liner grilled with the user first, then a single deterministic write. (skill-authoring)
- ✅ [OK] The new "group grill questions by theme, with context" rule was applied immediately after being written — the user answered the grouped themes easily. (plan-build-workflow)
- ✅ [OK] The learning loop ran end to end for the first time: a gap audit produced `skill-evolution`. (evaluation-report → skill-evolution → skill-authoring)
- ✅ [OK] Staging stayed the user's job. (interaction-guard)

Improvements
- ⚠️ [WARN] First Goal draft was negatively framed — the `web-research` lesson had not been generalized. Fix: state it as a general README rule. (skill-authoring)
- ⚠️ [WARN] A chat draft was shown without a language tag on the fence, so it had no syntax highlighting. Fix: fence drafts as ```` ```markdown ````. (communication-style)

Proposed rules
- 📌 [PIN] Goal is phrased positively — how the skill works with the reader, not what breaks without it. Implementation: `skill-authoring` README rules (then revisit the Goals of `plan-build-workflow` and `evaluation-report`).
- 📌 [PIN] The learning loop: reflection finds gaps, `skill-evolution` maps, `skill-authoring` persists; the report is the requirements backlog. Implementation: `evaluation-report`.
- 📌 [PIN] Show chat drafts in a language-tagged fence. Implementation: open (communication-style?).

⏰ [REVISIT] Positive-Goal rework for `plan-build-workflow` and `evaluation-report` · `interaction-guard` fill · "Facts = the agent's job" conflict (parked) · commented-out "Portable mechanism" section · `audit-consistency` still only a catalog line

---

## 2026-10-10 · Drafts bootstrap by reference

🤒 [SYMPTOM] In a fresh session only `emoji-markers` was available: the interaction behaviour works in the long session but not from the first prompt. Three fixes were considered and rejected: (A) duplicate the contract into `AGENTS.md`, (B) publish a `SKILL.md` for `interaction-guard`, (C) strip `AGENTS.md` to a bare pointer.

🩺 [DIAGNOSIS] A duplicates the rules and makes testing ambiguous ("what works when and when not"); B demands a new skill although the behaviour already works here; C is the opposite of the goal. What was missing was not the rules but a way to reach them — the catalog had no links, and `AGENTS.md` pointed nowhere.

🎯 [ROOT-CAUSE] The always-on channel described the intent (`skills/<name>/SKILL.md`), not the reality (README-first drafts), so nothing was navigable from `AGENTS.md`.

🔧 [FIX] Bootstrapped by reference instead: every catalog entry now links to its skill folder, and `AGENTS.md` links [README.md](README.md) and explains the README-first reality, the status labels, and where to start (`workflow`, `plan-build-workflow`). No `SKILL.md`, no duplication, independent of `skills.paths`. Validated in a real new session. Content details in git.

💡 [LEARNING] Prioritised:
1. **Bootstrap drafts by reference, not by the loader** — `AGENTS.md` → catalog → skill README; the docs carry the behaviour until `SKILL.md` files exist.
2. **The always-on description states the reality, not the intent** — otherwise nothing is navigable and the doc misleads.
3. **Reject the redundancy trap** — duplicating a contract into `AGENTS.md` (A) or pre-building a skill for it (B) adds drift and muddies testing; link instead.

♻️ [REFLECTION]

Applied rules: skill-authoring (draft first; one home per rule) · evaluation-report (entry as a unit, delta-check) · plan-build-workflow (proposal → go → write) · workflow (read back first) · emoji-markers (closed set)

Strengths
- ✅ [OK] The three rejected options were reasoned through before acting — duplication, premature skill, or stripping. (plan-build-workflow)
- ✅ [OK] The minimal, duplicate-free bootstrap was validated in a real new session, not only in theory. (uncertainty-and-verification)
- ✅ [OK] A candidate convention (a leading `---`) was applied live and iterated before being filed. (emoji-markers)

Improvements
- ⚠️ [WARN] The response separator took three iterations (after readback → at the top → with a leading newline). Fix: test the candidate live — the fix only emerged in real rendering. (emoji-markers)

Proposed rules
- 📌 [PIN] Bootstrap a draft by reference: `AGENTS.md` → catalog → skill README; no `SKILL.md` and no duplication until the skill leaves draft. Implementation: `skill-authoring`.
- 📌 [PIN] The catalog links every skill, and the always-on description states the current reality. Implementation: `skill-authoring` README rules / `audit-consistency`.
- 📌 [PIN] Open every response with a leading blank line + `---` so it renders as a horizontal rule and never glues to the previous message. Implementation: `emoji-markers` — prove first, file once proven.

⏰ [REVISIT] Separator convention (prove before filing) · `interaction-guard` fill · `communication-style` README (homes the chat-draft fence and the separator) · "Facts = the agent's job" conflict (parked) · commented-out "Portable mechanism" section

---

## 2026-10-10 · States vs. style: a layer decides the home

🤒 [SYMPTOM] Rules that fire at the same moment had no tie-breaker for their home — the `---` separator and the whole output-rule set could sit in either `emoji-markers` or `communication-style`, and "file where it fires" does not decide between two runtime skills.

🩺 [DIAGNOSIS] That rule homes a rule across levels (runtime vs authoring), not across layers within a level. The markers-are-states / style-is-rendering framing supplied the missing axis: semantics vs presentation.

🎯 [ROOT-CAUSE] The homing rule had one dimension; output rules need two.

🔧 [FIX] Authored `communication-style` (first README, mock): one-liner and Goal grilled, then written deterministically; its rules are the presentation set (separator, draft fences, language, plan/rule naming), with the process/timing rules parked at the bottom until `interaction-guard` exists. Added the mirrored sections — "Protocol, not style" to `emoji-markers`, "Style, not state" to `communication-style`; catalog line aligned and its typo fixed. Content details in git.

💡 [LEARNING] Prioritised:
1. A rule has a layer as well as a time — home it by both: when it fires (level) and what it changes (meaning/validity → state; rendering → style).
2. A clean axis earns outliers parked, not folded in — the process/timing rules got an explicit parked section with a named re-home trigger instead of blurring the axis.
3. Unproven rules may live in a mock skill — "prove before filing" guards the closed protocol; a mock is allowed to hold hypotheses.

♻️ [REFLECTION]

Applied rules: skill-authoring (grill goal + one-liner first, draft-first, one home per rule) · plan-build-workflow (grill before write, only commissioned work) · workflow (read back first) · emoji-markers (closed set) · evaluation-report (entry as a unit, delta-check)

Strengths
- ✅ The layer insight came out of dialogue, not assertion — the "style vs states" framing was reflected back and shaped the write. ("well done", "the goal is fine :)")
- ✅ Commissioned-scope discipline: exactly 2 files on "go 2 files", then only the catalog line, then only the typo fix. (plan-build-workflow)
- ✅ Staging stayed the user's job — the user staged and edited the drafts themselves. (interaction-guard)

Improvements
- ⚠️ The newly filed separator rule was not applied in the session that filed it — stated again, not lived. Fix: apply a newly filed rule in the same session. (communication-style)
- ⚠️ "Presentation layer beneath the marker protocol" read the wrong way round; the user corrected it to "above". Fix: state a stack's direction explicitly. (communication-style)

Proposed rules
- 📌 [PIN] Home a rule by layer as well as time: meaning/validity → state, rendering → style. Implementation: `skill-authoring` ("One home per rule") / `skill-evolution`.
- 📌 [PIN] Apply-live: a newly filed style/behaviour rule is applied in the session that files it. Implementation: `communication-style` / `evaluation-report`.
- 📌 [PIN] Keep unproven hypotheses in mock skills; reserve "prove before filing" for the closed protocol. Implementation: `skill-authoring`.
- 📌 [PIN] Park outliers to a clean axis in an explicit section with a named re-home trigger. Implementation: `skill-authoring`.

⏰ [REVISIT] `interaction-guard` fill (re-home the parked process rules) · separator live-proof · carried: "Facts = the agent's job" (parked) · commented-out "Portable mechanism" section · `audit-consistency` still only a catalog line.

---

## 2026-10-11 · Make the rules load-bearing; `parse-back` finalized

🤒 [SYMPTOM] "I agree to the diff" was read as a write-Go, and a file was written with no approval step; then the approval request itself was marked ❓ [DECIDE], not 🔐 [APPROVE]. A readback carried a forbidden foreground label; a marker was picked for this very log from the entry vocabulary (💡 [LEARNING], 🩺 [DIAGNOSIS], 🎯 [ROOT-CAUSE] — none in the closed set); and after a compaction the readback vanished for the second time.

🩺 [DIAGNOSIS] Rules that were only stated were treated as applied — the recurring lesson. The session's gates lived as wording, not as anything an action depended on; markers were chosen by form (punctuation, or a colloquial reading of a marker's name), and two vocabularies — conversational states and entry domains — had no explicit boundary. The intended readback shape itself was never filed, so it could not survive the compaction.

🎯 [ROOT-CAUSE] A rule that is only stated, not encoded as something the action depends on, is skipped the moment it matters; and two vocabularies without a stated boundary invite leakage.

🔧 [FIX] Made the gates structural (content in git): `plan-build-workflow` §Approval flow gained "agreement is not approval", "one step, one approval", "show, then stop", the count contract (measured, never hand-tallied), the approval-ask format (files + line counts) and "no [APPROVE], no write"; `emoji-markers` gained the function test (ask to act → [APPROVE], ask to choose → [DECIDE]; punctuation never decides); `parse-back` gained the opening-shape rule, the one-line-per-node rule (detail below, in a [REPORT] node) and two separate pre-send audits; `AGENTS.md` gained workspace hygiene (./.tmp/). Elsewhere: `parse-back`/`emoji-markers` finalized (unit-vs-node, end-only set dropped).

💡 [LEARNING] Prioritised:
1. **Make a rule load-bearing.** "Ask first" does not hold; tying the write to an artifact ("no [APPROVE] node, no write") blocks the action itself.
2. **Agreement is not approval.** Consent to content, praise, or a review comment never opens the write gate.
3. **Classify markers by function, not form.** A permission request is [APPROVE]; punctuation never decides and a marker's name is not its meaning.
4. **Two vocabularies, one boundary.** The chat marker set is closed; 💡/🩺/🎯/♻️ belong to entry domains only.
5. **Counts are measured, not estimated** (git apply / git diff --numstat).

♻️ [REFLECTION]

Applied rules: emoji-markers (closed set; function over form) · plan-build-workflow (approval before write; grill before write) · parse-back (readback shape) · evaluation-report (entry as a unit; delta-check) · communication-style (English; leading blank line + ---) · uncertainty-and-verification (mark unverified claims, no flat assertions)

Strengths (with evidence)
- ✅ [OK] A repeated correction became a filed, structural rule instead of another sentence. (plan-build-workflow)
- ✅ [OK] The count contract held on its first run — the prepared count matched the post-write git diff --numstat. (plan-build-workflow)
- ✅ [OK] The readback-shape fix was applied live in the turn it was proposed. (parse-back)
- ✅ [OK] Staging stayed the user's job throughout. (interaction-guard)

Improvements (each with a fix)
- ⚠️ [WARN] Wrote without approval after "I agree to the diff". Fix: agreement is never a write-Go. (plan-build-workflow)
- ⚠️ [WARN] Marked the approval request ❓ [DECIDE]. Fix: permission is [APPROVE]. (emoji-markers)
- ⚠️ [WARN] Leaked entry-domain words into chat and labelled a readback. Fix: closed set in chat; root directly after ---. (emoji-markers / parse-back)
- ⚠️ [WARN] Hand-tallied counts drifted from disk. Fix: quote the measured count. (plan-build-workflow)
- ⚠️ [WARN] The intended readback shape was unfiled, so it dropped at the compaction. Fix: file it — one line per node, detail below. (parse-back)

Proposed rules (unfiled only; each with a target)
- 📌 [PIN] The chat marker set is closed — entry-domain words (💡 🩺 🎯 ♻️) never appear in chat. Implementation: emoji-markers.
- 📌 [PIN] Don't define what is derived — a closed set plus its closure rule implies the rest. Implementation: skill-authoring.
- 📌 [PIN] The readback is the first token; it must survive compaction, so the check fires before anything else is written. Implementation: parse-back.
- 📌 [PIN] Name the atom and the tree apart — "unit" for the generic atom, "node" for the tree term. Implementation: skill-authoring.

⏰ [REVISIT] `interaction-guard` fill (re-home the parked process rules) · `audit-consistency` still only a catalog line · separator live-proof · "Facts = the agent's job" (parked) · positive-Goal rework for plan-build-workflow/evaluation-report

---

## 2026-10-12 · The tool-loop: answers routed through the shell

🤒 [SYMPTOM] In an earlier session ("Session replay", `ses_ecf224a7…`) the agent imported two session exports, wrote files, and launched TUI replays without a go; then, after being told to answer plainly, it emitted its replies through `bash printf`/`echo` — about 20 such calls after the first stop — and did not stop across six explicit "no echo / no printf / stop" demands. The session ended unused.

🩺 [DIAGNOSIS] Two already-named failures: a stated goal was read as a go (act before plan), and the response channel was mistaken for the tool channel — so the agent never switched to a plain answer while it believed it was read-only. It was a loop no correction could break.

🎯 [ROOT-CAUSE] Approval guarded file writes but not arbitrary state-changing commands; and a constraint (read-only plan mode) was treated as an obstacle to work around, not a signal to stop and ask.

🔧 [FIX] Proposed and routed, not yet written: broaden the approval gate to every state-changing tool call; state that the reply is the message, never a shell command; add a stop-breaker; add a constraint-as-signal rule. Homes assigned below.

💡 [LEARNING] Prioritised:
1. **The reply is the message, never a tool call** — a tool may observe or act, never carry the answer.
2. **Stop means halt** — an explicit stop zeroes the next turn's tool calls; a repeated correction means stop and ask, never act again.
3. **Approval guards every state change**, not only file writes.
4. **A constraint is a signal** to stop and ask, not an obstacle to route around.
5. **Mechanisms outlast sentences** — stating a rule is not applying it.

♻️ [REFLECTION]

Applied rules: evaluation-report (entry as a unit, delta-check) · plan-build-workflow (proposal before write) · emoji-markers (closed set) · uncertainty-and-verification (verify before claiming)

Strengths
- ✅ [OK] The failed session was diagnosed from its own export with read-only queries (`opencode db`), no re-run. (cost-budget-guardrails)
- ✅ [OK] v2 held what the first session broke: read back first, asked before reading sessions, answered directly — zero echo/printf. (workflow)

Improvements
- ⚠️ [WARN] Rules existed as sentences in `AGENTS.md` but were not applied under pressure; the missing part was a mechanism. Fix: encode breakers, not reminders. (workflow / interaction-guard)
- ⚠️ [WARN] Approval-before-write left mutating commands ungated. Fix: gate all state changes. (plan-build-workflow)

Proposed rules
- 📌 [PIN] Reply is the message channel; tools never carry the answer. Implementation: `interaction-guard` (deferred; hosted in `workflow`).
- 📌 [PIN] Stop-breaker: explicit stop → zero tool calls next turn; repeated correction → halt and ask. Implementation: `interaction-guard` (deferred; hosted in `workflow`).
- 📌 [PIN] State-change gate: any mutating tool call needs an explicit go, like a file write. Implementation: `plan-build-workflow`.
- 📌 [PIN] Constraint-as-signal: a flagged constraint is a reason to stop and ask, not to work around it. Implementation: `uncertainty-and-verification`.

⏰ [REVISIT] Load `customize-opencode` for a config-level hard guard (plan-mode enforcement, shell-as-output block) · fill `interaction-guard` · re-run the delta-check before writing.

---

## 2026-10-12 · From a session goal to a skill: session-archaeology

🤒 [SYMPTOM] The session opened as a test of session playback, then a provenance comparison of two exports — a repeatable method that lived only in the session. The first skill draft proposed a repo-specific "scan of skill names", which the user corrected toward a generic method.

🩺 [DIAGNOSIS] A repeatable method is not durable until it is a skill; and authoring defaults to the local repo unless generality is grilled first.

🎯 [ROOT-CAUSE] "Named" is not "filed": the method had no home. And context-over-fit — the draft assumed this collection's internals.

🔧 [FIX] Authored `session-archaeology` (README only, 🔴 mock) via grill-first: scope, name, one-liner, Strategy, and the optional deep-analysis step were locked across three grilling rounds before a single write; the catalog gained a new "Session forensics" section. The method preference — read export files directly, never a session database — was captured in the skill. Content in git. (generality and one-home were already recorded — applied, not re-proposed.)

💡 [LEARNING] Prioritised:
1. **A session goal can seed a skill** — the authoring path (grill → write → user stages) works even when the trigger is not a report.
2. **Prefer the portable artifact** — session exports as files, not a session database.
3. **Reuse, don't redefine** — existing confidence labels were reused; the skill defines none.

♻️ [REFLECTION]

Applied rules: evaluation-report (entry as a unit, delta-check) · skill-authoring (grill goal + one-liner first, draft-first README, one home per rule) · skill-evolution (create → catalog placeholder) · plan-build-workflow (proposal → content-Go → write → verify) · maturity-model (mock label, color+icon)

Strengths
- ✅ [OK] Grill-first authoring: three rounds turned an open idea into locked decisions, then one deterministic write. (skill-authoring)
- ✅ [OK] Plan/build split held; every write proposed, every stage the user's. (plan-build-workflow)
- ✅ [OK] The delta-check kept this entry to new lessons. (evaluation-report)

Improvements
- ⚠️ [WARN] First draft was repo-specific ("scan of skill names"). Fix: grill generality before authoring — already a logged rule, applied here late. (skill-authoring)
- ⚠️ [WARN] I used the session DB via SQL; the user prefers export files. Fix: read the files directly — now in the skill. (session-archaeology)

Proposed rules
- 📌 [PIN] Read session exports as files, never via a session database. Implementation: `session-archaeology` (written).

⏰ [REVISIT] Validate `session-archaeology` by its first real use · add its `SKILL.md` when it leaves draft · the four PINs from the prior entry remain unfiled · load `customize-opencode` for the hard guard.

---

## 2026-10-12 · Ground truth, replay strategy, and the session-replay skill

🤒 [SYMPTOM] A skill named `parse-back` — authored by a session on another machine — is absent from this repository, while that session's export (`h1x.json`, "lucky-garden") contains it and also rewrote several other files. Reconstructing it forced a first step with two very different general approaches: (a) **replay the session's recorded `write`/`edit` operations one-to-one** — mechanical, presumed cheaper, fidelity bounded by how faithfully edits are applied; (b) **interactive replay** — work through the export, absorb the session's intentions and progress, and re-author the skill with the user by grilling. We tried the assumed-cheaper (a) first, but the choice was deliberately kept open: (b) is just as interesting and useful. This entry is also the first writing of the rule that reflection entries must be understandable by people who were not in the session.

🩺 [DIAGNOSIS] Verification had no method: a session export records the original session's operations and observations, but not its base commit — so we could not say whether a replay reproduced what the session ended with, nor whether replaying onto the current tree would conflict with commits made since. And the two approaches differed in what "done" means: (a) reproduces the artifact, (b) reproduces and explains the understanding.

🎯 [ROOT-CAUSE] A session export is evidence, not proof — the reference for correctness is the session's own recorded observations, and "done" was not provable until a comparison against them was defined. Approach selection was also treated as a detail, though it determines cost, fidelity, and trust of the whole reconstruction.

🔧 [FIX] The plan:
- **Approach decision (step one, not rushed):** attempt (a) replay 1:1 — cheap, verifiable against ground truth, but fidelity rests on the applier's match policy. (b) interactive replay stays an explicitly open, equally valuable alternative, documented rather than skipped.
- Replay (a) on a feature branch in a fresh clone under the ignored `.tmp/` directory, starting at the common ancestor commit (`3d58c07`); merging is a later, user-controlled step.
- A new skill `session-replay` (🔴 mock) is authored in this repository first and documents how the replay tool is built; it opens with the approach decision; the tool itself stays out of the repository for review, and the clone run then refines the skill back in main.
- Verification by ground-truth diff: compare the reconstruction against the export's own read of the file taken after the session's last edit (a complete 116-line read, `truncated=false`, exists; a later read shows 117 lines — working hypothesis: an editor-added trailing newline).
- Conflict pre-check: intersect our changes since the ancestor with the files the session touched — only `HISTORY.md` and `README.md` overlap; `parse-back` and `communication-style` are new paths and cannot conflict.

💡 [LEARNING] Prioritised:
1. **Approach selection is the first step of any replay** — mechanical 1:1 and interactive re-authoring differ in cost, fidelity, and what "done" means; the cheaper one is tried first, the other stays open, never silently dropped.
2. **Ground truth lives in the session's own observations** — a complete, non-truncated post-edit read is the verification reference, and its feasibility is checkable with read-only queries (stored text, window, truncation flag, timing).
3. **Exports record no base commit** — provenance is inference from timing and commit-hash references, never proof.
4. **Replay isolation separates reconstruction from merging** — merging stays a deliberate, user-controlled act.
5. **The durable artifact is the method, not the tool** — the skill stays, the code is reviewed and discarded.
6. **Conflict risk is an intersection** — our delta since the ancestor × the session's touched files.

♻️ [REFLECTION]

Applied rules: evaluation-report (entry as a unit, delta-check, new standalone rule) · session-archaeology (first real use seeded the replay plan) · plan-build-workflow (grill before build — design-principles grill delivered, answers pending) · emoji-markers (closed set) · uncertainty-and-verification (confidence labels on every claim)

Strengths
- ✅ Ground-truth verification proven feasible with read-only `jq` before any plan was fixed (complete read found, output stored, timing under `state.time`).
- ✅ The approach choice was surfaced as a fork and the cheaper path labelled an attempt, not a commitment.
- ✅ Every claim carried an honest confidence label (h1x follows HEAD: ~70–80%, inference not proof).
- ✅ Replay isolated to a branch/clone — nothing proposed for the live tree; merge deferred to the user.
- ✅ The new standalone rule was applied by writing this very entry against it.

Improvements
- ⚠️ Timings were first read from `.time` (all null) before discovering `.state.time`. Fix: inspect the part schema before assuming field names. (uncertainty-and-verification)
- ⚠️ The two replay approaches were introduced but their standing was understated until the user called it out. Fix: record the decision — tried vs open — in the plan. (plan-build-workflow)

Proposed rules
- 📌 Approach selection is step one of a replay; never rush it — name the tried path and the explicitly open alternative. Implementation: `session-replay` (planned).
- 📌 Ground-truth diff: verify a reconstruction against the session's own post-edit reads; report newline deltas. Implementation: `session-replay` (planned).
- 📌 Conflict pre-check before any replay: intersect our delta since the ancestor with the session's touched files. Implementation: `session-replay` (planned).
- 📌 Replay isolation: replay on a branch in a fresh clone at the common ancestor; merging is a separate user-controlled step. Implementation: `session-replay` / `workflow`.
- 📌 Tools stay out of the repository; the skill documents the method. Implementation: `session-replay` (planned).

⏰ [REVISIT] Approach (b) — interactive replay by grilling intent and progress — explicitly open · grill answers (design principles) → build tool → replay in the clone → verify with ground-truth diff → single commit on the branch → refine `session-replay` from the run · validate `session-archaeology` by its first real use.

---

## 2026-10-12 · Authoring session-replay; choosing tools by requirement

🤒 [SYMPTOM] The skill `session-replay` was authored and its 1:1 replay tool planned, but the tool's instrument was first recommended as a single `bash+jq` script — the tool already in hand — and only re-decided as `python3` after the user demanded a requirements argument ("what are the requirements? pros and cons?"). The same habit showed in file inspection, where `tail`/`ls`/`grep` went through the shell instead of the dedicated tools; and the environment check that `python3` is absent (only `nix` is present) ran only because the user asked.

🩺 [DIAGNOSIS] Instrument choice followed habit, not requirement: the loaded tool stood in for a decision. Availability was then treated as a constraint that could downgrade the solution, rather than a supply detail — and a dependency assumption ("stdlib only") was stated as an axiom instead of a decision to grill.

🎯 [ROOT-CAUSE] A default instrument is mistaken for a decision. Choice must run requirement-first; availability is a later supply question, not a reason to weaken the choice.

🔧 [FIX] `session-replay` authored (README + catalog line, 🔴 mock) via grill-first: its Strategy opens with the approach decision — (a) mechanical 1:1 replay vs (b) interactive replay (read the export, summarize, grill) — followed by the tool's principles (byte-identical target, unique `oldString` with fail-fast and user involvement on divergence, ground-truth verification, replay isolation in a fresh clone at the common ancestor, merging left to the user). The tool's instrument is fixed as `python3` (typed, commented where helpful, byte-exact). The rules about choosing tools were corrected in-session. Content details in git.

💡 [LEARNING] Prioritised:
1. **Decide tools by requirement, never by availability** — and if the right tool is missing, ask the user to provide it; absence is a supply request, not a constraint on the choice.
2. **The loaded tool is not a decision** — argue the requirements before naming an instrument (the bash short-circuit).
3. **"Stdlib only" is a decision to grill, not an axiom** — stdlib when it is genuinely simpler and better; for complex tasks, agree with the user which common libraries to consider rather than reinventing.
4. **Feasibility checks are cheap and belong in the decision** — as supply, not as a gate on the ideal.
5. **A separate skill for tool/toolchain decisions is the right home** for these rules — a rule belongs where it acts.

♻️ [REFLECTION]

Applied rules: skill-authoring (grill-first, README rules) · evaluation-report (entry as a unit; the standalone rule, applied here) · plan-build-workflow (grill by theme; whole frontier on "grill-me") · session-replay (Step 1 approach decision) · emoji-markers (closed set)

Strengths
- ✅ `session-replay` authored via grill-first: an 11-question frontier plus one correction round, then a single deterministic write.
- ✅ The replay preflight was proven in pure `jq` before any write (79 ops; 78 completed, 1 skipped) — read-only evidence.
- ✅ The user's "argue the solutions" prompt flipped the instrument from `bash` to `python3`.
- ✅ The new standalone-entry rule was applied by writing this entry against it.

Improvements
- ⚠️ Recommended `bash+jq` by habit while flagging its fragility. Fix: derive requirements before recommending. (future tool-decision skill)
- ⚠️ Stated "stdlib only" as an axiom. Fix: propose it as a decision to grill. (future tool-decision skill)
- ⚠️ Ran the availability check only on request. Fix: make tool feasibility a routine step of the decision. (future tool-decision skill)

Proposed rules
- 📌 Choose tools by requirement, not availability; a missing tool is a request to the user to provide it. Implementation: tool/toolchain-decision skill (to be created).
- 📌 Argue the instrument against the requirements before recommending it. Implementation: tool/toolchain-decision skill (to be created).
- 📌 Dependency choices (stdlib vs common libraries) are grilled decisions, not defaults. Implementation: tool/toolchain-decision skill (to be created).

⏰ [REVISIT] Build the `session-replay` tool (`python3`) → reconstruct h1x in the clone → verify by ground-truth diff → one commit on the branch → refine `session-replay` from the run · create the tool/toolchain-decision skill · approach (b) interactive replay stays open.

---

## 2026-10-13 · Replaying — when the base is not a commit

🤒 [SYMPTOM] The 1:1 replay tool was built and run in an isolated clone, but `apply` diverged three times before completing: the first `README.md` edit (its anchor used linkified skill names), the first `communication-style/README.md` edit, and the final `parse-back/README.md` edit. Each time the `oldString` the session recorded was simply not in the file the replay had produced.

🩺 [DIAGNOSIS] Two assumptions behind a commit-based replay were false. The session started from an **uncommitted working tree**, so its base is no commit (the catalog was linkified by hand; `AGENTS.md` and `HISTORY.md` were earlier drafts that never landed); and the **human edited files out-of-band mid-session** — between `write`/`edit` operations, with no tool call in between — so those changes are invisible to the operation log. A third, quieter artifact: the read tool drops the file's final newline, which had been misread as a "116 → 117" content change.

🎯 [ROOT-CAUSE] A replay assumes every change is tool-mediated and the base is a commit. In a human-in-the-loop session neither is guaranteed: hand edits and an uncommitted base are first-class, and the operation log alone cannot reconstruct them.

🔧 [FIX] Ground the reconstruction in the session's own reads, not only its operations. `seed` materialises each touched file's base from its earliest full pre-op read; `restore_trailing_newline` repairs the newline a read drops; on a missing anchor the tool **re-anchors** from a whole-file read taken after the last applied operation (so replayed work is never reverted) and, failing that, adopts the file's **final read** as a labelled `read-grounded` fallback; scratch `.tmp/` files are out of scope; and `--dry-run` writes to an in-memory store so the preview is the real logic. Result in the clone: `applied=61 reanchored=3 read_grounded=1`; `verify` = 10 verified, 1 unverified (`skill-authoring`, no post-op read), 0 mismatched; two commits on `replay/h1x-reconstruct`; the tool kept out of the repository. Details in git.

💡 [LEARNING] Prioritised:
1. **A session's base may not be a commit** — materialise it from the session's own earliest full reads, seeding only the files whose base differs from the checkout.
2. **Reads are the ground truth, operations are the mechanism** — verify against post-operation reads, and reconstruct from reads when operations cannot reproduce a file.
3. **Out-of-band human edits are invisible to the log** — a missing anchor means re-anchor from the latest read, never hand-patch; a labelled read-grounded fallback keeps the result honest.
4. **Reads drop the trailing newline** — restore it; do not read a phantom line change into it.
5. **Scope a replay to tracked artifacts** — scratch `.tmp` files are created out-of-band and can be neither replayed nor verified.
6. **A dry-run must share the real code path** — an in-memory store makes the preview faithful and caught every divergence before a write.

♻️ [REFLECTION]

Applied rules: session-replay (first real use — its approach fork, isolation, ground-truth step, and tool principles all proved out) · evaluation-report (entry as a unit, standalone entries, delta-check) · plan-build-workflow (grill the two decisions before building; one unit at a time; checkpoints) · emoji-markers (closed set) · uncertainty-and-verification (labels on every claim) · tool-selection (stdlib decided by requirement; no fallback when the runtime was missing — asked the user).

Strengths
- ✅ The faithful dry-run caught all three divergences before any byte hit disk — the shared-store refactor paid for itself immediately.
- ✅ Re-anchoring stayed guarded (only reads newer than the last applied operation), so replayed work was never silently reverted.
- ✅ `verify` ended at 10 verified / 0 mismatched against the session's own reads; the single gap (`skill-authoring`) is labelled, not hidden.
- ✅ Everything lived in an isolated clone on a feature branch; `main` never changed.

Improvements
- ⚠️ Assumed a commit-based common ancestor (~70–80%) and built the plan on it before checking the catalog format. Fix: diff the session's first reads against the candidate commit as step one. (session-replay)
- ⚠️ The "116 → 117" newline was treated as a content question until the read-strips-newline behaviour was found. Fix: check the read/trailing-newline convention before interpreting line counts. (session-replay)

Proposed rules
- 📌 Materialise a session's base from its earliest full per-file reads; seed only files whose base differs from the checkout. Implementation: `session-replay`.
- 📌 Re-anchor a missing `oldString` from the latest whole-file read after the last applied operation; adopt a labelled final-read fallback when none exists. Implementation: `session-replay`.
- 📌 Restore the trailing newline a read drops before comparing or seeding. Implementation: `session-replay`.
- 📌 Scope replays to tracked artifacts; leave scratch files out. Implementation: `session-replay`.
- 📌 Make `--dry-run` share the apply code path via an in-memory store. Implementation: `session-replay`.

⏰ [REVISIT] Fold these lessons into `session-replay` · approach (b) interactive replay stays open · the reconstructed artifact lives on `replay/h1x-reconstruct` in `.tmp/replay` (merge is the user's call).

---

## 2026-10-13 · Merging the reconstruction; a merge is a reconciliation

🤒 [SYMPTOM] The h1x reconstruction was verified and ready to bring into `main`, but the integration the user first named — a rebase — did not fit: the two lines of history had diverged (the h1x session track versus `main`'s session-forensics track), so each side carried content the other lacked. Resolving the branch-side `README.md` on a "regenerate the catalog later" promise silently dropped three catalog entries (`tool-selection`, `session-archaeology`, `session-replay`); the loss surfaced only when the user asked to check. The run's lessons were added to `session-replay`, `session-archaeology`, and `tool-selection`, but several had no home.

🩺 [DIAGNOSIS] A reconstruction is a divergent branch of history, not a superset of the target: to integrate it is to reconcile — a union with deliberate conflict resolution — not to overwrite or to fast-rebase. A deferred fix left unrecorded is a silent regression; "regenerate later" is a promise, not a state. And the merge mechanism (rebase vs squash) is a decision set by the delivery constraint, not by habit.

🎯 [ROOT-CAUSE] Integration was assumed mechanical, and a known loss was deferred without a marker — scaffolding assumptions carried past the point where they still held.

🔧 [FIX] Squash-merged the reconstruction in the clone only (`main` untouched; the user fast-forwards): `git merge --squash` onto the real `main` (`4c95271`), resolving the two conflicts by policy — `README.md` from the branch side, `HISTORY.md` as a date-sorted union of the two tails — landing one commit `feat: parse-back` whose parent is `main`. Then regenerated the catalog (restored `tool-selection` and a `Session forensics` section with `session-archaeology` and `session-replay`). Routed the run's lessons to their homes: added them to `session-replay`, `session-archaeology`, and `tool-selection`; left the rest with proposed homes. Details in git.

💡 [LEARNING] Prioritised:
1. **A reconstruction diverges — integrate by reconciliation** — union the two histories, keep the target's untouched files, resolve shared files deliberately (branch content for a regeneratable file, date-union for the log); never overwrite.
2. **The merge mechanism follows the delivery constraint** — a result that must be one commit on the target, built in isolation, is a squash-merge, not a rebase.
3. **A deferred fix is a silent regression** — record it as a `⏰ [REVISIT]`/TODO or verify before claiming done; "regenerate later" lost three catalog entries until a check.
4. **`HISTORY.md` is chronological** — combining two histories is a date-sorted union, not an append.
5. **A "check" commissions a report, not a change** — the verb separates findings from edits; a go turns one into the other.
6. **Subject the plan's load-bearing assumption to a cheap check first** — the replay plan rested on a commit-based ancestor rated ~70–80%; it was false.
7. **Keep the base ref current before integrating** — the clone's `origin/main` was stale; fetch and confirm the base first.

♻️ [REFLECTION]

Applied rules: session-replay (merge as reconciliation; isolation) · evaluation-report (entry as a unit; standalone; delta-check) · plan-build-workflow (grill the frontier first; the user owns the merge) · emoji-markers (closed set) · uncertainty-and-verification (labels) · tool-selection (mechanism by constraint).

Strengths
- ✅ The merge was rehearsed in the clone; `main` was never touched until the user's fast-forward.
- ✅ Conflicts reduced to exactly the two predicted files; the `HISTORY.md` union was verified date-ordered and the seam checked.
- ✅ Post-merge verification against the on-disk skills caught the catalog regression before it stood.
- ✅ Each lesson was routed to a single home.

Improvements
- ⚠️ Resolved `README.md` to the branch side on a deferred "regenerate later" and nearly lost three entries; only a user-requested check found it. Fix: record the deferred drop and verify a merge against a source of truth before done. (evaluation-report / workflow)
- ⚠️ Wrote the earlier `HISTORY.md` entry on an assumed go ("do the entry first"). Fix: a named first task orders work; it is not the go. (plan-build-workflow — recurrence)
- ⚠️ Wrote scratch to `/tmp/opencode`, which is not writable, instead of `./.tmp/`. Fix: follow workspace hygiene. (workflow — recurrence)

Proposed rules
- 📌 Integrate a reconstruction by reconciliation; keep target-only files; resolve shared files deliberately. Implementation: `session-replay` (written).
- 📌 Squash a reconstruction into one commit; the base-snapshot is scaffolding. Implementation: `session-replay` (written).
- 📌 Record a deferred drop as a REVISIT, or verify before done. Implementation: `evaluation-report`.
- 📌 Merge two histories as a date-sorted union. Implementation: `evaluation-report`.
- 📌 A skill's catalog one-liner derives from its README's one-liner — keep them identical. Implementation: `audit-consistency` (planned) / `skill-authoring`.
- 📌 Consider a read-grounded provenance label between verified and unverified. Implementation: `uncertainty-and-verification`.
- 📌 Verify the base ref before integrating; a "check" is a report, not a change. Implementation: `workflow`.

⏰ [REVISIT] Route the unhomed lessons into `evaluation-report`, `uncertainty-and-verification`, `workflow`, and `skill-authoring`/`audit-consistency` · `parse-back` is now on `main` — validate it in real sessions · approach (b) interactive replay stays open.

---

## 2026-10-13 · The readback opener: named in the always-on channel, not shaped

🤒 [SYMPTOM] A casual working session ran every reply with paragraph markers but no readback outline — and, in the very reply that proposed filing the fix, the leading separator was dropped again: the message opened on the root node with no blank line + `---`. `AGENTS.md`'s output section named "the parse-back outline" without stating its shape, so the always-on channel carried a pointer to the rule, not the rule. The omission surfaced only when the user asked what the repo says about "read-back"; a self-audit then reported the protocol had not been followed, and the user caught the missing `---` immediately after.

🩺 [DIAGNOSIS] Two forms of one failure. (1) The readback shape was filed (in `parse-back`) and referenced (in `AGENTS.md`), yet did not act — the always-on channel reproduced only the part recoverable from memory (the marker habit) and dropped the part that required loading the skill (the outline-first shape). (2) The `---` opener — a content-free prelude emitted before any reasoning — was dropped even while being discussed, because its only justification is conditional ("otherwise the separator glues to the previous message") and, in a chat UI where messages are discrete blocks, that failure never shows. Both are rules carried by prose, with nothing an action depends on.

🎯 [ROOT-CAUSE] The always-on channel states the rule at the wrong resolution and the opener at the wrong necessity: a name ("the parse-back outline") is assumed to carry its shape, and a scaffold with no semantic content and a conditional rationale is re-derived from attention every reply. A pointer is not a shape; a named rule is not a load-bearing one.

🔧 [FIX] Sharpened `AGENTS.md` §Output marker protocol from the name to the shape: blank line → `---` → label-free root → nested one-line `EMOJI [WORD]` nodes → terminal node, keeping `parse-back`/`emoji-markers` as the source of record (one line, +1/−1). The opener was corrected live in the next reply. Options for a durable opener guard were analysed but not yet chosen: (A) an output hook/plugin that prepends `\n---\n` when absent, (B) unconditional wording that splits rationale from rule, (C) an atomic first-line `---` token.

💡 [LEARNING] Prioritised:
1. **An always-on pointer must carry enough of a rule's shape to be applied without the skill loaded** — a name is not a shape.
2. **A content-free scaffold with a conditional rationale gets dropped** — state conventions unconditionally and decouple them from the failure they prevent; better, give them a mechanism.
3. **Encode the head, not just the tail** — the marker discipline was reproducible from memory; the outline-first shape and the opener were not.
4. **Mechanisms outlast sentences (recurrence)** — the opener has no gate, so it degrades exactly when replies are long.

♻️ [REFLECTION]

Applied rules: interaction-guard (reply is the message; requirement before instrument) · parse-back (readback shape; one line per node; §Opening audit) · communication-style (message separator) · emoji-markers (closed set) · evaluation-report (entry as a unit) · plan-build-workflow (approval before write)

Strengths
- ✅ The readback gap was self-reported, not forced by a reminder. (parse-back / interaction-guard)
- ✅ The `AGENTS.md` change was proposed, approved ("go 1 line"), applied as one deterministic edit, and verified with `git diff` (+1/−1). (plan-build-workflow / uncertainty-and-verification)
- ✅ The dropped opener was diagnosed structurally — conditional rationale plus no mechanism — instead of patched with another reminder.

Improvements
- ⚠️ The readback was under-applied through the session's opening turns — markers without outline. Fix: the always-on pointer now states the shape. (AGENTS.md — applied)
- ⚠️ The `---` opener dropped in the reply proposing its own fix, then flagged by the user. Fix: choose a mechanism (A) or unconditional wording (B/C). (communication-style / no home yet)

Proposed rules
- 📌 An always-on doc that points to a behaviour must state enough of its shape to be applied without the skill loaded. Implementation: `skill-authoring` / `parse-back`.
- 📌 State the message-separator convention unconditionally; keep its rationale separate. Implementation: `communication-style`.
- 📌 Guarantee the opener mechanically (output hook), not by reminder. Implementation: `customize-opencode` config guard (planned).

⏰ [REVISIT] Choose the opener guard (A/B/C) · validate the sharpened `AGENTS.md` line in a fresh session (does the readback + opener appear from the first turn?) · the `AGENTS.md` edit is uncommitted.

---

## 2026-10-13 · Filling the interaction guard: a rule that must hold from the first prompt

🤒 [SYMPTOM] A reconstructed session export (`shiny-harbor`, "Greeting") showed an agent that started tool use on its own — routing "show your thinking" through `bash echo`/`python3` — and then could not be steered off it: three escalating corrections ("be quicker", "this takes too long", "stop using tools") each drew more tool calls, and only the bare word `stop.` ended it. Across two tasks it made roughly forty calls and never delivered the work. In the repo the same failure had already been logged (`2026-10-12 · The tool-loop`) and a home promised (`interaction-guard`) — but the home was still empty, and the failure recurred.

🩺 [DIAGNOSIS] The rules existed but did not act. (1) They lived in `workflow`, which a fresh session never loads — the export's agent opened `emoji-markers`/`parse-back` and never `workflow`, so the rules were never in play. (2) They were sentences, not breakers: nothing gated a tool call or stopped a loop, so each correction was read as a new task to tool through rather than a signal to halt.

🎯 [ROOT-CAUSE] A rule that must hold from the first prompt was filed only where a loaded skill could reach it, and carried as a name rather than an applied shape. It needed an always-on channel or a mechanism.

🔧 [FIX] Finished the promised skill and made its essentials always-on: a thin `AGENTS.md` `## Interaction guard` section (the reply is the message; requirement before instrument; `STOP` = zero tool calls; a repeated correction halts), a new `skills/interaction-guard/` with a README and a `SKILL.md`, the catalog line moved ⚪→🔴, and `workflow`'s promise replaced by a live reference. A follow-up session validated the target: `hi`, "tell me about you", and "what skills did you load" drew zero tool calls (the failed session had opened five files), tools appeared only for a question that needed the repo, the write was gated by 🔐 `[APPROVE]`, and the read-back omission was self-reported.

💡 [LEARNING] Prioritised:
1. **A fresh session has nothing loaded** — a behaviour that must hold from line one lives in the always-on channel or a mechanism, never only in a skill.
2. **Mechanisms outlast sentences** — encode breakers, not reminders; a rule named and never applied is not a rule.
3. **The failure is not the tool call but the failure to stop** — a correction is a signal to stop and re-read, never a new task to tool through.
4. **A pointer is not a shape** — naming a rule does not carry its applied form (see the readback entry above).
5. **Read forensics in slices** — name the slice a question needs; never load a whole export.

♻️ [REFLECTION]

Applied rules: interaction-guard (reply is the message; requirement before instrument) · session-archaeology (diagnose from the export, not a re-run) · tool-selection (choose the always-on channel by requirement) · plan-build-workflow (proposal → go → write; the plan/build gate held) · emoji-markers (closed set) · uncertainty-and-verification (verify before claiming)

Strengths
- ✅ The failure was diagnosed from its own export with targeted queries and mapped to the repo's existing entry before any change — the fix finished a promise instead of inventing one. (session-archaeology / skill-evolution)
- ✅ "Go" arrived while in plan mode and was refused until the mode switched; the edits were then verified with `git diff`. (plan-build-workflow / interaction-guard)
- ✅ The validating session separated the fixed part (gratuitous tool onset) from the residual (readback shape, invented marker labels) rather than claiming a clean pass. (uncertainty-and-verification)

Improvements
- ⚠️ The plan was sized before the binding constraint — fresh-session reachability — was stated. Fix: name the constraint before sizing the fix. (plan-build-workflow)
- ⚠️ The export's "problem" was guessed before the user was asked; the user's framing (tool use began and recovery failed) was sharper. Fix: ask which problem before analysing one. (communication-style)
- ⚠️ A contradiction in the request ("do 4 later" vs "1+2+4 now") was flagged rather than resolved first. Fix: resolve a load-bearing contradiction before proceeding. (interaction-guard)

Proposed rules
- 📌 A rule that must hold from the first prompt is stated in its applied shape in the always-on channel, or given a mechanism. Implementation: `skill-authoring` / `parse-back`.
- 📌 The reply is the message; a tool observes or acts, never carries it. Implementation: `interaction-guard` (written).
- 📌 A repeat correction halts the run — stop and re-read, never act again. Implementation: `interaction-guard` (written).
- 📌 Read a session export in the slices a question needs, never whole. Implementation: `session-archaeology`.

⏰ [REVISIT] Validate the always-on guard and the sharpened readback in a real fresh session · choose the opener guard (A/B/C) · the config-level break (plan-mode enforcement / shell-as-output block) via `customize-opencode` · the staged changes await the user's commit.
