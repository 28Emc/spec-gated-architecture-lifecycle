# MealMind Traceability Matrix (AC → Spec → Test → Evidence)

```text id="mm-trace-1"
Document Metadata
```

| Field | Value |
|---|---|
| Document ID | `TRACE-MM-001` |
| Title | MealMind Delivery Traceability |
| Version | `0.1` |
| Status | `ACTIVE` |
| Project | `mealmind-app` |
| Owner | `culinary-team` |

---

```text id="mm-trace-2"
SPEC-CULINARY-001: Create Ingredient
```

| AC ID | Spec | Test ID | Test Type | Evidence Path | Status |
|---|---|---|---|---|---|
| AC-1 | SPEC-CULINARY-001 | TEST-CUL-001-01 | behavior | `tests/ingredients/create-happy.test.*` | `DONE` |
| AC-2 | SPEC-CULINARY-001 | TEST-CUL-001-02 | behavior | `tests/ingredients/create-duplicate.test.*` | `DONE` |
| AC-3 | SPEC-CULINARY-001 | TEST-CUL-001-03 | behavior | `tests/ingredients/create-missing.test.*` | `DONE` |
| AC-4 | SPEC-CULINARY-001 | TEST-CUL-001-04 | behavior | `tests/ingredients/create-negative.test.*` | `DONE` |

**Delivery:** `DONE` (all ACs satisfied with evidence; spec APPROVED+IMPLEMENTED)

---

```text id="mm-trace-3"
SPEC-CULINARY-002: Update Ingredient
```

| AC ID | Spec | Test ID | Test Type | Evidence Path | Status |
|---|---|---|---|---|---|
| AC-1 | SPEC-CULINARY-002 | TEST-CUL-002-01 | behavior | `tests/ingredients/update-happy.test.*` | `DONE` |
| AC-2 | SPEC-CULINARY-002 | TEST-CUL-002-02 | behavior | `tests/ingredients/update-notfound.test.*` | `DONE` |
| AC-3 | SPEC-CULINARY-002 | TEST-CUL-002-03 | behavior | `tests/ingredients/update-duplicate.test.*` | `DONE` |
| AC-4 | SPEC-CULINARY-002 | TEST-CUL-002-04 | behavior | `tests/ingredients/update-invalid.test.*` | `DONE` |

**Delivery:** `DONE`

---

```text id="mm-trace-4"
Relationships Used
```

- `SPECIFIES` (AC→Spec)
- `VERIFIES` (Test→Spec/AC)
- `IMPLEMENTS` (Impl→Spec)
- `JUSTIFIES` (Evidence→AC)
- `SUPPORTS` (Evidence→Delivery)
