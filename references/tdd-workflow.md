# TDD Workflow — Optional Test-Driven Development

## 1. Document Metadata

| Field | Value |
|---|---|
| Document ID | `REF-TDD-001` |
| Title | TDD Workflow (Optional) |
| Version | 0.1 |
| Status | `ACTIVE` |
| Created | 2026-10-12 |
| Last Modified | 2026-10-12 |
| Owner | Spec-Gated Architecture Lifecycle Skill |
| Applies To | Any consuming project using this skill |

---

## 2. Purpose

Define the **optional** TDD cycle used inside this skill. TDD is **activatable per scope and risk**; it is not mandatory for all work. The goal is to ensure behavior is driven by Acceptance Criteria (AC), not by implementation details.

---

## 3. Principle

> **Optional, not universal.** Apply TDD when behavior is non-trivial, has business rules, multiple paths, or carries meaningful risk. Skip or use lighter verification when work is configuration, wiring/glue, pure documentation, trivial getters/setters, or mechanical scaffolding.

---

## 4. TDD Cycle

The canonical cycle is: **AC → RED → GREEN → REFACTOR**

| Step | Action | Evidence |
|---|---|---|
| **1. AC → Identify** | Take each AC (Given/When/Then) from the approved specification. If an AC is ambiguous, block and clarify before writing tests. | Updated spec (clarify in Open Questions, not by guessing). |
| **2. RED** | Write the **smallest failing test** that proves the AC is not satisfied. The test must fail for the right reason (missing/incorrect behavior). | Failing test output (name + assertion + expected vs actual). |
| **3. GREEN** | Write the **minimal code** to make that failing test pass. No speculative generalization. | Passing test for that AC. |
| **4. REFACTOR** | Refactor safely (code + tests) while keeping all tests green. Apply `codebase-design` guidance (deep modules, seams, testability). | All tests still green; no behavior change. |
| **5. Repeat** | Repeat per AC (or per smallest meaningful behavior slice). Prefer one AC → one test or a small cohesive group. | AC→Test mapping updated. |

---

## 5. When TDD IS Recommended

| Scenario | Rationale |
|---|---|
| Business rules with multiple branches/alternates | Prevents logic gaps; forces explicit cases. |
| State transitions | Ensures valid/invalid transitions covered. |
| Validation & error catalog | Each error case becomes an explicit test. |
| Integration boundaries with contracts | Contract behavior (happy path + alternates) is verifiable. |
| High-risk or regulated behavior | Deterministic verification with evidence. |
| Complex algorithms/domain logic | Drives minimal implementation and clear behavior. |

---

## 6. When TDD is NOT Required

| Scenario | Alternative |
|---|---|
| Configuration/env wiring | Manual verification + smoke check. |
| Pure documentation edits | No tests required. |
| Trivial DTOs/mappings with no rules | Type checks + compilation sufficient. |
| Framework/glue code with no domain rules | Targeted integration/smoke tests. |
| Mechanical scaffolding | Verify build/compilation. |

**Guideline:** If there are zero non-trivial business rules or zero alternate paths, TDD is optional.

---

## 7. Test Levels & Focus

| Level | Purpose | What to test |
|---|---|---|
| **Acceptance (Behavior)** | Proves ACs from approved spec | Given/When/Then behavior, rules, alternates, errors. Prefer black-box by observable behavior. |
| **Unit** | Protects internal logic (after GREEN) | Deep-module behavior, edge cases, invariants. Avoid testing private implementation details. |
| **Integration/Contract** | Verifies boundaries | API/Event/Data contracts against agreed schemas. |
| **Property-based** (optional) | Invariants across ranges | Only when invariants are strong and useful (not default). |

---

## 8. Rules for Test Quality

1. **Behavior-driven, not implementation-driven.** Tests describe *what* (observable behavior), not *how* (internal steps). 
2. **Anti-pattern: Test-reproduces-implementation.** If tests mirror method structure line-by-line, they are brittle and add no specification value.
3. **One behavior per test** (preferred). Cohesive ACs may be grouped if they share setup and failure semantics.
4. **Deterministic.** No time/random/network flakiness. Control external dependencies (seams/mocks/stubs at boundaries).
5. **Explicit AC→Test traceability.** Every behavior test must trace to one or more ACs (see `references/traceability.md`).
6. **Fail for the right reason.** RED must demonstrate the missing behavior, not a typo/setup issue.
7. **Smallest possible change to go GREEN.** Resist gold-plating.
8. **Refactor with safety.** Only refactor when all tests are green.

---

## 9. TDD Activation

TDD is **opt-in**. To activate it for a scope:

1. Note activation in the specification's `Test Plan & Traceability` section (`TDD: Yes/No`, with rationale).
2. Follow `AC → RED → GREEN → REFACTOR` per AC.
3. Record evidence (test names, pass/fail, before/after refactor) for DoD.

If not activated, use appropriate verification (e.g. behavior tests written after implementation) while still satisfying ACs and DoD.

---

## 10. References

- `references/implementation-delivery-gate.md` — Specification-gated delivery
- `references/definition-of-done.md` — Definition of Done and evidence
- `references/traceability.md` — AC→Spec→Test→Evidence traceability
- `references/codebase-design` (skill) — Module design, seams, testability
