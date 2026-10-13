# Domain Context — MealPlanner Pro

## 1. Document Metadata

| Field | Value |
|-------|-------|
| Document ID | `DOM-CTX-001` |
| Version | `0.3` |
| Status | `IN_REVIEW` |
| Created | `2025-01-20` |
| Updated | `2025-01-28` |
| Project | MealPlanner Pro |
| Domain Scope | Nutrition planning, client management, compliance for dietitian meal planning platform |
| Discovery Mode | `GREENFIELD` |
| Owner | Domain Expert (Dietitian Consultant) |
| Reviewers | Product Owner, Architect |
| Related Domain Artifacts | `DOM-CAP-001`, `DOM-GLOSS-001`, `DOM-BC-001`, `DOM-CMAP-001` |
| Related Product Artifacts | `PROD-CTX-001`, `PROD-REQ-001` |

---

## 2. Purpose

Establish shared understanding of the meal planning domain for dietitians and wellness coaches. Identify core capabilities, boundaries, invariants, and terminology before architectural decomposition.

---

## 3. Core Principle

> A business capability is a stable business ability, not a technical component.

Capabilities remain meaningful regardless of: programming language, framework, database, API style, deployment model, application structure, infrastructure, architecture style.

---

## 4. Domain Scope

**Domain:** Meal planning and nutrition management for dietitians/wellness coaches.

**Subdomains:**
- **Nutrition Planning** (Core) — Algorithmic meal generation, restriction enforcement, nutrient calculation
- **Client Management** (Supporting) — Client onboarding, profiles, health data, consent, relationships
- **Compliance** (Supporting) — Audit, consent, retention, data privacy, regulatory adherence
- **Integration** (Generic) — USDA food data, PDF generation, email delivery

---

## 5. Stakeholder Roles

| Role | Description | Domain Interest |
|------|-------------|-----------------|
| Practitioner | Registered dietitian / wellness coach | Creates, customizes, approves plans; manages clients |
| Client | Patient receiving nutrition care | Receives plans, tracks adherence, provides feedback |
| System | MealPlanner Pro platform | Executes algorithms, enforces constraints, audits |
| Regulator | Health data compliance authority | Audits consent, retention, access controls |

---

## 6. Key Business Capabilities

| ID | Capability | Description | Core/Supporting |
|----|------------|-------------|-----------------|
| `CAP-001` | Meal Plan Generation | Algorithmically create nutritionally complete meal plans respecting macros and restrictions | Core |
| `CAP-002` | Restriction Management | Define, validate, enforce dietary restrictions (allergies, intolerances, preferences) | Core |
| `CAP-003` | Plan Customization | Practitioner modifies generated plans (swap meals, adjust portions, add notes) | Core |
| `CAP-004` | Plan Approval Workflow | Practitioner reviews and approves before client delivery | Core |
| `CAP-005` | Client Onboarding | Capture health profile, restrictions, goals, consent | Supporting |
| `CAP-006` | Compliance & Security | Encrypt, audit, consent, retain health data per policy | Supporting |
| `CAP-007` | External Data Integration | Fetch nutrient data from USDA; deliver via email/PDF | Supporting |

---

## 7. Domain Terminology (Glossary)

See `domain-glossary.md` for complete glossary. Key terms:

| Term | Definition |
|------|------------|
| Meal Plan | A structured set of meals for a defined period meeting macro/micro targets |
| Restriction | A dietary limitation: allergy (immune), intolerance (digestive), preference (choice) |
| Macro Targets | Daily calorie and macronutrient (protein/carb/fat) goals |
| Practitioner | Registered dietitian or certified wellness coach using the platform |
| Client | Individual receiving nutrition care from a practitioner |
| Consent | Explicit, purpose-bound permission to use health data |
| Nutrient Profile | Complete macro/micro nutrient breakdown for a food item or meal |
| Shopping List | Aggregated ingredient quantities across a meal plan |
| Prep Guide | Cooking instructions and timing per meal |

---

## 8. Domain Processes

