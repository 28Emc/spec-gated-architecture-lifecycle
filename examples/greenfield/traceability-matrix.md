# Traceability Matrix — MealPlanner Pro (Greenfield)

## 1. Document Metadata

| Field | Value |
|-------|-------|
| Document ID | `TRACE-001` |
| Version | `0.3` |
| Status | `ACTIVE` |
| Created | `2025-01-31` |
| Updated | `2025-02-01` |
| Project | MealPlanner Pro |
| Lifecycle Mode | GREENFIELD |
| Owner | Architect |

---

## 2. Purpose

Consolidated cross-phase traceability from product requirements through verification. Demonstrates the canonical relationship chain and identifies any orphaned or incomplete paths.

---

## 3. Canonical Traceability Chain

```
Product Need (OUT-001)
    ↓ DERIVES_FROM
Requirement (REQ-001)
    ↓ SATISFIES
Domain Capability (CAP-001)
    ↓ REALIZES
Architecture Element (ARCH-001: Nutrition Planning Module)
    ↓ EXPOSES
Contract (API-001: MealPlan API)
    ↓ SPECIFIES
Specification (SPEC-001: MealPlan Engine Component Spec)
    ↓ IMPLEMENTS
Implementation (MOD-001: MealPlanGenerator, MealPlanController)
    ↓ VERIFIES
Verification (TEST-001: MealPlan Generation Test Suite)
```

---

## 4. Requirement-to-Capability Traceability

| Requirement | Domain Capability | Relationship | Status |
|-------------|-------------------|--------------|--------|
| `REQ-001` (Generate plan) | `CAP-001` (Meal Plan Generation) | `SATISFIES` | `VALID` |
| `REQ-002` (Enforce restrictions) | `CAP-001`, `CAP-002` (Restriction Mgmt) | `SATISFIES` | `VALID` |
| `REQ-003` (Customize plan) | `CAP-003` (Plan Customization) | `SATISFIES` | `VALID` |
| `REQ-004` (Approval gate) | `CAP-004` (Plan Approval Workflow) | `SATISFIES` | `VALID` |
| `REQ-005` (Shopping list) | `CAP-007` (Integration) | `SATISFIES` | `VALID` |
| `REQ-006` (Prep guide) | `CAP-007` (Integration) | `SATISFIES` | `VALID` |
| `REQ-007` (USDA integration) | `CAP-005` (External Data Integration) | `SATISFIES` | `VALID` |
| `REQ-008` (Encryption) | `CAP-006` (Compliance & Security) | `SATISFIES` | `VALID` |
| `REQ-009` (Audit logging) | `CAP-006` (Compliance & Security) | `SATISFIES` | `VALID` |
| `REQ-010` (Consent enforcement) | `CAP-006`, `CAP-007` | `SATISFIES` | `VALID` |
| `REQ-011` (Retention policy) | `CAP-006` (Compliance & Security) | `SATISFIES` | `OPEN` |
| `REQ-012` (Performance) | `CAP-001` (Meal Plan Generation) | `SATISFIES` | `VALID` |
| `REQ-013` (Availability) | `CAP-006` (Compliance & Security) | `SATISFIES` | `VALID` |
| `REQ-014` (RBAC) | `CAP-006` (Compliance & Security) | `SATISFIES` | `PROPOSED` |

---

## 5. Capability-to-Architecture Traceability

| Domain Capability | Architecture Element | Relationship | Status |
|-------------------|---------------------|--------------|--------|
| `CAP-001` (Meal Plan Generation) | `ARCH-001` (Nutrition Planning Module) | `REALIZES` | `VALID` |
| `CAP-002` (Restriction Management) | `ARCH-001` (Nutrition Planning Module) | `REALIZES` | `VALID` |
| `CAP-003` (Plan Customization) | `ARCH-001`, `ARCH-002` (Client Mgmt) | `REALIZES` | `VALID` |
| `CAP-004` (Plan Approval) | `ARCH-002` (Client Management Module) | `REALIZES` | `VALID` |
| `CAP-005` (Client Onboarding) | `ARCH-002` (Client Management Module) | `REALIZES` | `VALID` |
| `CAP-006` (Compliance & Security) | `ARCH-003` (Compliance Module) | `REALIZES` | `VALID` |
| `CAP-007` (External Integration) | `ARCH-004` (Integration Module) | `REALIZES` | `VALID` |

---

## 6. Architecture-to-Contract Traceability

