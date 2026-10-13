# Behavior Specification: Update Ingredient (Condensed)

```text id="spec-cul-002-meta"
Document Metadata
```

| Field | Value |
|---|---|
| Document ID | `SPEC-CULINARY-002` |
| Title | Update Ingredient |
| Version | `1.0` |
| Status | `APPROVED` |
| Created | `2025-10-06` |
| Last Modified | `2025-10-08` |
| Project | `mealmind-app` |
| Owner | `culinary-team` |
| Reviewers | `architect, domain-expert` |

---

```text id="spec-cul-002-purpose"
Purpose
```

Update an existing culinary ingredient while preserving referential integrity and uniqueness constraints.

---

```text id="spec-cul-002-scope"
Scope
```

**In Scope:** Partial/full update, validation, optimistic update rules.  
**Out of Scope:** Delete, versioning strategy (future).

---

```text id="spec-cul-002-ac"
Acceptance Criteria
```

| AC ID | Given | When | Then |
|---|---|---|---|
| AC-1 | Existing ingredient, valid data | Update | Updated successfully |
| AC-2 | Non-existent id | Update | Not found error |
| AC-3 | Rename to existing name | Update | ERR-002 (duplicate) |
| AC-4 | Invalid values | Update | Validation errors |

---

```text id="spec-cul-002-tdd"
Test Plan & Traceability (AC → Test)
```

| AC ID | Test ID | Test Type | TDD | Notes |
|---|---|---|---|---|
| AC-1 | TEST-CUL-002-01 | behavior | Y | Happy path |
| AC-2 | TEST-CUL-002-02 | behavior | Y | Not found |
| AC-3 | TEST-CUL-002-03 | behavior | Y | Duplicate name |
| AC-4 | TEST-CUL-002-04 | behavior | Y | Validation |

**TDD Activation:** Y

---

```text id="spec-cul-002-status"
Status
```

`APPROVED` (implementable per gate)
