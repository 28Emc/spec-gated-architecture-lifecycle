# Architecture Context — MealPlanner Pro

## 1. Document Metadata

| Field | Value |
|-------|-------|
| Document ID | `ARCH-CTX-001` |
| Version | `0.3` |
| Status | `IN_REVIEW` |
| Created | `2025-01-25` |
| Updated | `2025-01-29` |
| Project | MealPlanner Pro |
| Lifecycle Phase | Architecture |
| Owner | Architect |
| Reviewers | Technical Lead, Domain Expert, Security Officer |

---

## 2. Purpose

Define the structural architecture for MealPlanner Pro based on approved domain boundaries (DOM-BC-001) and product requirements (PROD-REQ-001).

---

## 3. Architectural Drivers

| Driver | Description | Source |
|--------|-------------|--------|
| **Domain Boundaries** | 4 bounded contexts: Nutrition Planning, Client Management, Compliance, Integration | `DOM-BC-001` |
| **Quality Attributes** | Security (CRITICAL), Performance (HIGH), Maintainability (HIGH), Availability (MEDIUM) | `PROD-REQ-001` |
| **Constraints** | Team size (3), Budget ($50K), Timeline (4mo), Data residency (us-east-1) | `PROD-CTX-001` |
| **Decisions** | Modular monolith, In-process comm, Per-context data ownership | `ADR-001`, `ADR-002`, `ADR-003` |

---

## 4. System Boundary

```
┌─────────────────────────────────────────────────────────────┐
│                    MealPlanner Pro System                   │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │  Nutrition  │  │   Client    │  │ Compliance  │         │
│  │  Planning   │  │ Management  │  │             │         │
│  │   Module    │  │   Module    │  │   Module    │         │
│  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘         │
│         │                │                │                 │
│         └────────────────┼────────────────┘                 │
│                          ▼                                  │
│                 ┌─────────────────┐                         │
│                 │   Integration   │                         │
│                 │     Module      │                         │
│                 └────────┬────────┘                         │
└──────────────────────────┼──────────────────────────────────┘
                           │
        ┌──────────────────┼──────────────────┐
        ▼                  ▼                  ▼
   ┌─────────┐        ┌─────────┐        ┌─────────┐
   │  USDA   │        │  Auth0  │        │ Email/  │
   │   API   │        │           │        │  PDF    │
   └─────────┘        └─────────┘        └─────────┘
```

**Inside Boundary:** All 4 modules, shared kernel (ClientIdentity), event bus
**Outside Boundary:** USDA API, Auth0, Email Service, PDF Service, Cloud Infrastructure

---

## 5. Architecture Principles

| Principle | Rationale | Traceability |
|-----------|-----------|--------------|
| **Domain-aligned modules** | Modules map 1:1 to bounded contexts | `DOM-BC-001`, `ADR-001` |
| **Single deployable unit** | Team size, operational simplicity, reversibility | `ADR-001` |
| **In-process communication** | Low latency for generation; no distributed complexity | `ADR-002` |
| **Event-driven cross-context** | Decouple contexts; enable audit; eventual consistency | `ADR-002`, `DOM-BC-001` |
| **Per-context data ownership** | Clear ownership; no shared tables | `ADR-003`, `DOM-BC-001` |
| **Security by design** | Health data requires encryption, audit, consent | `REQ-008`, `REQ-009`, `REQ-010`, `ADR-004` |
| **Observability built-in** | Structured logs, metrics, traces from day one | `REQ-012`, `REQ-013` |

---

## 6. C4 Level 1 — System Context

See `c4-system-context.md` for diagram.

**Actors:** Practitioner, Client (via email/PDF), System (internal)
**External Systems:** USDA API, Auth0, Email Service, PDF Service, Cloud Provider

---

## 7. C4 Level 2 — Container Architecture

See `c4-container.md` for diagram.

| Container | Technology | Responsibility |
|-----------|------------|----------------|
| **MealPlanner API** | Spring Boot 3 / .NET 8 (modular monolith) | All business logic, REST API, event publishing |
| **PostgreSQL** | Managed (RDS/Cloud SQL) | Primary persistence (per-context schemas) |
| **Redis** | Managed (ElastiCache) | USDA cache, session cache, rate limiting |
| **Object Storage** | S3 / GCS | PDF templates, generated PDFs, exports |
| **Event Bus** | In-process (ApplicationEventPublisher) | Domain event distribution |

