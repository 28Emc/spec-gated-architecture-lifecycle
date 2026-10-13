# Bounded Contexts — MealPlanner Pro

## 1. Document Metadata

| Field | Value |
|-------|-------|
| Document ID | `DOM-BC-001` |
| Version | `0.2` |
| Status | `PROPOSED` |
| Created | `2025-01-22` |
| Updated | `2025-01-28` |
| Project | MealPlanner Pro |
| Discovery Mode | `GREENFIELD` |
| Owner | Domain Expert + Architect |
| Reviewers | Product Owner, Technical Lead |

---

## 2. Purpose

Define the bounded context boundaries for MealPlanner Pro. This document records the **PROPOSED** boundaries pending human authorization (Gate 2 blocking issue DOM-DEC-001).

---

## 3. Context Boundaries (PROPOSED)

### 3.1 Nutrition Planning (Core Domain)

**Responsibility:** Algorithmic meal plan generation, nutrient calculation, restriction enforcement.

**Ubiquitous Language:**
- MealPlan, Meal, Recipe, Ingredient, NutrientProfile
- Restriction (Allergy, Intolerance, Preference)
- MacroTarget, MicroTarget
- GenerationRequest, GenerationResult
- MealSwap, PortionAdjustment

**Aggregates:**
- `MealPlan` (AR) — Root: plan generation, customization, nutrition validation
- `Restriction` (AR) — Restriction catalog, validation rules
- `NutrientProfile` (Value Object) — Immutable nutrient data per food item

**Domain Services:**
- `MealPlanGenerator` — Constraint satisfaction algorithm
- `RestrictionValidator` — Enforces BR-001, BR-002, BR-005
- `NutrientCalculator` — Aggregates meal → plan nutrition totals

**Events Published:**
- `MealPlanGenerated` (planId, clientId, status=DRAFT, nutritionTotals)
- `PlanCustomized` (planId, practitionerId, changes, newNutritionTotals)

**Events Consumed:**
- `ClientOnboarded` (clientId, healthProfile, restrictions) — Triggers profile availability
- `ConsentGranted` (clientId, purpose=meal_planning) — Enables generation
- `ConsentRevoked` (clientId, purpose=meal_planning) — Disables generation

**Ownership:** Nutrition Planning owns MealPlan, Restriction, NutrientProfile data.

---

### 3.2 Client Management (Supporting Domain)

**Responsibility:** Client lifecycle, health profiles, consent management, practitioner-client relationships.

**Ubiquitous Language:**
- Client, Practitioner, HealthProfile
- Consent (purpose, grantedAt, expiresAt, revokedAt)
- ClientStatus (ACTIVE, INACTIVE, ARCHIVED)
- Relationship (practitionerId, clientId, role)

**Aggregates:**
- `Client` (AR) — Root: onboarding, profile updates, status transitions
- `Consent` (AR) — Root: grant, revoke, expiry, purpose scoping
- `HealthProfile` (Value Object) — Immutable snapshot at onboarding

**Domain Services:**
- `ClientOnboardingService` — Creates client, initial consent, health profile
- `ConsentManager` — Grants, revokes, validates consent per purpose

**Events Published:**
- `ClientOnboarded` (clientId, practitionerId, healthProfile, initialConsents)
- `ConsentGranted` (clientId, purpose, grantedAt)
- `ConsentRevoked` (clientId, purpose, revokedAt)
- `ClientStatusChanged` (clientId, oldStatus, newStatus)

**Events Consumed:**
- `MealPlanPublished` (planId, clientId) — Updates client plan history
- `PlanRevoked` (planId, clientId) — Updates client plan history

**Ownership:** Client Management owns Client, Consent, HealthProfile, Relationship data.

---

### 3.3 Compliance (Supporting Domain)

**Responsibility:** Audit logging, data retention, privacy enforcement, regulatory adherence.

