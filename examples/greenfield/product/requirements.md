# Product Requirements — MealPlanner Pro

## 1. Document Metadata

| Field | Value |
|-------|-------|
| Document ID | `PROD-REQ-001` |
| Title | MealPlanner Pro — Product Requirements |
| Product / System | MealPlanner Pro |
| Version | `0.4` |
| Status | `IN_REVIEW` |
| Lifecycle Mode | `GREENFIELD` |
| Owner | Product Owner |
| Date | `2025-01-15` |
| Last Updated | `2025-01-28` |

### Document Status
`IN_REVIEW` — Requirements stable; awaiting regulatory clarification on retention (REQ-011).

---

## 2. Purpose

Capture the complete set of product-level requirements for MealPlanner Pro MVP. Requirements describe what the product must achieve, not how the system implements it (unless the constraint is explicit).

---

## 3. Requirement Model

Each requirement has a stable identifier: `REQ-XXX`.

Minimum fields: ID, Statement, Type, Priority, Status, Source, Acceptance Criteria.

---

## 4. Requirement Statements

All requirements use the form: "The system shall <expected behavior>."

---

## 5. Requirement Types

`FUNCTIONAL`, `QUALITY_ATTRIBUTE`, `SECURITY`, `COMPLIANCE`, `INTEGRATION`, `DATA`, `CONSTRAINT`, `OPERATIONAL`

---

## 6. Priority

`CRITICAL`, `HIGH`, `MEDIUM`, `LOW`

---

## 7. Requirement Status

`OPEN` → `PROPOSED` → `ACCEPTED` → `IN_PROGRESS` → `IMPLEMENTED` → `VERIFIED`

Alternative paths: `PROPOSED` → `REJECTED`, `ACCEPTED` → `DEFERRED`, `ACCEPTED` → `SUPERSEDED`

---

## 8. Requirements Register

| ID | Requirement | Type | Priority | Status | Source |
|----|-------------|------|----------|--------|--------|
| `REQ-001` | The system shall generate a complete daily meal plan meeting specified macro targets | `FUNCTIONAL` | `CRITICAL` | `ACCEPTED` | Practitioner interview |
| `REQ-002` | The system shall enforce all client dietary restrictions (allergies, intolerances, preferences) | `FUNCTIONAL` | `CRITICAL` | `ACCEPTED` | Clinical safety |
| `REQ-003` | The system shall allow practitioner to customize any meal in a generated plan | `FUNCTIONAL` | `HIGH` | `ACCEPTED` | Practitioner interview |
| `REQ-004` | The system shall require practitioner approval before plan is delivered to client | `FUNCTIONAL` | `CRITICAL` | `ACCEPTED` | Clinical workflow |
| `REQ-005` | The system shall produce shopping list aggregated across plan duration | `FUNCTIONAL` | `HIGH` | `ACCEPTED` | Usability |
| `REQ-006` | The system shall produce prep guide with cooking instructions per meal | `FUNCTIONAL` | `MEDIUM` | `ACCEPTED` | Practitioner interview |
| `REQ-007` | The system shall integrate with USDA FoodData Central for nutrient data | `INTEGRATION` | `HIGH` | `ACCEPTED` | Credibility requirement |
| `REQ-008` | The system shall encrypt all health data at rest and in transit | `SECURITY` | `CRITICAL` | `ACCEPTED` | Compliance |
| `REQ-009` | The system shall audit all access to client health data | `SECURITY` | `HIGH` | `ACCEPTED` | Compliance |
| `REQ-010` | The system shall enforce consent before health data is used in plan generation | `COMPLIANCE` | `CRITICAL` | `ACCEPTED` | Legal requirement |
| `REQ-011` | The system shall retain health data per practitioner-defined retention policy | `COMPLIANCE` | `HIGH` | `OPEN` | Legal — **UNK-005** |
| `REQ-012` | The system shall respond to plan generation requests within 30 seconds | `QUALITY_ATTRIBUTE` | `HIGH` | `ACCEPTED` | Practitioner workflow |
| `REQ-013` | The system shall be available 99.5% during business hours | `QUALITY_ATTRIBUTE` | `MEDIUM` | `ACCEPTED` | Business hours focus |
| `REQ-014` | The system shall support practitioner role-based access (admin, dietitian, assistant) | `FUNCTIONAL` | `MEDIUM` | `PROPOSED` | Team feedback |

---

## 9. Detailed Requirements

### REQ-001 — Meal Plan Generation

**Statement:** The system shall generate a complete daily meal plan meeting specified macro targets.

