# Contract Governance — MealPlanner Pro

## 1. Document Metadata

| Field | Value |
|-------|-------|
| Document ID | `CNT-GOV-001` |
| Version | `0.2` |
| Status | `IN_REVIEW` |
| Created | `2025-01-27` |
| Updated | `2025-01-29` |
| Project | MealPlanner Pro |
| Lifecycle Phase | Contracts |
| Owner | Architect |
| Reviewers | Technical Lead, Security Officer |

---

## 2. Purpose

Define the governance rules for all contracts in MealPlanner Pro. Establishes versioning, compatibility, review process, and ownership.

---

## 3. Contract Inventory

| Contract ID | Name | Type | Owner | Consumers | Status |
|-------------|------|------|-------|-----------|--------|
| `API-001` | MealPlan API | REST API | Nutrition Planning | Practitioner Frontend (MVP: API direct), Future Client Portal | `ACTIVE` |
| `API-002` | Client API | REST API | Client Management | Practitioner Frontend | `ACTIVE` |
| `EVT-001` | Domain Events | Event Contract | All Contexts (Publisher) | Compliance, Integration, Client Management | `ACTIVE` |
| `DAT-001` | Data Contracts | Data Contract | All Contexts | All Contexts (shared schemas) | `ACTIVE` |
| `SEC-001` | Security Contract | Security Contract | All Contexts | All Contexts | `ACTIVE` |
| `OBS-001` | Observability Contract | Observability Contract | All Contexts | Operations, Monitoring | `ACTIVE` |

---

## 4. Versioning Strategy

**API Contracts:** URL versioning (`/v1/`, `/v2/`)
- Backward compatibility guaranteed for 12 months
- Breaking changes → new version (`/v2/`)
- Deprecation notice 6 months before removal

**Event Contracts:** Schema version in event envelope (`"schemaVersion": 1`)
- Additive changes only (new optional fields)
- Breaking changes → new event type (`MealPlanGeneratedV2`)

**Data Contracts:** Database migration-based (Flyway/Liquibase)
- Backward compatible migrations only
- Column additions: nullable or with default
- Column removals: soft delete → deprecate → remove after 2 versions

---

## 5. Compatibility Rules

| Change Type | API | Event | Data |
|-------------|-----|-------|------|
| Add optional field | ✅ Compatible | ✅ Compatible | ✅ Compatible |
| Add required field | ❌ Breaking | ❌ Breaking | ❌ Breaking (unless default) |
| Remove field | ❌ Breaking | ❌ Breaking | ❌ Breaking |
| Change field type | ❌ Breaking | ❌ Breaking | ❌ Breaking |
| Add enum value | ✅ Compatible | ✅ Compatible | ✅ Compatible |
| Remove enum value | ❌ Breaking | ❌ Breaking | ❌ Breaking |
| Change error format | ❌ Breaking | N/A | N/A |
| Add new endpoint/event | ✅ Compatible | ✅ Compatible | N/A |

---

## 6. Contract Review Process

1. **Proposal:** Contract author creates/updates contract document
2. **Review:** Architect + Consumer representatives review
3. **Compatibility Check:** Automated (Pact/contract tests) + Manual
4. **Approval:** Contract Owner + Consumer Lead sign-off
5. **Publication:** Published to contract registry (OpenAPI/AsyncAPI specs)
6. **Monitoring:** Contract tests run in CI for each consumer

---

## 7. Ownership

| Contract | Owner Context | Authority |
|----------|---------------|-----------|
| `API-001` | Nutrition Planning | Domain Expert + Architect |
| `API-002` | Client Management | Domain Expert + Architect |
| `EVT-001` | Respective Publisher | Each context owns its events |
| `DAT-001` | Respective Context | Each context owns its schema |
| `SEC-001` | Compliance + Security | Security Officer |
| `OBS-001` | Integration + Operations | Technical Lead |

---

## 8. Error Semantics

**HTTP Status Codes:**
- `200` OK
- `201` Created
- `400` Bad Request (validation error)
- `401` Unauthorized (invalid/missing token)
- `403` Forbidden (insufficient role/consent)
- `404` Not Found
- `409` Conflict (optimistic lock, duplicate)
- `422` Unprocessable Entity (business rule violation)
- `429` Too Many Requests (rate limit)
- `500` Internal Server Error
- `503` Service Unavailable (circuit breaker open)

**Error Response Format:**
```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Human-readable description",
    "details": [
      {"field": "macroTargets.protein", "issue": "Must be between 10-35%"}
    ],
    "traceId": "abc-123"
  }
}
```

---

## 9. Security Contract (`SEC-001`)

**Authentication:** OAuth2 Authorization Code Flow (Auth0)
- Practitioner logs in → Auth0 → JWT with `sub`, `roles`, `org_id`
- API validates JWT signature (JWKS), expiry, audience

**Authorization:**
- Role-based: `practitioner`, `admin`, `assistant`
- Resource-based: Practitioner can only access own clients' data
- Consent-based: `REQ-010` — Plan generation requires active consent for `meal_planning` purpose

**Data Protection:**
- TLS 1.2+ for all external communication
- AES-256 at rest (managed keys)
- Field-level encryption for: health conditions, restriction details, consent records

**Audit:** All health data access logged (who, what, when, purpose, outcome)

---

## 10. Observability Contract (`OBS-001`)

**Logging:** Structured JSON (OpenTelemetry)
- Fields: `timestamp`, `level`, `traceId`, `spanId`, `service`, `module`, `message`, `attributes`
- Health data access: `audit.health_data_access` level

**Metrics (Prometheus):**
- `mealplan_generation_duration_seconds` (histogram)
- `mealplan_generation_total` (counter: success, failure, validation_error)
- `usda_api_requests_total` (counter: success, failure, rate_limited)
- `http_request_duration_seconds` (histogram, by endpoint)
- `active_practitioners` (gauge)

**Tracing:** OpenTelemetry (W3C TraceContext)
- Trace propagation: HTTP headers, event bus headers
- Span attributes: `module`, `operation`, `client_id`, `plan_id`

**Alerts:**
- Generation p95 > 25s (warning), > 30s (critical)
- USDA API failure rate > 5% (warning)
- Circuit breaker open (critical)

---

## 11. Contract Review Status

```
Gate: GATE-4 — Contracts
Status: PASSED

Satisfied:
✓ API contracts (2) defined with versioning
✓ Event contract defined with schema versioning
✓ Data contracts per context schema
✓ Security contract (auth, authz, encryption, audit)
✓ Observability contract (logs, metrics, traces, alerts)
✓ Compatibility rules established
✓ Review process defined
✓ Ownership assigned

Non-Blocking Risks:
⚠ Contract test framework not yet implemented (Sprint 3)
⚠ Consumer-driven contract validation not yet configured

Required Follow-Up:
1. Implement Pact/contract tests for API-001, API-002 (Sprint 3)
2. Configure contract test in CI pipeline
3. Publish OpenAPI/AsyncAPI specs to registry
```