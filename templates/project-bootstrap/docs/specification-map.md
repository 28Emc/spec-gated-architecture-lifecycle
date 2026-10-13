# Specification Map

```text id="specmap-1"
Document Metadata
```

| Field | Value |
|---|---|
| Document ID | `SPEC-MAP-001` |
| Title | Specification Map — `<project>` |
| Version | `0.1` |
| Status | `DRAFT` |
| Created | `<date>` |
| Last Modified | `<date>` |
| Owner | `<owner>` |

---

```text id="specmap-2"
Purpose
```

Registry of all behavior/specification documents. Enforces status vocabulary and the specification gate.

---

```text id="specmap-3"
Specification Status Vocabulary
```

| Status | Meaning | Implementable? |
|---|---|---|
| `DRAFT` | Work in progress | No |
| `REVIEW` | Under review | No |
| `APPROVED` | Approved for implementation (gate passed) | **Yes** |
| `IMPLEMENTING` | Actively being implemented | No (already in progress) |
| `VALIDATED` | Implemented and validated against DoD | No |
| `DEPRECATED` | Superseded or no longer relevant | No |
| `BLOCKED` | Blocked; cannot proceed | No |
| `CANCELLED` | Withdrawn | No |

**Rule:** Only `APPROVED` specifications may be implemented. Absence of status is not approval.

---

```text id="specmap-4"
Specification Numbering
```

| Prefix | Type | Range |
|---|---|---|
| `SPEC-` | Behavior/functional specification | 001-999 |
| `SPEC-API-` | API specification | 001-999 |
| `SPEC-COMP-` | Component specification | 001-999 |
| `SPEC-DATA-` | Data specification | 001-999 |
| `SPEC-EVT-` | Event specification | 001-999 |
| `SPEC-SEC-` | Security specification | 001-999 |
| `SPEC-INFRA-` | Infrastructure specification | 001-999 |

Adjust prefixes to project needs. Keep numbering unique.

---

```text id="specmap-5"
Registry
```

| Spec ID | Title | Status | Version | Owner | Linked ADRs | Notes |
|---|---|---|---|---|---|---|
| <TBD> | <TBD> | `DRAFT` | 0.1 | `<owner>` | <TBD> | <TBD> |

---

```text id="specmap-6"
Gate Rules
```

- Pre-implementation: use `templates/specifications/specification-delivery-review.md`.
- Implementation only when status becomes `APPROVED` after review.
- On start: set to `IMPLEMENTING` (with rationale).
- On completion: set to `VALIDATED` only after DoD satisfied and delivery report issued.
