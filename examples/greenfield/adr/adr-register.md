# ADR Register — MealPlanner Pro

## 1. Document Metadata

| Field | Value |
|-------|-------|
| Document ID | `ADR-REG-001` |
| Version | `0.4` |
| Status | `ACTIVE` |
| Created | `2025-01-25` |
| Updated | `2025-01-29` |
| Project | MealPlanner Pro |
| Lifecycle Phase | Architecture Decisions |
| Owner | Architect |
| Reviewers | Technical Lead, Domain Expert, Security Officer |

---

## 2. ADR Inventory

| ID | Title | Status | Date | Supersedes | Superseded By | Significance |
|----|-------|--------|------|------------|---------------|--------------|
| `ADR-001` | Architecture Style: Modular Monolith | `ACTIVE` | `2025-01-26` | — | — | Strategic |
| `ADR-002` | Communication Pattern: In-Process + Domain Events | `ACTIVE` | `2025-01-26` | — | — | Strategic |
| `ADR-003` | Data Ownership: Per Bounded Context | `ACTIVE` | `2025-01-27` | — | — | Strategic |
| `ADR-004` | Authentication: OAuth2 + JWT (Auth0) | `ACTIVE` | `2025-01-27` | — | — | Significant |
| `ADR-005` | PDF Generation: External Service via Integration Module | `ACTIVE` | `2025-01-28` | — | — | Local |
| `ADR-006` | USDA Caching: Redis 30-Day TTL | `PROPOSED` | `2025-01-29` | — | — | Significant |

---

## 3. ADR-001 — Architecture Style: Modular Monolith

**Status:** `ACTIVE` (was `PROPOSED` until `2025-01-26`)

**Date:** `2025-01-26`

**Context:**
- Greenfield project, team of 3 engineers
- 4 bounded contexts identified (Nutrition Planning, Client Management, Compliance, Integration)
- 4-month timeline to MVP
- Budget: $50K infrastructure first year

**Problem:**
Choose architectural style that balances domain alignment, operational simplicity, and team capacity.

**Constraints:**
- Team size: 3 engineers (cannot operate distributed system)
- Timeline: 4 months (no time for distributed complexity)
- Domain: Core algorithmic (Nutrition Planning) + Supporting (Client, Compliance, Integration)
- Reversibility: Architecture style is DIFFICULT_TO_REVERSE

**Options Considered:**

| Option | Description | Pros | Cons |
|--------|-------------|------|------|
| **A) Modular Monolith (SELECTED)** | Single deployable, internal module boundaries = bounded contexts, in-process comm | Simple ops, low latency, clear boundaries, team can manage, evolves to services later | Single point of failure, scaling is all-or-nothing |
| B) Microservices | Each bounded context = separate service | Independent deploy/scale, tech diversity | Operational overhead (3 engineers), distributed complexity, latency, eventual consistency, 4-month timeline unrealistic |
| C) Serverless Functions | Each capability = function | Auto-scale, pay-per-use | Cold starts, vendor lock-in, debugging hard, not suited for algorithmic generation |
| D) Layered Monolith | Traditional layers (controller, service, repository) | Simple initially | No domain alignment, tight coupling, hard to extract later |

**Decision:** Option A — Modular Monolith

**Rationale:**
- Domain-aligned modules (1:1 with bounded contexts) provide clear boundaries
- Single deployable matches team capacity and timeline
- In-process communication eliminates distributed complexity for core algorithm
- Event-driven cross-context integration prepares for future extraction
- Clear migration path: module → service when justified

**Consequences:**
- Single deployment unit (all modules deploy together)
- Shared process = shared failure domain (mitigated: health checks, graceful degradation)
- Scaling is coarse-grained (mitigated: horizontal pod scaling, stateless API)
- Module boundaries enforced by architecture tests (ArchUnit/NetArchTest)

**Risks:**
- Module boundary erosion over time → Mitigation: Architecture tests in CI, code review guidelines
- Future extraction effort → Mitigation: Clean module interfaces, event-driven integration, separate schemas

**Affected Components:**
- All 4 modules (Nutrition Planning, Client Management, Compliance, Integration)
- Deployment pipeline (single container)
- Database (single instance, per-context schemas)

**Affected Contracts:**
- Internal module interfaces (not external contracts)

