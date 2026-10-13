# System Discovery — OrderFlow Legacy

## 1. Document Metadata

| Field | Value |
|-------|-------|
| Document ID | `SYS-DISC-001` |
| Version | `0.3` |
| Status | `ACTIVE` |
| Created | `2025-01-15` |
| Updated | `2025-01-28` |
| Project | OrderFlow Legacy Assessment |
| Lifecycle Mode | EXISTING_SYSTEM |
| Owner | Technical Lead |
| Reviewers | VP Engineering, Architect, Security Officer |

---

## 2. Purpose

Document the **Actual State** of OrderFlow through evidence-based discovery. This is the foundation for all subsequent assessment — `Observed Reality > Historical Documentation`.

---

## 3. Evidence Sources

| Source | Type | Access | Confidence |
|--------|------|--------|------------|
| Source Code (GitHub) | `CODE` | Full read | `HIGH` |
| Production Database (Read-only) | `SYSTEM` | Read-only | `HIGH` |
| Production Logs (Datadog) | `SYSTEM` | Read-only | `HIGH` |
| Runtime Metrics (Datadog APM) | `SYSTEM` | Read-only | `HIGH` |
| Jenkins Build Logs | `SYSTEM` | Read-only | `HIGH` |
| Confluence Wiki | `DOCUMENT` | Read | `LOW` (outdated) |
| Team Interviews (4 engineers, 1 PM) | `USER_INPUT` | Direct | `MEDIUM` |

---

## 4. Codebase Analysis

### 4.1 Repository Structure

```
orderflow/
├── orderflow-api/          # Spring Boot 2.7.18 (Java 11)
│   ├── src/main/java/com/distributor/orderflow/
│   │   ├── controller/     # 15 REST controllers
│   │   ├── service/        # 28 @Service classes
│   │   ├── repository/     # 22 Spring Data JPA + 5 MongoRepository
│   │   ├── domain/         # 45 @Entity + 12 @Document
│   │   ├── integration/    # SAP, Stripe, EasyPost clients
│   │   ├── config/         # Security, RabbitMQ, Jackson, OpenAPI
│   │   └── util/           # 30+ utility classes
│   └── src/test/           # EMPTY (0 tests)
├── orderflow-frontend/     # AngularJS 1.8 (legacy)
└── orderflow-infra/        # Jenkinsfile, Dockerfile, k8s (unused)
```

### 4.2 Module Coupling Analysis (Static)

**Coupling Matrix (Fan-in / Fan-out):**

| Module | Fan-in | Fan-out | Primary Dependencies |
|--------|--------|---------|---------------------|
| `OrderController` | 0 | 12 | OrderService, PaymentService, InventoryService, CustomerService, SAPClient, StripeClient, EasyPostClient |
| `PaymentController` | 0 | 5 | PaymentService, OrderService, StripeClient |
| `InventoryController` | 0 | 4 | InventoryService, OrderService, SAPClient |
| `OrderService` | 3 | 8 | OrderRepository, PaymentService, InventoryService, CustomerRepository, EventPublisher |
| `PaymentService` | 2 | 6 | PaymentRepository, OrderRepository, StripeClient, EventPublisher |
| `InventoryService` | 2 | 5 | InventoryRepository, OrderRepository, ProductRepository, SAPClient |
| `CustomerService` | 2 | 3 | CustomerRepository, OrderRepository |

**Finding:** **No module boundaries.** Controllers and services freely inject each other. All access shared repositories.

### 4.3 Database Schema Analysis

**PostgreSQL (orders_db) — 47 tables, 50M+ rows in `orders`:**

| Table | Rows | Key Findings |
|-------|------|--------------|
| `orders` | 52M | No partition, 15 indexes, `status` VARCHAR(20) no constraint |
| `order_items` | 180M | FK to orders, no FK to products (MongoDB) |
| `payments` | 48M | `order_id` FK, `status` VARCHAR, `stripe_charge_id` nullable |
| `inventory_reservations` | 12M | `order_id` FK, `product_id` (string), `quantity`, `expires_at` |
| `customers` | 850K | `email` unique, `sap_customer_id` nullable |
| `products` | 0 | **EMPTY** — products in MongoDB |

