---
name: spec-gated-architecture-lifecycle
description: Guide software projects through an evidence-based architecture lifecycle — product discovery, domain/DDD, C4 architecture, contracts, ADRs, specifications, infrastructure, and release readiness — plus specification-gated delivery, optional TDD, Definition of Done, project bootstrap, and a machine-validated specification gate. Use when designing or reviewing architecture, writing specs/ADRs/contracts, bootstrapping a spec-gated project from scratch, deciding lifecycle depth, or determining whether work is ready to implement or release.
metadata:
  opencode/slash: "true"
---

# Spec-Gated Architecture Lifecycle

# 0. Start Here — Triage Router (Read First)

Before producing anything, **classify the request and pick the smallest lane**. Do not produce artifacts above the lane. Full details, examples, and edge cases: `references/triage-routing.md`.

## 0.1 Lanes

| Lane | When | Produce | Skip (STOP) | Gate |
| --- | --- | --- | --- | --- |
| **L0 — Direct** | Local change: typo, config, wiring, internal refactor, dep bump. No behavior/contract/domain change. | Code + tests | specs, ADRs, architecture, contracts | build / lint / tests |
| **L1 — Spec-gated feature** (default for short tasks/requirements) | One bounded behavior change. | **ONE** `APPROVED` behavior spec + ACs + optional TDD + DoD | architecture, contracts, ADRs (unless affected) | delivery gate |
| **L2 — Boundary-affecting** | Touches API/event/data contract, security, data ownership, or migration. | L1 + contract (+ ADR if consequential) | full architecture unless a boundary appears | contract freeze + delivery gate |
| **L3 — Architecture/context** | New boundary, consistency model, integration pattern, or multi-component change. | domain → architecture → contracts → ADR → specs | — | architecture gate |
| **L4 — New project** | Nothing exists yet. | bootstrap → product → domain → L1..L3 as needed | — | per-phase gates |
| **SPIKE — Prototype** | Throwaway, time-boxed exploration. | Code + notes | **all gates** (explicit skip) | none |

## 0.2 STOP thresholds

Never produce these when the lane does not warrant them:

- No ADR for a **local** decision → it lives in the specification.
- No architecture/C4 unless a boundary, consistency, ownership, or trust question exists.
- No contract unless there is a **consumer across a boundary**.
- No new spec when an existing `APPROVED` spec already covers the change → update/implement that one.
- No product/domain artifacts for an L0 change.

## 0.3 Non-negotiables

- Only `APPROVED` specifications are implementable. If the lane requires a spec and none exists, create it → review → `APPROVED` → implement.
- Claims require evidence paths (DoD). `NOT_REQUIRED` and `WAIVED` are valid, *intentional*, and must record a rationale.
- A `SPIKE` must never be promoted to production without re-entering L1 or higher.

---

## 1. Skill Identity

**Name:** Spec-Gated Architecture Lifecycle

**Purpose:** Guide AI agents through a progressive, evidence-based lifecycle for discovering, designing, specifying, validating, and preparing software systems for implementation and release.

**Primary Domain:** Software architecture, product discovery, domain discovery, DDD, architecture governance, contracts, specifications, infrastructure, release readiness.

**Technology Scope:** Technology-agnostic.

**Intended Consumers:**

* Codex
* Claude Code
* OpenCode
* Antigravity
* Other AI coding and architecture agents

**Quickstart:** See `QUICKSTART.md` for activation, bootstrap, and the day-to-day spec-gated loop. A worked from-scratch walkthrough lives in `examples/from-scratch/`.

---

# 2. Purpose

Spec-Gated Architecture Lifecycle provides a structured reasoning and documentation process that prevents AI agents from jumping directly from a user request to implementation.

It guides the agent through:

```text
Product Discovery → Domain Discovery / DDD → Architecture / C4 → Contracts
  → Architecture Decisions / ADR → Specifications / SDD → Infrastructure → Release Readiness
```

The lifecycle is progressive, iterative, evidence-based, and traceable. It is **not** a mandatory waterfall: later discoveries may invalidate earlier assumptions and cause controlled feedback to previous phases.

The skill must help the agent answer: **what are we building, why, what does the domain mean, where are the boundaries, how should the system be structured, what must cross those boundaries, which consequential decisions have been made, how should the approved architecture be realized, what infrastructure is required, and what evidence is sufficient to release it safely?** The agent must avoid solving questions that have not yet been sufficiently understood.

---

# 3. Core Rules (Do Not Violate)

