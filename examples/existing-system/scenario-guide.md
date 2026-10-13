# Existing System Scenario Guide — OrderFlow Legacy

## Purpose

Walk through how an AI agent applies Spec-Gated Architecture Lifecycle to an existing system (EXISTING_SYSTEM mode). Demonstrates the critical distinction between Documented, Actual, and Target states, proportional gate evaluation, and evidence-based discovery.

**Read this file first.**

---

## Scenario Summary

**System:** OrderFlow — 5-year-old order management for B2B distributor
**Mode:** EXISTING_SYSTEM
**Sizing:** LEVEL 3 — FULL (High complexity, High risk, High integration surface)
**Team:** 4 engineers, 1 PM
**Trigger:** Architecture assessment before new feature work

---

## Phase-by-Phase Walkthrough

### 0. Project Initialization (Gate 0)

**Trigger:** VP Engineering requests "architecture review before we build the customer portal."

**Agent Action:** Classify as EXISTING_SYSTEM. Identify scope: entire OrderFlow system. Stakeholders: VP Eng, PM, Tech Lead, Security Officer.

**Evidence Discovery (Critical Step):**
- Source code (GitHub): 120K lines, 3 repos (api, frontend, infra)
- Production access: Read-only DB, logs, metrics (Datadog)
- Documentation: Confluence wiki (last updated 2 years ago), sparse READMEs
- No ADRs, no architecture diagrams, no contract registry
- CI/CD: Jenkins → EC2, no staging, deploy to prod directly

**Entry Mode Confirmation:** EXISTING_SYSTEM — system exists, must be understood before changes.

**Gate 0 Result:** PASSED — Scope=SYSTEM, Mode=EXISTING_SYSTEM, Evidence sources identified.

---

### 1. System Discovery (Replaces Product Discovery)

**Why different:** No "product vision" to discover — the system *is* the product. Must understand what it actually does.

**Agent Action:** Create `system-discovery.md` by inspecting:
- Code: Controllers, services, repositories, domain models
- Runtime: Datadog dashboards, logs, traces
- Data: Schema analysis, row counts, query patterns
- Integrations: API calls, message queues, external configs

**Key Findings (Actual State):**
- **Monolith with hidden services:** Single Spring Boot app but 3 internal "services" (Order, Payment, Inventory) sharing DB tables
- **Two databases:** PostgreSQL (orders, payments, customers) + MongoDB (product catalog, pricing rules)
- **Three external integrations:** SAP ERP (SOAP), Stripe (REST), EasyPost (REST)
- **No test coverage:** 0% unit, 0% integration, 0% contract
- **Deployment:** Jenkins builds JAR → copies to EC2 → restarts service (no blue-green, no rollback)
- **Security:** JWT in header (no validation), hardcoded Stripe keys in config, SQL injection in 2 endpoints

**Documented vs Actual (First Major Discovery):**

| Aspect | Documented (Wiki) | Actual (Code/Runtime) | Target |
|--------|-------------------|----------------------|--------|
| Order ownership | OrderService owns Order | OrderService, PaymentService, InventoryService ALL modify `orders` table | OrderService sole owner |
| Payment flow | Async via RabbitMQ | Synchronous REST to Stripe in OrderController | Async event-driven |
| Inventory check | Real-time reservation | Best-effort check, overselling occurs | Reservation with compensation |
| Authentication | OAuth2 | Custom JWT filter, no expiry validation, no refresh | OAuth2 (Auth0) |
| Data retention | 7 years | No purge job, 50M rows in orders table | 7 years with purge |

**Gate 1 Result:** PASSED_WITH_RISKS — Product context sufficiently understood for assessment scope. Critical: Documentation cannot be trusted.

---

### 2. Domain Discovery (Targeted)

**Why targeted:** Not greenfield — only discover domain where assessment needs it.

**Agent Action:** Focus on Order and Payment domains (highest risk, target of upcoming changes).

**Method:** Extract domain model from code + runtime behavior + PM interviews.

**Key Findings:**
- **Core Capabilities:** Order Management, Payment Processing, Inventory Allocation, Customer Management, Reporting
- **Bounded Contexts (Actual):** Order & Payment (tangled), Inventory, Customer, Reporting
- **Critical Invariants (Actual, not documented):**
  - Order total = sum(line items) + tax + shipping — **VIOLATED** in 2% of orders (rounding bugs)
  - Payment amount must equal order total — **VIOLATED** when partial refunds not tracked
  - Inventory reserved on order confirm — **NOT ENFORCED** (best-effort only)
