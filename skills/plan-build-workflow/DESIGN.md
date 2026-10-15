# plan-build-workflow — design principles

One section per criterion of the state-machine comparison overview. Each states
what the criterion means, then what this machine should do about it.

Status: all nine sections have been grilled with the user. Sections 1–4 and 6–9 carry
the settled decisions; section 5 is deliberately deferred and carries only its
provisional position plus a pending research cross-check. Per-state values remain
**provisional** until CHECK 1 fills the state inventory — they name the eight
wireframe states as they stand now.

Settled: the schema lives in `SKILL.md` as two tables, the runtime instance as JSON ·
`SKILL.md` is a thin router with a detail file per state · the allow-list is
default-deny · the machine does not terminate — it gates and budgets · the instance
lives in context and persists at user boundaries, with the PoC to decide the rest ·
the re-injection hub is `schedule` · verification is distributed and no retry loop
bypasses the user · host-dependence is minimal by design.

---

## State as data

The machine lives as tables the model reads, not as prose it re-interprets.
Prose is ambiguous: the model fills the gaps differently on each run, so two runs
of the same conversation diverge. A table is identical on every read, which is
what makes a run comparable and an illegal move detectable.

Two artifacts, deliberately separated:

- **The schema** — static, owned by the skill, agent-facing. It lives in
  `SKILL.md` as two markdown tables (see *File-split*).
- **The instance** — the state actually being executed. Encoded as **JSON conforming
  to a JSON schema**, and every transition passes the new state forward explicitly.
  Where that JSON is *kept* is decided in *Externalised state (survival)*, which
  supersedes the earlier "held in the working context" wording here.

The schema tables:

- **States table** — one row per state, saying what it is *expected to do* and
  what it *must not do*.
- **Transitions table** — `from → to` plus the condition for each. Where several
  moves are possible they are worked **top to bottom, first applicable wins**, so
  the model evaluates conditions in order rather than choosing between options.

Consequences taken from that choice:

- Exactly one owner of "next": the transitions table is the only source of moves.
  Because the first applicable row wins, "one owner" is real and not aspirational.
- Guards travel with the move: each row states the condition that must hold, so a
  move is either legal or not, not "probably".
- The mermaid diagram is **human-facing and non-authoritative** (see *File-split*);
  when it disagrees with `SKILL.md`, `SKILL.md` wins.
- A state is named once and used consistently. A state called `grill` in the
  diagram but "clarify" in prose is two states in practice.

## File-split

Split the machine by role and by reading moment, not by convenience. A diagram is
read for orientation, tables for decisions, a per-state file for the detail that
binds. Mixing them forces the model to carry the whole thing every turn, and makes
each part change for a reason that breaks the others.

- **`README.md`** — human-facing. Holds the mermaid diagram. **Not authoritative**;
  a convenience copy that may drift, because nothing depends on it.
- **`SKILL.md`** — agent-facing and authoritative, and deliberately a **router**:
  it contains only the two tables. For this machine that is well under the 500-line
  cap; the cap is the tripwire that tells us to split, not the design itself.
- **A per-state detail file** — one file per state, holding its checklists, exit
  criteria and normative wording. Only the current state's file is loaded, so
  "load on demand" is literal rather than aspirational.
- The states table must therefore stay **summary-level**: everything it does not
  say lives one hop away in the per-state file. No chains of files pointing at
  files.
- The runtime instance (current state, budgets, transition log) lives outside the
  skill files entirely, so a skill edit mid-session never clobbers session
  progress.
- Growth path: if the router outgrows the cap, split further — the shape of that
  split is to be advised when it is needed, not designed now.

## Per-state capability gating

Each state declares what it may do, and the declaration is an **allow-list**:
anything not explicitly listed is forbidden. That default-deny stance is what
makes an action structurally unavailable rather than merely discouraged, and it is
the only form that still holds late in a long session.