1. **Specification gate:** Only `APPROVED` specifications are implementable. Absence of status is **not** approval. Gate artifact: `templates/specifications/specification-delivery-review.md`; rules: `references/implementation-delivery-gate.md`.
2. **Acceptance Criteria:** An implementable spec must express observable behavior as `AC-<n>` (Given/When/Then). Completion claims map AC → test → evidence.
3. **No invention:** Never fabricate domain entities, APIs, events, contracts, capacity numbers, or project context. Unknowns are recorded as `UNKNOWN`, not guessed (`references/reasoning-rules.md`).
4. **Evidence over documentation:** Observed reality (code, runtime, data) beats historical documentation when they conflict. Three-state model: Documented vs Actual vs Target (`references/architecture-gates.md`, `references/traceability.md`).
5. **Local vs ADR:** Local decisions live in the specification; cross-cutting or difficult-to-reverse decisions escalate to an ADR (`references/decision-governance.md`).
6. **Escalation before implementation:** If a change cannot be implemented without unsupported assumptions, resolve the smallest unresolved artifact first — never bury architectural decisions in code (`references/agent-procedure.md` §5).
7. **Minimal artifacts:** Select templates by scope + risk + complexity + change impact + criticality + reversibility (§6). `NOT_REQUIRED` / `WAIVED` are valid, intentional outcomes with a recorded rationale (`references/project-sizing.md`).
8. **Technology-neutrality:** No language, framework, cloud, database, messaging, deployment, or test tool is introduced merely because the skill uses examples or templates. Technology appears only when explicitly selected.
9. **Project context boundary:** The skill is generic. Project-specific information belongs in the consuming project's workspace (`docs/`, `specs/`, `adr/`, etc.), never inside the skill.
10. **Enforce mechanically:** Validators `scripts/check-spec.ps1` / `check-spec.sh` check status, acceptance criteria, completeness, and (optionally) the passing delivery gate. Run them in CI.

---

# 4. Reference Map

Read a reference only when the task needs it. Each reference is self-contained and authoritative for its topic.

| Topic | File | Use when |
|---|---|---|
| Triage routing | `references/triage-routing.md` | Choosing a lane (L0–L4, SPIKE) and the short-task fast lane |
| Lifecycle | `references/lifecycle.md` | Full phase-by-phase lifecycle, entry modes, transitions, feedback, completion |
| Agent procedure | `references/agent-procedure.md` | Working procedure, formats, escalation rules, usage contract |
| Reasoning rules | `references/reasoning-rules.md` | Reasoning model, evidence hierarchy, unknowns, question quality |
| Decision governance | `references/decision-governance.md` | Decision categories, authority, ADR requirement |
| Architecture gates | `references/architecture-gates.md` | Gate outcomes/states, gate-by-gate requirements |
| Traceability | `references/traceability.md` | AC → spec → test → evidence and change impact |
| Project sizing | `references/project-sizing.md` | Sizing dimensions, lifecycle depth levels |
| Implementation & delivery gate | `references/implementation-delivery-gate.md` | Start-of-implementation preconditions |
| Test-driven development | `references/tdd-workflow.md` | Optional TDD activation and cycle |
| Definition of done | `references/definition-of-done.md` | Evidence required before `DONE` |
| Project bootstrap | `references/project-bootstrap.md` | Creating a spec-gated project from nothing |

---

# 5. Template Map

Select templates per phase and lane (§6). Do **not** instantiate every template.

- **Product** — `templates/product/`
  Context, requirements, quality attributes, constraints, assumptions, unknowns, business rules, scope, actors, outcomes, use cases, dependencies, risks, prioritization, decisions, discovery summary.
- **Domain** — `templates/domain/`
  Context, capabilities, processes, glossary, bounded contexts, context map, model, events, boundary review.
- **Architecture** — `templates/architecture/`
  Context, C4 (system context, container, component), views, review.
- **Contracts** — `templates/contracts/`
  Governance, API / event / data / security / observability contracts, contract review.
- **ADR** — `templates/adr/`
  Architecture decisions, ADR register, review.
- **Specifications** — `templates/specifications/`
  Behavior specification (`behavior-specification.md`) — the default L1 artifact; specification delivery review (`specification-delivery-review.md`) — the pre-implementation gate; plus API, event, data/persistence, component, integration, security, observability, configuration, runtime, deployment, infrastructure, test, migration, and operational specifications; readiness review.
- **Infrastructure** — `templates/infrastructure/`
  Context, infrastructure specification, readiness review.
