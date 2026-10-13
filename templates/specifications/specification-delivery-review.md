# Specification Delivery Review Template (Pre-Implementation Gate)

```text id="sdr-1"
Document Metadata
```

| Field | Value |
|---|---|
| Document ID | `REV-SPEC-XXX` |
| Title | Delivery Review — <SPEC-XXX> |
| Version | `0.1` |
| Status | `DRAFT` |
| Created | `<date>` |
| Last Modified | `<date>` |
| Project | `<project>` |
| Owner | `<owner>` |
| Reviewers | `<reviewers>` |
| Spec Under Review | `SPEC-XXX` (v<ver>) |

---

```text id="sdr-2"
Purpose
```

Verify preconditions for implementation: spec `APPROVED`? decisions closed? contracts frozen? ACs present? DoD known? Evidence plan exists.

---

```text id="sdr-3"
Gate Checklist
```

| Item | Required | Status (Y/N/NA) | Evidence/Notes |
|---|---|---|---|
| Spec status == `APPROVED` | Yes | <Y/N> | Check metadata Status. |
| Acceptance Criteria present (Given/When/Then) | Yes | <Y/N> | Section 19 of behavior spec. |
| Scope explicit (In/Out) | Yes | <Y/N> | Section 3. |
| Business Rules/Validation defined | Conditional | <Y/N/NA> | Sections 8-9. |
| Open Decisions section empty or all resolved | Yes | <Y/N> | Section 23. No unresolved items. |
| ADRs identified and linked (if architectural) | Conditional | <Y/N/NA> | Traceability/ADR refs. |
| Contracts affected: agreed/frozen | Conditional | <Y/N/NA> | API/Event/Data contracts. |
| Test plan + AC→Test mapping | Recommended | <Y/N/NA> | Section 20. |
| TDD decision recorded (Y/N + rationale) | Recommended | <Y/N/NA> | Section 20. |
| DoD referenced and evidence plan | Yes | <Y/N> | Points to definition-of-done.md. |
| Dependencies identified | Yes | <Y/N> | Section 21. |
| Risks documented with mitigations | Yes | <Y/N> | Section 22. |
| Traceability defined | Yes | <Y/N> | Section 24. |

---

```text id="sdr-4"
Review Outcome
```

**Review outcome:** `READY` | `READY_WITH_RISKS` | `INCOMPLETE` | `BLOCKED`

**Rationale:** <rationale>

**Risks accepted (if READY_WITH_RISKS):** <list or "none">

---

```text id="sdr-5"
Gate State After Evaluation
```

**Gate state:** `PASSED` | `PASSED_WITH_RISKS` | `BLOCKED` | `WAIVED`

**Authorized by:** <reviewer> | **Date:** `<date>`

---

```text id="sdr-6"
Findings
```

| ID | Finding | Severity (low/med/high/blocker) | Action | Owner | Due |
|---|---|---|---|---|---|
| F-1 | <finding> | <sev> | <action> | <owner> | `<date>` |

---

```text id="sdr-7"
Delivery Authorization

```text id="auth"
Only proceed to implementation if Review outcome is READY or READY_WITH_RISKS AND Gate state is PASSED or PASSED_WITH_RISKS. If BLOCKED, do not implement.
```

```text
Implementation authorized: Y/N
Authorized by: <name>
Date: <date>
Spec Status after authorization: `APPROVED` (confirmed)
```