**Rationale:** Core value proposition — replaces manual calculation.

**Source:** Practitioner interview, Dietitian consultant

**Priority:** `CRITICAL`

**Status:** `ACCEPTED`

**Scope:** Nutrition Planning bounded context

**Constraints:** 
- Must use USDA nutrient data (CON-001)
- Must respect all client restrictions (REQ-002)
- Generation time < 30s (REQ-012)

**Dependencies:** REQ-002 (restrictions), REQ-007 (USDA data), REQ-012 (performance)

**Acceptance Criteria:**
```
AC-001: Given a client profile with 2000 kcal target, 40/30/30 macro split, and no restrictions
When the practitioner requests a 7-day plan
Then the system produces 7 days × 3 meals + 2 snacks meeting macros ±5%

AC-002: Given a client with vegetarian restriction
When generating a plan
Then no meal contains meat, poultry, or fish

AC-003: Given a client with peanut allergy
When generating a plan
Then no meal contains peanuts or peanut-derived ingredients

AC-004: Given invalid macro targets (e.g., protein > 50%)
When generating a plan
Then the system rejects with clear error message
```

**Verification:**
```
Verification Method: TEST (unit + integration)
Evidence: Test suite covering macro accuracy, restriction enforcement, performance
```

**Traceability:**
```
DERIVES_FROM: PROD-CTX-001 (Product Context)
SATISFIES: CAP-001 (Meal Plan Generation capability)
REALIZES: ARCH-001 (Nutrition Planning module)
IMPLEMENTS: SPEC-001 (MealPlan Engine Component Spec)
VERIFIES: TEST-001 (MealPlan Generation Test Suite)
```

---

### REQ-002 — Dietary Restriction Enforcement

**Statement:** The system shall enforce all client dietary restrictions (allergies, intolerances, preferences).

**Rationale:** Clinical safety — violations can cause harm.

**Source:** Clinical safety, Dietitian consultant

**Priority:** `CRITICAL`

**Status:** `ACCEPTED`

**Scope:** Nutrition Planning, Client Management

**Constraints:** Must be enforced at generation time, not post-hoc.

**Dependencies:** REQ-001 (generation), REQ-010 (consent for health data)

**Acceptance Criteria:**
```
AC-005: Given client with gluten intolerance
When generating plan
Then zero meals contain gluten-containing ingredients

AC-006: Given client with multiple restrictions (vegan + nut allergy)
When generating plan
Then all meals satisfy ALL restrictions simultaneously

AC-007: Given a new restriction type added by practitioner
When generating plan
Then the restriction is enforced without code change (data-driven)
```

**Verification:**
```
Verification Method: TEST (property-based)
Evidence: Property tests verifying restriction enforcement across 10,000 random profiles
```

**Traceability:**
```
DERIVES_FROM: PROD-CTX-001
SATISFIES: CAP-001, CAP-002 (Restriction Management)
REALIZES: ARCH-001
IMPLEMENTS: SPEC-001
VERIFIES: TEST-002 (Restriction Enforcement Tests)
```

---

### REQ-003 — Practitioner Customization

**Statement:** The system shall allow practitioner to customize any meal in a generated plan.

**Rationale:** Practitioner expertise must override algorithm when needed.

**Source:** Practitioner interview

**Priority:** `HIGH`

**Status:** `ACCEPTED`

**Scope:** Nutrition Planning, Client Management

**Acceptance Criteria:**
```
AC-008: Given a generated plan
When practitioner swaps Monday lunch with alternative
Then plan regenerates nutrition totals for that day

AC-009: Given a customized plan
When practitioner adjusts portion size
Then macros recalculate and remain within ±5% target

AC-010: Given a customized plan
When practitioner adds free-text note to meal
Then note appears in client PDF and shopping list
```

**Traceability:**
```
DERIVES_FROM: PROD-CTX-001
SATISFIES: CAP-003 (Plan Customization)
REALIZES: ARCH-001, ARCH-002 (Client Management module)
IMPLEMENTS: SPEC-001, SPEC-002 (Client API Spec)
VERIFIES: TEST-003 (Customization Tests)
```

---

### REQ-004 — Practitioner Approval Gate

**Statement:** The system shall require practitioner approval before plan is delivered to client.

**Rationale:** Clinical workflow — practitioner accountable for plan content.

**Source:** Clinical workflow, Dietitian consultant

**Priority:** `CRITICAL`

**Status:** `ACCEPTED`

**Scope:** Client Management

