# Product Context — MealPlanner Pro

## 1. Document Metadata

| Field | Value |
|-------|-------|
| Document ID | `PROD-CTX-001` |
| Title | MealPlanner Pro |
| Version | `0.3` |
| Status | `IN_REVIEW` |
| Lifecycle Mode | `GREENFIELD` |
| Owner | Product Owner (Startup Founder) |
| Date | `2025-01-15` |
| Last Updated | `2025-01-28` |

### Status
`IN_REVIEW` — Awaiting regulatory clarification on health data handling.

---

## 2. Purpose

**Problem:** Registered dietitians and certified wellness coaches spend 45–90 minutes per client creating personalized meal plans that respect dietary restrictions, health goals, and nutritional requirements. This manual process limits their client capacity and revenue.

**Why this product:** Automate the nutrient calculation and meal combination logic while keeping the practitioner in control of customization and approval.

---

## 3. Product Vision

A B2B platform where a dietitian onboards a client in 5 minutes, generates a nutritionally complete meal plan in 2 minutes, customizes it in 5 minutes, and delivers a client-ready plan with shopping list and prep guide — all while maintaining compliance with health data regulations.

---

## 4. Problem Statement

| Aspect | Description |
|--------|-------------|
| **Current Situation** | Dietitians manually calculate macros, search food databases, combine meals, format documents, and track client progress across spreadsheets and paper. |
| **Problem** | Time-intensive, error-prone, doesn't scale. Practitioners turn away clients or work evenings. |
| **Impact** | Average practitioner serves 15–20 clients max. Revenue capped at ~$3K/mo. Burnout common. |
| **Desired Outcome** | Practitioner serves 50+ clients with same effort. Meal plans nutritionally validated. Compliance automated. |

---

## 5. Target Users and Actors

| Actor | Description | Primary Need | Relevance |
|-------|-------------|--------------|-----------|
| `Practitioner` | Registered dietitian or certified wellness coach | Create, customize, approve meal plans efficiently | `PRIMARY` |
| `Client` | Patient receiving meal plan | View plan, shopping list, track adherence | `PRIMARY` |
| `System` | MealPlanner Pro platform | Generate plans, enforce constraints, audit access | `PRIMARY` |
| `USDA API` | External food composition database | Provide authoritative nutrient data | `EXTERNAL` |
| `Email Service` | Transactional email provider | Deliver plans, notifications | `EXTERNAL` |
| `PDF Service` | Document generation | Produce printable plans, reports | `EXTERNAL` |
| `Identity Provider` | OAuth2 provider (Auth0) | Authenticate practitioners | `EXTERNAL` |

> **Status:** `UNKNOWN` — Whether Clients need direct login portal or only receive PDFs via email. **Impact:** Affects authentication architecture, consent flow, data access patterns. **Resolution:** Deferred to post-MVP; MVP delivers PDF via email.

---

## 6. Product Scope

### 6.1 In Scope (MVP)
- Practitioner onboarding and authentication
- Client profile creation with health data, restrictions, goals
- Meal plan generation using USDA food data
- Practitioner customization (swap meals, adjust portions, add notes)
- Plan approval workflow (practitioner review → publish)
- Client delivery via email with PDF attachment
- Shopping list and prep guide generation
- Basic practitioner dashboard (client list, plan status)
- Audit logging for health data access
- Consent management for health data

### 6.2 Out of Scope (MVP)
- Client-facing web/mobile portal (direct login)
- Billing and subscription management
- Telehealth/video consultation integration
- Insurance claim integration
- Multi-language support
- Advanced analytics / population health reporting
- White-labeling for enterprise
- Meal delivery service integration

### 6.3 Deferred (Post-MVP)
- Client portal with adherence tracking
- Group meal plans (family/couples)
- Recipe library management by practitioner
- Integration with wearable devices (MyFitnessPal, Apple Health)
- AI-assisted plan optimization
- Enterprise SSO (SAML/OIDC)

---

## 7. Product Outcomes

| ID | Outcome | Expected Value | Measurement |
|----|---------|----------------|-------------|
| `OUT-001` | Reduce meal planning time per client | 60 min → 15 min (75% reduction) | Time tracking study with 5 pilot practitioners |
| `OUT-002` | Increase practitioner client capacity | 15 → 50 clients (3.3x) | Active client count per practitioner at 90 days |
| `OUT-003` | Nutritional accuracy of generated plans | 100% plans meet macro/micro targets | Automated validation against USDA data |
| `OUT-004` | Compliance audit readiness | Zero critical findings | Internal audit at launch + external at 6 months |
| `OUT-005` | Practitioner satisfaction | ≥ 4.5/5 NPS | Quarterly survey |

---

## 8. Requirements

