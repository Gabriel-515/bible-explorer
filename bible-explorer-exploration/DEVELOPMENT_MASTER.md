# BIBLE EXPLORER — DEVELOPMENT MASTER
> Version 1.0 · Oct 2026
> Canonical authority for development workflow, milestone execution, verification, Git checkpoints, and handoffs.

---

## 1. Authority and responsibilities

- **Gabriel** is the creator and final creative authority. He approves story outlines, Zone creative design, milestone acceptance, and changes to canon.
- **MASTER_BRAIN.md** is the overarching canon and product north star.
- **STORYLINE_MASTER.md** owns narrative structure, dialogue, scanner wording, Scripture moments, character voice, and beat progression.
- **VISUAL_MASTER.md** owns approved visual direction, composition, materials, lighting, animation direction, and visual canon.
- **DEVELOPMENT_MASTER.md** owns development workflow, implementation gates, verification requirements, checkpoint safety, and handoff format. It does not create story or visual canon.
- **ChatGPT** proposes story outlines, high-level Zone Maps, Creative Reports, and creative options for Gabriel's review. Proposals remain `PROPOSED` until Gabriel approves them.
- **Codex** implements only approved bounded scope, verifies it, records evidence and stops at the stated acceptance gate.
- A reviewer may independently verify a milestone but cannot approve visual quality or canon on Gabriel's behalf.

When authorities appear to conflict, stop the affected work, record the conflict and return it to Gabriel. Do not silently choose or rewrite canon.

---

## 2. Scene & Zone Development Protocol V1.1

1. Approve the Scene story outline before detailed Zone work begins.
2. Divide each Scene into numbered Zones.
3. ChatGPT proposes a high-level Zone Map with purpose, order, transitions and dependencies.
4. Gabriel reviews and approves the creative design. Unapproved maps, dimensions and layouts remain `PROPOSED`.
5. Produce an approved Creative Report for each Zone before implementation.
6. Codex implements only the approved Zone or milestone scope.
7. Run technical verification and then Gabriel's direct creator playtest.
8. Update canon only through an explicit, authority-approved documentation milestone.
9. Prioritize a complete playable path over polish that does not block gameplay, comprehension, safety or acceptance.

Zone work cannot infer permission to revise adjacent Zones, later Scenes, protected systems, narrative beats or visual canon.

---

## 3. Mandatory Zone Creative Report

Every Zone Creative Report must identify:

1. **Project / Scene / Zone / status** — including whether the Zone is `PROPOSED`, `APPROVED FOR PROTOTYPE`, or accepted.
2. **Narrative purpose** — the approved problem, discovery beat and emotional function.
3. **Player objective and exit condition** — what the player does and what permits progression.
4. **Spatial role** — entry, exit, traversal direction, landmarks and relationship to adjacent Zones.
5. **Interactions** — required, optional and passive interactions, including state dependencies.
6. **Scripture connection** — range, semantic purpose, placement and translation boundary; no invented wording.
7. **ARCHIVIST and scanner content** — approved dialogue/readout source or an explicit placeholder status.
8. **Visual direction** — applicable Visual Master rules, approved assets and clearly labeled placeholders.
9. **Technical scope** — scenes, systems, persistence, input, camera and platform requirements.
10. **Protected elements and exclusions** — systems and canon the milestone may not change.
11. **Acceptance criteria** — observable runtime behavior and creator review points.
12. **Open decisions, risks and debt** — unresolved creative questions, blockers and deferred polish.

A Creative Report is an implementation contract, not permission to extend scope.

---

## 4. Milestones, approval and continuation

- Every milestone must state its baseline, objective, permitted changes, protected systems, prohibited scope, deliverables and exact stop condition.
- Approval applies only to the named milestone and artifacts. It does not authorize the next milestone.
- Codex must stop at creator review, independent review, staging or commit gates as instructed.
- Failed required checks produce `BLOCKED` or `REVISION_REQUIRED` with exact evidence. A partial result cannot be labeled accepted.
- Runtime verification and Gabriel's creator playtest are mandatory before a playable milestone is accepted.
- A technical review may establish technical readiness. Gabriel alone accepts creative quality and canon.
- New implementation begins only from a verified checkpoint or an explicitly approved dirty baseline.

---

## 5. Codex execution and safety

- Read the relevant Master Files and repository instructions before implementation.
- Verify repository identity, branch, HEAD, worktree state and existing staged files before changing anything.
- Inspect only the files needed for the bounded scope. Preserve unrelated dirty worktrees and untracked evidence.
- Do not modify protected code, assets, saves or canon without explicit authority.
- Use disposable projects and explicit temporary save paths for tests that write persistent state. Never assume creator saves are expendable.
- Distinguish simulated input, automated input and physical-device testing in evidence.
- Do not conceal production defects with test-harness changes or misleading captures.
- Do not fetch, push, merge, rebase, deploy, delete or clean unless the milestone explicitly authorizes that exact action.
- Do not begin another milestone automatically.

---

## 6. Model-cost efficiency