**External Containers:**
- Auth0 (Identity)
- USDA FoodData Central (Nutrient Data)
- SendGrid (Email)
- PDF Service (Document Generation)

---

## 8. Module Structure (C4 Level 3 — Selective)

### 8.1 Nutrition Planning Module
**Components:**
- `MealPlanController` — REST endpoints (generate, customize, get)
- `MealPlanGenerator` — Core algorithm (constraint satisfaction)
- `RestrictionService` — Validation, catalog management
- `NutrientService` — USDA integration, calculation, caching
- `MealPlanRepository` — Persistence (JPA/Entity Framework)

**Interfaces:** `MealPlanGenerator`, `RestrictionValidator`, `NutrientProvider`

### 8.2 Client Management Module
**Components:**
- `ClientController` — REST endpoints (onboard, profile, consent)
- `ClientService` — Onboarding, status transitions
- `ConsentService` — Grant, revoke, validate consent
- `ClientRepository` — Persistence

**Interfaces:** `ClientProvider`, `ConsentValidator`

### 8.3 Compliance Module
**Components:**
- `AuditLogger` — Event listener → AuditLog persistence
- `RetentionService` — Scheduled purge job, legal hold
- `PrivacyService` — Data subject requests
- `ComplianceRepository` — AuditLog, RetentionPolicy, LegalHold

**Interfaces:** `AuditRecorder`, `RetentionPolicyProvider`

### 8.4 Integration Module
**Components:**
- `USDAAdapter` — Search, fetch, cache (implements `NutrientProvider`)
- `EmailAdapter` — Template render, send (implements `NotificationSender`)
- `PDFAdapter` — Render template + data → PDF (implements `DocumentRenderer`)
- `AuthAdapter` — Token validation, roles (implements `AuthProvider`)

---

## 9. Communication Patterns

| Interaction | Pattern | Protocol | Traceability |
|-------------|---------|----------|--------------|
| Practitioner → API | Synchronous | HTTPS / REST | `REQ-001`, `REQ-003`, `REQ-004` |
| Module → Module (same context) | In-process | Direct method call | `ADR-002` |
| Nutrition Planning → Client Management | Async Event | In-process Event Bus | `DOM-BC-001` (ClientOnboarded) |
| Client Management → Nutrition Planning | Async Event | In-process Event Bus | `DOM-BC-001` (ConsentGranted) |
| All Modules → Compliance | Async Event | In-process Event Bus | `DOM-BC-001` (Audit) |
| Nutrition Planning → Integration | Synchronous | Interface call | `REQ-007` (USDA) |
| Client Management → Integration | Async Event | In-process Event Bus | `PlanPublished` → PDF/Email |
| API → Auth0 | Synchronous | HTTPS / OAuth2 | `ADR-004` |

---

## 10. Data Architecture

### 10.1 Per-Context Schemas (PostgreSQL)

| Context | Schema | Tables |
|---------|--------|--------|
| Nutrition Planning | `nutrition` | `meal_plans`, `meals`, `recipes`, `ingredients`, `restrictions`, `nutrient_profiles` |
| Client Management | `client_mgmt` | `clients`, `health_profiles`, `consents`, `practitioner_clients` |
| Compliance | `compliance` | `audit_logs`, `retention_policies`, `legal_holds` |
| Integration | `integration` | `adapter_configs`, `document_templates`, `circuit_breaker_state` |
| Shared Kernel | `shared` | `client_identities` (minimal: id, practitioner_id, status) |

**No cross-schema foreign keys.** References by ID only.

### 10.2 Shared Kernel: ClientIdentity

Minimal shared table: `client_identities (id UUID PK, practitioner_id UUID, status VARCHAR, version INT)`

Updated by Client Management on `ClientOnboarded`, `ClientStatusChanged`.
Read by Nutrition Planning for validation.

---

## 11. Quality Attribute Realization

| Attribute | Realization | Verification |
|-----------|-------------|--------------|
| **Security** | TLS 1.2+, AES-256 at rest, OAuth2/JWT, consent checks at API layer, audit all access | `SPEC-005`, Penetration test |
| **Performance** | USDA caching (Redis, 30-day TTL), async PDF/email, connection pooling, p95 < 30s generation | `SPEC-001`, Load test |
| **Availability** | Single AZ (MVP), health checks, graceful degradation (cache fallback), 99.5% target | `SPEC-007`, Chaos test |
| **Maintainability** | Modular monolith, clear boundaries, hexagonal architecture per module, dependency rules | Architecture tests (ArchUnit/NetArchTest) |
| **Scalability** | Horizontal pod scaling (stateless API), Redis cluster, read replicas (post-MVP) | `SPEC-007` |
| **Observability** | OpenTelemetry, structured JSON logs, Prometheus metrics, distributed traces | `SPEC-006` |

