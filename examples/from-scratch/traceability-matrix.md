# From-Scratch Traceability Matrix — BookNest (AC → Spec → Test → Evidence)

```text id="fs-trace-meta"
Document Metadata
```

| Field | Value |
|---|---|
| Document ID | `TRACE-FS-001` |
| Title | BookNest Delivery Traceability |
| Version | `1.0` |
| Status | `ACTIVE` |
| Project | `booknest` |
| Owner | `library-team` |

---

```text id="fs-trace-full"
Full chain
```

| Requirement | Capability | Invariant | Spec | AC | Test | Evidence | Status |
|---|---|---|---|---|---|---|---|
| `REQ-001` | `CAP-001` | `INV-001` | `SPEC-LENDING-001` | `AC-1` | `TEST-LEND-01` | `tests/lending/lend-book.test.*` | `DONE` |
| `REQ-003` | `CAP-001` | `INV-001` | `SPEC-LENDING-001` | `AC-2` | `TEST-LEND-02` | `tests/lending/lend-unavailable.test.*` | `DONE` |
| `REQ-002` | `CAP-001` | `INV-002` | `SPEC-LENDING-001` | `AC-3` | `TEST-LEND-03` | `tests/lending/lend-unknown-copy.test.*` | `DONE` |
| `REQ-002` | `CAP-001` | `INV-002` | `SPEC-LENDING-001` | `AC-4` | `TEST-LEND-04` | `tests/lending/lend-unknown-member.test.*` | `DONE` |
| `REQ-001` | `CAP-001` | `INV-001` | `SPEC-LENDING-001` | `AC-5` | `TEST-LEND-05` | `tests/lending/lend-concurrency.test.*` | `DONE` |

**Delivery:** `DONE` (all ACs satisfied with evidence; spec `APPROVED` → `VALIDATED`)

---

```text id="fs-trace-relationships"
Relationships used
```

- `DERIVES_FROM` (Spec → Product requirement)
- `REFINES` (Spec → Domain capability)
- `CONSTRAINS` (Invariant → Spec)
- `SPECIFIES` (Spec → AC)
- `VERIFIES` (Test → AC/Spec)
- `IMPLEMENTS` (Implementation → Spec)
- `JUSTIFIES` (Evidence → AC)
- `SUPPORTS` (Evidence → Delivery)
