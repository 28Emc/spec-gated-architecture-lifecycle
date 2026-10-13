# Behavior Specification: Lend Book (From-Scratch Example)

```text id="fs-spec-meta"
Document Metadata
```

| Field | Value |
|---|---|
| Document ID | `SPEC-LENDING-001` |
| Title | Lend Book |
| Version | `1.0` |
| Status | `VALIDATED` |
| Created | `2026-10-12` |
| Last Modified | `2026-10-12` |
| Project | `booknest` |
| Owner | `library-team` |
| Reviewers | `domain-expert, staff-representative` |

**Status history:** `DRAFT` → `REVIEW` → `APPROVED` → `IMPLEMENTING` → `VALIDATED`

---

```text id="fs-spec-purpose"
Purpose
```

Allow staff to lend a specific available copy to a member, creating a loan and guaranteeing `INV-001` (a copy has at most one active loan).

---

```text id="fs-spec-scope"
Scope
```

**In Scope:**
- Lend an available copy to a member; create a loan; mark the copy unavailable.

**Out of Scope:**
- Returns, renewals, fines, reservations, catalog management.

---

```text id="fs-spec-actors"
Actors
```

| Actor | Description |
|---|---|
| Staff | Initiates the lending action |
| System | Validates availability and persists the loan |

---

```text id="fs-spec-glossary"
Glossary / Ubiquitous Language
```

| Term | Definition |
|---|---|
| Copy | A physical item that can be on loan |
| Member | A person who borrows a copy |
| Loan | An active commitment of a copy to a member |
| Available | A copy with no active loan |

---

```text id="fs-spec-preconditions"
Preconditions
```

- The member exists and is eligible to borrow.
- The copy exists.

---

```text id="fs-spec-input"
Input
```

| Field | Type | Constraints | Required | Mutability |
|---|---|---|---|---|
| copyId | string | must reference an existing copy | Y | read |
| memberId | string | must reference an existing member | Y | read |

---

```text id="fs-spec-rules"
Business Rules / Invariants
```

| Rule ID | Rule | Rationale |
|---|---|---|
| BR-1 | Only an available copy may be lent | Enforces `INV-001` |
| BR-2 | A loan references exactly one copy and one member | Enforces `INV-002` |
| BR-3 | A lent copy becomes unavailable | Availability reflects active loans |

---

```text id="fs-spec-validation"
Validation & Error Catalog
```

| Error Code | Condition | Message | HTTP/Domain Mapping |
|---|---|---|---|
| ERR-001 | Copy does not exist | Copy not found | 404 / NotFound |
| ERR-002 | Member does not exist | Member not found | 404 / NotFound |
| ERR-003 | Copy already on an active loan | Copy not available | 409 / Conflict |

---

```text id="fs-spec-behavior"
Behavior / Process
```

**Happy Path:**
1. Receive `copyId` and `memberId`.
2. Validate copy exists (`ERR-001` otherwise).
3. Validate member exists (`ERR-002` otherwise).
4. Check the copy has no active loan (`ERR-003` otherwise).
5. Create a loan linking the copy and member.
6. Mark the copy unavailable.
7. Emit domain event `CopyLent`.

**Alternates:**
- ALT-1: Copy unavailable → return `ERR-003`; no loan is created.

**Exceptions:**
- EX-1: Concurrent lend of the same copy → the losing attempt returns `ERR-003` (atomic availability check).

---

```text id="fs-spec-states"
State Transitions
```

| From | Event | To | Guard | Action |
|---|---|---|---|---|
| Available | Lend | OnLoan | No active loan | Create loan; emit `CopyLent` |
| OnLoan | Lend | OnLoan | — | Reject `ERR-003` |

---

```text id="fs-spec-api"
API Impact
```

| Endpoint/Method | Change Type | Contract Ref | Notes |
|---|---|---|---|
| `POST /loans` | add | n/a (no external contract; internal) | See Gate 4 result (contract `NOT_REQUIRED`) |

---

```text id="fs-spec-event"
Event Impact
```

| Event | Change Type | Contract Ref | Notes |
|---|---|---|---|
| `CopyLent` | add | n/a | Domain event; not a messaging contract |

---

```text id="fs-spec-data"
Data / Persistence Impact
```