**Ubiquitous Language:**
- AuditLog (who, what, when, purpose, outcome)
- RetentionPolicy (duration, jurisdiction, legalHold)
- DataSubjectRequest (access, deletion, portability)
- LegalHold (caseId, affectedEntities, reason)

**Aggregates:**
- `AuditLog` (Append-only) — Immutable event stream
- `RetentionPolicy` (AR) — Per practitioner organization
- `LegalHold` (AR) — Overrides retention

**Domain Services:**
- `AuditLogger` — Captures all health data access, modifications, consent changes
- `RetentionEngine` — Schedules and executes purges per policy, respects legal holds
- `PrivacyService` — Handles data subject requests

**Events Published:**
- `HealthDataAccessed` (accessorId, subjectId, dataType, purpose, timestamp)
- `RetentionPolicyChanged` (practitionerOrgId, newPolicy)
- `LegalHoldPlaced` / `LegalHoldReleased` (holdId, affectedEntities)

**Events Consumed:**
- All domain events (for audit) — `ClientOnboarded`, `MealPlanGenerated`, `ConsentGranted`, etc.

**Ownership:** Compliance owns AuditLog, RetentionPolicy, LegalHold data.

---

### 3.4 Integration (Generic Domain)

**Responsibility:** External system adapters — USDA, Email, PDF, Auth.

**Ubiquitous Language:**
- ExternalAdapter, AdapterConfig
- CircuitBreaker, RetryPolicy, Fallback
- DocumentTemplate, RenderRequest, RenderResult

**Aggregates:**
- `ExternalAdapter` (AR) — Per external system: config, health, circuit state

**Domain Services:**
- `USDAAdapter` — Search, nutrient fetch, caching (30-day TTL)
- `EmailAdapter` — Template rendering, delivery, bounce handling
- `PDFAdapter` — Template + data → PDF bytes, timeout/retry
- `AuthAdapter` — Token validation, role extraction

**Events Published:**
- `ExternalCallSucceeded` / `ExternalCallFailed` (adapter, operation, latency, error)

**Events Consumed:**
- `PlanPublished` (planId, clientId) → PDFAdapter → EmailAdapter
- `ClientOnboarded` (clientId, email) → EmailAdapter (welcome)

**Ownership:** Integration owns Adapter configs, circuit breaker state, template definitions.

---

## 4. Context Relationships (Context Map)

See `context-map.md` for visual map. Summary:

| Upstream | Downstream | Pattern | Notes |
|----------|------------|---------|-------|
| Client Management | Nutrition Planning | **Customer/Supplier** | Client Management supplies ClientOnboarded, Consent events |
| Nutrition Planning | Client Management | **Conformist** | Nutrition Planning publishes MealPlanGenerated, PlanCustomized |
| Client Management | Compliance | **Published Language** | Client events consumed for audit |
| Nutrition Planning | Compliance | **Published Language** | Nutrition events consumed for audit |
| Integration | All | **Open Host Service** | Adapters expose internal APIs |
| Nutrition Planning | Integration | **Customer/Supplier** | Nutrition Planning requests PDF/Email via Integration |

---

## 5. Anti-Corruption Layers

**Nutrition Planning ← Client Management:**
- Client Management publishes `ClientOnboarded` with HealthProfile snapshot
- Nutrition Planning maintains local `ClientProfileView` (denormalized)
- ACL translates external Client ID → internal ClientProfileView

**Nutrition Planning → Client Management:**
- Nutrition Planning publishes `MealPlanGenerated` with minimal data
- Client Management stores plan reference only (planId, status, nutritionSummary)
- No direct access to Nutrition Planning aggregates

**Compliance ← All:**
- Compliance consumes all events via event bus
- No synchronous calls from domain contexts to Compliance
- AuditLog is append-only; no queries from domain contexts

---

## 6. Data Ownership