**Acceptance Criteria:**
```
AC-011: Given a generated or customized plan
When plan status is DRAFT
Then client cannot access plan via any channel

AC-012: Given a plan in DRAFT
When practitioner clicks "Approve and Send"
Then plan status becomes PUBLISHED and delivery is triggered

AC-013: Given a published plan
When practitioner clicks "Revoke"
Then plan status becomes REVOKED and client access is removed
```

**Traceability:**
```
DERIVES_FROM: PROD-CTX-001
SATISFIES: CAP-004 (Plan Approval Workflow)
REALIZES: ARCH-002
IMPLEMENTS: SPEC-002
VERIFIES: TEST-004 (Workflow Tests)
```

---

### REQ-007 — USDA Integration

**Statement:** The system shall integrate with USDA FoodData Central for nutrient data.

**Rationale:** Authoritative, credible nutrient source.

**Source:** Credibility requirement, Dietitian consultant

**Priority:** `HIGH`

**Status:** `ACCEPTED`

**Scope:** Integration bounded context

**Constraints:** CON-001 (must use USDA), rate limits (1,000/day free)

**Acceptance Criteria:**
```
AC-014: Given a food item search
When system queries USDA API
Then nutrient data (macros, micros, serving sizes) returned and cached

AC-015: Given USDA API rate limit exceeded
When system needs nutrient data
Then cached data is used with staleness indicator

AC-016: Given USDA API unavailable
When system needs nutrient data
Then curated fallback dataset used with warning logged
```

**Traceability:**
```
DERIVES_FROM: PROD-CTX-001
SATISFIES: CAP-005 (External Data Integration)
REALIZES: ARCH-004 (Integration module)
IMPLEMENTS: SPEC-004 (Integration Spec)
VERIFIES: TEST-007 (USDA Integration Tests)
```

---

### REQ-008 — Health Data Encryption

**Statement:** The system shall encrypt all health data at rest and in transit.

**Rationale:** Compliance, trust, breach mitigation.

**Source:** Compliance, Security Officer

**Priority:** `CRITICAL`

**Status:** `ACCEPTED`

**Scope:** All bounded contexts handling health data

**Acceptance Criteria:**
```
AC-017: Given health data written to database
When stored
Then encrypted with AES-256 (managed key)

AC-018: Given API request containing health data
When transmitted
Then TLS 1.2+ enforced

AC-019: Given database backup
When created
Then encrypted with same key management
```

**Traceability:**
```
DERIVES_FROM: PROD-CTX-001
SATISFIES: CAP-006 (Compliance & Security)
CONSTRAINS: ADR-003 (Data Ownership), ADR-004 (Authentication)
REALIZES: ARCH-002, ARCH-003 (Compliance module)
IMPLEMENTS: SPEC-005 (Security Spec)
VERIFIES: TEST-008 (Security Tests)
```

---

### REQ-010 — Consent Enforcement

**Statement:** The system shall enforce consent before health data is used in plan generation.

**Rationale:** Legal requirement, patient autonomy.

**Source:** Legal requirement

**Priority:** `CRITICAL`

**Status:** `ACCEPTED`

**Scope:** Client Management, Nutrition Planning

**Acceptance Criteria:**
```
AC-020: Given client without active consent for "meal_planning"
When practitioner requests plan generation
Then system blocks request with consent-required error

AC-021: Given client with expired consent
When practitioner requests plan generation
Then system blocks and prompts for consent renewal

AC-022: Given consent granted
When plan generated
Then audit log records consent ID, timestamp, practitioner
```

**Traceability:**
```
DERIVES_FROM: PROD-CTX-001
SATISFIES: CAP-006, CAP-007 (Consent Management)
CONSTRAINS: ADR-003
REALIZES: ARCH-003
IMPLEMENTS: SPEC-005
VERIFIES: TEST-010 (Consent Tests)
```

---

### REQ-011 — Data Retention Policy

**Statement:** The system shall retain health data per practitioner-defined retention policy.

**Rationale:** Compliance with varying jurisdictional requirements.

**Source:** Legal — **UNK-005**

**Priority:** `HIGH`

**Status:** `OPEN` — **BLOCKING UNKNOWN**

**Scope:** Compliance bounded context

**Acceptance Criteria:**
```
AC-023: Given practitioner sets retention to 7 years
When client relationship ends
Then health data purged after 7 years (configurable)

AC-024: Given legal hold placed
When purge job runs
Then held data excluded from purge
```

**Traceability:**
```
DERIVES_FROM: PROD-CTX-001
SATISFIES: CAP-006
REALIZES: ARCH-003
IMPLEMENTS: SPEC-005
VERIFIES: TEST-011 (Retention Tests) — PENDING requirement acceptance
```