- Entities: `Loan` (new), `Copy` (availability flag / active-loan link)
- Schema changes: add `loan` record; add copy availability
- Migration needed: N (new capability)
- Backward compatibility: N/A

---

```text id="fs-spec-security"
Security & Authorization
```

- AuthN required: N (internal desk operation for this example)
- AuthZ rules: staff-only in the consuming application
- Sensitive data: member association (minimal)
- Security contract ref: n/a

---

```text id="fs-spec-config"
Configuration
```

| Key | Type | Default | Required | Notes |
|---|---|---|---|---|
| — | — | — | N | no configuration for this behavior |

---

```text id="fs-spec-observability"
Observability
```

- Logs: lending attempts with `copyId`, `memberId`, outcome
- Metrics: `loans.created`, `loans.rejected_unavailable`
- Traces: lend flow span across validation + persistence
- Alerts: spike in `loans.rejected_unavailable`

---

```text id="fs-spec-nfr"
Non-Functional Expectations
```

| Aspect | Target | Notes |
|---|---|---|
| Performance | < 100 ms p95 (local) | Small library scale |
| Availability | N/A | single instance |
| Consistency | Strong for `INV-001` | availability check is atomic |
| Idempotency | N | duplicate lend returns `ERR-003` |

---

```text id="fs-spec-ac"
Acceptance Criteria
```

| AC ID | Given | When | Then | Priority |
|---|---|---|---|---|
| AC-1 | An available copy and a valid member | Lend the copy | A loan is created and the copy is unavailable | P0 |
| AC-2 | A copy already on an active loan | Lend the copy | `ERR-003` is returned and no new loan is created | P0 |
| AC-3 | A non-existent copy | Lend | `ERR-001` is returned | P1 |
| AC-4 | A non-existent member | Lend | `ERR-002` is returned | P1 |
| AC-5 | Two concurrent lends of the same available copy | Lend both | Exactly one succeeds; the other returns `ERR-003` | P0 |

---

```text id="fs-spec-testplan"
Test Plan & Traceability (AC → Test)
```

| AC ID | Test ID | Test Type | TDD | Notes |
|---|---|---|---|---|
| AC-1 | TEST-LEND-01 | behavior | Y | Happy path |
| AC-2 | TEST-LEND-02 | behavior | Y | Unavailable copy |
| AC-3 | TEST-LEND-03 | behavior | Y | Unknown copy |
| AC-4 | TEST-LEND-04 | behavior | Y | Unknown member |
| AC-5 | TEST-LEND-05 | behavior | Y | Concurrency on `INV-001` |

**TDD Activation:** Y (rationale: invariant `INV-001` + validation errors + concurrency — non-trivial behavior)

---

```text id="fs-spec-deps"
Dependencies
```

| Dependency | Type | Spec/Contract Ref | Notes |
|---|---|---|---|
| Copy existence | internal | `DOM-CTX-001` (`Copy`) | Precondition |
| Member existence | internal | `DOM-CTX-001` (`Member`) | Precondition |

---

```text id="fs-spec-risks"
Risks & Open Questions
```

| ID | Type | Description | Mitigation | Status |
|---|---|---|---|---|
| RISK-1 | risk | Concurrent lends race on availability | Atomic availability check (`AC-5`) | RESOLVED |
| Q-1 | question | Barcode input required? | Deferred; input remains `copyId` | OPEN (non-blocking) |

---

```text id="fs-spec-decisions"
Open Decisions
```

| Decision | Impact | Escalate to ADR? | Rationale |
|---|---|---|---|
| Availability enforced locally (single component) | low | N | Local consistency rule; reversible; no ownership/trust change |

**Note:** Local decisions live in the specification. Architectural decisions escalate to an ADR. Here no escalation was required.

---

```text id="fs-spec-trace"
Traceability
```

| Relationship | Target | Status |
|---|---|---|
| DERIVES_FROM | `PROD-CTX-001` (`REQ-001`, `REQ-003`) | `VALID` |
| REFINES | `DOM-CTX-001` (`CAP-001`) | `VALID` |
| CONSTRAINS | `INV-001` | `VALID` |
| SPECIFIES | `AC-1..AC-5` | `VALID` |
| VERIFIES | `TEST-LEND-01..05` | `VALID` |
| IMPLEMENTS | `CAP-001` | `VALID` |