See `domain-processes.md` for detailed process models. High-level:

1. **Client Onboarding** → Practitioner creates client → Captures health profile → Records consent
2. **Plan Generation** → Practitioner requests plan → System calculates macros → Enforces restrictions → Produces plan
3. **Plan Customization** → Practitioner reviews → Swaps/adjusts meals → System recalculates nutrition
4. **Plan Approval** → Practitioner approves → System publishes → Triggers delivery
5. **Plan Delivery** → System generates PDF → Emails to client → Logs audit event

---

## 9. Bounded Contexts

See `bounded-contexts.md` and `context-map.md` for details.

| Context | Responsibility | Key Aggregates |
|---------|----------------|----------------|
| **Nutrition Planning** | Meal plan generation, restriction enforcement, nutrient calculation | MealPlan, Restriction, NutrientProfile |
| **Client Management** | Client profiles, health data, consent, practitioner-client relationships | Client, Consent, HealthProfile |
| **Compliance** | Audit logging, data retention, consent enforcement, privacy | AuditLog, RetentionPolicy, ConsentRecord |
| **Integration** | USDA API, PDF generation, email delivery | ExternalAdapter, DocumentTemplate |

---

## 10. Domain Events

See `domain-events.md` for complete list.

| Event | Publisher | Consumers | Purpose |
|-------|-----------|-----------|---------|
| `ClientOnboarded` | Client Management | Nutrition Planning, Compliance | Trigger profile availability |
| `MealPlanGenerated` | Nutrition Planning | Client Management, Compliance | Notify plan ready for review |
| `PlanCustomized` | Nutrition Planning | Compliance | Audit customization |
| `PlanPublished` | Client Management | Integration (email/PDF) | Trigger client delivery |
| `ConsentGranted` / `ConsentRevoked` | Client Management | Nutrition Planning, Compliance | Enable/disable plan generation |
| `HealthDataAccessed` | Any | Compliance | Audit trail |

---

## 11. Business Rules & Invariants

| ID | Rule | Context | Enforcement |
|----|------|---------|-------------|
| `BR-001` | Meal plan must meet 100% of daily macro targets (±5%) | Nutrition Planning | Generation algorithm |
| `BR-002` | No meal may contain ingredient matching client allergy list | Nutrition Planning | Generation + Customization validation |
| `BR-003` | Plan cannot be published without practitioner explicit approval | Client Management | Workflow state machine |
| `BR-004` | Health data access requires active, purpose-specific consent | Client Management, Compliance | Pre-condition check |
| `BR-005` | Meal variety: no repeated main ingredient within 3 days | Nutrition Planning | Generation algorithm |
| `BR-006` | Shopping list aggregates quantities by ingredient across all meals | Integration | Document generation |
| `BR-007` | Retention policy applies per practitioner organization | Compliance | Purge job |
| `BR-008` | Legal hold overrides retention policy | Compliance | Purge job exclusion |

---

## 12. Assumptions

| ID | Assumption | Confidence | Validation |
|----|------------|------------|------------|
| `DOM-ASM-001` | Nutrition science rules (macro calculations) are stable | `HIGH` | Established science |
| `DOM-ASM-002` | Practitioners understand and can validate algorithm output | `MEDIUM` | Pilot feedback |
| `DOM-ASM-003` | Restriction taxonomy (allergy/intolerance/preference) is sufficient | `MEDIUM` | May need extension for medical diets |
| `DOM-ASM-004` | USDA food data covers 95%+ of needed ingredients | `MEDIUM` | Coverage analysis needed |

---

## 13. Unknowns

| ID | Unknown | Impact | Blocking? |
|----|---------|--------|-----------|
| `DOM-UNK-001` | Exact regulatory definition of "health data" for this use case | Affects Compliance boundary, audit scope | `YES` — Legal review |
| `DOM-UNK-002` | Whether meal plans are considered "medical records" in some jurisdictions | Affects retention, access control, audit | `YES` — Legal review |
| `DOM-UNK-003` | Support for therapeutic diets (renal, cardiac, oncology) | Affects CAP-001, CAP-002 scope | `NO` — Post-MVP |