- **The allow-list is the primary constraint.** A prohibition list is
  default-allow — anything not forbidden is permitted — and prohibitions are also
  the rule shape that decays fastest. So the design relies on the allow-list, and
  "must not do" survives only where a prohibition cannot be expressed as an
  absence from the allow-list.
- **Checklists are the second surface**: they state what a state is *expected* to
  produce, and they may also carry checks for what must *not* happen. Keeping the
  negative checks inside the checklist keeps them next to the positive ones at the
  moment they bind.
- Provisional until CHECK 1: `parse`, `schedule`, `grill`, `investigate`,
  `suggest` are read-only (read, search, ask); `approve` accepts or rejects only;
  `exec` may run commands and edit files; `validate` may run commands and read,
  but not edit.
- **`exec` is the only state that may mutate the workspace.** Everything upstream
  of it is reversible by construction.
- Least privilege: enumerate only the operations a state actually needs, and
  prefer the dedicated tool over a shell equivalent for the same job. Unused
  privilege is drift surface.

📌 **PINs:** which portion of the allow-list belongs to the state machine versus
to the per-state JSON · where the allow-list is written — in the `SKILL.md` states
table, or in the per-state detail file. Both deferred.

## Termination + budget

The heading maps to the survey column, but this machine **does not terminate**, and
the column's content has to be read accordingly. It is the innermost interactive
loop: its job is to involve the user, so it ends only when the session ends.

An implicit "done" is still a skipped "done" — the model reports success when it
feels finished rather than when a checked condition holds — but here that is caught
by gates and budgets instead of by terminal states.

- **Plan is the default** — the resting state. While in plan the machine returns to
  the user (`grill`) as fast as it can; user involvement is the point of the loop,
  not an exception to it.
- **The gate into build is an empty frontier.** Only when nothing is left open does
  `approve` fire.
- **Build requires a FINALIZED budget**, agreed during plan and confirmed at
  `approve`. No finalized budget, no build.
- **Build ends, or its budget is exhausted, and the machine returns to plan.**
  Exhaustion hands control *to the user*, which is the safe direction: this design
  fails toward more involvement, never toward less.
- Consequence: `validate → plan` is **unconditional**. "Success" is simply an empty
  frontier on the next visit to plan; there is no terminal to distinguish success
  from another round.
- An illegal transition is reported and control returns to the user. The machine
  never guesses a next state to keep moving.
- Each state carries an exit checklist; the move out is not taken until it holds.

📌 **PINs:** where the planning budget is held — the state definitions or the
current-state JSON · what the planning budget counts (grill rounds? user-free
steps?) · budget home generally. All deferred.

## Real mechanism (enforcement)

The distinction that decides whether the machine holds: is each rule enforced by a
mechanism, or only stated in prose. A stated rule decays — it is obeyed early and
forgotten late. A mechanism makes the illegal move impossible or raises an error,
and that does not decay.

- Where the host exposes a hook, use it: an illegal transition raises instead of
  proceeding.
- Where it does not, gate on the state data value and re-assert the rule at every
  transition, so the rule is re-read rather than remembered.
- The strongest form is the machine itself owning "what is next": the current
  state's file states the move, the model executes it and cannot choose a
  different one. Borrow the idea, not the compiler — a compiled CLI is heavier
  than a prose skill needs.
- Be honest about what this buys: the machine secures mechanism and, through
  externalisation, survival. It does not secure that the work done is
  substantively right. That is a separate property and is not claimed.
- Every transition is observable: log from → to and the guard result, so an
  illegal move is visible after the fact and not only at the moment it would have
  been blocked.

📌 **DEFERRED — the hardest principle, not decided.** Treated as the hardest one to
get right; relevant, but not straightforward to implement. The aim is to implement
it as well as it can be done, and proposals are wanted.

User's provisional position, kept as stated and open to correction: enforcing a rule
needs a **tool** that defines it; a skill on its own cannot implement it fully
reliably.

