# Architectural Risk Register — OrderFlow Legacy

## 1. Document Metadata

| Field | Value |
|-------|-------|
| Document ID | `RISK-REG-001` |
| Version | `0.3` |
| Status | `ACTIVE` |
| Created | `2025-01-20` |
| Updated | `2025-01-29` |
| Project | OrderFlow Legacy Assessment |
| Lifecycle Mode | EXISTING_SYSTEM |
| Owner | Architect |
| Reviewers | VP Engineering, Technical Lead, Security Officer |

---

## 2. Purpose

Catalog and prioritize architectural risks discovered during assessment. Risks are classified per `references/architecture-gates.md` Section 5: `INFO`, `WARNING`, `SIGNIFICANT`, `BLOCKING`.

Only `BLOCKING` findings automatically prevent gate progression.

---

## 3. Risk Classification Matrix

| Risk ID | Title | Category | Severity | Status | Gate Impact |
|---------|-------|----------|----------|--------|-------------|
| `RISK-001` | No JWT Validation — Trivial Auth Bypass | Security | `BLOCKING` | `OPEN` | Gate 3, 4, 5, 7 |
| `RISK-002` | Hardcoded Secrets (Stripe, SAP, JWT) | Security | `BLOCKING` | `OPEN` | Gate 3, 4, 5, 7 |
| `RISK-003` | SQL Injection in OrderRepository | Security | `BLOCKING` | `OPEN` | Gate 3, 4, 5, 7 |
| `RISK-004` | Unsigned Stripe Webhook — Spoofing Risk | Security | `BLOCKING` | `OPEN` | Gate 3, 4, 5, 7 |
| `RISK-005` | Triple Order Ownership — Data Integrity | Architecture | `BLOCKING` | `OPEN` | Gate 3, 5 |
| `RISK-006` | Synchronous Stripe Call in Request Path | Architecture | `BLOCKING` | `OPEN` | Gate 3, 4, 7 |
| `RISK-007` | No Circuit Breakers / Retries / Timeouts | Architecture | `SIGNIFICANT` | `OPEN` | Gate 3, 7 |
| `RISK-008` | No Contract Versioning / Governance | Contracts | `SIGNIFICANT` | `OPEN` | Gate 4 |
| `RISK-009` | SAP Integration Fragile (40% Failure) | Integration | `SIGNIFICANT` | `OPEN` | Gate 3, 4, 7 |
| `RISK-010` | No Test Coverage (0%) | Quality | `SIGNIFICANT` | `OPEN` | Gate 3, 6, 8 |
| `RISK-011` | Single EC2 — No HA, No Rollback | Infrastructure | `SIGNIFICANT` | `OPEN` | Gate 7 |
| `RISK-012` | No Staging Environment | Infrastructure | `SIGNIFICANT` | `OPEN` | Gate 7 |
| `RISK-013` | Spring Boot 2.7 EOL (No Security Patches) | Technical Debt | `SIGNIFICANT` | `OPEN` | Gate 3, 7 |
| `RISK-014` | AngularJS 1.8 Frontend (EOL) | Technical Debt | `WARNING` | `OPEN` | Gate 3, 7 |
| `RISK-015` | Overselling (3% Orders) — Inventory Best-Effort | Domain | `SIGNIFICANT` | `OPEN` | Gate 2, 3 |
| `RISK-016` | Payment/Order Total Mismatch (2% Orders) | Data Integrity | `SIGNIFICANT` | `OPEN` | Gate 2, 3 |
| `RISK-017` | No Contract Tests — Breaking Changes Silent | Contracts | `SIGNIFICANT` | `OPEN` | Gate 4 |
| `RISK-018` | Decision Debt: AuthStrategy=OPEN, DataOwnership=AMBIGUOUS | Governance | `SIGNIFICANT` | `OPEN` | Gate 5 |
| `RISK-019` | No Business Metrics / Alerting | Observability | `WARNING` | `OPEN` | Gate 7 |
| `RISK-020` | No Backup Verification / PITR | Infrastructure | `WARNING` | `OPEN` | Gate 7 |

---

## 4. Detailed Risk Entries (BLOCKING)

### RISK-001: No JWT Validation — Trivial Auth Bypass

