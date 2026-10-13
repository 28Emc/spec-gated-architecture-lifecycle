# Documented vs Actual vs Target — OrderFlow Legacy

## 1. Document Metadata

| Field | Value |
|-------|-------|
| Document ID | `SYS-DVA-001` |
| Version | `0.2` |
| Status | `ACTIVE` |
| Created | `2025-01-18` |
| Updated | `2025-01-28` |
| Project | OrderFlow Legacy Assessment |
| Lifecycle Mode | EXISTING_SYSTEM |
| Owner | Technical Lead |
| Reviewers | Architect, VP Engineering, PM |

---

## 2. Purpose

Explicitly distinguish the three states per `references/architecture-gates.md` Section 15:

> ```text
> Documented State
> Actual State
> Target State
> ```
>
> `Observed Reality > Historical Documentation` when the two conflict.

This document is the single source of truth for state discrepancies.

---

## 3. Three-State Comparison

### 3.1 Order Ownership

| State | Description | Evidence |
|-------|-------------|----------|
| **Documented** (Wiki: "Architecture Overview") | "OrderService is the sole owner of the Order aggregate. All order modifications go through OrderService." | Confluence page "Architecture Overview" v2.1 (Jan 2022) |
| **Actual** (Code + Runtime) | **Three services modify `orders` table:**<br/>1. `OrderService` — create, update, cancel<br/>2. `PaymentService` — updates `status`, `paid_at`, `stripe_charge_id` on payment success/failure<br/>3. `InventoryService` — updates `inventory_reserved`, `confirmed_at` on reservation | Code: All three inject `OrderRepository`<br/>DB: `orders` table updated by 3 service IDs in `updated_by` column<br/>Logs: `PaymentService.updateOrderPaymentStatus()` called 45K/day |
| **Target** | **OrderService sole owner.** Payment/Inventory communicate via domain events. OrderService publishes `OrderPaymentUpdated`, `OrderInventoryReserved`. | ADR-003 (PROPOSED), Strangler Fig migration plan |

**Discrepancy Severity:** `BLOCKING` — Violates data ownership, causes invariant violations (2% orders have payment/order total mismatch)

---

### 3.2 Payment Flow

| State | Description | Evidence |
|-------|-------------|----------|
| **Documented** (Wiki: "Payment Integration") | "Payment processing is asynchronous. OrderService publishes `OrderCreated` event. PaymentService consumes, calls Stripe, publishes `PaymentCompleted`. OrderService updates order on event." | Confluence page "Payment Integration" v1.3 (Mar 2022) |
| **Actual** (Code + Runtime) | **Synchronous REST in request path:**<br/>1. `OrderController.confirmOrder()` calls `PaymentService.charge()`<br/>2. `PaymentService.charge()` calls Stripe synchronously (no timeout)<br/>3. On success, `PaymentService` updates `orders` table directly<br/>4. On failure, throws exception → 500 to user<br/>**RabbitMQ exists but unused for payments** — only Inventory uses it for SAP sync | Code: `OrderController.confirmOrder()` → `PaymentService.charge()` → `StripeClient.charge()`<br/>Traces: 3.2s P95 (Stripe call dominates)<br/>RabbitMQ: Queue `payment.events` has 0 consumers |
| **Target** | **Async event-driven.** OrderService publishes `OrderConfirmed`. PaymentService consumes, processes async, publishes `PaymentCompleted`/`PaymentFailed`. OrderService updates on event. Circuit breaker on Stripe. | ADR-004 (PROPOSED), ADR-001 target architecture |

**Discrepancy Severity:** `BLOCKING` — Synchronous external call causes 3.2s latency, Stripe downtime = order downtime, no resilience

---

### 3.3 Inventory Check & Reservation

| State | Description | Evidence |
|-------|-------------|----------|
| **Documented** (Wiki: "Inventory Management") | "Real-time inventory reservation. On order confirm, InventoryService reserves stock via SAP. If unavailable, order rejected." | Confluence page "Inventory Management" v1.0 (Feb 2022) |
| **Actual** (Code + Runtime) | **Best-effort, overselling occurs:**<br/>1. `OrderController.confirmOrder()` calls `InventoryService.checkAvailability()`<br/>2. `InventoryService` reads `products.inventory_count` from MongoDB (cached, stale)<br/>3. If available, creates `InventoryReservation` document (expires 24h)<br/>4. **No SAP real-time check** — SAP sync is nightly batch<br/>5. **No compensation** — if SAP later shows OOS, no automatic cancellation<br/>**Overselling rate:** ~3% of orders (customer complaints) | Code: `InventoryService.checkAvailability()` reads MongoDB only<br/>Data: `inventory_reservations` vs actual SAP stock mismatch 15%<br/>Support tickets: 12/month "item shipped but OOS" |
| **Target** | **Reservation with compensation.** Real-time SAP check (cached 5min) or async reservation with saga. OOS → automatic cancellation + customer notification. | ADR-001 target architecture, ADR-004 (circuit breaker + async) |