| Data | Owning Context | Shared? |
|------|----------------|---------|
| MealPlan, Meal, Recipe, Ingredient | Nutrition Planning | No |
| Restriction catalog | Nutrition Planning | Read-only by Client Management |
| NutrientProfile (USDA cached) | Nutrition Planning | Read-only by Integration |
| Client, HealthProfile | Client Management | No |
| Consent records | Client Management | Read-only by Nutrition Planning, Compliance |
| Practitioner-Client Relationship | Client Management | Read-only by Nutrition Planning |
| AuditLog | Compliance | No (write-only from all) |
| RetentionPolicy, LegalHold | Compliance | No |
| ExternalAdapter config | Integration | No |

---

## 7. Decision: Bounded Context Boundaries

**Decision ID:** `DOM-DEC-001`

**Status:** `PROPOSED` — **Awaiting human authorization**

**Problem:** Whether Nutrition Planning and Client Management should be separate bounded contexts or combined.

**Options:**
- **A) Separate Contexts (PROPOSED):** Anti-corruption layer between them. Nutrition Planning owns MealPlan; Client Management owns Client/Consent. Events for integration.
- **B) Single Context:** Combined "Nutrition & Client" context. Simpler initially but mixes core algorithmic domain with CRUD/supporting domain.

**Recommendation:** Option A (Separate). Rationale:
- Nutrition Planning is Core Domain (algorithmic, differentiator)
- Client Management is Supporting Domain (CRUD, workflow)
- Different change rates: algorithm evolves independently of client onboarding
- Different team skills: ML/nutrition vs CRUD/web
- Clear data ownership: MealPlan ≠ Client

**Consequences:**
- Requires event-driven integration (complexity)
- Anti-corruption layer maintenance
- Eventual consistency between contexts (acceptable for this domain)

**Authority Required:** Domain Expert (Dietitian) + Architect

**Traceability:**
```
DERIVES_FROM: DOM-CTX-001
DECIDES: ADR-001 (Architecture Style), ADR-003 (Data Ownership)
CONSTRAINS: ARCH-001, ARCH-002 module boundaries
```

---

## 8. Decision: Aggregate Ownership

**Decision ID:** `DOM-DEC-002`

**Status:** `PROPOSED` — Depends on DOM-DEC-001

**Problem:** Which context owns the MealPlan aggregate?

**Options:**
- **A) Nutrition Planning (PROPOSED if DOM-DEC-001 = A):** MealPlan is core to algorithmic generation; customization is part of generation workflow.
- **B) Client Management:** MealPlan is "owned by client"; Client Management manages plan lifecycle.

**Recommendation:** Option A. MealPlan generation, validation, customization are algorithmic concerns. Client Management holds reference only.

**Authority Required:** Domain Expert + Architect (same workshop as DOM-DEC-001)

---

## 9. Traceability

| Relationship | Artifact | Status |
|--------------|----------|--------|
| `DERIVES_FROM` | `DOM-CTX-001` | `VALID` |
| `REFINES` | `DOM-CAP-001` (Capabilities) | `VALID` |
| `SATISFIES` | `PROD-REQ-001` (REQ-001..004) | `VALID` |
| `REALIZES` | `ARCH-001`..`ARCH-004` | `VALID` |
| `DECIDES` | `ADR-001`, `ADR-003` | `VALID` (pending) |
| `CONSTRAINS` | `SPEC-001`, `SPEC-002` | `VALID` (pending) |

---

## 10. Evidence

| Evidence | Type | Source | Confidence |
|----------|------|--------|------------|
| Domain Expert workshops | `USER_INPUT` | Dietitian Consultant | `HIGH` |
| DDD literature (Vaughn Vernon, Eric Evans) | `DOCUMENT` | Established patterns | `HIGH` |
| Team skill assessment | `USER_INPUT` | Technical Lead | `HIGH` |
| Change rate analysis (hypothetical) | `INFERRED` | Agent analysis | `MEDIUM` |

---

## 11. Status

```
Status: PROPOSED
Blocking: DOM-DEC-001, DOM-DEC-002 require human authorization
Gate 2: BLOCKED until decisions recorded
```