Partial answer on the record: the position holds for anything that *blocks*. Prose
in a skill has no authority to stop a tool call — it can only discourage it, which
is exactly the form that decays (see *Rule-decay handling*). The hard gate that
still works is the host's own layer, outside the model's reach: a permission /
pre-write gate that refuses the call regardless of intent. Anything weaker — a guard
the model is asked to run — is only as hard as the model's willingness to run it,
which is not a mechanism.

Therefore the likely shape: the skill **declares** what must be enforced and
**points** at the host mechanism that enforces it; the host layer does the
blocking; on a host without that layer the skill degrades honestly and says the
property is not secured (*Host dependence*).

Pending for this section: an explicit **cross-check against the risk-research
findings** (.tmp/risk-research/) before this is settled.

## Externalised state (survival)

A context compaction is routine in a long session, and anything that exists only in
the conversation is lost with it. This section decides where the runtime instance
lives. It also corrects an error in *State as data*, which said "held in the working
context" without accounting for compaction at all.

Two candidate implementations:

- **(a) file-authoritative + context-as-cache** — the file is the source, the
  in-context JSON a copy. Needs a write-back on every transition *and* a re-read of
  the original, because a cache cannot be trusted on its own. Cost: one write and one
  read per move. Gain: the state survives compaction and interruption, and "resume,
  never restart" is literally true.
- **(b) everything in context, persisted to a file only at named points** — no
  write-back, no cache distrust. Cost: the state dies with the conversation if a
  compaction arrives before the next named point, and it dies **silently** — after a
  compaction there is no file whose absence could be noticed. Gain: far fewer writes
  and far fewer tokens.

**Decision: implement (b) first, with (a) as the fallback.** The machine is an
innermost loop with a very short dwell time per state, which is the condition under
which (b) is most likely to hold. The design intent is *close human in the loop and
fast cycles*, and (b) serves that; (a) is reached only if (b) proves insufficient.

The **persist points are the user boundaries**: after `parse` and after `approve`.
`parse` is the single chokepoint through which every user utterance passes — grill
rounds return to `schedule` via parse-back — so nothing that crosses between agent
and user goes unrecorded; `approve` is the only user decision that is a gate rather
than a message. **Write at the boundary, read at the boundary**: a write nobody reads
is decoration, and reading at the same points gives a recovery path at the same cost.
The file is therefore never more than one user interaction stale.

Honest claim: under (b) survival is **not secured by default**. It is secured only
if a persist point is reached before the compaction. The one window that remains
exposed is a compaction firing *mid-build-turn*, between two user boundaries — and
that is a named question for the PoC, not an oversight.

Unaffected by the choice:

- The state file, when written, lives outside the skill's own files, so a skill
  update mid-session never clobbers session progress.
- The invariants — the goal and the hard constraints — still need a home that
  compaction cannot reach; that question is independent of where the instance lives.

📌 **PIN:** which half of the trade-off actually holds — (b) assumed cheaper and less
correct, (a) assumed the reverse. **Both unmeasured; the PoC measures this.**

## Rule-decay handling

Rules lose force the longer they go unasserted, and prohibitions lose it fastest.
A design that states its rules once and relies on them holding for the whole
session relies on something that measurably does not hold. Each rule therefore needs
a moment at which it is re-injected, chosen by how fast it decays.

Re-injection has two layers, split by scope rather than by rule shape:

- **The hub injects the global rules** — the state machine itself, the allow-list,
  the invariants. The hub is **`schedule`**, and that is verified rather than
  asserted: in the current mermaid `schedule` and `grill` alternate, so `schedule`
  lies on every cycle. Cadence is therefore once per grill round — as often as the
  user is involved, a natural bound rather than a tuned number. "Which state lies on
  every cycle?" is a property of the transitions table, computable from it; it is not
  a name anyone picks.
- **Each state's checklist injects its local rules.** This is the fallback that keeps
  the machine working if the hub is missed — after a compaction, after an illegal
  transition, or on a host with no enforcement at all.
- **Bootstrap edge:** the hub cannot be the only route to the base rules, because
  reaching `schedule` already presupposes knowing that one is in `schedule`. The
  *first* injection belongs to the always-on layer; the hub performs only the
  *re*-injection.