**Discrepancy Severity:** `SIGNIFICANT` — Customer impact, revenue loss, trust erosion

---

### 3.4 Authentication & Authorization

| State | Description | Evidence |
|-------|-------------|----------|
| **Documented** (Wiki: "Security") | "OAuth2 with JWT tokens. Role-based access control (ADMIN, USER, API). Tokens validated on each request." | Confluence page "Security" v1.1 (Jan 2022) |
| **Actual** (Code + Runtime) | **Custom JWT filter, no validation:**<br/>1. `JwtFilter` extracts `Authorization` header<br/>2. Parses JWT **without signature verification**<br/>3. No expiry check (`exp` claim ignored)<br/>4. No issuer/audience validation<br/>5. Roles from `roles` claim used directly<br/>6. **No refresh token support** — tokens never expire<br/>**Hardcoded secrets** in `application-prod.yml` | Code: `JwtFilter.doFilterInternal()` — `parser.parseClaimsJwt(token)` (no `setSigningKey`)<br/>Config: `jwt.secret=hardcoded-secret-123`<br/>Penetration test (2023): "Trivial token forgery" |
| **Target** | **Auth0 OAuth2.** Authorization Code Flow + PKCE. JWT validation (JWKS), expiry, roles, MFA. Secrets in Secrets Manager. | ADR-002 (ACTIVE), SPEC-001 (Security Remediation) |

**Discrepancy Severity:** `BLOCKING` — Trivial auth bypass, no token expiry, hardcoded secrets

---

### 3.5 Data Retention

| State | Description | Evidence |
|-------|-------------|----------|
| **Documented** (Wiki: "Data Policy") | "Orders retained 7 years per tax law. Automated purge job runs monthly." | Confluence page "Data Policy" v1.0 (Dec 2021) |
| **Actual** (Runtime) | **No purge job exists.**<br/>- `orders` table: 52M rows (5 years)<br/>- `order_items`: 180M rows<br/>- `payments`: 48M rows<br/>- No `deleted_at`, no archive partition<br/>- **No scheduled job** in Spring `@Scheduled` or Jenkins<br/>- **No archive strategy** — all data in primary tables | Code: No `@Scheduled` purge method<br/>DB: `orders` table growth 1M rows/month<br/>Jenkins: No purge job |
| **Target** | **Partitioned tables + automated purge.** 7-year retention, monthly partition, purge job with legal hold check. Archive to cold storage before purge. | ADR-003 (data ownership), Compliance Module (target) |

**Discrepancy Severity:** `SIGNIFICANT` — Storage cost, query performance, compliance risk

---

### 3.6 SAP Integration

| State | Description | Evidence |
|-------|-------------|----------|
| **Documented** (Wiki: "ERP Integration") | "Real-time SAP integration. Product catalog synced every hour. Inventory levels real-time." | Confluence page "ERP Integration" v1.2 (Apr 2022) |
| **Actual** (Runtime) | **Nightly batch, 40% failure rate:**<br/>1. `@Scheduled(cron="0 2 * * *")` triggers `SapSyncJob`<br/>2. Calls SAP BAPI via SOAP (no timeout)<br/>3. Parses response → upserts MongoDB `products`<br/>4. **40% failure rate** last 30 days (network, schema changes)<br/>5. **No alerting** — failures only in `sap_sync_log` collection<br/>6. **No contract** — fragile parsing, breaks on SAP schema change | Logs: `sap_sync_log` — 40% `FAILED`, errors: "Connection timeout", "XML parse error"<br/>Code: `SapClient` no timeout, no retry, no circuit breaker |
| **Target** | **Resilient sync with contract.** Hourly sync with circuit breaker, retry, dead letter queue, alerting. Schema validation. Fallback to cached catalog. | ADR-004 (circuit breaker), Contract Governance (target) |

**Discrepancy Severity:** `SIGNIFICANT` — Stale catalog, pricing errors, no visibility into failures

---

### 3.7 Deployment & Release

| State | Description | Evidence |
|-------|-------------|----------|
| **Documented** (Wiki: "Release Process") | "Staging environment for validation. Blue-green deployment. Automated rollback on health check failure." | Confluence page "Release Process" v1.0 (Mar 2022) |
| **Actual** (Runtime) | **No staging, no blue-green, manual rollback:**<br/>1. Jenkins builds JAR from `main`<br/>2. `scp` JAR to prod EC2<br/>3. `systemctl stop orderflow && mv jar && systemctl start orderflow`<br/>4. **No health check wait** — assumes instant startup<br/>5. **Rollback:** Manual `scp` previous JAR + restart (45 min)<br/>6. **No staging environment** — deploys directly to prod | Jenkinsfile: `deploy` stage = `scp` + `ssh systemctl restart`<br/>Infrastructure: Single EC2, no ASG, no ALB target groups<br/>Incident (Jan 2025): Bad deploy → 2h downtime (manual rollback) |
| **Target** | **CI/CD with staging, blue-green, automated rollback.** GitHub Actions → build → test → staging → manual approval → prod blue-green. Health checks, synthetic tests, instant rollback. | Infrastructure Spec (target), SPEC-008 (Deployment) |

