# Implementation Delivery Gate — Specification-Gated Delivery

## 1. Document Metadata

| Field | Value |
|---|---|
| Document ID | `REF-IMP-001` |
| Title | Implementation Delivery Gate |
| Version | 0.1 |
| Status | `ACTIVE` |
| Created | 2026-10-12 |
| Last Modified | 2026-10-12 |
| Owner | Spec-Gated Architecture Lifecycle Skill |
| Applies To | Any consuming project using this skill |

---

## 2. Purpose

This reference defines the **specification-gated delivery rule**: implementation may only begin once a specification is `APPROVED`. It clarifies the boundary between *decisions that belong in the specification* and *decisions that must escalate to an ADR*.

---

## 3. Core Rule

> **Only an `APPROVED` specification is implementable.**

- If the specification is `DRAFT`, `REVIEW`, `BLOCKED`, `IMPLEMENTING`, `VALIDATED`, `DEPRECATED`, or `CANCELLED`, implementation is **not permitted**.
- The specification status must be explicitly `APPROVED`. Absence of a status is not approval.
- Approval must come from the authorized reviewer(s) defined for that scope (per decision governance). Approval is a human decision.

---

## 4. Preconditions for Starting Implementation

Before implementation starts, the following must be true:

| Precondition | Required? | Notes |
|---|---|---|
| Specification status is `APPROVED` | Yes | Verified against the specification's metadata `Status` field. |
| Acceptance Criteria (Given/When/Then) are present | Yes | See `tdd-workflow.md`. |
| Contracts frozen for affected scope | Conditional | If API/Event/Data contracts are affected, they must be `FROZEN`/agreed per `references/contract-governance.md`. |
| Open Decisions (`Open Decisions` section) are zero or all resolved | Yes | Unresolved open decisions block implementation. |
| ADRs identified | Conditional | If an architectural decision arises, it **escalates to an ADR** (do not bury in code/comments). |
| Scope (In/Out) is explicit | Yes | Prevents scope creep. |
| Test plan/traceability exists | Recommended | `AC → Test` mapping is required to satisfy DoD. |
| Definition of Done is known | Yes | See `definition-of-done.md`. |

---

## 5. Delivery States

| State | Meaning | Action |
|---|---|---|
| `NOT_STARTED` | Spec approved, not yet implemented | Proceed only via this gate. |
| `IMPLEMENTING` | Actively implementing against approved spec | Keep changes scoped to spec. Update delivery evidence as you go. |
| `BLOCKED` | Blocker found (missing evidence, failing test, unclear rule) | Do not advance. Log blocker with evidence. |
| `PARTIAL` | Some AC satisfied, others missing | Do not claim `DONE`. Complete remaining or split. |
| `DONE` | All AC satisfied, DoD evidence complete, agent report issued | Ready for review/validation. |
| `CANCELLED` | No longer needed | Do not implement. |

---

## 6. Decisions-in-Spec vs. ADR Escalation

**Decisions that may live in the specification:**
- Local behavior (validation rules, error messages, field constraints, ordering, default values)
- Capacity/selection decisions scoped to this behavior (algorithm choice with no cross-cutting impact)
- UI/UX copy/rules specific to this feature
- Error catalog entries

**Decisions that must escalate to an ADR:**
- Cross-cutting architectural choices (boundaries, layering, strategy, repository pattern changes)
- Introduction/removal of external dependencies or integration styles
- Data model shape affecting multiple contexts or ownership changes
- Security/auth model changes
- Eventing topology, messaging guarantees, idempotency strategy
- Infrastructure/runtime topology changes
- Breaking contract changes affecting other consumers

**Rule:** If the decision affects more than this specification's isolated behavior **or** constrains future specifications, create/escalate an ADR. Reference the ADR in the spec (`ADR-XXX`) and in traceability.

---

## 7. What Blocks the Gate

| Blocker | Resolution |
|---|---|
| Status != `APPROVED` | Return to review. Do not start. |
| No Acceptance Criteria | Add ACs in `Acceptance Criteria` section. |
| Unresolved `Open Decisions` | Resolve or escalate to ADR. |
| Affected contract not agreed | Follow contract governance. Freeze before implementing. |
| Unknown external dependency | Document and assess impact; escalate to ADR if architectural. |
| No DoD reference | Reference `definition-of-done.md` and populate evidence plan. |

---

## 8. Agent Reporting at Implementation End

At the end of implementation work, the agent must produce a concise delivery report using the format defined in `definition-of-done.md`:

```text
Delivery Report: SPEC-XXX
Status: DONE | PARTIAL | BLOCKED
Spec: <link/id>
AC satisfied: X/Y
Evidence: [paths to logs/tests/reports]
Blockers: [list or "none"]
Next: [action]
```

---

## 9. References

- `references/decision-governance.md` — Decision authority and ADR process
- `references/contract-governance.md` — Contract states and freezing
- `references/traceability.md` — Delivery traceability
- `references/tdd-workflow.md` — Optional TDD workflow
- `references/definition-of-done.md` — Definition of Done and evidence
