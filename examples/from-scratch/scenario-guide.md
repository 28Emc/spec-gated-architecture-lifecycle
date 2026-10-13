# From-Scratch Scenario Guide — BookNest

```text id="fsg-1"
Purpose
```

This guide walks through what an AI agent does when the user has **no project at all** and asks to work in a spec-gated way. It covers skill activation, workspace bootstrap, and the minimum lifecycle needed to reach a first implementable specification.

**Read this file first.** The artifacts in this folder are referenced throughout.

---

```text id="fsg-2"
Scenario summary
```

- **Prompt from the user:** "I want to build a small library lending service. I have no repo, nothing. Set up the project so we work spec-first."
- **Lifecycle Mode:** `GREENFIELD`
- **Project Sizing:** `LIGHT`
- **Outcome of this walkthrough:** `SPEC-LENDING-001` reaches `APPROVED`, passes the delivery gate `READY`/`PASSED`, is implemented, and is reported `DONE`.

---

## Step 0 — Skill activation (no project required)

**Why this comes first:** The skill is a *global* capability. It does not depend on a project existing. It is activated by matching the user's request against the skill `description` (or by loading it explicitly by name).

**Precondition — frontmatter:** For opencode to discover the skill, `SKILL.md` must start with YAML frontmatter containing `name` and `description`:

```yaml
---
name: spec-gated-architecture-lifecycle
description: Guide software projects through an evidence-based architecture lifecycle ...
---
```

If the frontmatter is missing, the skill does not appear in `<available_skills>` and cannot be loaded. There is no project requirement — only the frontmatter requirement. `name` must match the folder name.

**Result:** Skill `FACT` available. The agent can now reason with the lifecycle on an empty directory.

---

## Step 1 — Bootstrap the workspace (Gate 0)

**Agent action:** Create an empty target directory and run the scaffold script shipped with the skill. It copies `templates/project-bootstrap/` and replaces placeholders — it never invents domain content.

```powershell
& "C:\Users\Edi\.agents\skills\spec-gated-architecture-lifecycle\scripts\scaffold.ps1" `
  -Target "C:\path\to\booknest" `
  -Project "booknest" -System "booknest-api" -Context "library lending" -Owner "library-team"
```

Observed output (real run, Windows):

```text
Created target: C:\path\to\booknest
Scaffolding spec-gated structure...
  Skill: ...\spec-gated-architecture-lifecycle
  Bootstrap: ...\templates\project-bootstrap
  Target: C:\path\to\booknest
  Replacements: Project=booknest, System=booknest-api, Context=library lending, Owner=library-team, Date=2026-10-12
  Created: AGENTS.md
  Created: docs\agent-context.md
  Created: docs\definition-of-done.md
  Created: docs\project-context.md
  Created: docs\sdd-tdd-workflow.md
  Created: docs\specification-map.md
```

Resulting structure:

```text
booknest/
├── AGENTS.md
└── docs/
    ├── agent-context.md
    ├── definition-of-done.md
    ├── project-context.md
    ├── sdd-tdd-workflow.md
    └── specification-map.md
```

**Evidence:** `FACT` — files exist on disk; placeholders substituted.

**Gate 0 result:** `PASSED` — scope is "new product", entry mode `GREENFIELD`, workspace created. No domain content fabricated.

---

## Step 2 — Project sizing

**Why this phase:** Process depth must scale with risk, not ceremony. Before producing artifacts, classify the request.

| Dimension | Assessment |
|---|---|
| Scope | `LOCAL`→`DOMAIN_AFFECTING` (one capability) |
| Domain complexity | `LOW` |
| Technical complexity | `LOW` |
| Reversibility | `HIGH` (fully reversible) |
| Integration surface | `NONE` |
| **Recommended depth** | **`LIGHT`** |

**Consequence:** Architecture / C4, Contracts, and ADRs are evaluated and may be `NOT_REQUIRED` with rationale. `NOT_REQUIRED` is a valid, intentional outcome.

---

## Step 3 — Product Discovery (Gate 1)

**Why:** We cannot model a domain without knowing the problem and the actors.

**Agent action:** Instantiate `templates/product/product-context.md` → `product/product-context.md` (condensed here).

**Key findings:**

- **Problem (`FACT`):** Small libraries lend physical copies and need a simple, correct record of who holds what.
- **Primary actor (`FACT`):** Staff member (librarian) operating at the desk. Member is a secondary actor.
- **Scope (`DECISION`):** In scope — create a loan for an available copy. Out of scope — returns, renewals, fines, reservations, notifications.
- **Assumption (`ASSUMPTION`, MEDIUM):** A title has multiple copies; availability is per-copy, not per-title.
- **Unknown (`UNKNOWN`, NON_BLOCKING):** Whether barcode scanning is required (deferred; no impact on the first behavior).

**Gate 1 result:** `PASSED` — problem, primary actor, scope, and constraints identified. One non-blocking unknown recorded.

---

## Step 4 — Domain Discovery (Gate 2)

**Why:** Architecture and specs must serve domain meaning, not technical convenience.

**Agent action:** Instantiate `templates/domain/domain-context.md` → `domain/domain-context.md` (condensed here).

**Key findings:**