**Category:** Security | **Severity:** `BLOCKING` | **Status:** `OPEN`

**Description:** `JwtFilter` parses JWT without signature verification, expiry check, issuer/audience validation. Any string with valid JWT structure and `sub`/`roles` claims is accepted.

**Evidence:**
- Code: `JwtFilter.doFilterInternal()` uses `parser.parseClaimsJwt(token)` without `setSigningKey()`
- Config: `jwt.secret=hardcoded-secret-123` in `application-prod.yml`
- Penetration test (2023): "Trivial token forgery — any user can escalate to ADMIN"

**Impact:** Full authentication bypass. Any attacker can forge tokens with arbitrary roles.

**Affected Components:** All controllers (global filter)

**Traceability:**
- `CONSTRAINS` → `ADR-002` (Security Remediation)
- `VERIFIES` → `SPEC-001` (Security Spec)
- `SUPERSEDES` → Wiki "Security" v1.1

**Mitigation:** ADR-002 authorized — migrate to Auth0 OAuth2 with proper JWT validation. Immediate hotfix: add signature verification with current secret.

**Gate Blocking:** Gate 3 (Architecture), Gate 4 (Contracts), Gate 5 (Decisions), Gate 7 (Infrastructure)

---

### RISK-002: Hardcoded Secrets

**Category:** Security | **Severity:** `BLOCKING` | **Status:** `OPEN`

**Description:** Production secrets in plaintext configuration file deployed to EC2.

**Evidence:**
- `application-prod.yml`:
  ```yaml
  stripe:
    secret_key: sk_live_abc123...
  sap:
    username: orderflow
    password: sap-pass-123
  jwt:
    secret: hardcoded-secret-123
  ```

**Impact:** Secret exposure → Stripe account takeover, SAP unauthorized access, JWT forgery. No rotation, no audit trail.

**Affected Components:** StripeClient, SAPClient, JwtFilter

**Traceability:**
- `CONSTRAINS` → `ADR-002` (Security Remediation)
- `VERIFIES` → `SPEC-001` (Security Spec)

**Mitigation:** ADR-002 — Secrets Manager / Vault. Immediate: rotate all secrets, move to environment variables.

---

### RISK-003: SQL Injection in OrderRepository

**Category:** Security | **Severity:** `BLOCKING` | **Status:** `OPEN`

**Description:** `@Query` with string concatenation allows SQL injection via `customerEmail` parameter.

**Evidence:**
```java
@Query("SELECT * FROM orders WHERE customer_email = " + email + " AND status != 'CANCELLED'")
List<Order> findByCustomerEmail(String email);
```

**Impact:** Full database read/write via order lookup endpoint. Customer email parameter user-controlled.

**Affected Components:** `OrderRepository`, `CustomerController` (exposes endpoint)

**Traceability:**
- `CONSTRAINS` → `ADR-002`, `SPEC-001`

**Mitigation:** Parameterized query (immediate hotfix). ADR-002 — full security remediation.

---

### RISK-004: Unsigned Stripe Webhook

**Category:** Security | **Severity:** `BLOCKING` | **Status:** `OPEN`

**Description:** Stripe webhook endpoint accepts any POST without signature verification. Attacker can forge `payment_intent.succeeded` events.

**Evidence:**
```java
@PostMapping("/webhook")
public ResponseEntity<Void> stripeWebhook(@RequestBody String payload) {
    // NO stripe-signature header validation
    PaymentEvent event = objectMapper.readValue(payload, PaymentEvent.class);
    paymentService.handleEvent(event);
    return ResponseEntity.ok().build();
}
```

**Impact:** Payment fraud — attacker can mark orders paid without payment. Refund fraud via `charge.refunded` events.

**Affected Components:** `PaymentController.stripeWebhook()`

**Traceability:**
- `CONSTRAINS` → `ADR-002`, `SPEC-001`
- `CONSTRAINS` → `SEC-001` (Security Contract)

**Mitigation:** Immediate: add Stripe signature verification. ADR-002 — full remediation.

---

### RISK-005: Triple Order Ownership — Data Integrity

**Category:** Architecture | **Severity:** `BLOCKING` | **Status:** `OPEN`

