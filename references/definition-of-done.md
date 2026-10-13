# Definition of Done — Required Evidence for Delivery

## 1. Document Metadata

| Field | Value |
|---|---|
| Document ID | `REF-DOD-001` |
| Title | Definition of Done (DoD) |
| Version | 0.1 |
| Status | `ACTIVE` |
| Created | 2026-10-12 |
| Last Modified | 2026-10-12 |
| Owner | Spec-Gated Architecture Lifecycle Skill |
| Applies To | Any consuming project using this skill |

---

## 2. Purpose

Define the minimum criteria that must be satisfied before an implementation against an `APPROVED` specification is considered `DONE`. DoD is evidence-based: **claims require proof**.

---

## 3. Core Principle

> **Done means verifiably done.** If evidence is missing, the work is `PARTIAL` or `BLOCKED`, not `DONE`.

---

## 4. DoD Dimensions

| Dimension | Criterion | Required Evidence |
|---|---|---|
| **Scope & Spec** | Implementation is limited to approved spec scope (In Scope). Out of Scope changes not present. | Diff summary vs spec scope; references to SPEC-XXX. |
| **Acceptance Criteria** | Every AC is satisfied. | AC→Test mapping; test results showing each AC covered. |
| **Behavior** | Happy path + specified alternates/errors behave as specified. | Behavior test results (names + status). |
| **Contracts** | Affected API/Event/Data contracts honored. No unapproved breaking changes. | Contract test results; diff of contract files (if changed). |
| **Decisions/ADRs** | New architectural decisions escalated to ADR; referenced. | ADR-XXX created/updated; cross-references in spec/traceability. |
| **Data/Persistence** | Migrations (if any) correct, reversible plan noted, constraints respected. | Migration files; validation notes; rollback plan if applicable. |
| **Events** | Event contracts, idempotency, ordering (if specified) respected. | Event schema validation; test evidence. |
| **Security/Authorization** | AuthZ rules, validation, secrets handling per spec/SEC. | Security checks; tests for authZ/authN paths specified. |
| **Observability** | Logs/metrics/traces as specified. | Evidence of added instrumentation or rationale if none. |
| **Configuration** | Config keys documented; defaults safe; no secrets committed. | Config diff; docs updated. |
| **Quality** | Lint/typecheck/build pass (project conventions). | Tool outputs (or command summary + exit status). |
| **Tests** | Tests present per TDD activation (or adequate verification). No test-only changes masking behavior. | Test suite summary (pass/fail counts). |
| **Traceability** | Traceability updated (AC→Spec→Test→Evidence). | `traceability-matrix.md` updated or equivalent. |
| **Documentation** | Affected docs updated (spec status, decisions, contracts). | Doc diffs. |
| **Risk/Open Questions** | Residual risks documented; no new untracked blockers. | Updated Risks/Open Questions. |

---

## 5. Delivery Report Format (Agent)

The agent must issue a delivery report at implementation end. Use this exact structure:

```text
=== DELIVERY REPORT ===
Spec: SPEC-XXX (vX.Y) — Status: APPROVED
Delivery Status: DONE | PARTIAL | BLOCKED
Scope: In-Scope satisfied; Out-of-Scope: <none|list>
AC: X/Y satisfied (list any missing)
Evidence:
- tests: <path/summary>
- build/lint/typecheck: <summary+status>
- contracts: <summary>
- migrations: <summary or "none">
- docs: <summary>
- traceability: <updated path>
Blockers: <list or "none">
Decisions: <ADR refs or "none">
Next Steps: <concrete action>
=== END REPORT ===
```

**Rules:**
- Use `DONE` only if **all** dimensions satisfied with evidence.
- Use `PARTIAL` if some AC missing but no hard blocker, or evidence incomplete.
- Use `BLOCKED` if a gate/blocker prevents completion (status not approved, unresolved decisions, failing build/tests).
- Evidence must be **concrete paths/outputs**, not "verified" alone.

---

## 6. Minimal Evidence Checklist

Before claiming `DONE`, verify:

- [ ] Spec status remains `APPROVED` (or updated appropriately)
- [ ] All ACs have passing behavior tests
- [ ] AC→Test mapping present
- [ ] Build, lint, typecheck pass (project commands)
- [ ] Affected contracts unchanged or agreed
- [ ] Traceability matrix updated
- [ ] DoD dimensions covered
- [ ] Delivery report issued

---

## 7. References

- `references/implementation-delivery-gate.md` — Specification-gated delivery
- `references/tdd-workflow.md` — Optional TDD workflow
- `references/traceability.md` — Delivery traceability
- `references/decision-governance.md` — ADR escalation