- **Domain statement (`FACT`):** The domain is *circulation* — the business of tracking which physical copy is lent to whom.
- **Capability `CAP-001 Lend Copy` (`FACT`):** Make a specific available copy unavailable to all others by assigning it to one member via a loan.
- **Concepts:** `Copy` (a physical item), `Loan` (the commitment of a copy to a member), `Member` (the borrower).
- **Invariant `INV-001` (`FACT`):** A copy cannot be on more than one active loan at a time.
- **Invariant `INV-002`: ** A loan references exactly one copy and one member.
- **Domain event:** `CopyLent`.
- **Candidate boundary (`PROPOSAL`, LOW confidence):** Circulation vs Catalog. With a single capability, a separate bounded context is **not** justified. **Do not** infer a microservice from a concept.

**Gate 2 result:** `PASSED` — capabilities, concepts, and invariants understood well enough to specify the behavior. No architecture decomposition required.

---

## Step 5 — Architecture / C4 (Gate 3)

**Why evaluate it:** Domain boundaries must be checked against architecture. But depth must match sizing.

**Agent action:** Evaluate. Result:

| Item | Result | Rationale |
|---|---|---|
| System context (C4 L1) | `NOT_REQUIRED` | Single deployable, no external systems |
| Container (C4 L2) | `NOT_REQUIRED` | No meaningful runtime topology yet |
| Component (C4 L3) | `NOT_REQUIRED` | Selection is optional; nothing to separate |

**Gate 3 result:** `WAIVED` — explicitly waived for `LIGHT` scope by the recorded sizing decision. **Not** silently skipped.

---

## Step 6 — Contracts (Gate 4)

**Why evaluate it:** Boundaries need explicit agreements before specs — *if boundaries exist*.

- A library-internal capability with no consumers other than the same deployable has **no cross-boundary contract** at this stage.
- If/when a public API is introduced, an API contract must be created first.

**Gate 4 result:** `NOT_REQUIRED` — no cross-boundary consumers. Rationale recorded.

---

## Step 7 — Architecture Decisions / ADR (Gate 5)

**Why evaluate it:** Consequential, hard-to-reverse choices need governance. This one isn't.

- The only decision — "how do we ensure a copy is not lent twice" — is a **local consistency rule** expressed as `INV-001` in the specification.
- It affects one component, is easily reversible, and does not change ownership or trust boundaries.

**Gate 5 result:** `NOT_REQUIRED` — decision is local (lives in the spec), not architectural. Per the delivery gate: *local decisions live in the spec; architectural decisions escalate to an ADR.*

---

## Step 8 — Specifications (Gate 6)

**Why:** Produce an implementable, verifiable behavior specification.

**Agent action:** Instantiate `templates/specifications/behavior-specification.md` → `specifications/behavior-specification-lend-book.md` as `SPEC-LENDING-001`.

**Highlights:**

- Status starts `DRAFT`; after review → `APPROVED`.
- Acceptance criteria in Given/When/Then form (`AC-1..AC-5`).
- Test plan maps each AC to a test (`AC → Test`), with a TDD activation decision.
- **TDD activation:** `Y` — the behavior has an invariant (`INV-001`) and validation; these benefit from `AC → RED → GREEN → REFACTOR`.

**Gate 6 result:** `PASSED` — scope, behavior, ACs, validation, and traceability defined. No new architecture invented.

---

## Step 9 — Delivery gate + implementation (Phase 6.5)

**Pre-implementation gate:** Instantiate `templates/specifications/specification-delivery-review.md` → `specifications/specification-delivery-review.md`.

- Spec status `APPROVED`? **Y**
- ACs present? **Y**
- Open Decisions resolved? **Y**
- Contracts/ADRs conditioned? **NA** (none)
- DoD + evidence plan? **Y**

**Review outcome:** `READY` → **Gate state:** `PASSED`. Implementation authorized.

**Implement (TDD):**

1. `AC-1` → write failing test (`RED`).
2. Minimal code to pass (`GREEN`).
3. Refactor with tests green.
4. Repeat for `AC-2..AC-5`.

**Verify:** build / lint / typecheck + behavior tests + confirm no contract impact.

**Report:** Emit `definition-of-done-report.md` (`DONE`) and update `traceability-matrix.md`.

**Final spec state:** `APPROVED → IMPLEMENTING → VALIDATED`.

---

```text id="fsg-10"
What this example demonstrates
```

| Behavior | Where |
|---|---|
| Skill activation needs no project | Step 0 |
| Bootstrap without inventing domain content | Step 1 (+ `AGENTS.md`) |
| Sizing drives template selection | Steps 2, 5, 6, 7 |
| `NOT_REQUIRED` / `WAIVED` as valid, justified outcomes | Steps 5–7 |
| Spec-gated: only `APPROVED` implementable | Steps 8–9 |
| Optional TDD activated by risk | Step 8, Step 9 |
| Evidence-based DoD + traceability | `definition-of-done-report.md`, `traceability-matrix.md` |

---

```text id="fsg-11"
Anti-patterns avoided
```

- ❌ Scaffolding invented domain content (only stubs/placeholders were produced).
- ❌ Forcing the full lifecycle for a `LIGHT` change.
- ❌ Treating `NOT_REQUIRED` as "skipped silently" (each has explicit rationale).
- ❌ Starting implementation before the spec was `APPROVED`.
- ❌ Claiming `DONE` without evidence paths.
