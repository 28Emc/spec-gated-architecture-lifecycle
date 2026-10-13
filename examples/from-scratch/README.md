# From-Scratch Example — BookNest

```text id="fs-1"
Purpose
```

This example shows how to use **spec-gated-architecture-lifecycle** when you do **not** have a project yet: how to make the skill available, bootstrap a spec-gated workspace from an empty directory, and drive the lifecycle until the first behavior specification is `APPROVED` and implemented.

It is **illustrative only**. BookNest values are fictional and live only in this folder — they are never copied into `templates/` or `templates/project-bootstrap/`.

---

```text id="fs-2"
How this differs from the other examples
```

| Example | Starting point | Focus |
|---|---|---|
| `examples/greenfield/` | Product context already exists | Full lifecycle depth (LEVEL 2 — STANDARD) |
| `examples/existing-system/` | A running legacy system | Documented vs Actual vs Target |
| `examples/mealmind/` | An already spec-gated repo | Delivery gate + TDD + DoD in practice |
| **`examples/from-scratch/`** | **Empty directory — nothing exists** | **Activation + bootstrap + first approved spec** |

---

```text id="fs-3"
Scenario
```

**Product:** BookNest — a small library lending service. Members borrow available copies of a title; staff track loans.

**Lifecycle Mode:** `GREENFIELD`

**Project Sizing:** `LIGHT` (single capability, low domain complexity, fully reversible, no external integrations)

**Why LIGHT:** A single bounded capability does not justify the full lifecycle depth. Architecture, contracts, and ADRs are evaluated and marked `NOT_REQUIRED` with explicit rationale rather than produced by ceremony.

---

```text id="fs-4"
Contents
```

| File | What it shows |
|---|---|
| `README.md` | This file — overview and directory map |
| `scenario-guide.md` | Step-by-step narrative from empty directory to implemented spec |
| `product/product-context.md` | Phase 1 output (condensed) |
| `domain/domain-context.md` | Phase 2 output (condensed) |
| `specifications/behavior-specification-lend-book.md` | Phase 6 output: `SPEC-LENDING-001` (`APPROVED` → `VALIDATED`) |
| `specifications/specification-delivery-review.md` | Phase 6.5 pre-implementation gate (`READY` / `PASSED`) |
| `definition-of-done-report.md` | Evidence-based delivery report (`DONE`) |
| `traceability-matrix.md` | `AC → Spec → Test → Evidence` |

---

```text id="fs-5"
Directory map
```

```text
from-scratch/
├── README.md
├── scenario-guide.md
├── product/
│   └── product-context.md
├── domain/
│   └── domain-context.md
├── specifications/
│   ├── behavior-specification-lend-book.md
│   └── specification-delivery-review.md
├── definition-of-done-report.md
└── traceability-matrix.md
```

---

```text id="fs-6"
Read order
```

1. `scenario-guide.md` — the reasoning process (start here).
2. `product/product-context.md` → `domain/domain-context.md` — how understanding is built.
3. `specifications/behavior-specification-lend-book.md` — the implementable artifact.
4. `specifications/specification-delivery-review.md` → `definition-of-done-report.md` → `traceability-matrix.md` — gate, delivery, evidence.

---

```text id="fs-7"
Conventions reused (not reinvented)
```

- Specification status: `DRAFT → REVIEW → APPROVED → IMPLEMENTING → VALIDATED` (+ terminals). Only `APPROVED` is implementable.
- Review outcome: `READY / READY_WITH_RISKS / INCOMPLETE / BLOCKED`; gate state: `PASSED / PASSED_WITH_RISKS / BLOCKED / WAIVED`.
- Delivery status: `DONE / PARTIAL / BLOCKED`.
- Epistemic markers: `FACT`, `ASSUMPTION`, `PROPOSAL`, `DECISION`, `UNKNOWN`, `CONFLICTING`.

> **Examples are illustrative, not authoritative.** The templates, references, and rules in this skill remain the source of process conventions.