**Description:** Three services directly modify `orders` table: `OrderService`, `PaymentService`, `InventoryService`. No single owner.

**Evidence:**
- Code: All three inject `OrderRepository`
- DB: `orders.updated_by` shows `ORDER_SERVICE`, `PAYMENT_SERVICE`, `INVENTORY_SERVICE`
- Invariant violations: 2% orders have `payment_total != order_total`

**Impact:** Data integrity violations, lost updates, race conditions, audit impossible.

**Affected Components:** `OrderService`, `PaymentService`, `InventoryService`, `orders` table

**Traceability:**
- `CONSTRAINS` → `ADR-001` (Target Architecture), `ADR-003` (Data Ownership)
- `SUPERSEDES` → Wiki "Architecture Overview" v2.1

**Mitigation:** ADR-003 (PROPOSED) — OrderService sole owner. Payment/Inventory via events. Strangler Fig extraction.

---

### RISK-006: Synchronous Stripe Call in Request Path

**Category:** Architecture | **Severity:** `BLOCKING` | **Status:** `OPEN`

**Description:** `OrderController.confirmOrder()` → `PaymentService.charge()` → synchronous Stripe API call (no timeout). Stripe downtime = order downtime. 3.2s P95 latency.

**Evidence:**
- Code: `PaymentService.charge()` calls `StripeClient.charge()` synchronously
- Traces: 3.2s P95, Stripe call = 2.8s
- No circuit breaker, no timeout, no fallback

**Impact:** Availability coupled to Stripe. Latency unacceptable. No resilience.

**Affected Components:** `OrderController`, `PaymentService`, `StripeClient`

**Traceability:**
- `CONSTRAINS` → `ADR-001`, `ADR-004` (External Calls)
- `CONSTRAINS` → `SPEC-002`, `SPEC-003`

**Mitigation:** ADR-004 (PROPOSED) — Async event-driven + circuit breaker.

---

## 5. Detailed Risk Entries (SIGNIFICANT)

### RISK-007: No Circuit Breakers / Retries / Timeouts

**Category:** Architecture | **Severity:** `SIGNIFICANT` | **Status:** `OPEN`

**Description:** All external calls (Stripe, SAP, EasyPost) lack resilience patterns.

**Evidence:**
- `StripeClient`: No timeout, no retry, no circuit breaker
- `SAPClient`: Spring WS, no timeout, no retry, no circuit breaker
- `EasyPostClient`: No timeout, no retry

**Impact:** Cascade failures, thread pool exhaustion, poor UX.

**Mitigation:** ADR-004 (PROPOSED) — Resilience4j on all external clients.

---

### RISK-008: No Contract Versioning / Governance

**Category:** Contracts | **Severity:** `SIGNIFICANT` | **Status:** `OPEN`

**Description:** APIs have no versioning. Breaking changes deployed without notice. No contract registry.

**Evidence:**
- Order API: 15 endpoints, no `/v1/` prefix
- Stripe webhook: No version tolerance
- SAP integration: No contract, fragile parsing

**Impact:** Consumers break silently. No compatibility guarantees.

**Mitigation:** ADR-005 (PROPOSED) — Contract Governance with versioning, Pact tests.

---

### RISK-009: SAP Integration Fragile

**Category:** Integration | **Severity:** `SIGNIFICANT` | **Status:** `OPEN`

**Description:** Nightly SAP sync has 40% failure rate, no alerting, no contract.

**Evidence:**
- `sap_sync_log`: 40% `FAILED` last 30 days
- Errors: "Connection timeout", "XML parse error", "Unexpected element"
- No circuit breaker, no retry, no dead letter queue
- No alerting — only visible in MongoDB collection

**Impact:** Stale catalog → pricing errors, inventory mismatch.

**Mitigation:** ADR-004 (circuit breaker), Contract Governance (SAP contract).

---

### RISK-010: No Test Coverage (0%)

**Category:** Quality | **Severity:** `SIGNIFICANT` | **Status:** `OPEN`

**Description:** Zero tests in any repository. No safety net for refactoring.

**Evidence:** `src/test` empty in `orderflow-api`, `orderflow-frontend`, `orderflow-infra`

**Impact:** Cannot verify fixes, cannot detect regressions, refactoring blocked.