**Related Decisions:**
- `ADR-002` (Communication Pattern) — depends on this
- `ADR-003` (Data Ownership) — depends on this
- `ADR-005` (PDF Generation) — depends on this

**Supersedes:** None

**Authority:** Technical Lead + Architect (explicit authorization recorded `2025-01-26`)

---

## 4. ADR-002 — Communication Pattern: In-Process + Domain Events

**Status:** `ACTIVE` (was `PROPOSED` until `2025-01-26`)

**Date:** `2025-01-26`

**Context:** Following `ADR-001` (Modular Monolith), define how modules communicate.

**Problem:** Modules need to share data and trigger cross-context behavior without tight coupling.

**Constraints:**
- Low latency required for meal plan generation (< 30s)
- Team cannot operate message broker (Kafka/RabbitMQ) for MVP
- Eventual consistency acceptable for cross-context (audit, notifications)
- Strong consistency required within context

**Options Considered:**

| Option | Description | Pros | Cons |
|--------|-------------|------|------|
| **A) In-Process + Domain Events (SELECTED)** | Same context: direct calls. Cross-context: in-process event bus (Spring Events / MediatR) | Low latency, no broker ops, clear boundary enforcement, testable | In-process only (no horizontal scaling of event processing), single process failure domain |
| B) Synchronous REST between modules | All module communication via HTTP | Explicit contracts, independently testable | Latency overhead, circular dependency risk, operational complexity |
| C) External Message Broker (Kafka) | All async via Kafka | Durability, replay, horizontal scale | Operational overhead, latency, overkill for MVP |
| D) Shared Database | Modules read/write each other's tables | Simple queries | Tight coupling, no boundary enforcement, schema conflicts |

**Decision:** Option A — In-Process for same context, In-Process Domain Events for cross-context

**Rationale:**
- Meal plan generation requires low latency (direct calls within Nutrition Planning)
- Cross-context (Client→Nutrition, Nutrition→Compliance) uses events: decouples, enables audit, prepares for extraction
- In-process event bus (Spring ApplicationEventPublisher / MediatR) requires zero infrastructure
- Clear semantic distinction: Commands (sync, same context) vs Events (async, cross-context)

**Consequences:**
- Eventual consistency for cross-context (acceptable: audit, notifications, plan history)
- No event replay without external broker (acceptable for MVP)
- Event ordering within single process (deterministic)
- Testing: Events can be captured/verified in unit tests

**Risks:**
- Event loss on process crash → Mitigation: Critical events also persisted (outbox pattern post-MVP)
- Event ordering across contexts → Mitigation: Design for commutativity; use saga for multi-step

**Affected Components:**
- All modules (event publishing/consumption)
- Event bus infrastructure (in-process)
- Test strategy (event capture)

**Related Decisions:**
- `ADR-001` (Modular Monolith) — prerequisite
- `ADR-003` (Data Ownership) — events carry IDs, not full aggregates

**Authority:** Technical Lead + Architect (explicit authorization `2025-01-26`)

---

## 5. ADR-003 — Data Ownership: Per Bounded Context

**Status:** `ACTIVE` (was `PROPOSED` until `2025-01-27`)

**Date:** `2025-01-27`

**Context:** Following `ADR-001` and `DOM-DEC-001` (separate bounded contexts), define data ownership.

**Problem:** Each bounded context must own its data to maintain autonomy. No shared tables.

**Constraints:**
- Single PostgreSQL instance (cost, ops simplicity)
- No cross-schema foreign keys
- Clear ownership for compliance (audit, retention, consent)

**Options Considered:**

| Option | Description | Pros | Cons |
|--------|-------------|------|------|
| **A) Per-Context Schemas (SELECTED)** | Each context = PostgreSQL schema (`nutrition`, `client_mgmt`, `compliance`, `integration`, `shared`) | Clear ownership, no FK coupling, independent migrations, compliance alignment | Cross-context queries require application-layer joins |
| B) Single Schema, Prefixed Tables | All tables in `public` with prefixes (`nutrition_meal_plans`, `client_clients`) | Simpler queries | No ownership enforcement, migration conflicts, compliance harder |
| C) Separate Databases | Each context = separate PostgreSQL instance | Complete isolation | Cost, operational overhead, distributed transactions |
| D) Shared Tables | Common tables (e.g., `clients` shared) | Simpler for shared concepts | Ownership ambiguity, coupling, compliance violation |