- **Domain Events (Actual):** None explicit. Implicit via direct DB writes.

**Gate 2 Result:** PASSED_WITH_RISKS — Domain understanding sufficient for architecture assessment. Invariants violated in production.

---

### 3. Architecture Assessment (Gate 3 — Full)

**Why full:** High risk, high complexity, revenue-critical system.

**Agent Action:** Create observed C4 diagrams from code + runtime.

**Observed Architecture (Actual State):**

```
┌─────────────────────────────────────────────────────────────┐
│                    OrderFlow Monolith                       │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │   Order     │  │  Payment    │  │ Inventory   │         │
│  │ Controller  │  │ Controller  │  │ Controller  │         │
│  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘         │
│         │                │                │                 │
│         ▼                ▼                ▼                 │
│  ┌─────────────────────────────────────────────┐           │
│  │           Shared PostgreSQL                  │           │
│  │  orders | payments | inventory | customers   │           │
│  └─────────────────────────────────────────────┘           │
│                          │                                 │
│                          ▼                                 │
│  ┌─────────────────────────────────────────────┐           │
│  │           MongoDB (Catalog)                  │           │
│  └─────────────────────────────────────────────┘           │
└─────────────────────────────────────────────────────────────┘
         │                    │                    │
         ▼                    ▼                    ▼
    ┌─────────┐          ┌─────────┐          ┌─────────┐
    │   SAP   │          │ Stripe  │          │EasyPost │
    │  (SOAP) │          │ (REST)  │          │ (REST)  │
    └─────────┘          └─────────┘          └─────────┘
```

**Architecture Violations (Actual vs Principles):**
- ❌ No module boundaries — all controllers access all tables
- ❌ Synchronous external calls in request path (Stripe, SAP)
- ❌ No circuit breakers, retries, timeouts
- ❌ Shared database = shared schema = coupling
- ❌ No domain events — temporal coupling via DB
- ❌ Security: No auth validation, hardcoded secrets

**Quality Attribute Assessment:**
| Attribute | Actual | Target | Gap |
|-----------|--------|--------|-----|
| Availability | 99.2% (monthly 6h downtime) | 99.9% | SIGNIFICANT |
| Performance | P95 3.2s (order confirm) | < 500ms | SIGNIFICANT |
| Security | Critical findings (auth, secrets, SQLi) | SOC2-ready | BLOCKING |
| Maintainability | 0% test coverage, circular deps | Testable, modular | SIGNIFICANT |
| Scalability | Vertical only (single EC2) | Horizontal | SIGNIFICANT |

**Gate 3 Result:** BLOCKED
- ✗ Architecture contradicts domain boundaries (Order/Payment/Inventory tangled)
- ✗ Critical security issues (auth, secrets, SQLi)
- ✗ No module ownership — shared DB with cross-writes
- ✗ Required quality attributes not satisfiable by current architecture

**Required Actions:**
1. Define target modular monolith architecture (ADR)
2. Plan strangler fig migration: extract Order → Payment → Inventory
3. Implement security fixes immediately (auth, secrets, SQLi)
4. Add circuit breakers for external calls

---

### 4. Contract Assessment (Gate 4 — Full)

**Agent Action:** Reverse-engineer actual contracts from code + traffic.

**Actual Contracts Found:**

| Contract | Type | Actual State | Documented | Compatibility |
|----------|------|--------------|------------|---------------|
| Order API | REST | 15 endpoints, no versioning, breaking changes deployed | 8 endpoints (outdated) | N/A — no consumers external |
| Payment Callback | Webhook | Stripe webhook → PaymentController, no signature validation | None | N/A |
| Inventory Sync | Scheduled Job | Nightly SAP → MongoDB, no contract, fragile parsing | "Real-time" (false) | BROKEN |
| Shipping API | REST | EasyPost calls embedded in OrderController | None | N/A |

**Contract Risks:**
- No versioning strategy → breaking changes deployed without notice
- Stripe webhook unsigned → spoofing risk
- SAP integration fragile — schema changes break nightly sync
- No contract tests → changes break consumers silently

**Gate 4 Result:** BLOCKED
- ✗ No versioning strategy
- ✗ Critical security: unsigned webhooks
- ✗ SAP integration contract undefined/fragile
- ✗ No contract governance process

---