**Mitigation:** SPEC-009 (Test Spec) — Start with contract tests, then integration, then unit.

---

### RISK-011: Single EC2 — No HA, No Rollback

**Category:** Infrastructure | **Severity:** `SIGNIFICANT` | **Status:** `OPEN`

**Description:** Production runs on single t3.large EC2. No autoscaling, no load balancer, no blue-green.

**Evidence:**
- Infrastructure: 1 EC2, no ASG, no ALB
- Deploy: `scp` + `systemctl restart`
- Rollback: Manual JAR replace (45 min)
- Incident Jan 2025: Bad deploy → 2h downtime

**Impact:** Single point of failure, deployment risk, no capacity headroom.

**Mitigation:** Target Infrastructure Spec — EKS/GKE, blue-green, health checks.

---

### RISK-012: No Staging Environment

**Category:** Infrastructure | **Severity:** `SIGNIFICANT` | **Status:** `OPEN`

**Description:** Deploys directly to production. No validation environment.

**Evidence:** Jenkins deploys to same EC2. No staging namespace/cluster.

**Impact:** Every deploy is production experiment.

**Mitigation:** Target Infrastructure Spec — staging environment in CI/CD.

---

### RISK-013: Spring Boot 2.7 EOL

**Category:** Technical Debt | **Severity:** `SIGNIFICANT` | **Status:** `OPEN`

**Description:** Spring Boot 2.7 reached EOL Nov 2023. No security patches.

**Evidence:** `pom.xml`: `<spring-boot.version>2.7.18</spring-boot.version>`

**Impact:** Unpatched CVEs, compliance risk.

**Mitigation:** Upgrade to Spring Boot 3.x (requires Java 17). Part of modular monolith migration.

---

### RISK-015: Overselling (3% Orders)

**Category:** Domain | **Severity:** `SIGNIFICANT` | **Status:** `OPEN`

**Description:** Inventory check reads stale MongoDB cache, no real-time SAP check, no compensation.

**Evidence:** Support tickets: 12/month "shipped but OOS". Data: reservation vs SAP mismatch 15%.

**Impact:** Customer trust, revenue loss, operational overhead.

**Mitigation:** ADR-001 target architecture — real-time check or saga with compensation.

---

### RISK-016: Payment/Order Total Mismatch (2%)

**Category:** Data Integrity | **Severity:** `SIGNIFICANT` | **Status:** `OPEN`

**Description:** 2% of orders have `payment_total != order_total` due to triple ownership race conditions.

**Evidence:** DB query: `SELECT * FROM orders WHERE payment_total != order_total` → ~1M rows

**Impact:** Financial reconciliation errors, audit failures.

**Mitigation:** ADR-003 (OrderService sole owner) + event-driven reconciliation.

---

### RISK-017: No Contract Tests

**Category:** Contracts | **Severity:** `SIGNIFICANT` | **Status:** `OPEN`

**Description:** Breaking changes deployed without detection. No Pact/contract tests.

**Evidence:** No contract test framework configured. API changes deployed directly.

**Impact:** Consumer breakage, integration failures.

**Mitigation:** ADR-005 (Contract Governance) + Pact implementation.

---

### RISK-018: Decision Debt

**Category:** Governance | **Severity:** `SIGNIFICANT` | **Status:** `OPEN`

**Description:** Critical architectural decisions never explicitly made.

| Decision | State | Impact |
|----------|-------|--------|
| `AuthStrategy` | `OPEN` | Custom JWT, no validation |
| `ConsistencyModel` | `UNKNOWN` | Sync vs async not decided |
| `DataOwnership` | `AMBIGUOUS` | 3 services write orders |
| `ErrorHandling` | `NONE` | Exceptions → 500 |

**Source:** `references/decision-governance.md` Section 22 (Decision Debt)

**Mitigation:** ADR-001..005 — explicit decisions for each.

---

## 6. Risk Summary by Gate