- **Release** — `templates/release/`
  Release readiness context and review.
- **Project Bootstrap** — `templates/project-bootstrap/`
  `AGENTS.md`, agent context, project context, DoD, SDD/TDD workflow, specification map, `specs/` workspace (behavior-spec template + validator).

> Note: `templates/specifications/infrastructure-specification.md` defines implementation-level infrastructure requirements derived from approved architecture and decisions (Phase 6). `templates/infrastructure/infrastructure-specification.md` defines how infrastructure is realized, provisioned, operated, and evolved (Phase 7).

---

# 6. Template Selection Rule

Do not instantiate every template. Select templates according to:

```text
Scope + Risk + Complexity + Change Impact + Criticality + Reversibility
```

A template may be `REQUIRED`, `RECOMMENDED`, `OPTIONAL`, or `NOT_REQUIRED`. `NOT_REQUIRED` is a valid and intentional outcome.

---

# 7. Anti-Patterns

The skill must actively prevent:

- **Implement-Before-Approval** — implementation before spec status is `APPROVED`.
- **Decision-Beside-the-Spec** — burying architectural decisions in code/comments instead of escalating to an ADR.
- **Test-Reproduces-Implementation** — tests that mirror implementation structure instead of asserting observable behavior against ACs.
- **Done-Without-Evidence** — claiming `DONE` without concrete evidence paths per DoD.
- **Code-First Architecture** — implementing before understanding the problem.
- **Technology-First Architecture** — choosing frameworks before understanding architectural drivers.
- **Microservice-First Design** — deriving services from entities, endpoints, or bounded contexts.
- **Database-First Domain Modeling** — letting tables/collections define domain meaning.
- **API-First Domain Modeling** — letting endpoints define business boundaries.
- **Diagram Theater** — diagrams without meaningful architectural reasoning.
- **Documentation Theater** — documents that reduce no uncertainty.
- **ADR Theater** — ADRs for trivial decisions.
- **Silent Decisions** — implementation choices becoming architecture without governance.
- **False Precision** — inventing exact values without evidence.
- **Legacy Worship** — treating historical implementation as automatically correct.
- **Specification as Architecture** — specs introducing unapproved architecture.
- **Contract as Schema** — reducing contracts to structural schemas.
- **Test Theater** — treating coverage numbers as proof of correctness.
- **Checklist Gates** — treating completed fields as proof of readiness.
- **Architecture Freeze** — treating approved architecture as permanently immutable.
- **Over-Engineering** — complexity without evidence of need.
- **Under-Analysis** — skipping reasoning for difficult-to-reverse decisions.

---

# 8. Agent Procedure

When this skill is active, the agent behaves as:

```text
Discover → Understand → Classify → Analyze → Decide/Recommend → Document → Validate → Gate → Implement/Continue
```

and never as `Request → Generate Code`, unless the request is genuinely local (L0) and requires no unresolved lifecycle reasoning.

Ten-step working procedure and rules of play:

1. **Understand** — intent, context, current/desired state, affected area.
2. **Classify** — scope, risk, complexity, reversibility, lane (`references/triage-routing.md`).
3. **Inspect Evidence** — the smallest authoritative set of code, docs, contracts, decisions, specs, tests.
4. **Identify Unknowns** — record what materially affects the decision.
5. **Analyze** — alternatives, consequences, dependencies, risks, compatibility, traceability.
6. **Decide or Recommend** — record if authorized; otherwise recommend and name the required decision.
7. **Update Artifacts** — the smallest authoritative set.
8. **Validate** — consistency, traceability, evidence, downstream impact.
9. **Gate** — review outcome → canonical gate state (`READY/READY_WITH_RISKS/INCOMPLETE/BLOCKED`; `PASSED/PASSED_WITH_RISKS/BLOCKED/WAIVED`).
10. **Implement** — only approved understanding; only `APPROVED` specs.

**Minimal-question policy:** ask only when the missing information materially affects behavior, domain meaning, architecture, contracts, security, data ownership, release safety, or difficult-to-reverse decisions. Ask the smallest question that resolves the decision.

**Formats and escalation:** recommendation format, finding format, implementation/architecture/release escalation rules, and the full usage contract are in `references/agent-procedure.md`.

---

# 9. Delivery Discipline

