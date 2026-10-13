# Product Context — BookNest (From-Scratch Example)

```text id="fs-pc-meta"
Document Metadata
```

| Field | Value |
|---|---|
| Document ID | `PROD-CTX-001` |
| Title | BookNest — Library Lending Service |
| Version | `1.0` |
| Status | `APPROVED` |
| Lifecycle Mode | `GREENFIELD` |
| Owner | `library-team` |
| Date | `2026-10-12` |
| Last Updated | `2026-10-12` |

---

```text id="fs-pc-purpose"
Purpose
```

Provide a correct, simple record of which physical library copy is lent to which member, starting with the lending action itself.

**Problem (`FACT`):**
Current Situation: Lending is tracked on paper or a spreadsheet.
Problem: It is easy to lend the same copy twice or to lose track of a loan.
Impact: Members and staff cannot trust availability.
Desired Outcome: A single lending action that atomically marks a copy as lent and records the loan.

**Product Vision (`FACT`):** A reliable circulation record for small libraries, starting from the lending action and growing only as evidence requires.

---

```text id="fs-pc-actors"
Target Users and Actors
```

| Actor | Description | Primary Need | Relevance |
|---|---|---|---|
| Staff (librarian) | Operates the desk | Lend a copy quickly and correctly | `PRIMARY` |
| Member | Borrows a copy | Receive a copy that is actually available | `SECONDARY` |

---

```text id="fs-pc-scope"
Product Scope
```

**In Scope (`DECISION`):**
- Lend an available copy to a member (create a loan).

**Out of Scope (`DECISION`):**
- Returns, renewals, fines, reservations, notifications.
- Catalog management (adding titles/copies).

**Deferred:**
- Barcode scanning; member self-service.

---

```text id="fs-pc-requirements"
Requirements
```

| ID | Requirement | Type | Priority | Status |
|---|---|---|---|---|
| `REQ-001` | A lent copy must not be lent again while the loan is active | `FUNCTIONAL` | `HIGH` | `ACCEPTED` |
| `REQ-002` | Every loan records the copy and the member | `DATA` | `HIGH` | `ACCEPTED` |
| `REQ-003` | A copy that is already lent cannot be lent again | `FUNCTIONAL` | `HIGH` | `ACCEPTED` |

---

```text id="fs-pc-constraints"
Constraints, Assumptions, Unknowns
```

| Type | ID | Statement | Confidence / Blocking |
|---|---|---|---|
| Constraint | `CON-001` | Small library; single team; no external systems | `FACT` |
| Assumption | `ASM-001` | A title has multiple copies; availability is per-copy | `MEDIUM` |
| Unknown | `UNK-001` | Whether barcode scanning is required | `NON_BLOCKING` |

---

```text id="fs-pc-outcomes"
Outcomes and Success Criteria
```

| ID | Outcome / Criterion | Measurement | Target |
|---|---|---|---|
| `OUT-001` | A copy is never lent to two members at once | Duplicate-active-loan count | `0` |
| `SC-001` | Lending succeeds for an available copy | Success on happy path | `100%` |

---

```text id="fs-pc-risks"
Major Risks
```

| ID | Risk | Probability | Impact | Mitigation |
|---|---|---|---|---|
| `RISK-001` | Concurrent lend of the same copy | `LOW` | `HIGH` | Enforce `INV-001` in the lending behavior (see spec) |

---

```text id="fs-pc-boundaries"
Product Boundaries
```

```text
Inside Product Boundary:
- Lend an available copy

Outside Product Boundary:
- Catalog management
- Returns / renewals / fines
- Notifications
```

---

```text id="fs-pc-gate"
Gate Result
```

```text
Gate: GATE-1 — Product Discovery
Result: PASSED
Blocking Issues: none
Non-Blocking Risks:
- UNK-001 (barcode scanning) — deferred, no impact on first behavior
Required Follow-Up:
- Proceed to Domain Discovery
```

---

```text id="fs-pc-trace"
Traceability
```

| Relationship | Artifact | Status |
|---|---|---|
| `DERIVES_FROM` | User request (statement of intent) | `VALID` |
| `REFINES` | `domain/domain-context.md` (via `CAP-001`) | `VALID` |
