# SDD/TDD Workflow (Project Summary)

```text id="sdd-1"
Purpose
```

This document summarizes the specification-gated delivery and optional TDD workflow for `<project>`. Full details live in the Spec-Gated Architecture Lifecycle skill references.

---

```text id="sdd-2"
Specification-Gated Delivery
```

**Rule:** Only `APPROVED` specifications are implementable.

**Preconditions:** ACs present, decisions closed, contracts frozen (if affected), DoD known, evidence plan.

**Reference:** `references/implementation-delivery-gate.md`

---

```text id="sdd-3"
Optional TDD Cycle
```

**When active:** `AC → RED → GREEN → REFACTOR`

- **RED:** Write smallest failing test proving AC not satisfied
- **GREEN:** Minimal code to pass
- **REFACTOR:** Clean up safely with all tests green

**Activation:** Opt-in per scope (record Y/N + rationale in spec Section 20).

**Reference:** `references/tdd-workflow.md`

---

```text id="sdd-4"
Delivery Report
```

Emit delivery report per DoD at implementation end:

```text
Spec: SPEC-XXX
Delivery Status: DONE | PARTIAL | BLOCKED
AC satisfied: X/Y
Evidence: [concrete paths]
Blockers: [or "none"]
```

**Reference:** `references/definition-of-done.md`