---

### REQ-012 — Plan Generation Performance

**Statement:** The system shall respond to plan generation requests within 30 seconds.

**Rationale:** Practitioner workflow cannot tolerate long waits.

**Source:** Practitioner workflow analysis

**Priority:** `HIGH`

**Status:** `ACCEPTED`

**Acceptance Criteria:**
```
AC-025: Given standard client profile (5 restrictions, 7-day plan)
When generation requested
Then p95 latency < 30s

AC-026: Given complex profile (15 restrictions, 14-day plan)
When generation requested
Then p95 latency < 45s (with progress indicator)
```

**Traceability:**
```
DERIVES_FROM: PROD-CTX-001
SATISFIES: CAP-001
REALIZES: ARCH-001
IMPLEMENTS: SPEC-001
VERIFIES: TEST-012 (Performance Tests)
```

---

## 10. Acceptance Criteria Summary

All acceptance criteria use Given/When/Then format. See detailed requirements above.

---

## 11. Quality Attribute Requirements

See REQ-012 (Performance), REQ-013 (Availability), Section 9 in Product Context for Security, Privacy, etc.

---

## 12. Security Requirements

See REQ-008 (Encryption), REQ-009 (Audit), REQ-010 (Consent), REQ-014 (RBAC).

---

## 13. Data Requirements

Health data: Client profile, restrictions, health conditions, consent records, audit logs.
Retention: Per REQ-011 (OPEN).
Ownership: Per ADR-003 (Practitioner organization owns data).

---

## 14. Integration Requirements

USDA API (REQ-007), Email (plan delivery), PDF (document generation), Auth0 (auth).

---

## 15. Operational Requirements

Observability (REQ-012 latency, REQ-013 availability), Deployment (REQ-012), Backup/Recovery (tied to REQ-011).

---

## 16. Constraints

See Product Context Section 10.

---

## 17. Requirement Dependencies

| Requirement | Relationship | Related Requirement |
|-------------|--------------|---------------------|
| `REQ-001` | `DEPENDS_ON` | `REQ-002` |
| `REQ-001` | `DEPENDS_ON` | `REQ-007` |
| `REQ-001` | `DEPENDS_ON` | `REQ-012` |
| `REQ-003` | `DEPENDS_ON` | `REQ-001` |
| `REQ-004` | `DEPENDS_ON` | `REQ-003` |
| `REQ-010` | `CONSTRAINS` | `REQ-001` |
| `REQ-011` | `CONSTRAINS` | `REQ-008`, `REQ-009` |

---

## 18. Conflicting Requirements

```
Conflict: REQ-001 (generate complete plan) ↔ REQ-002 (enforce all restrictions)
Severity: SIGNIFICANT
Impact: For highly restricted clients, no valid meal combination may exist
Resolution: Algorithm must detect unsatisfiable constraints and report specific conflicts to practitioner rather than producing invalid plan
Status: OPEN — Algorithm spec (SPEC-001) must define conflict detection behavior
```

---

## 19. Ambiguous Requirements

```
Ambiguity: REQ-013 "99.5% during business hours"
Impact: Does not define measurement window, exclusion of planned maintenance, or SLA consequences
Status: OPEN — To be refined in Operational Spec (SPEC-007)
```

---

## 20. Assumptions Associated With Requirements

| ID | Requirement | Assumption | Confidence | Validation |
|----|-------------|------------|------------|------------|
| `ASM-001` | `REQ-007` | USDA API free tier sufficient | `MEDIUM` | Load test Sprint 2 |
| `ASM-002` | `REQ-012` | 30s achievable with caching | `MEDIUM` | Performance spike |
| `ASM-003` | `REQ-011` | Retention policy configurable per practitioner | `LOW` | Legal review |

---

## 21. Requirement Traceability

See detailed Traceability sections in each requirement above. Consolidated in `traceability-matrix.md`.

---

## 22. Requirement Coverage