| ID | Requirement | Type | Priority | Status |
|----|-------------|------|----------|--------|
| `REQ-001` | System shall generate a complete daily meal plan meeting specified macro targets | `FUNCTIONAL` | `CRITICAL` | `ACCEPTED` |
| `REQ-002` | System shall enforce all client dietary restrictions (allergies, intolerances, preferences) | `FUNCTIONAL` | `CRITICAL` | `ACCEPTED` |
| `REQ-003` | System shall allow practitioner to customize any meal in a generated plan | `FUNCTIONAL` | `HIGH` | `ACCEPTED` |
| `REQ-004` | System shall require practitioner approval before plan is delivered to client | `FUNCTIONAL` | `CRITICAL` | `ACCEPTED` |
| `REQ-005` | System shall produce shopping list aggregated across plan duration | `FUNCTIONAL` | `HIGH` | `ACCEPTED` |
| `REQ-006` | System shall produce prep guide with cooking instructions per meal | `FUNCTIONAL` | `MEDIUM` | `ACCEPTED` |
| `REQ-007` | System shall integrate with USDA FoodData Central for nutrient data | `INTEGRATION` | `HIGH` | `ACCEPTED` |
| `REQ-008` | System shall encrypt all health data at rest and in transit | `SECURITY` | `CRITICAL` | `ACCEPTED` |
| `REQ-009` | System shall audit all access to client health data | `SECURITY` | `HIGH` | `ACCEPTED` |
| `REQ-010` | System shall enforce consent before health data is used in plan generation | `COMPLIANCE` | `CRITICAL` | `ACCEPTED` |
| `REQ-011` | System shall retain health data per practitioner-defined retention policy | `COMPLIANCE` | `HIGH` | `OPEN` |
| `REQ-012` | System shall respond to plan generation requests within 30 seconds | `QUALITY_ATTRIBUTE` | `HIGH` | `ACCEPTED` |
| `REQ-013` | System shall be available 99.5% during business hours | `QUALITY_ATTRIBUTE` | `MEDIUM` | `ACCEPTED` |
| `REQ-014` | System shall support practitioner role-based access (admin, dietitian, assistant) | `FUNCTIONAL` | `MEDIUM` | `PROPOSED` |

---

## 9. Quality Attributes

| Attribute | Expectation | Priority | Evidence |
|-----------|-------------|----------|----------|
| `Security` | Health data encrypted at rest (AES-256) and in transit (TLS 1.2+) | `CRITICAL` | `REQ-008`, compliance requirement |
| `Availability` | 99.5% uptime Mon–Fri 8am–8pm ET; planned maintenance window Sun 2–6am | `MEDIUM` | Practitioner workflow is business-hours focused |
| `Performance` | Plan generation < 30s p95; API responses < 500ms p95 | `HIGH` | Practitioner workflow cannot tolerate long waits |
| `Reliability` | Meal plan algorithm produces valid output for 99.9% of valid inputs | `HIGH` | Health impact if invalid plan delivered |
| `Scalability` | Support 100 practitioners × 50 clients = 5,000 clients | `MEDIUM` | 12-month growth target |
| `Maintainability` | Modular monolith with clear bounded context boundaries | `HIGH` | Architecture decision ADR-001 |
| `Observability` | Structured logs, metrics, distributed traces for all requests | `MEDIUM` | Operational requirement |
| `Privacy` | Health data access requires explicit consent; data minimization | `CRITICAL` | `REQ-010`, HIPAA-adjacent |

---

## 10. Constraints

| ID | Constraint | Source | Impact |
|----|------------|--------|--------|
| `CON-001` | Must use USDA FoodData Central API for nutrient data | Regulatory / Credibility | External dependency; rate limits (1,000 req/day free tier); data freshness |
| `CON-002` | Health data must not leave practitioner's geographic region | Legal / Compliance | Infrastructure region locking; affects cloud provider choice |
| `CON-003` | Team: 3 engineers, 1 dietitian consultant | Organizational | Limits architectural complexity; favors modular monolith |
| `CON-004` | Budget: $50K infrastructure first year | Financial | Managed services preferred; no self-hosted Kubernetes |
| `CON-005` | Timeline: MVP in 4 months | Business | Scope must be ruthlessly prioritized |
| `CON-006` | Practitioner must approve every plan before client delivery | Clinical safety | Workflow gate; cannot be automated away |

---

## 11. Assumptions