- **Specification gate (must):** only `APPROVED` specs are implementable. Pre-implementation review uses `templates/specifications/specification-delivery-review.md`. See `references/implementation-delivery-gate.md`.
- **TDD (optional):** activatable per scope/risk. When active: `AC → RED → GREEN → REFACTOR`. Recommended for business rules, state transitions, validation, contracts, high-risk behavior; not for config/wiring/docs. See `references/tdd-workflow.md`.
- **Definition of Done (must):** delivery claims require evidence paths. Agent emits a delivery report (`DONE`/`PARTIAL`/`BLOCKED`). See `references/definition-of-done.md`.
- **Project bootstrap:** from `templates/project-bootstrap/` via `scripts/scaffold.ps1` / `scaffold.sh`. Produces generic Markdown plus an SDD-ready `specs/` and the `check-spec` validator. See `references/project-bootstrap.md`.
- **Mechanical enforcement:** `scripts/check-spec.ps1` / `check-spec.sh` validate status, acceptance criteria, completeness, and (opt-in) the passing gate.

---

# 10. Examples

The Skill includes four worked examples in the `examples/` directory demonstrating how to apply Spec-Gated Architecture Lifecycle in practice. Choose by starting point:

| Starting point | Example |
| --- | --- |
| Greenfield product (full lifecycle) | `examples/greenfield/` |
| Existing/legacy system (Documented vs Actual vs Target) | `examples/existing-system/` |
| Short task via spec-gated delivery | `examples/mealmind/` |
| From an empty directory (activation + bootstrap) | `examples/from-scratch/` |

## 10.1 Greenfield — `examples/greenfield/`

New product (MealPlanner Pro) from initial concept through release readiness. Demonstrates:
- Full lifecycle progression: Product → Domain → Architecture → Contracts → Decisions → Specifications → Infrastructure → Release
- Explicit epistemic states (FACT, ASSUMPTION, PROPOSAL, DECISION, UNKNOWN)
- Human decision authority boundaries
- Honest gate evaluation (one BLOCKED, one PASSED_WITH_RISKS)
- Traceability across all phases
- Project sizing driving template selection (LEVEL 2 — STANDARD)

## 10.2 Existing System — `examples/existing-system/`

Assessment of a legacy order management system (OrderFlow). Demonstrates:
- Three-state distinction: Documented vs Actual vs Target
- Evidence-based discovery (code, runtime, data over documentation)
- Proportional gate evaluation (Gate 1 lightweight, Gate 3 full, Gate 8 N/A)
- Decision debt identification (AuthStrategy=OPEN, DataOwnership=AMBIGUOUS)
- Target architecture via incremental strangler fig migration

**Examples are illustrative, not authoritative.** The templates, references, and rules in this Skill remain the source of process conventions. Examples demonstrate sound judgment, controlled progression, explicit uncertainty, traceability, and proportionate governance — they do not define new mandatory rules.

---

## 10.3 MealMind — Spec-Gated Delivery (`examples/mealmind/`)

Pragmatic instantiation showing specification-gated delivery with optional TDD:
- Behavior specs `SPEC-CULINARY-001` (`APPROVED` + implemented) and `SPEC-CULINARY-002` (`APPROVED`)
- AC→Test traceability matrix with concrete evidence paths
- Evidence-based delivery report (`DONE`) per Definition of Done
- Demonstrates `AC → RED → GREEN → REFACTOR` cycle for non-trivial validation

## 10.4 From-Scratch — `examples/from-scratch/`

Starting with **no project at all** (empty directory), showing activation + bootstrap + first approved spec:
- Skill activation requires only `SKILL.md` frontmatter (no project needed)
- Workspace bootstrap via `scripts/scaffold.ps1` (stubs + placeholders only; no domain content invented)
- `LIGHT` project sizing driving `NOT_REQUIRED`/`WAIVED` outcomes for Architecture/Contracts/ADR
- `SPEC-LENDING-001` reaching `APPROVED` → `VALIDATED`, with delivery gate `READY`/`PASSED`, optional TDD, DoD report (`DONE`), and AC→Test→Evidence traceability

---

# 11. Final Agent Principle

> **Do not implement what has not been sufficiently understood. Do not decide what has not been appropriately governed. Do not document what has no purpose. Do not assume what can be verified. Do not advance a lifecycle phase when doing so requires inventing unresolved semantics.**

Spec-Gated Architecture Lifecycle exists to transform ambiguous requests into:

```text
Understanding → Boundaries → Decisions → Contracts → Specifications → Implementation → Verification → Release → Evidence → Evolution
```

The goal is not more architecture documentation.

The goal is **better decisions, explicit boundaries, controlled uncertainty, traceable reasoning, and safer implementation and evolution.**