**MongoDB (catalog_db) — 3 collections:**

| Collection | Documents | Key Findings |
|------------|-----------|--------------|
| `products` | 45K | `sku`, `name`, `price_rules` (embedded), `inventory_count` |
| `pricing_rules` | 12K | Complex nested rules, versioned by `effective_date` |
| `sap_sync_log` | 500K | Audit of nightly SAP sync, 40% failure rate last 30 days |

### 4.4 External Integration Analysis

| Integration | Protocol | Client Location | Auth | Error Handling |
|-------------|----------|-----------------|------|----------------|
| SAP ERP | SOAP | `SAPClient` (Spring WS) | Basic Auth (hardcoded) | None — exceptions bubble |
| Stripe | REST | `StripeClient` (custom) | Secret key in config | Try-catch → 500 |
| EasyPost | REST | `EasyPostClient` (custom) | API key in config | Try-catch → 500 |
| RabbitMQ | AMQP | `RabbitConfig` + listeners | Guest/guest | Dead letter queue (unused) |

**Critical Findings:**
- Stripe secret key in `application-prod.yml` (plaintext)
- SAP credentials in `application-prod.yml` (plaintext)
- No circuit breakers, retries, timeouts on any external call
- Stripe webhook endpoint: `/api/payments/webhook` — **NO SIGNATURE VALIDATION**
- SAP sync: Nightly `@Scheduled` job, 40% failure rate, no alerting

### 4.5 Runtime Behavior (Datadog APM)

| Metric | Value | Assessment |
|--------|-------|------------|
| **Availability** | 99.2% (last 30 days) | 6h downtime/month |
| **Order Confirm P95** | 3.2s | Synchronous Stripe + SAP calls |
| **Error Rate** | 2.1% (5xx) | Mostly Stripe timeouts, SAP SOAP faults |
| **DB Connections** | 95/100 max | Connection pool exhaustion under load |
| **JVM Heap** | 85% avg, 98% peak | Frequent GC pauses |
| **Deploy Frequency** | 2/week | Manual Jenkins → EC2 |
| **Rollback Time** | 45 min | Manual JAR replace + restart |
| **Test Coverage** | 0% | No tests in any repo |

---

## 5. Security Assessment (Evidence-Based)

| Finding | Evidence | Severity |
|---------|----------|----------|
| **No JWT Validation** | `JwtFilter` only parses `sub` claim, no signature verification, no expiry check | `BLOCKING` |
| **Hardcoded Secrets** | `application-prod.yml`: `stripe.secret_key=sk_live_...`, `sap.password=...` | `BLOCKING` |
| **SQL Injection** | `OrderRepository.findByCustomerEmail(String email)` uses `@Query("SELECT * FROM orders WHERE customer_email = " + email)` | `BLOCKING` |
| **Unsigned Stripe Webhook** | `PaymentController.stripeWebhook()` accepts any POST, no `stripe-signature` verification | `BLOCKING` |
| **No Rate Limiting** | No rate limiter on `/api/orders`, `/api/payments` | `SIGNIFICANT` |
| **CORS Wildcard** | `WebMvcConfigurer` allows `*` origin | `WARNING` |
| **No Security Headers** | No CSP, HSTS, X-Frame-Options | `WARNING` |

---

## 6. Operational Assessment

| Area | Actual State | Gap |
|------|--------------|-----|
| **Deployment** | Jenkins builds JAR → SCP to EC2 → `systemctl restart` | No blue-green, no rollback, no staging |
| **Monitoring** | Datadog APM + logs (basic) | No business metrics, no SLOs |
| **Alerting** | 3 alerts (CPU, disk, JVM heap) | No business alerts (order failure rate, payment failures) |
| **Logging** | JSON to stdout → Datadog | No correlation IDs, no audit trail |
| **Backup** | RDS automated snapshots (daily, 7-day retention) | No PITR, no restore testing |
| **Secrets** | Plaintext in `application-prod.yml` on EC2 | No rotation, no audit |
| **Capacity** | Single t3.large EC2, 2 vCPU, 8GB RAM | No headroom, vertical only |