### 5. Architecture Decisions (Gate 5 — Targeted)

**Agent Action:** Only create ADRs for identified risks and target architecture.

**ADRs Created (PROPOSED → ACTIVE after authorization):**

| ADR | Title | Status | Trigger |
|-----|-------|--------|---------|
| `ADR-001` | Target Architecture: Modular Monolith → Service Extraction | `PROPOSED` | Gate 3 blocking |
| `ADR-002` | Security: OAuth2 + Secrets Management | `ACTIVE` | Security assessment (BLOCKING) |
| `ADR-003` | Data Ownership: Order Service sole owner of orders | `PROPOSED` | Gate 3 blocking |
| `ADR-004` | External Calls: Circuit Breakers + Async | `PROPOSED` | Gate 3/4 blocking |
| `ADR-005` | Contract Governance: Versioning + Tests | `PROPOSED` | Gate 4 blocking |

**Decision Debt Identified (from `references/decision-governance.md` Section 22):**
- `AuthStrategy = OPEN` — No decision, custom JWT with no validation
- `ConsistencyModel = UNKNOWN` — Sync vs async not decided
- `DataOwnership = AMBIGUOUS` — 3 services write orders table
- `ErrorHandling = NONE` — No error model, exceptions bubble to 500

**Gate 5 Result:** IN_PROGRESS — ADR-002 authorized (security critical), others proposed awaiting target architecture workshop.

---

### 6. Specifications (Gate 6 — Targeted)

**Agent Action:** Only specify remediation work, not full system.

**Specs Created:**
- `SPEC-001` — Security Remediation: OAuth2 migration, secret rotation, SQLi fixes
- `SPEC-002` — Order Service Extraction: Module boundaries, API, data migration
- `SPEC-003` — Circuit Breaker Implementation: Resilience4j for Stripe, SAP, EasyPost

**Gate 6 Result:** IN_PROGRESS — SPEC-001 authorized (security), others pending ADR-001.

---

### 7. Infrastructure (Gate 7 — Targeted)

**Agent Action:** Assess current infra, define remediation requirements.

**Current Infrastructure (Actual):**
- Single EC2 (t3.large) — no HA, no autoscaling
- RDS PostgreSQL (single AZ) — no read replicas, no PITR
- MongoDB Atlas (shared cluster) — no backup verification
- Jenkins on same EC2 — single point of failure
- No staging environment
- Secrets in plaintext config files

**Target Infrastructure (Phase 7 Spec):**
- EKS/GKE for modular monolith deployment
- Multi-AZ RDS with read replica
- Managed Redis for caching/sessions
- GitHub Actions CI/CD with staging
- Secrets Manager / Vault
- Observability stack (Prometheus, Grafana, Loki, Tempo)

**Gate 7 Result:** BLOCKED — Current infrastructure cannot support target architecture or security requirements.

---

### 8. Release Readiness (Gate 8 — Not Applicable)

**Per `references/architecture-gates.md` Section 16:** No release planned for assessment phase. Gate 8 not evaluated.

---

## Key Behaviors Demonstrated

| Behavior | Example |
|----------|---------|
| **Three-state distinction** | Order ownership: Documented=OrderService, Actual=3 services, Target=OrderService |
| **Evidence over documentation** | Agent discovers PaymentService writes orders table — wiki says OrderService only |
| **Proportional gates** | Gate 1 lightweight (product context), Gate 3 full (architecture), Gate 8 N/A |
| **Decision debt catalogued** | `AuthStrategy=OPEN`, `DataOwnership=AMBIGUOUS` explicitly recorded |
| **Target architecture incremental** | Strangler Fig: Order → Payment → Inventory, not big bang rewrite |
| **No forced phases** | Domain Discovery only for Order/Payment (high risk areas) |
| **Gate blocking on real issues** | Gate 3 BLOCKED on security + architecture; Gate 4 BLOCKED on contracts |

---

## Files in This Example

See `README.md` for directory structure. Key files:
- `scenario-guide.md` — This file
- `project-sizing-assessment.md` — LEVEL 3 justification
- `system-assessment/system-discovery.md` — Actual system evidence
- `system-assessment/documented-vs-actual.md` — Three-state comparison
- `architecture-risks/risk-register.md` — Prioritized risks
- `gate-evaluation/gate-3-architecture.md` — Full architecture gate with BLOCKED result
- `traceability-matrix.md` — Actual → Target traceability