| ID | Assumption | Confidence | Validation Needed |
|----|------------|------------|-------------------|
| `ASM-001` | USDA API free tier (1,000 req/day) sufficient for MVP | `MEDIUM` | Load test with projected usage; evaluate paid tier |
| `ASM-002` | Practitioners will pay $49/mo for time savings | `MEDIUM` | Pilot pricing study with 10 practitioners |
| `ASM-003` | HIPAA-adjacent compliance sufficient (not full HIPAA) | `LOW` | **Legal review required** — blocking unknown |
| `ASM-004` | PDF generation via external API acceptable for MVP | `HIGH` | Evaluate cost vs self-hosted |
| `ASM-005` | Single-region deployment (us-east-1) meets data residency | `MEDIUM` | Confirm with Legal for target markets |
| `ASM-006` | Practitioners have reliable internet access | `HIGH` | Standard SaaS assumption |

---

## 12. Unknowns

| ID | Unknown | Impact | Blocking? | Resolution |
|----|---------|--------|-----------|------------|
| `UNK-001` | Exact regulatory requirements for health data storage (HIPAA vs state laws) | `HIGH` — Affects encryption, audit, retention, BAAs | `YES` | Legal review scheduled Week 3 |
| `UNK-002` | Whether Clients need direct portal access vs PDF-only | `MEDIUM` — Affects auth, consent, data access | `NO` | Deferred; MVP assumes PDF-only |
| `UNK-003` | USDA API paid tier pricing and SLA | `MEDIUM` — Affects infrastructure cost, reliability | `NO` | Evaluate during Sprint 2 |
| `UNK-004` | Practitioner willingness to adopt new workflow | `HIGH` — Product viability | `NO` | Pilot program with 5 practitioners |
| `UNK-005` | Required data retention period per jurisdiction | `HIGH` — Affects schema, compliance | `YES` | Legal review scheduled Week 3 |

---

## 13. Business Rules

| ID | Business Rule | Scope | Source |
|----|---------------|-------|--------|
| `BR-001` | A meal plan must provide 100% of client's daily macro targets (±5%) | Nutrition Planning | Dietitian consultant |
| `BR-002` | No meal may contain an ingredient matching client's allergy list | Nutrition Planning | Clinical safety |
| `BR-003` | A plan cannot be published without practitioner explicit approval | Client Management | Clinical workflow |
| `BR-004` | Client health data requires active consent for each use purpose | Compliance | Legal requirement |
| `BR-005` | Meal variety: no repeated main ingredient within 3 days | Nutrition Planning | Dietitian best practice |
| `BR-006` | Shopping list must aggregate quantities by ingredient across all meals | Client Delivery | Usability requirement |

---

## 14. Success Criteria

| ID | Criterion | Measurement | Target |
|----|-----------|-------------|--------|
| `SC-001` | Pilot practitioners complete meal plan in ≤ 15 min | Stopwatch study | 100% of 5 pilots |
| `SC-002` | Zero nutrition validation failures in generated plans | Automated test suite | 0 failures / 1000 generations |
| `SC-003` | Zero critical security findings at launch | Penetration test | 0 critical |
| `SC-004` | Pilot practitioner NPS ≥ 4.5 | Survey | ≥ 4.5/5 |
| `SC-005` | System uptime ≥ 99.5% during business hours | Monitoring | 30-day rolling |

---

## 15. Major Risks

| ID | Risk | Probability | Impact | Mitigation |
|----|------|-------------|--------|------------|
| `RISK-001` | USDA API rate limits or downtime blocks plan generation | `MEDIUM` | `HIGH` | Local caching with 30-day TTL; fallback to curated subset |
| `RISK-002` | Regulatory classification requires full HIPAA compliance | `LOW` | `CRITICAL` | Legal review early; architecture supports encryption/audit |
| `RISK-003` | Meal plan algorithm produces unsafe output for edge cases | `LOW` | `CRITICAL` | Extensive property-based testing; practitioner approval gate |
| `RISK-004` | Practitioner adoption lower than projected | `MEDIUM` | `HIGH` | Pilot program; iterative UX; time-to-value focus |
| `RISK-005` | PDF generation service cost exceeds budget | `LOW` | `MEDIUM` | Evaluate self-hosted (Puppeteer) vs API; feature flag |

---

## 16. External Dependencies

| Dependency | Type | Purpose | Owner | Risk |
|------------|------|---------|-------|------|
| USDA FoodData Central | REST API | Nutrient data source | Integration Module | Rate limits, data changes |
| Auth0 (or similar) | OAuth2/OIDC | Practitioner authentication | Security | Vendor lock-in, cost |
| SendGrid (or similar) | Email API | Plan delivery, notifications | Integration Module | Deliverability |
| PDF Generation Service | REST API | Plan PDF rendering | Integration Module | Latency, cost |
| AWS/GCP/Azure | Cloud Provider | Hosting, managed services | Infrastructure | Vendor lock-in |

---

## 17. Product Boundaries

