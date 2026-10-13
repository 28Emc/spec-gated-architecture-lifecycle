# Triage Routing

Purpose: choose the **smallest sufficient lane** for a request *before* producing artifacts, so the lifecycle adds signal instead of ceremony. This reference expands `SKILL.md` §0.

## 1. Why routing comes first

Most agent failures are not "not enough documentation" — they are **wrong-depth process**: architecture documents for a config change, or a code-only patch for a contract change. Routing binds the amount of process to the amount of consequence.

## 2. Lanes

### L0 — Direct change
- **Signal:** local, behavior-preserving, single component, reversible, no external consumer affected.
- **Examples:** rename, log message, config value, dependency bump, internal refactor, test-only change, docs.
- **Produce:** code + tests that already exist for that area.
- **STOP:** specs, ADRs, contracts, architecture, product/domain artifacts.
- **Exit:** build/lint/tests pass.

### L1 — Spec-gated feature (default for short tasks/requirements)
- **Signal:** one bounded behavior change with observable outcomes; no cross-boundary contract change.
- **Examples:** "add cancel-order", "validate coupon expiry", "paginate results".
- **Produce:** exactly ONE behavior specification (`templates/specifications/behavior-specification.md`) with Acceptance Criteria; optional TDD; DoD report.
- **STOP:** architecture, contracts, ADRs — *unless* the change reveals a boundary/decision (then escalate to L2/L3).
- **Exit:** delivery gate `PASSED`.

### L2 — Boundary-affecting
- **Signal:** touches an API/event/data contract, security, data ownership, or a migration; there is a consumer across a boundary.
- **Examples:** new/changed endpoint, event schema change, column type change, auth rule change.
- **Produce:** L1 + the relevant contract (`templates/contracts/`) + ADR only if the decision is consequential/hard to reverse.
- **STOP:** full architecture unless a new boundary appears.
- **Exit:** contract freeze + delivery gate.

### L3 — Architecture/context
- **Signal:** new boundary, consistency model, integration pattern, multi-component change, or unresolved ownership/trust question.
- **Produce:** domain → architecture (C4 as needed) → contracts → ADR → specifications.
- **Exit:** architecture gate (`references/architecture-gates.md`).

### L4 — New project
- **Signal:** nothing exists yet.
- **Path:** bootstrap (`references/project-bootstrap.md`) → product → domain → then L1/L2/L3 per feature.
- **Exit:** per-phase gates.

### SPIKE — Prototype
- **Signal:** time-boxed exploration to reduce uncertainty; the deliverable is knowledge, not product.
- **Produce:** throwaway code + notes. Label artifacts `SPIKE` / `THROWAWAY`.
- **STOP:** all gates (explicit, recorded skip).
- **Rule:** a SPIKE never ships. Promoting it requires re-entering L1+ (write the spec, pass the gate).

## 3. STOP thresholds (summary)

| Do NOT produce | Unless |
| --- | --- |
| ADR | The decision is architectural, cross-cutting, or hard to reverse |
| Architecture / C4 | A boundary, consistency, ownership, or trust question exists |
| Contract | There is a consumer across a boundary |
| New spec | No `APPROVED` spec already governs the change |
| Product/domain artifacts | The lane is L3/L4 |

If none of the "unless" conditions hold, `NOT_REQUIRED` is the correct, intentional outcome. Record nothing more.

## 4. Short-task fast lane (existing project)

Use when you receive a short requirement/task and a repository already exists.

1. **Read the code and any existing specs/ADRs** relevant to the area. Do not invent.
2. **Classify the lane** (§2). If L0 → implement directly and stop.
3. **Find an existing governing spec.** If one covers the change → implement against it (do not create a new one). If not → create ONE behavior spec.
4. **Write Acceptance Criteria** as observable, testable statements (`AC-1`, `AC-2`, ...).
5. **Gate it:** fill `templates/specifications/specification-delivery-review.md`; set spec status `APPROVED` only when the gate is `READY`/`READY_WITH_RISKS`.
6. **Implement** against the ACs. Optional TDD: `AC → RED → GREEN → REFACTOR` (`references/tdd-workflow.md`).
7. **Verify** and emit the DoD report (`DONE`/`PARTIAL`/`BLOCKED`) with **evidence paths**.
8. **Update the traceability matrix** (AC → spec → test → evidence).

Time-box the fast lane: if step 2 keeps escalating lanes, stop and treat it as L2/L3 instead of forcing a fast lane.

## 5. New project with SDD (L4)

1. **Bootstrap** the workspace (`scripts/scaffold.ps1` / `scaffold.sh`) → `AGENTS.md`, `docs/`, and a ready `specs/` with the behavior-spec template + `check-spec` validator.
2. **Product discovery** (minimum): context, actors, outcomes, quality attributes, constraints, unknowns.
3. **Domain discovery**: capabilities, glossary, bounded contexts — only as far as needed.
4. **First feature (L1):** write the first behavior spec, gate it, implement, report DoD.
5. **Add architecture/contracts/ADRs** only when the first real boundary/decision appears (do not front-load them).

The point of SDD is that **specs are the unit of work**, not that every phase is filled up front.

## 6. Relationship to project sizing

Project sizing (`references/project-sizing.md`) sets the *project-level* default depth (e.g. `LIGHT`). Routing sets the *request-level* lane. A request may be **shallower** than the project default (an L0 fix inside a `FULL` project) but should not be **deeper** than the project default without justification recorded as a decision.

## 7. Worked examples

- Empty directory → bootstrap → first approved spec: `examples/from-scratch/`.
- Short task → spec-gated delivery: `examples/mealmind/`.
- Existing/legacy system → three-state assessment: `examples/existing-system/`.
- Full greenfield lifecycle: `examples/greenfield/`.