**Decision:** Option A — Per-Context Schemas in Single PostgreSQL Instance

**Rationale:**
- Aligns with bounded context ownership (`DOM-BC-001`)
- Compliance requires clear data ownership (audit, retention per context)
- Single instance keeps cost/ops manageable for MVP
- Shared kernel (`shared.client_identities`) for minimal cross-reference

**Consequences:**
- No foreign keys across schemas (references by ID only)
- Application-layer joins for cross-context queries
- Each context manages its own migrations (Flyway/Liquibase per schema)
- `shared` schema minimized: only `client_identities` (id, practitioner_id, status, version)

**Risks:**
- Cross-context query performance → Mitigation: Denormalized views where needed (e.g., Nutrition Planning maintains `ClientProfileView`)
- Migration coordination → Mitigation: Independent migrations; shared kernel changes require coordination

**Affected Components:**
- All modules (each owns its schema)
- Database migration strategy
- Compliance (retention per schema)

**Related Decisions:**
- `ADR-001` (Modular Monolith) — prerequisite
- `ADR-002` (Events) — events carry IDs for cross-context reference

**Authority:** Domain Expert + Architect (explicit authorization `2025-01-27`)

---

## 6. ADR-004 — Authentication: OAuth2 + JWT (Auth0)

**Status:** `ACTIVE` (was `PROPOSED` until `2025-01-27`)

**Date:** `2025-01-27`

**Context:** Need practitioner authentication with role-based access and organizational isolation.

**Problem:** Choose authentication approach meeting security, compliance, and operational requirements.

**Constraints:**
- Health data requires strong authentication
- Role-based access (`practitioner`, `admin`, `assistant`)
- Organization-level isolation (multi-tenant)
- Team cannot build/maintain auth system
- Budget includes managed auth service

**Options Considered:**

| Option | Description | Pros | Cons |
|--------|-------------|------|------|
| **A) Auth0 (OAuth2/OIDC) (SELECTED)** | Managed identity provider, JWT issuance, roles, organizations | Offloads auth complexity, standards-based, MFA, social login, org support | Vendor cost, vendor lock-in |
| B) Custom JWT + In-House Auth | Build own login, registration, password reset, MFA | Full control, no vendor cost | High development effort, security risk, maintenance burden |
| C) Keycloak (Self-Hosted) | Open-source IAM on Kubernetes | No vendor cost, full control | Operational overhead (3 engineers), upgrades, HA |
| D) AWS Cognito / Azure AD B2C | Cloud provider managed | Integrated with cloud | Less mature features, vendor lock-in |

**Decision:** Option A — Auth0 (OAuth2 Authorization Code Flow + JWT)

**Rationale:**
- Offloads auth complexity (MFA, password reset, breach detection)
- OAuth2/OIDC standard — portable if migration needed
- Organizations feature maps to practitioner organizations
- Roles in JWT (`practitioner`, `admin`, `assistant`) for API authorization
- Cost acceptable for startup scale

**Consequences:**
- Vendor dependency (mitigated: standard tokens, portable)
- Cost scales with MAU (monitored)
- Token validation at API Gateway / Filter layer

**Affected Components:**
- API Gateway / Filter (JWT validation)
- All controllers (role-based authorization)
- Auth Adapter (Integration Module)

**Related Decisions:**
- `ADR-001` (Modular Monolith) — single API entry point
- `SEC-001` (Security Contract) — defines auth contract

**Authority:** Security Officer + Technical Lead (explicit authorization `2025-01-27`)

---

## 7. ADR-005 — PDF Generation: External Service via Integration Module

**Status:** `ACTIVE` (was `PROPOSED` until `2025-01-28`)

**Date:** `2025-01-28`

**Context:** Meal plans delivered as PDF via email. Need rendering approach.

**Problem:** Choose PDF generation strategy balancing quality, cost, and operational simplicity.

**Constraints:**
- Professional-quality PDF (meal plan, shopping list, prep guide)
- Template-based (practitioner branding post-MVP)
- Low operational overhead
- Cost within budget

**Options Considered:**

