# MealMind Example — Spec-Gated Delivery in Practice

```text id="mm-1"
Purpose
```

This example shows how MealMind (culinary ingredient management) instantiates the Spec-Gated Architecture Lifecycle skill with specification-gated delivery and optional TDD. It is **illustrative only** — values are MealMind-specific and live only here (not in bootstrap/templates).

**Context:** MealMind repository uses spec-gated approach; `SPEC-CULINARY-001` is `APPROVED` + implemented; `SPEC-CULINARY-002` is `APPROVED`.

---

```text id="mm-2"
Contents
```

- `behavior-specification-create-ingredient.md` — Condensed SPEC-CULINARY-001 (APPROVED + implemented)
- `behavior-specification-update-ingredient.md` — Condensed SPEC-CULINARY-002 (APPROVED)
- `traceability-matrix.md` — AC → Test mapping
- `definition-of-done-report.md` — Example delivery report

---

```text id="mm-3"
Notes
```

- Statuses follow vocabulary: `DRAFT→REVIEW→APPROVED→IMPLEMENTING→VALIDATED`
- Only `APPROVED` specs implementable
- TDD activated here (non-trivial validation/rules)
- Evidence-based DoD