| Gate | BLOCKING Risks | SIGNIFICANT Risks | Result |
|------|----------------|-------------------|--------|
| Gate 1 (Product) | 0 | 2 (RISK-015, RISK-016) | `PASSED_WITH_RISKS` |
| Gate 2 (Domain) | 0 | 2 (RISK-015, RISK-016) | `PASSED_WITH_RISKS` |
| Gate 3 (Architecture) | **4** (001, 002, 003, 004, 005, 006) | 5 (007, 009, 010, 013, 018) | **`BLOCKED`** |
| Gate 4 (Contracts) | **4** (001, 002, 003, 004) | 3 (008, 009, 017) | **`BLOCKED`** |
| Gate 5 (Decisions) | 0 | 1 (018) | `IN_PROGRESS` |
| Gate 6 (Specs) | 0 | 1 (010) | `IN_PROGRESS` |
| Gate 7 (Infrastructure) | **4** (001, 002, 003, 004) | 4 (011, 012, 013, 020) | **`BLOCKED`** |
| Gate 8 (Release) | N/A | N/A | Not Evaluated |

---

## 7. Risk Mitigation Roadmap

| Phase | Focus | Risks Addressed | Timeline |
|-------|-------|-----------------|----------|
| **Immediate (Week 1-2)** | Security Hotfixes | RISK-001, 002, 003, 004 | Sprint 1 |
| **Sprint 2-3** | Security Remediation (ADR-002) | RISK-001, 002, 003, 004 | Sprint 2-3 |
| **Sprint 3-4** | Target Architecture (ADR-001, 003, 004) | RISK-005, 006, 007, 009 | Sprint 3-5 |
| **Sprint 4-5** | Contract Governance (ADR-005) | RISK-008, 017 | Sprint 4-5 |
| **Sprint 5-6** | Infrastructure Migration | RISK-011, 012, 019, 020 | Sprint 5-6 |
| **Ongoing** | Test Coverage (SPEC-009) | RISK-010 | Continuous |

---

## 8. Traceability

| Risk | Constrains | Verifies | Supersedes |
|------|------------|----------|------------|
| RISK-001..004 | `ADR-002`, `SPEC-001` | `SPEC-001` tests | Wiki "Security" v1.1 |
| RISK-005 | `ADR-001`, `ADR-003` | `SPEC-002` | Wiki "Architecture Overview" v2.1 |
| RISK-006 | `ADR-001`, `ADR-004` | `SPEC-002`, `SPEC-003` | — |
| RISK-007 | `ADR-004` | `SPEC-003` | — |
| RISK-008 | `ADR-005` | `SPEC-009` (contract tests) | — |
| RISK-009 | `ADR-004`, Contract Gov | `SPEC-003` | Wiki "ERP Integration" v1.2 |
| RISK-010 | — | `SPEC-009` | — |
| RISK-011, 012 | Infrastructure Spec | Infrastructure Spec | Wiki "Release Process" v1.0 |
| RISK-013 | `ADR-001` (migration) | `SPEC-002` | — |
| RISK-015, 016 | `ADR-001`, `ADR-003` | `SPEC-002` | — |
| RISK-018 | `ADR-001`..`005` | All Specs | — |

---

## 9. Evidence

| Risk | Evidence | Confidence |
|------|----------|------------|
| RISK-001 | Code (JwtFilter), Config, Penetration test | `HIGH` |
| RISK-002 | Config file (application-prod.yml) | `HIGH` |
| RISK-003 | Code (OrderRepository @Query) | `HIGH` |
| RISK-004 | Code (PaymentController.stripeWebhook) | `HIGH` |
| RISK-005 | Code (3 services inject OrderRepository), DB (updated_by) | `HIGH` |
| RISK-006 | Code (call chain), Traces (3.2s P95) | `HIGH` |
| RISK-007 | Code (StripeClient, SAPClient, EasyPostClient) | `HIGH` |
| RISK-008 | Code (no versioning), Deploy history | `HIGH` |
| RISK-009 | MongoDB (sap_sync_log), Code (SapClient) | `HIGH` |
| RISK-010 | Code (empty src/test) | `HIGH` |
| RISK-011 | Infra (single EC2), Jenkinsfile | `HIGH` |
| RISK-015 | Support tickets, Data (reservation vs SAP) | `HIGH` |
| RISK-016 | DB query (payment_total != order_total) | `HIGH` |
| RISK-018 | Decision Governance audit | `HIGH` |