---

## 12. Deployment Model

**MVP:** Single Kubernetes namespace (EKS/GKE), 3 replicas, managed PostgreSQL, managed Redis, S3.
**Environments:** dev → staging → prod (blue-green)
**CI/CD:** GitHub Actions → Build → Test → Scan → Deploy staging → Manual promote → prod

---

## 13. Security Architecture

**Authentication:** OAuth2 Authorization Code Flow (Auth0) → JWT with roles (`practitioner`, `admin`, `assistant`)
**Authorization:** Role-based at API Gateway; consent check at Controller layer (per `REQ-010`)
**Data Protection:** AES-256 (managed keys), TLS 1.2+, field-level encryption for sensitive health fields
**Audit:** All health data access logged to Compliance module (immutable)
**Network:** Private subnets, WAF, security groups, VPC endpoints for managed services

---

## 14. Open Architectural Decisions

| ID | Decision | Options | Status |
|----|----------|---------|--------|
| `ARCH-DEC-001` | Caching strategy for USDA data | A) 30-day Redis TTL (PROPOSED) B) No cache C) Local DB mirror | `PROPOSED` |
| `ARCH-DEC-002` | PDF generation: sync vs async | A) Sync in request (simple) B) Async via event (resilient) | `PROPOSED` — Lean B |
| `ARCH-DEC-003` | Multi-region for data residency | A) Single region (us-east-1) B) Per-practitioner region | `OPEN` — Awaits Legal |

---

## 15. Traceability

| Relationship | Artifact | Status |
|--------------|----------|--------|
| `DERIVES_FROM` | `DOM-BC-001` | `VALID` |
| `SATISFIES` | `PROD-REQ-001` (all REQs) | `VALID` |
| `REALIZES` | `CAP-001`..`CAP-007` | `VALID` |
| `DECIDES` | `ADR-001`, `ADR-002`, `ADR-003`, `ADR-004`, `ADR-005` | `VALID` |
| `EXPOSES` | `API-CONTRACT-001`, `API-CONTRACT-002` | `VALID` |
| `CONSTRAINS` | `SPEC-001`..`SPEC-009` | `VALID` |

---

## 16. Evidence

| Evidence | Type | Source | Confidence |
|----------|------|--------|------------|
| ADR-001..005 (accepted) | `DOCUMENT` | Architecture Decisions | `HIGH` |
| Domain Context (DOM-CTX-001) | `DOCUMENT` | Domain Discovery | `HIGH` |
| Bounded Contexts (DOM-BC-001) | `DOCUMENT` | Domain Discovery | `HIGH` |
| Technical spike: modular monolith prototype | `CODE` | Engineering | `HIGH` |
| Load test: meal plan generation | `SYSTEM` | Engineering | `MEDIUM` |

---

## 17. Architecture Review Status

```
Status: IN_REVIEW
Gate 3: BLOCKED (was) → PASSED_WITH_RISKS (after DOM-DEC-001 authorized)
```

### Blocking Issues (Resolved)
- ~~Domain boundaries unresolved (DOM-DEC-001)~~ → **RESOLVED** after workshop

### Non-Blocking Risks
- ⚠ `ARCH-DEC-001`: USDA caching strategy not finalized
- ⚠ `ARCH-DEC-002`: PDF generation sync vs async
- ⚠ `ARCH-DEC-003`: Multi-region pending Legal

---

## 18. Gate Result

```
Gate: GATE-3 — Architecture
Status: PASSED_WITH_RISKS

Satisfied:
✓ System boundary established
✓ Major components (4 modules) identified
✓ Responsibilities established per bounded context
✓ Communication patterns defined (sync + async)
✓ Quality attributes considered
✓ External systems identified
✓ Deployment model defined
✓ Architectural risks identified

Non-Blocking Risks:
⚠ ARCH-DEC-001: USDA caching strategy — Sprint 2
⚠ ARCH-DEC-002: PDF sync vs async — Sprint 3
⚠ ARCH-DEC-003: Multi-region — Legal review

Required Follow-Up:
1. Finalize caching strategy (Sprint 2)
2. Prototype async PDF generation (Sprint 3)
3. Resolve multi-region after Legal review
```