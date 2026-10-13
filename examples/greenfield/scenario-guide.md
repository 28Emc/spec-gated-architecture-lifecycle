# Greenfield Scenario Guide — MealPlanner Pro

## Purpose

This guide walks through the reasoning process an AI agent should follow when applying the Spec-Gated Architecture Lifecycle to a new product (Greenfield mode). It explains not just what documents to create, but why each step matters, what evidence was available, what remained unknown, and how decisions were made.

**Read this file first.** The individual artifacts are referenced throughout.

---

## Scenario Summary

**Product:** MealPlanner Pro — A B2B meal planning and nutrition management platform for dietitians and wellness coaches.

**Lifecycle Mode:** GREENFIELD

**Project Sizing:** LEVEL 2 — STANDARD (see `project-sizing-assessment.md`)

---

## Phase-by-Phase Walkthrough

### 0. Project Initialization (Gate 0)

**Trigger:** User requests architecture assistance for a new meal planning platform.

**Agent Action:** Classify the request as GREENFIELD. No existing codebase, no legacy constraints. Identify stakeholders: Product Owner (wellness startup founder), Domain Expert (registered dietitian consultant), Technical Lead (agent's user).

**Evidence:** User description only. No documents, no code, no contracts.

**Unknowns:** Nearly everything — scope, architecture, integrations, compliance details.

**Gate 0 Result:** PASSED — Scope is "new product," entry mode is GREENFIELD, stakeholders identified.

---

### 1. Product Discovery (Gate 1)

**Why this phase:** We cannot design architecture without understanding what problem we're solving and for whom.

**Agent Action:** Create `product/product-context.md` and `product/requirements.md` based on user interviews (simulated).

**Key Decisions Made (with authority):**
- **Product Scope (DECISION):** MVP covers practitioner meal planning, client management, USDA food data integration. Out of scope: consumer app, billing, telehealth.
- **Primary Objective (DECISION):** Reduce dietitian meal planning time from 60 min to 15 min per client.
- **Data Ownership (DECISION_REQUIRES_AUTHORITY):** Client health data owned by practitioner's organization — requires Legal + Product Owner approval.

**Assumptions Explicitly Recorded:**
- ASSUMPTION: USDA API will remain free and stable (MEDIUM confidence)
- ASSUMPTION: Practitioners will pay $49/mo for time savings (MEDIUM confidence)
- ASSUMPTION: HIPAA-adjacent compliance sufficient (LOW confidence — needs Security Officer)

**Unknowns Recorded (Blocking):**
- UNKNOWN: Exact regulatory requirements for health data storage (BLOCKING — needs Legal review)
- UNKNOWN: Whether external clients (patients) need direct portal access (DECISION_RELEVANT)

**Gate 1 Result:** PASSED_WITH_RISKS
- ✓ Problem, actors, scope, constraints identified
- ⚠ Regulatory requirements UNKNOWN — accepted as non-blocking for MVP with Legal review scheduled
- ⚠ Patient portal scope UNKNOWN — deferred to post-MVP

---

### 2. Domain Discovery (Gate 2)

**Why this phase:** Architecture must reflect domain boundaries, not technical convenience.

**Agent Action:** Create domain artifacts based on Product Discovery outputs and dietitian consultant input.

**Key Domain Findings:**
- Core Capabilities: Client Onboarding, Meal Plan Generation, Plan Customization, Client Portal, Practitioner Dashboard, Compliance Reporting
- Bounded Contexts Identified: **Nutrition Planning** (core algorithmic domain), **Client Management** (CRUD + relationships), **Compliance** (audit, consent, retention), **Integration** (USDA, PDF, email)
- Critical Invariants: A meal plan must respect all client restrictions; a plan cannot be published without practitioner review; health data access requires explicit consent

**Decisions Requiring Authority:**
- **Bounded Context Boundaries (DECISION_REQUIRES_AUTHORITY):** Nutrition Planning vs Client Management separation — Domain Expert + Architect
- **Aggregate Ownership (DECISION_REQUIRES_AUTHORITY):** Who owns MealPlan aggregate — Nutrition Planning context

**Gate 2 Result:** BLOCKED
- ✓ Core capabilities, terminology, invariants identified
- ✗ Bounded context boundary between Nutrition Planning and Client Management unresolved — affects architecture decomposition
- ⚠ Secondary domain events (e.g., PlanSharedWithClient) not fully modeled

**Resolution:** Human workshop scheduled. Agent records `PROPOSAL`: Keep Nutrition Planning and Client Management as separate bounded contexts with explicit anti-corruption layer. **Not yet a DECISION.**

---

### 3. Architecture (Gate 3)

**Why this phase:** Structure the system to support domain boundaries and quality attributes.

**Agent Action:** Create architecture artifacts after Domain boundary decision is authorized.

**Key Architectural Choices (PROPOSALS pending authority):**
- **Architecture Style (DECISION_REQUIRES_AUTHORITY):** Modular monolith (Spring Boot / .NET) — single deployable, internal module boundaries align with bounded contexts. Alternative: Distributed services — rejected due to LOW reversibility, operational complexity, team size (3 engineers).
- **Communication Pattern (DECISION_REQUIRES_AUTHORITY):** In-process module communication for MVP. Async events only for cross-bounded-context notifications (PlanGenerated, ClientOnboarded).
- **Data Ownership (DECISION_REQUIRES_AUTHORITY):** Each bounded context owns its schema. Shared kernel only for ClientIdentity.

**C4 Views Created:**
- System Context: MealPlanner Pro ↔ Practitioners, Clients, USDA API, Email Service, PDF Generator
- Container: Single modular monolith container + external systems
- Component (selective): Nutrition Planning module, Client Management module, Integration module

**Gate 3 Result:** BLOCKED (initially) → PASSED_WITH_RISKS after boundary decision
- ✗ Initially: Context boundaries unresolved → Architecture cannot be coherent
- After human decision: ✓ System boundary, components, communication, deployment model established
- ⚠ Deployment topology (cloud vs on-prem) still evolving — accepted as non-blocking

---

### 4. Contracts (Gate 4)

**Why this phase:** Boundaries need explicit agreements before specifications can be written.

**Agent Action:** Define contracts for each architectural boundary.

**Contracts Created:**
- **API Contract (MealPlan):** `POST /meal-plans`, `GET /meal-plans/{id}`, `PUT /meal-plans/{id}/customize`, `POST /meal-plans/{id}/publish`
- **API Contract (Client):** `POST /clients`, `GET /clients/{id}`, `GET /clients/{id}/meal-plans`
- **Event Contract:** `MealPlanGenerated`, `ClientOnboarded`, `PlanPublished`
- **Data Contract:** MealPlan, Client, NutritionProfile, Restriction schemas
- **Security Contract:** OAuth2 for practitioners, JWT with role claims, consent-scoped access
- **Observability Contract:** Structured logging, metrics (plan generation latency), audit events

**Key Decision:** Versioning strategy — URL versioning (`/v1/`) with backward compatibility guarantee for 12 months.

**Gate 4 Result:** PASSED
- ✓ All applicable boundary contracts defined
- ✓ Versioning, compatibility, error semantics decided
- ⚠ Contract test strategy not yet defined — deferred to Specifications

---

### 5. Architecture Decisions (Gate 5)

**Why this phase:** Make consequential choices explicit, authorized, and traceable.

**ADRs Created:**
- **ADR-001:** Architecture Style — Modular Monolith (ACCEPTED)
- **ADR-002:** Communication Pattern — In-process + Domain Events (ACCEPTED)
- **ADR-003:** Data Ownership — Per Bounded Context (ACCEPTED)
- **ADR-004:** Authentication — OAuth2 + JWT (ACCEPTED)
- **ADR-005:** PDF Generation — External Service via Integration Module (ACCEPTED)

**Decision Governance Demonstrated:**
- Each ADR follows: Problem → Context → Options → Recommendation → Human Authorization → RECORDED
- ADR-001 initially PROPOSED, only became ACCEPTED after Tech Lead + Architect sign-off
- ADR-003 supersedes initial assumption of shared database — shows SUPERSEDED lifecycle

**Gate 5 Result:** PASSED
- ✓ All significant decisions identified and recorded
- ✓ Decision dependencies mapped (ADR-001 → ADR-002 → ADR-005)
- ✓ No implicit assumptions masquerading as decisions

---

### 6. Specifications (Gate 6)

**Why this phase:** Implementation-ready detail without requiring architectural invention during coding.

**Specifications Created (Phase 6 — derived from approved architecture/contracts/ADRs):**
- **API Spec (MealPlan):** Detailed endpoints, request/response, error codes, validation rules
- **API Spec (Client):** Detailed endpoints
- **Data Persistence Spec:** Schema per bounded context, migration strategy
- **Component Spec (MealPlan Engine):** Algorithm inputs, constraints, output format, performance targets
- **Security Spec:** Encryption at rest, TLS, consent enforcement, audit logging
- **Observability Spec:** Log format, metrics, alerts, dashboards
- **Configuration Spec:** Feature flags, USDA API key, PDF service endpoint
- **Deployment Spec:** Container image, env vars, health checks, migration on startup
- **Test Spec:** Unit, integration, contract, E2E test requirements

**Key Principle Demonstrated:** Specifications reference approved ADRs and contracts. No new architectural decisions introduced. When spec revealed missing decision (e.g., caching strategy for USDA data), agent **stopped and escalated** to Architecture Decisions — did not invent.

**Gate 6 Result:** PASSED_WITH_RISKS
- ✓ Implementation scope defined, behavior specified, contracts referenced, acceptance criteria established
- ⚠ USDA API rate limit handling not fully specified — accepted as non-blocking with monitoring
- ⚠ PDF generation timeout/retry not fully specified — deferred to implementation with observability

---

### 7. Infrastructure (Gate 7)

**Why this phase:** The system must be buildable, deployable, operable.

**Phase 6 Infrastructure Specification (templates/specifications/infrastructure-specification.md):**
- Defines *what* infrastructure capabilities are required: managed PostgreSQL, Redis cache, object storage for PDFs, managed Kubernetes (EKS/GKE), TLS certificates, secrets manager, CI/CD pipeline

**Phase 7 Infrastructure Specification (templates/infrastructure/infrastructure-specification.md):**
- Defines *how* infrastructure is realized: Terraform modules, Helm charts, environment promotion (dev→staging→prod), blue-green deployment, backup/recovery RPO/RTO, alerting rules

**Gate 7 Result:** PASSED_WITH_RISKS
- ✓ Dev environment defined, runtime environment designed, deployment strategy, networking, config, secrets, persistence, CI/CD, observability, security, backup/recovery
- ⚠ Production autoscaling policy not finalized — WAIVED for initial internal release with documented manual scaling procedure

---

### 8. Release Readiness (Gate 8)

**Why this phase:** Evidence-based go/no-go decision.

**Evaluation:**
- Functional: Core meal planning flow implemented and tested (E2E for happy path)
- Architecture: Implementation aligns with modular monolith — no critical drift
- Contracts: API v1 compatible, contract tests passing
- Security: Encryption, auth, audit logging implemented; penetration test scheduled post-launch
- Testing: Unit 85%, Integration 70%, Contract 100%, E2E critical paths
- Operations: Monitoring, logging, alerting, deployment validated, rollback tested
- Documentation: Runbooks, API docs, architecture decision log

**Gate 8 Result:** PASSED_WITH_RISKS → GO_WITH_RISKS
- ✓ All mandatory criteria satisfied
- ⚠ Penetration test not complete — accepted with GO_WITH_RISKS, review before public launch
- ⚠ Load testing at projected scale not complete — monitoring in place

---

## Key Behaviors Demonstrated

| Behavior | Example in This Scenario |
|----------|-------------------------|
| Explicit unknowns | Regulatory requirements, patient portal scope |
| Recommendation ≠ Decision | ADR-001 was PROPOSED for 2 weeks before ACCEPTED |
| Gate blocking on real issues | Gate 2 BLOCKED on bounded context boundary |
| Feedback loop | Contracts revealed missing caching decision → new ADR |
| Traceability | REQ-003 → CAP-02 → ARCH-01 → API-001 → SPEC-003 → TEST-017 |
| Project sizing | LEVEL 2 — no full C4 Level 3, no formal threat model |
| Infrastructure phase boundary | Phase 6 spec (what) vs Phase 7 spec (how) |

---

## Files in This Example

See `README.md` for the complete directory structure. Key files:

- `scenario-guide.md` — This file
- `project-sizing-assessment.md` — Formal sizing analysis
- `traceability-matrix.md` — Consolidated cross-phase traceability
- `product/`, `domain/`, `architecture/`, `contracts/`, `adr/`, `specifications/`, `infrastructure/`, `release/` — Phase artifacts