| Option | Description | Pros | Cons |
|--------|-------------|------|------|
| **A) External API (SELECTED)** | Call PDF service (DocRaptor, PDFShift, or similar) via Integration Module | Zero ops, professional quality, template support, scalable | Per-document cost, external dependency, latency |
| B) Self-Hosted (Puppeteer/Playwright) | Run headless Chrome in Kubernetes | Full control, no per-doc cost, template flexibility | Operational overhead (Chrome in K8s), memory, maintenance |
| C) Library (iText, PDFBox) | Generate PDF programmatically in Java/C# | No external call, full control | Complex layout code, template harder, maintenance |

**Decision:** Option A — External PDF Generation Service via Integration Module

**Rationale:**
- Zero operational overhead for MVP team
- Professional quality with HTML/CSS templates
- Integration Module encapsulates adapter (swappable)
- Cost predictable at MVP scale (~$0.01/doc)

**Consequences:**
- External dependency (mitigated: circuit breaker, fallback to simple HTML email)
- Latency added to plan delivery (async via event — non-blocking)
- Template management in Integration Module

**Risks:**
- Vendor API changes → Mitigation: Adapter pattern, integration tests
- Cost at scale → Mitigation: Evaluate self-hosted post-MVP

**Affected Components:**
- Integration Module (`PDFAdapter`)
- Event flow: `PlanPublished` → Integration → PDF → Email
- Object Storage (PDF template + generated PDF)

**Authority:** Technical Lead + Architect (explicit authorization `2025-01-28`)

---

## 8. ADR-006 — USDA Caching: Redis 30-Day TTL

**Status:** `PROPOSED` (not yet authorized)

**Date:** `2025-01-29`

**Context:** USDA API free tier: 1,000 requests/day. Meal plan generation requires multiple food lookups.

**Problem:** Define caching strategy to stay within rate limits while maintaining data freshness.

**Constraints:**
- Free tier: 1,000 req/day
- Estimated: 50 practitioners × 2 plans/day × 20 lookups = 2,000 req/day (exceeds free tier)
- Nutrient data changes infrequently (USDA updates quarterly)
- Redis already provisioned for sessions

**Options Considered:**

| Option | Description | Pros | Cons |
|--------|-------------|------|------|
| **A) Redis Cache 30-Day TTL (PROPOSED)** | Cache nutrient profiles in Redis, TTL 30 days | Stays within free tier, low latency, simple | Stale data up to 30 days, cache invalidation manual |
| B) No Cache | Direct USDA calls | Always fresh | Exceeds free tier immediately |
| C) Local PostgreSQL Mirror | Sync USDA to local DB nightly | Full control, no rate limit | Sync complexity, storage, maintenance |
| D) Paid USDA Tier | Upgrade to paid plan | No caching needed, fresh data | Recurring cost, vendor dependency |

**Recommendation:** Option A — Redis Cache with 30-Day TTL

**Rationale:**
- USDA updates quarterly → 30-day TTL acceptable staleness
- Redis already provisioned
- Simple implementation: `NutrientProvider` checks cache → USDA → cache
- Cache miss logs warning for monitoring

**Consequences:**
- Stale data possible (mitigated: admin cache clear endpoint, quarterly full refresh)
- Cache warming needed on deploy

**Affected Components:**
- Nutrition Planning Module (`NutrientService`, `USDAAdapter`)
- Redis (existing)
- Monitoring (cache hit/miss metrics)

**Authority Required:** Technical Lead + Architect

---

## 9. Decision Governance Compliance

All ADRs follow `references/decision-governance.md`:
- ✓ Explicit problem, context, constraints, options, decision, rationale, consequences
- ✓ Significance classified (Strategic/Significant/Local)
- ✓ Recommendation distinguished from Decision (`PROPOSED` → `ACTIVE` only after authorization)
- ✓ Authority identified for each
- ✓ Traceability to architecture, domain, requirements
- ✓ Supersession tracked (none yet)
- ✓ Decision register maintained

---

## 10. Architecture Decision Review Status

```
Gate: GATE-5 — Architecture Decisions
Status: PASSED

Satisfied:
✓ Significant decisions identified (5 Strategic/Significant)
✓ Existing decisions reviewed (none)
✓ Conflicts resolved (ADR-001 chose monolith over microservices)
✓ Required ADRs created
✓ Decision status established (ACTIVE vs PROPOSED)
✓ Decision dependencies identified (ADR-001 → ADR-002 → ADR-003)
✓ No superseded decisions

Non-Blocking Risks:
⚠ ADR-006 (USDA Caching) still PROPOSED — Sprint 2 authorization
```