Standing rules:

- Tag every rule omission or commission. A prohibition decays faster than an
  instruction, and the two need different treatment.
- Keep each state's load-bearing rules to two or three restated inline; the rest are
  one hop away and loaded on demand. This is a **tripwire, not a design value** — a
  state that needs ten rules probably has two jobs and should be split.
- Prefer positive, checkable actions over prohibitions: "run the exit checklist
  before leaving" holds longer than "do not skip the checklist".
- The re-injection point for a rule is stated in the rule's own home, so cadence is
  designed rather than hoped.

📌 **PIN:** how often re-injection is "enough" — a metric question, to be measured by
the PoC (tokens spent on re-injection against observed rule-drop events), not decided
here.

## Verification independence

The component that produces a result is not the one that decides it is correct.
Self-checking tends to confirm its own assumptions, because the checker already
knows what was intended and reads the result through that. Independent verification
is the only form that catches a work product that is wrong in a way the author did
not notice.

**Independence here is distributed, not delegated.** The machine gets it from
structure, which means it holds on any host:

- In **plan** the checker is the *user*: every agent action ends in a grill.
- In **build** the checker is a *separate state*: `validate` carries its own exit
  checklist, and `exec` checking its own work is not verification.
- Both directions are verified, not only output. Parse-back checks the user's
  *input* for understandability and plausibility before the agent acts on it;
  validate and grill check the agent's *output*.

Standing rules:

- The checker re-reads the acceptance criteria before looking at the result, as a
  stranger to the change would.
- Evidence bar: never accept "it should work" — only a run, a diff, a test result,
  or a concrete number. This bar is already owned by the `uncertainty-and-verification`
  skill; this machine points at it rather than restating it, which also gives the
  rule a re-injection home outside the hub.
- **Build cannot start without it.** The user approves explicitly, confirming the
  named permissions and budget, and the frontier is empty first — agent and user
  sharing one mental model. Every build then carries a `validate` phase that checks
  the quality the plan established, before the next step is possible.
- **There is no autonomous retry loop.** A failing check is recorded, the step ends,
  further loops are blocked, and the user decides via grill. The mermaid deliberately
  contains no loop that bypasses the user, so the enforcement of the evidence bar is
  the user, not the budget.

📌 **PIN (later):** whether and how the checker can be strengthened — a separate
agent, tool-calls, or a plugin. An upgrade, not a dependency.

📌 **PIN (later):** **batch jobs** — an exec-validate loop inside build that runs to
a budget. This is the first loop that bypasses the user, so it is to be built as a
**named, budgeted exception** to the rule above, and it requires an extra in-build
scheduler. The exception must earn its budget; it must not grow quietly.

## Host dependence

This repo exists to prove what a skill can do on its own, so host dependence is
**minimised by design**. Host mechanisms should stay as orthogonal as possible to
skill capability and form an *independent, more important* layer of their own — not
something the skill quietly relies on.

- **Portable core, and the only thing claimed:** the state table, the file split, the
  exit checklists, the budget, the re-injection cadence. All of these work on any
  host that reads files.
- **Host-specific is out of scope for now**, for as long as it can be. Where the
  design names a host mechanism — a pre-write approval gate, a transition hook that
  raises, per-request rule re-injection — it names it as a *candidate*, not a
  dependency, and the portable fallback has to stand on its own.
- **The disclaimers in `docs/INSTALL.md` carry this section.** They already state
  what a host does and does not secure; this design does not restate them.
- **A host-configuration recommendation may come later, as a separate delivery**, and
  only once everything in this repo works as intended without it. It is not part of
  this machine.
- The skill claims only what its host can hold. Under option (b) of *Externalised
  state* that means claiming survival as **not secured by default** — and saying so,
  rather than implying the property.
- Degradation direction, unchanged: on a weaker host, degrade to more re-reading and
  more frequent checklist checks — never to less enforcement.