---

## 14. Open Domain Decisions

| ID | Decision | Options | Impact | Status |
|----|----------|---------|--------|--------|
| `DOM-DEC-001` | Bounded context boundary: Nutrition Planning vs Client Management | A) Separate contexts (anti-corruption layer) B) Single context | Architecture, data ownership, team ownership | `OPEN` — **BLOCKING Gate 2** — Awaiting Domain Expert + Architect decision |
| `DOM-DEC-002` | Aggregate ownership: MealPlan belongs to which context? | A) Nutrition Planning B) Client Management | Data ownership, transaction boundaries | `OPEN` — Depends on DOM-DEC-001 |

---

## 15. Traceability

| Relationship | Artifact | Status |
|--------------|----------|--------|
| `DERIVES_FROM` | `PROD-CTX-001` | `VALID` |
| `DERIVES_FROM` | `PROD-REQ-001` | `VALID` |
| `SATISFIES` | `CAP-001`..`CAP-007` | `VALID` |
| `REALIZES` | `ARCH-001`..`ARCH-004` (Architecture) | `VALID` |
| `CONSTRAINS` | `ADR-001` (Architecture Style), `ADR-003` (Data Ownership) | `VALID` |

---

## 16. Evidence

| Evidence | Type | Source | Confidence |
|----------|------|--------|------------|
| Dietitian consultant workshops (3 sessions) | `USER_INPUT` | Domain Expert | `HIGH` |
| Nutrition science literature | `DOCUMENT` | Academic | `HIGH` |
| Competitor domain analysis | `DOCUMENT` | Market research | `MEDIUM` |
| Regulatory checklist (preliminary) | `DOCUMENT` | Legal consultant | `LOW` |

---

## 17. Domain Discovery Status

```
Status: IN_REVIEW
```

### Blocking Conditions
- `DOM-DEC-001` (Bounded context boundary) — **BLOCKING Gate 2** — Workshop scheduled
- `DOM-UNK-001`, `DOM-UNK-002` (Regulatory classification) — Legal review Week 3

### Non-Blocking Risks
- `DOM-ASM-003` (Restriction taxonomy) — May need extension
- `DOM-ASM-004` (USDA coverage) — Analysis Sprint 2
- `DOM-UNK-003` (Therapeutic diets) — Deferred post-MVP

---

## 18. Review Checklist

- [x] Core capabilities identified
- [x] Domain terminology established
- [x] Important concepts identified
- [x] Business rules identified
- [x] Important invariants identified
- [x] Candidate bounded contexts established
- [x] Major relationships identified
- [x] Data ownership considerations identified
- [ ] Bounded context boundaries resolved — **BLOCKED**
- [ ] Critical business invariants fully validated — **Partial**

---

## 19. Gate Result

```
Gate: GATE-2 — Domain Discovery
Status: BLOCKED

Satisfied:
✓ Core capabilities (7) identified and described
✓ Domain terminology (25+ terms) in glossary
✓ Business rules (8) and invariants explicit
✓ Candidate bounded contexts (4) proposed
✓ Domain events (6) modeled
✓ Context map drafted

Blocking:
✗ DOM-DEC-001: Bounded context boundary between Nutrition Planning and Client Management unresolved
  - Affects: Architecture decomposition (Gate 3), Data ownership (ADR-003), Team ownership
  - Required: Domain Expert + Architect decision workshop

Non-Blocking Risks:
⚠ DOM-ASM-003: Restriction taxonomy may need extension
⚠ DOM-ASM-004: USDA coverage analysis pending
⚠ DOM-UNK-003: Therapeutic diets deferred

Required Next Action:
1. Conduct bounded context boundary workshop (Domain Expert + Architect)
2. Record decision as DOM-DEC-001 = ACCEPTED
3. Update context map and bounded context definitions
4. Re-evaluate Gate 2
```