**Discrepancy Severity:** `SIGNIFICANT` — Deployment risk, no safety net

---

## 4. Summary of Discrepancies

| Area | Documented | Actual | Target | Severity |
|------|------------|--------|--------|----------|
| Order Ownership | Single (OrderService) | Triple (Order, Payment, Inventory) | Single (OrderService) | `BLOCKING` |
| Payment Flow | Async event-driven | Sync REST in request | Async event-driven | `BLOCKING` |
| Inventory | Real-time SAP reservation | Best-effort MongoDB, overselling | Reservation + compensation | `SIGNIFICANT` |
| Authentication | OAuth2 + JWT validation | Custom JWT, no validation, hardcoded secrets | Auth0 OAuth2 | `BLOCKING` |
| Data Retention | 7-year purge job | No purge, 50M+ rows | Partitioned + purge | `SIGNIFICANT` |
| SAP Integration | Real-time hourly | Nightly batch, 40% failure | Resilient hourly sync | `SIGNIFICANT` |
| Deployment | Staging + blue-green | Direct to prod, manual | Staging + blue-green | `SIGNIFICANT` |

---

## 5. Agent Behavior Demonstrated

1. **Evidence over documentation** — Agent inspected code, DB, logs; did not trust wiki
2. **Explicit discrepancy recording** — Each gap documented with evidence, severity
3. **No silent resolution** — Discrepancies surfaced as blocking issues for gates
4. **Target state defined** — Each discrepancy has a Target State with ADR/spec traceability
5. **Proportional assessment** — Deep dive on high-risk areas (Order, Payment, Security); lighter on Reporting

---

## 6. Traceability

| Relationship | Artifact | Status |
|--------------|----------|--------|
| `DERIVES_FROM` | `SYS-DISC-001` (System Discovery) | `VALID` |
| `CONSTRAINS` | `ADR-001` (Target Architecture) | `VALID` |
| `CONSTRAINS` | `ADR-002` (Security) | `VALID` |
| `CONSTRAINS` | `ADR-003` (Data Ownership) | `VALID` |
| `CONSTRAINS` | `ADR-004` (External Calls) | `VALID` |
| `SUPERSEDES` | Wiki "Architecture Overview" v2.1 | `VALID` |
| `SUPERSEDES` | Wiki "Payment Integration" v1.3 | `VALID` |
| `SUPERSEDES` | Wiki "Security" v1.1 | `VALID` |

---

## 7. Gate Impact

| Gate | Impact of Discrepancies |
|------|------------------------|
| Gate 1 (Product) | PASSED_WITH_RISKS — Product context understood; documentation unreliable |
| Gate 2 (Domain) | PASSED_WITH_RISKS — Domain model extracted from code; invariants violated |
| Gate 3 (Architecture) | **BLOCKED** — Architecture contradicts domain boundaries, security critical |
| Gate 4 (Contracts) | **BLOCKED** — No versioning, unsigned webhooks, fragile SAP |
| Gate 5 (Decisions) | IN_PROGRESS — ADR-002 ACTIVE (security), others PROPOSED |
| Gate 6 (Specs) | IN_PROGRESS — SPEC-001 ACTIVE (security remediation) |
| Gate 7 (Infra) | **BLOCKED** — Current infra cannot support target |
| Gate 8 (Release) | N/A — No release planned |

---

## 8. Evidence

| Discrepancy | Evidence | Confidence |
|-------------|----------|------------|
| Triple order ownership | Code: 3 services inject OrderRepository; DB: updated_by column | `HIGH` |
| Sync payment in request | Code: OrderController → PaymentService → StripeClient; Traces: 3.2s | `HIGH` |
| No JWT validation | Code: JwtFilter parses without signing key; Config: hardcoded secret | `HIGH` |
| Unsigned Stripe webhook | Code: PaymentController.stripeWebhook() no signature check | `HIGH` |
| SQL injection | Code: OrderRepository @Query with string concatenation | `HIGH` |
| 40% SAP sync failure | MongoDB: sap_sync_log collection, 40% FAILED last 30 days | `HIGH` |
| No purge job | Code: No @Scheduled purge; DB: 52M rows, 1M/month growth | `HIGH` |
| Direct prod deploy | Jenkinsfile: scp + ssh restart; Infra: single EC2 | `HIGH` |