| Architecture Element | Contract | Relationship | Status |
|---------------------|----------|--------------|--------|
| `ARCH-001` (Nutrition Planning) | `API-001` (MealPlan API) | `EXPOSES` | `VALID` |
| `ARCH-001` | `EVT-001` (MealPlanGenerated, PlanCustomized) | `EXPOSES` | `VALID` |
| `ARCH-002` (Client Management) | `API-002` (Client API) | `EXPOSES` | `VALID` |
| `ARCH-002` | `EVT-001` (ClientOnboarded, ConsentGranted) | `EXPOSES` | `VALID` |
| `ARCH-003` (Compliance) | `EVT-001` (HealthDataAccessed, RetentionPolicyChanged) | `EXPOSES` | `VALID` |
| `ARCH-004` (Integration) | `API-001`, `API-002` (consumes) | `CONSUMES` | `VALID` |
| All Modules | `SEC-001` (Security Contract) | `CONSTRAINS` | `VALID` |
| All Modules | `OBS-001` (Observability Contract) | `CONSTRAINS` | `VALID` |

---

## 7. Contract-to-Specification Traceability

| Contract | Specification | Relationship | Status |
|----------|---------------|--------------|--------|
| `API-001` (MealPlan API) | `SPEC-001` (MealPlan Engine), `SPEC-003` (MealPlan API) | `SPECIFIES` | `VALID` |
| `API-002` (Client API) | `SPEC-002` (Client API) | `SPECIFIES` | `VALID` |
| `EVT-001` (Domain Events) | `SPEC-001`, `SPEC-002`, `SPEC-004` | `SPECIFIES` | `VALID` |
| `DAT-001` (Data Contracts) | `SPEC-004` (Data Persistence) | `SPECIFIES` | `VALID` |
| `SEC-001` (Security Contract) | `SPEC-005` (Security Spec) | `SPECIFIES` | `VALID` |
| `OBS-001` (Observability Contract) | `SPEC-006` (Observability Spec) | `SPECIFIES` | `VALID` |

---

## 8. Specification-to-Implementation Traceability

| Specification | Implementation Module | Relationship | Status |
|---------------|----------------------|--------------|--------|
| `SPEC-001` (MealPlan Engine) | `MOD-001` (Nutrition Planning Module) | `IMPLEMENTS` | `VALID` |
| `SPEC-002` (Client API) | `MOD-002` (Client Management Module) | `IMPLEMENTS` | `VALID` |
| `SPEC-003` (MealPlan API) | `MOD-001` (Nutrition Planning Module) | `IMPLEMENTS` | `VALID` |
| `SPEC-004` (Data Persistence) | `MOD-001`..`MOD-004` (All Modules) | `IMPLEMENTS` | `VALID` |
| `SPEC-005` (Security) | `MOD-001`..`MOD-004` (All Modules) | `IMPLEMENTS` | `VALID` |
| `SPEC-006` (Observability) | `MOD-001`..`MOD-004` (All Modules) | `IMPLEMENTS` | `VALID` |
| `SPEC-007` (Configuration) | `MOD-004` (Integration Module) | `IMPLEMENTS` | `VALID` |
| `SPEC-008` (Deployment) | Infrastructure (K8s, Helm) | `IMPLEMENTS` | `VALID` |
| `SPEC-009` (Test Spec) | Test Suite (All Modules) | `VERIFIES` | `VALID` |

---

## 9. Decision Traceability

| Decision | Constrains Architecture | Influences Specification | Status |
|----------|------------------------|-------------------------|--------|
| `ADR-001` (Modular Monolith) | `ARCH-001`..`ARCH-004` (Module boundaries) | `SPEC-001`..`SPEC-009` (Single deployable) | `ACTIVE` |
| `ADR-002` (In-Process + Events) | Module communication patterns | `SPEC-001` (sync), `EVT-001` (async) | `ACTIVE` |
| `ADR-003` (Per-Context Data) | `ARCH-001`..`ARCH-004` (Schema ownership) | `SPEC-004` (Data Persistence) | `ACTIVE` |
| `ADR-004` (OAuth2 + JWT) | `SEC-001` (Security Contract) | `SPEC-005` (Security Spec) | `ACTIVE` |
| `ADR-005` (PDF External) | `ARCH-004` (Integration Module) | `SPEC-008` (Deployment), `SPEC-007` (Config) | `ACTIVE` |

---

## 10. Verification Traceability

| Requirement | Test Suite | Test Type | Status |
|-------------|------------|-----------|--------|
| `REQ-001` | `TEST-001` | Unit + Integration | `VERIFIED` |
| `REQ-002` | `TEST-002` | Property-based | `VERIFIED` |
| `REQ-003` | `TEST-003` | Integration + E2E | `VERIFIED` |
| `REQ-004` | `TEST-004` | E2E | `VERIFIED` |
| `REQ-005` | `TEST-005` | Unit | `VERIFIED` |
| `REQ-006` | `TEST-006` | Unit | `VERIFIED` |
| `REQ-007` | `TEST-007` | Integration (USDA mock) | `VERIFIED` |
| `REQ-008` | `TEST-008` | Security (encryption verify) | `VERIFIED` |
| `REQ-009` | `TEST-009` | Integration (audit log verify) | `VERIFIED` |
| `REQ-010` | `TEST-010` | Integration (consent flow) | `VERIFIED` |
| `REQ-011` | `TEST-011` | — | `PENDING` (req OPEN) |
| `REQ-012` | `TEST-012` | Performance (load test) | `VERIFIED` |
| `REQ-013` | `TEST-013` | Operational (chaos test) | `PLANNED` |
| `REQ-014` | `TEST-014` | Integration (RBAC) | `PLANNED` (req PROPOSED) |

