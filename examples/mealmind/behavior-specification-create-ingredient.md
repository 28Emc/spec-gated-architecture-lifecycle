# Behavior Specification: Create Ingredient (Condensed)

```text id="spec-cul-001-meta"
Document Metadata
```

| Field | Value |
|---|---|
| Document ID | `SPEC-CULINARY-001` |
| Title | Create Ingredient |
| Version | `1.0` |
| Status | `APPROVED` |
| Created | `2025-10-01` |
| Last Modified | `2025-10-05` |
| Project | `mealmind-app` |
| Owner | `culinary-team` |
| Reviewers | `architect, domain-expert` |

---

```text id="spec-cul-001-purpose"
Purpose
```

Allow authorized users to create a culinary ingredient with validated identity, categorization, unit constraints, and storage metadata.

---

```text id="spec-cul-001-scope"
Scope
```

**In Scope:** Create ingredient via API; validation; persistence; audit fields.  
**Out of Scope:** Update/delete (separate specs), bulk import.

---

```text id="spec-cul-001-actors"
Actors
```

| Actor | Description |
|---|---|
| User (authenticated) | Creates ingredient |
| System | Validates/persists |

---

```text id="spec-cul-001-glossary"
Glossary / Ubiquitous Language
```

| Term | Definition |
|---|---|
| Ingredient | Culinary ingredient entity |
| Category | Ingredient category |
| Base Unit | Default unit of measure |

---

```text id="spec-cul-001-input"
Input
```

| Field | Type | Constraints | Required |
|---|---|---|---|
| name | string | 1-100 chars, unique | Y |
| category | enum | allowed set | Y |
| baseUnit | enum | allowed set | Y |
| caloriesPer100g | decimal | >=0 | Y |
| description | string | max 500 | N |

---

```text id="spec-cul-001-rules"
Business Rules / Invariants
```

| Rule ID | Rule | Rationale |
|---|---|---|
| BR-001 | Name is unique (case-insensitive) | Prevent duplicates |
| BR-002 | CaloriesPer100g >= 0 | Valid nutritional data |
| BR-003 | baseUnit consistent with category constraints | Domain validity |

---

```text id="spec-cul-001-validation"
Validation & Error Catalog
```

| Error Code | Condition | Message |
|---|---|---|
| ERR-001 | Name empty/too long | Invalid name |
| ERR-002 | Duplicate name | Ingredient already exists |
| ERR-003 | Invalid category/unit | Invalid reference |

---

```text id="spec-cul-001-ac"
Acceptance Criteria
```

| AC ID | Given | When | Then |
|---|---|---|---|
| AC-1 | Valid ingredient data | Create | Ingredient created with id |
| AC-2 | Duplicate name | Create | ERR-002 returned |
| AC-3 | Missing required field | Create | Validation error |
| AC-4 | Negative calories | Create | ERR-003/validation error |

---

```text id="spec-cul-001-tdd"
Test Plan & Traceability (AC → Test)
```

| AC ID | Test ID | Test Type | TDD | Notes |
|---|---|---|---|---|
| AC-1 | TEST-CUL-001-01 | behavior | Y | Happy path |
| AC-2 | TEST-CUL-001-02 | behavior | Y | Duplicate |
| AC-3 | TEST-CUL-001-03 | behavior | Y | Missing fields |
| AC-4 | TEST-CUL-001-04 | behavior | Y | Negative calories |

**TDD Activation:** Y (business rules + validation)

---

```text id="spec-cul-001-status"
Implementation Status
```

**Status:** `APPROVED` → `IMPLEMENTING` → `VALIDATED` (example)
