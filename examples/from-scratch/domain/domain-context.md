# Domain Context — BookNest (From-Scratch Example)

```text id="fs-dc-meta"
Document Metadata
```

| Field | Value |
|---|---|
| Document ID | `DOM-CTX-001` |
| Version | `1.0` |
| Status | `ACCEPTED` |
| Lifecycle Phase | Domain Discovery |
| Discovery Mode | `GREENFIELD` |
| Project | `booknest` |
| Discovery Scope | Circulation — lending a copy |
| Owner | `library-team` |
| Reviewers | `domain-expert` |
| Related Product Artifacts | `product/product-context.md` |

---

```text id="fs-dc-statement"
Domain Statement
```

```text
Domain Statement:
The system operates in the domain of library circulation.
The domain exists to keep an accurate record of which physical copy is lent to whom.
The primary business problem addressed is untrustworthy availability.
The domain produces value by making lending reliable and unambiguous.
```

---

```text id="fs-dc-scope"
Domain Scope
```

```text
Included Capabilities:
- Lend a copy (CAP-001)

Excluded Capabilities:
- Catalog management
- Returns, renewals, fines

Deferred Areas:
- Reservations, notifications
```

---

```text id="fs-dc-capabilities"
Business Capabilities
```

| Field | Value |
|---|---|
| ID | `CAP-001` |
| Name | Lend Copy |
| Purpose | Make a specific available copy unavailable to others by assigning it to one member through a loan |
| Business Value | Guarantees a copy has at most one active loan |
| Actors | Staff (initiator), Member (borrower) |
| Rules | `R-001`: only an available copy can be lent |
| Classification | `SUPPORTING` |

---

```text id="fs-dc-concepts"
Domain Concepts
```

| Concept | Meaning | Classification | Confidence |
|---|---|---|---|
| Copy | A single physical item that can be on loan | `ENTITY` | `HIGH` |
| Loan | The commitment of one copy to one member | `ENTITY` | `HIGH` |
| Member | The person who borrows a copy | `ENTITY` | `HIGH` |

---

```text id="fs-dc-glossary"
Domain Language
```

| Term | Definition | Status |
|---|---|---|
| Copy | A physical item of a title | `ACCEPTED` |
| Loan | An active commitment of a copy to a member | `ACCEPTED` |
| Available | A copy with no active loan | `ACCEPTED` |

---

```text id="fs-dc-invariants"
Invariants
```

| ID | Invariant | Source |
|---|---|---|
| `INV-001` | A copy cannot be on more than one active loan at a time | `FACT` (domain rule) |
| `INV-002` | A loan references exactly one copy and one member | `FACT` (domain rule) |

---

```text id="fs-dc-events"
Domain Events
```

| Event | Meaning | Trigger |
|---|---|---|
| `CopyLent` | A copy has been assigned to a member via a loan | Successful lend |

---

```text id="fs-dc-boundaries"
Candidate Boundaries
```

```text
Candidate Boundary: Circulation vs Catalog
Evidence:
- Different responsibilities (lending vs describing titles)
Confidence: LOW
Status: PROPOSAL
Decision: NOT accepted. With a single capability, a separate bounded context is not justified.
```

**Rule respected:** a bounded context is not a microservice. No decomposition is inferred here.

---

```text id="fs-dc-unknowns"
Unknowns and Assumptions
```

| Type | ID | Statement | Classification |
|---|---|---|---|
| Unknown | `UNK-001` | Barcode scanning required? | `NON_BLOCKING` |
| Assumption | `ASM-001` | Availability is per-copy | `DECISION_RELEVANT` (validated for first spec) |

---

```text id="fs-dc-gate"
Domain Discovery Gate
```

```text
Gate: GATE-2 — Domain Discovery
Result: PASSED
Notes:
- Capability, concepts, invariants, and event identified
- No blocking ownership ambiguity
- Architecture-relevant implications: none requiring decomposition
```

---

```text id="fs-dc-trace"
Domain Traceability
```

| Relationship | Target | Status |
|---|---|---|
| `DERIVES_FROM` | `PROD-CTX-001` / `REQ-001` | `VALID` |
| `REALIZES` | `CAP-001` → `OUT-001` | `VALID` |
| `CONSTRAINS` | `INV-001` → `SPEC-LENDING-001` | `VALID` |