- Use the lowest-cost capable model and reasoning level for bounded verification, inventory, formatting and routine Git preparation.
- Reserve higher-capability models or deeper reasoning for canon-sensitive design, architecture, difficult debugging and independent review where they materially improve the result.
- Reuse accepted assets, reports, hashes and test evidence. Do not repeat approved milestones without a concrete verification need.
- Keep experiments isolated and bounded. Stop testing when the acceptance criteria are sufficiently demonstrated.
- Prefer small, reviewable changes and targeted reads over repository-wide work.

Efficiency never overrides canon, evidence quality, save safety or a required acceptance gate.

---

## 7. Git checkpoint protection

- Start from the exact approved commit and branch.
- Before staging, inventory tracked, staged and untracked files and check whether the intended checkpoint already exists.
- Stage only the approved production manifest. Evidence and experiments remain unstaged unless explicitly included.
- Run `git diff --cached --check` and inspect the exact staged inventory before requesting commit approval.
- A local commit requires explicit authorization and must contain only the approved files.
- Commit authorization does not authorize push, merge, rebase, PR creation or deployment.
- Record the commit SHA, parent, branch, subject and file inventory after committing.
- Preserve rollback instructions and never rewrite existing history during a bounded milestone.

---

## 8. Autonomous Loop status

Loop autonomous execution is **SUSPENDED**.

- Do not run Loop or use autonomous continuation to cross milestone gates.
- Each new milestone requires a written handoff and explicit permitted action.
- Suspension remains in force until Gabriel explicitly changes it in an approved development decision.

---

## 9. Blockers and visual debt

- A **gameplay blocker** prevents startup, required progression, safe persistence, required input, mandatory content access or reliable completion of the approved loop.
- A **creative blocker** is an unresolved Gabriel decision or conflict between canonical authorities that prevents correct implementation.
- **Known visual debt** is a verified presentation defect that does not prevent the approved loop or misrepresent canon. Record it with impact and defer it to an approved milestone.
- Debt must not be silently treated as fixed, and polish must not delay playable completion when acceptance criteria remain satisfied.

Current known debt: ARCHIVIST-07's Walk has visible foot sliding at the protected 92 px/s movement speed. It is deferred and does not block the accepted technical loop.

---

## 10. Required evidence package

Each implementation milestone must provide, as applicable:

- exact repository, branch, baseline and current HEAD;
- changed-file inventory separated into production, evidence and experiments;
- runtime version, launch path and entry scene;
- acceptance criteria with PASS, FAIL, BLOCKED or untested results;
- runtime output and errors;
- input coverage, distinguishing simulated and physical input;
- disposable save-data setup and persistence/relaunch results;
- gameplay capture at the target viewport and representative stills when useful;
- asset provenance, hashes and resource paths where assets change;
- protected-system regression results;
- known defects, deferred polish and untested edges;
- rollback instructions;
- exact Git status and recommended checkpoint manifest.

Evidence must describe what was actually tested. Generated evidence is not production code and remains unstaged unless the checkpoint explicitly includes it.

---

## 11. Mandatory Handoff Protocol

Every future handoff must contain:

- Project Instructions inheritance;
- relevant Master Files and their authority boundaries;
- Project, Scene, Zone and Milestone;
- verified baseline and implementation status;
- approved decisions;
- blockers and known debt;
- protected systems;
- prohibited scope;
- next permitted action;
- acceptance gate and exact stop condition;
- repository path, expected branch and expected HEAD when Git work is involved.

Use verified facts and label proposals clearly. A handoff carries only the authority explicitly stated in it.

---

## 12. New Chatroom startup procedure

Every new chatroom starts by establishing this sequence:

```
PROJECT → SCENE → ZONE → MILESTONE → STATUS → NEXT ACTION
```

Then:

1. Load BIBLE EXPLORER PROJECT INSTRUCTIONS V1.1.
2. Read the relevant sections of `MASTER_BRAIN.md`, `STORYLINE_MASTER.md`, `VISUAL_MASTER.md` and `DEVELOPMENT_MASTER.md`.
3. Verify repository, branch, HEAD, staged state, dirty files and worktrees when relevant.
4. Restate approved decisions, blockers, protected systems, prohibited scope and acceptance gate.
5. Continue only with the stated next permitted action.

Missing context is a reason to verify or ask; it is not permission to invent canon or expand scope.

---

## 13. Verified development state — MASTER-SYNC-V1

- CHAR-VS2 is closed.
- CH1-VS1A technical verification passed.
- CH1-VS1B Gabriel creator playtest passed 8/8.
- CH1-VS1C local checkpoint is `8b87582dfe9a4f51f92abd0cb57f1cf75239a8fc`.
- Scene 1 — The Garden That Remembers remains incomplete.
- A Day 1 Z01–Z07 map is `PROPOSED`, not approved.
- A 2,880 px map width is a candidate, not locked.
- Walk foot sliding is deferred visual debt.
- Scene 2 — Cain & Abel awaits creative development.

The CH1 Genesis 1 reader is an accepted technical vertical slice. It does not replace the locked Chapter 1 major Scripture moments: Genesis 2 after Day 1 and Genesis 3 after Day 2. The six Creation Tablets, REST action and Day 2 structure remain protected.

---

This file governs how approved canon becomes verified, reviewable implementation. It does not approve a proposed Zone Map or authorize implementation by itself.