---

## 7. Technical Debt Catalog (Initial)

| ID | Debt | Severity | Evidence |
|----|------|----------|----------|
| `DEBT-001` | No test coverage | `SIGNIFICANT` | 0 tests in 3 repos |
| `DEBT-002` | Circular service dependencies | `SIGNIFICANT` | Static analysis (jdeps/ArchUnit) |
| `DEBT-003` | Shared DB schema (cross-service writes) | `BLOCKING` | 3 services write `orders` table |
| `DEBT-004` | Synchronous external calls in request path | `SIGNIFICANT` | Stripe + SAP in OrderController |
| `DEBT-005` | No circuit breakers / retries | `SIGNIFICANT` | Integration clients have none |
| `DEBT-006` | No contract versioning | `SIGNIFICANT` | Breaking changes deployed |
| `DEBT-007` | AngularJS 1.8 frontend | `WARNING` | End-of-life, no security updates |
| `DEBT-008` | Spring Boot 2.7 (EOL Nov 2023) | `SIGNIFICANT` | No security patches |

---

## 8. Traceability (Actual State)

| Relationship | From | To | Status | Confidence |
|--------------|------|-----|--------|------------|
| `IMPLEMENTS` | `OrderController` | `OrderService` | `VALID` | `HIGH` |
| `IMPLEMENTS` | `PaymentService` | `StripeClient` | `VALID` | `HIGH` |
| `CONSUMES` | `OrderService` | `payments` table | `VALID` | `HIGH` |
| `CONSUMES` | `PaymentService` | `orders` table | `VALID` | `HIGH` |
| `CONSUMES` | `InventoryService` | `orders` table | `VALID` | `HIGH` |
| `EXPOSES` | `OrderController` | `/api/orders/**` | `VALID` | `HIGH` |
| `CONSUMES` | `StripeClient` | Stripe API | `VALID` | `HIGH` |
| `CONSUMES` | `SAPClient` | SAP SOAP | `VALID` | `HIGH` |

**Missing Traceability (Orphans):**
- `InventoryService` → `orders` table (undocumented cross-write)
- `PaymentService` → `orders` table (undocumented cross-write)
- `SAPClient` → `products` collection (nightly sync, no contract)

---

## 9. Assessment Summary

**System State:** Revenue-critical monolith with significant architectural debt, critical security vulnerabilities, and no safety net (tests, staging, rollback).

**Primary Risks:**
1. **Security** — 4 BLOCKING findings (auth, secrets, SQLi, unsigned webhook)
2. **Architecture** — No module boundaries, shared DB, cross-writes
3. **Operations** — No staging, no rollback, single point of failure
4. **Data Integrity** — Invariant violations in production (2% orders)

**Recommendation:** Immediate security remediation (ADR-002), then incremental modular monolith extraction (ADR-001). Do not add features until security and architecture gates pass.

---

## 10. Evidence Summary

| Claim | Evidence | Confidence |
|-------|----------|------------|
| 3 services write `orders` table | Code: `OrderService`, `PaymentService`, `InventoryService` all inject `OrderRepository` | `HIGH` |
| Stripe webhook unsigned | Code: `PaymentController.stripeWebhook()` no signature check | `HIGH` |
| SQL injection in OrderRepository | Code: `@Query` with string concatenation | `HIGH` |
| 40% SAP sync failure | Datadog: `sap_sync_log` collection, 40% `status=FAILED` last 30 days | `HIGH` |
| 0% test coverage | Code: `src/test` empty in all 3 repos | `HIGH` |
| Single EC2 deployment | Infra: Jenkins → EC2, no ASG, no LB | `HIGH` |