| Requirement | Domain | Architecture | Specification | Implementation | Verification |
|-------------|--------|--------------|---------------|----------------|--------------|
| `REQ-001` | `CAP-001` | `ARCH-001` | `SPEC-001` | `MOD-001` | `TEST-001` |
| `REQ-002` | `CAP-001, CAP-002` | `ARCH-001` | `SPEC-001` | `MOD-001` | `TEST-002` |
| `REQ-003` | `CAP-003` | `ARCH-001, ARCH-002` | `SPEC-001, SPEC-002` | `MOD-001, MOD-002` | `TEST-003` |
| `REQ-004` | `CAP-004` | `ARCH-002` | `SPEC-002` | `MOD-002` | `TEST-004` |
| `REQ-007` | `CAP-005` | `ARCH-004` | `SPEC-004` | `MOD-004` | `TEST-007` |
| `REQ-008` | `CAP-006` | `ARCH-003` | `SPEC-005` | `MOD-003` | `TEST-008` |
| `REQ-010` | `CAP-006, CAP-007` | `ARCH-003` | `SPEC-005` | `MOD-003` | `TEST-010` |
| `REQ-011` | `CAP-006` | `ARCH-003` | `SPEC-005` | `MOD-003` | `TEST-011` |
| `REQ-012` | `CAP-001` | `ARCH-001` | `SPEC-001` | `MOD-001` | `TEST-012` |

Status codes: `COMPLETE`, `PARTIAL`, `MISSING`, `UNKNOWN`, `NOT_APPLICABLE`

---

## 23. Requirement Change

No changes yet — initial version.

---

## 24. Requirement Supersession

None.

---

## 25. Requirement Rejection

None.

---

## 26. Requirement Deferral

| Requirement | Reason | Target |
|-------------|--------|--------|
| `REQ-014` (RBAC) | Post-MVP scope | Phase 2 |

---

## 27. Existing System Requirements

`GREENFIELD` — Not applicable.

---

## 28. System Evolution Requirements

`GREENFIELD` — Not applicable.

---

## 29. Requirement Review

- [x] Understandable
- [x] Expected outcome clear
- [x] Testable/verifiable (except REQ-011 OPEN)
- [x] Source known
- [x] Priority justified
- [x] Dependencies known
- [x] Constraints visible
- [x] Ambiguities identified (REQ-013)
- [x] Conflicts identified (REQ-001 ↔ REQ-002)
- [x] Scope clear
- [x] Free of implementation prescription

---

## 30. Requirement Quality Checklist

- [x] CLEAR
- [x] CONSISTENT
- [x] RELEVANT
- [x] TESTABLE (mostly)
- [x] TRACEABLE
- [x] FEASIBLE
- [x] UNAMBIGUOUS (mostly)
- [x] SCOPED

---

## 31. Requirements Gate Contribution

**Gate 1 — Product Discovery**

Potential blocking conditions:
- [ ] Critical requirements materially ambiguous — **REQ-013 partially ambiguous**
- [x] Conflicting requirements unresolved — **REQ-001 ↔ REQ-002 documented, algorithm spec must resolve**
- [ ] Critical scope undefined — **No**
- [ ] Important security/compliance requirements unknown — **REQ-011 OPEN (Legal review)**

---

## 32. Requirements Register Template

| ID | Statement | Type | Priority | Status | Source | Acceptance | Traceability |
|----|-----------|------|----------|--------|--------|------------|--------------|
| `REQ-001` | Generate meal plan meeting macros | `FUNCTIONAL` | `CRITICAL` | `ACCEPTED` | Practitioner | `AC-001`..`AC-004` | `CAP-001`, `ARCH-001`, `SPEC-001` |
| `REQ-002` | Enforce all dietary restrictions | `FUNCTIONAL` | `CRITICAL` | `ACCEPTED` | Safety | `AC-005`..`AC-007` | `CAP-001,002`, `ARCH-001`, `SPEC-001` |
| ... | ... | ... | ... | ... | ... | ... | ... |

---

## 33. Agent Instructions Followed

1. ✓ Stable requirement identifiers preserved
2. ✓ Requirements separated from implementation decisions
3. ✓ Sources recorded
4. ✓ Ambiguity identified (REQ-013)
5. ✓ Conflicts identified (REQ-001 ↔ REQ-002)
6. ✓ Assumptions explicit (Section 20)
7. ✓ No invented requirements
8. ✓ Rejected/superseded preserved (none yet)
9. ✓ Traceability maintained
10. ✓ Downstream impact analyzed (Section 17, 22)
11. ✓ Detail proportional to scope (LEVEL 2)
12. ✓ GREENFIELD — no existing system distinction needed
13. ✓ Explicit confirmation for consequential decisions (REQ-008, REQ-010 require Security/Legal)
14. ✓ Not marked VERIFIED without evidence

---

## 34. Final Principle

> **A good requirement reduces ambiguity about the outcome while preserving freedom about the implementation.**

This document establishes WHAT the product must do. HOW it is achieved is documented in Domain, Architecture, Contracts, Decisions, and Specifications.