---

## 11. Orphan Detection

| Artifact | Type | Traceability Status | Action |
|----------|------|---------------------|--------|
| `REQ-011` | Requirement | `PARTIAL` (no IMPLEMENTS, no VERIFIES) | `OPEN` — Legal review blocking |
| `REQ-014` | Requirement | `PARTIAL` (no IMPLEMENTS, no VERIFIES) | `PROPOSED` — Post-MVP |
| `SPEC-007` | Specification | `IN_REVIEW` (pending ADR-006) | `IN_PROGRESS` |
| `SPEC-008` | Specification | `IN_REVIEW` (pending ARCH-DEC-003) | `IN_PROGRESS` |
| `ADR-006` | Decision | `PROPOSED` | `IN_PROGRESS` |

---

## 12. Broken/Stale Traceability Check

| Check | Result |
|-------|--------|
| All requirements trace to capability | ✅ PASS |
| All capabilities trace to architecture | ✅ PASS |
| All architecture elements trace to contracts | ✅ PASS |
| All contracts trace to specifications | ✅ PASS |
| All specifications trace to implementation | ✅ PASS (where APPROVED) |
| All requirements trace to verification | ✅ PASS (except OPEN/PROPOSED) |
| No ADR without architectural consequence | ✅ PASS |
| No implementation without specification | ✅ PASS |

---

## 13. Traceability Coverage Summary

| Layer | Artifacts | Traced | Coverage |
|-------|-----------|--------|----------|
| Product Requirements | 14 | 12 `VALID` / 2 `OPEN/PROPOSED` | 86% |
| Domain Capabilities | 7 | 7 `VALID` | 100% |
| Architecture Elements | 4 | 4 `VALID` | 100% |
| Contracts | 6 | 6 `VALID` | 100% |
| Specifications | 9 | 7 `VALID` / 2 `IN_REVIEW` | 78% |
| Implementation Modules | 4 | 4 `VALID` | 100% |
| Verification (Test Suites) | 14 | 10 `VERIFIED` / 4 `PLANNED/PENDING` | 71% |
| Decisions | 6 | 6 `ACTIVE/PROPOSED` | 100% |

**Overall Assessment:** Traceability is sufficient for pilot release. Gaps are explicitly documented and tied to known blocking items (Legal review, ADR-006 authorization).

---

## 14. Change Impact Example

**Scenario:** `REQ-001` macro target precision changed from ±5% to ±3%

```
REQ-001 (changed)
    ↓ SATISFIES
CAP-001 (affected)
    ↓ REALIZES
ARCH-001 (Nutrition Planning Module) — DIRECT IMPACT
    ↓ EXPOSES
API-001 (MealPlan API) — DIRECT IMPACT (response schema)
    ↓ SPECIFIES
SPEC-001, SPEC-003 — DIRECT IMPACT (acceptance criteria)
    ↓ IMPLEMENTS
MOD-001 (MealPlanGenerator, Controller) — DIRECT IMPACT
    ↓ VERIFIES
TEST-001 — DIRECT IMPACT (test thresholds)
    ↓
CAP-002 (Restriction Mgmt) — INDIRECT IMPACT (revalidation)
ARCH-002 (Client Mgmt) — POTENTIAL IMPACT (dashboard display)
```

**Impact Classification:** `DIRECT` for Nutrition Planning module and API; `INDIRECT` for Client Management dashboard; `POTENTIAL` for Integration (PDF template).

---

## 15. Evidence

| Evidence | Type | Source | Confidence |
|----------|------|--------|------------|
| Requirement documents | `DOCUMENT` | Product | `HIGH` |
| Domain context & bounded contexts | `DOCUMENT` | Domain | `HIGH` |
| Architecture context & C4 diagrams | `DOCUMENT` | Architecture | `HIGH` |
| Contract documents | `DOCUMENT` | Contracts | `HIGH` |
| ADR register | `DOCUMENT` | Decisions | `HIGH` |
| Specification documents | `DOCUMENT` | Specifications | `HIGH` |
| Source code (module structure) | `CODE` | Implementation | `HIGH` |
| Test suite (unit, integration, contract, E2E) | `TEST` | CI/CD | `HIGH` |
| Architecture tests (ArchUnit) | `TEST` | CI/CD | `HIGH` |