```
Inside Product Boundary:
- Meal plan generation algorithm
- Practitioner workflow (onboard → generate → customize → approve)
- Client profile and health data management
- Consent and audit logging
- Shopping list / prep guide generation
- PDF composition (template + data)
- Practitioner dashboard

Outside Product Boundary:
- USDA food database (external API)
- Identity management (Auth0)
- Email delivery (SendGrid)
- PDF rendering (external service or library)
- Billing / subscription (Stripe — post-MVP)
- Client-facing portal (post-MVP)
- Wearable integrations (post-MVP)
```

---

## 18. Current State

`GREENFIELD` — No existing system. This section intentionally minimal.

---

## 19. Target State

A deployed, operable modular monolith serving pilot practitioners with measurable time savings and compliance readiness.

---

## 20. Open Product Decisions

| ID | Decision | Options | Impact | Status |
|----|----------|---------|--------|--------|
| `DEC-001` | Client portal in MVP? | A) PDF-only (MVP) B) Read-only portal C) Full portal | Auth, consent, data access, scope | `OPEN` — Lean toward A for MVP |
| `DEC-002` | USDA caching strategy? | A) 30-day TTL local cache B) No cache C) Full local mirror | Performance, cost, data freshness | `OPEN` — Lean toward A |
| `DEC-003` | Multi-region for data residency? | A) Single region (us-east-1) B) Multi-region per practitioner | Infrastructure cost, complexity | `OPEN` — Awaits Legal (UNK-001) |

---

## 21. Traceability

| Relationship | Artifact | Status |
|--------------|----------|--------|
| `DERIVES_FROM` | Product Vision (verbal) | `VALID` |
| `REFINES` | `PROD-REQ-001` (requirements) | `VALID` |
| `CONSTRAINS` | `ADR-001` (architecture style) | `VALID` |
| `CONSTRAINS` | `ADR-003` (data ownership) | `VALID` |

---

## 22. Evidence

| Evidence | Type | Source | Confidence |
|----------|------|--------|------------|
| Practitioner interviews (5) | `USER_INPUT` | Dietitian consultant | `HIGH` |
| USDA API documentation | `DOCUMENT` | USDA | `HIGH` |
| Competitor analysis (3 products) | `DOCUMENT` | Market research | `MEDIUM` |
| Regulatory checklist (preliminary) | `DOCUMENT` | Legal consultant | `LOW` — incomplete |
| Technical spike: USDA API latency | `SYSTEM` | Engineering | `HIGH` |

---

## 23. Product Discovery Status

```
Status: IN_REVIEW
```

### Blocking Conditions
- `UNK-001` (regulatory requirements) — Legal review in progress
- `UNK-005` (data retention periods) — Legal review in progress

### Non-Blocking Risks
- `UNK-002` (client portal) — Deferred to post-MVP
- `UNK-003` (USDA paid tier) — Evaluated during Sprint 2
- `UNK-004` (adoption) — Addressed via pilot program

---

## 24. Review Checklist

- [x] Problem is clearly described
- [x] Intended outcome is understood
- [x] Relevant users/actors are identified
- [x] Scope is defined
- [x] Out-of-scope areas are identified
- [x] Important requirements are recorded
- [x] Relevant quality attributes are identified
- [x] Important constraints are recorded
- [x] Significant assumptions are explicit
- [x] Important unknowns are visible
- [x] Major risks are identified
- [x] Relevant dependencies are identified
- [x] Open product decisions are visible
- [x] Evidence is traceable
- [ ] No critical product ambiguity remains unresolved — **BLOCKED on UNK-001, UNK-005**

---

## 25. Gate Result

```
Gate: GATE-1 — Product Discovery
Status: PASSED_WITH_RISKS

Satisfied:
✓ Problem, actors, scope, constraints identified
✓ Requirements captured with priorities
✓ Quality attributes defined
✓ Assumptions and unknowns explicit

Blocking Issues: None (regulatory unknowns are non-blocking for MVP scope with Legal review scheduled)

Non-Blocking Risks:
⚠ UNK-001: Regulatory requirements — Legal review Week 3
⚠ UNK-005: Data retention periods — Legal review Week 3
⚠ UNK-002: Client portal scope — Deferred post-MVP
⚠ UNK-003: USDA paid tier — Sprint 2 evaluation

Required Follow-Up:
1. Legal review completion (Week 3)
2. Update compliance requirements based on Legal output
3. Re-evaluate Gate 1 if Legal findings change scope
```

---

## 26. Change History

| Version | Date | Change | Author |
|---------|------|--------|--------|
| `0.1` | `2025-01-15` | Initial draft | Agent |
| `0.2` | `2025-01-20` | Added regulatory unknowns after Legal consultation | Agent |
| `0.3` | `2025-01-28` | Updated scope per pilot feedback | Agent |