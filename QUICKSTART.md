# Quickstart — Spec-Gated Architecture Lifecycle

```text id="qs-1"
What this skill is
```

A technology-agnostic lifecycle for AI agents: **Product → Domain/DDD → Architecture/C4 → Contracts → ADRs → Specifications → Infrastructure → Release**, plus **specification-gated delivery**, **optional TDD**, **Definition of Done**, and **project bootstrap**.

It prevents the agent from jumping from a request straight to code.

---

```text id="qs-2"
When it activates
```

The skill is global — it does **not** require an existing project. It activates when your request matches its `description` (architecture, specs, ADRs, contracts, bootstrap, delivery readiness), or when you load it explicitly by name.

> **Precondition:** `SKILL.md` must start with YAML frontmatter (`name` + `description`). Without it, opencode does not list the skill. `name` must match the folder name.

---

```text id="qs-2b"
Pick the smallest lane (triage first)
```

| Lane | When | Produce |
|---|---|---|
| **L0 Direct** | typo, config, wiring, internal refactor | code + tests |
| **L1 Feature** (default for short tasks) | one bounded behavior change | **one** spec + ACs (+ optional TDD) + DoD |
| **L2 Boundary** | API/event/data contract, security, migration | L1 + contract (+ ADR if consequential) |
| **L3 Architecture** | new boundary, consistency, multi-component | domain → architecture → contracts → ADR → specs |
| **L4 New project** | nothing exists yet | bootstrap → product → domain → L1..L3 |
| **SPIKE** | throwaway, time-boxed | code + notes (all gates skipped) |

**STOP:** no ADR for local decisions; no architecture unless a boundary/ownership question exists; no contract unless a consumer exists; no new spec if an `APPROVED` one already covers it. Full detail: `references/triage-routing.md`.

---

```text id="qs-3"
Use it with an existing project
```

1. Point the agent at the repo and state the task (e.g. "add a cancel-order endpoint").
2. The agent classifies scope (`LOCAL`, `CONTRACT_AFFECTING`, `ARCHITECTURE_AFFECTING`, …) and picks the **minimum lifecycle depth**.
3. It produces only the artifacts justified by scope/risk — `NOT_REQUIRED` is a valid outcome.
4. Implementation happens only against an `APPROVED` specification.

---

```text id="qs-4"
Use it with NO project (from scratch)
```

### Option A — Ask the agent to bootstrap

> "Set up a new spec-gated project for <idea>."

The agent scaffolds the workspace and drives the lifecycle.

### Option B — Run the scaffold yourself

```powershell
# Windows (PowerShell)
& "C:\Users\Edi\.agents\skills\spec-gated-architecture-lifecycle\scripts\scaffold.ps1" `
  -Target "C:\path\to\new-project" `
  -Project "my-project" -System "my-system" -Context "short context" -Owner "team-x"
```

```bash
# POSIX
bash /path/to/spec-gated-architecture-lifecycle/scripts/scaffold.sh \
  /path/to/new-project my-project my-system "short context" team-x
```

Produces (generic Markdown only — no domain content invented):

```text
new-project/
├── AGENTS.md
├── docs/
│   ├── agent-context.md
│   ├── definition-of-done.md
│   ├── project-context.md
│   ├── sdd-tdd-workflow.md
│   └── specification-map.md
├── specs/
│   ├── README.md
│   └── _TEMPLATE-behavior-specification.md
└── scripts/
    ├── check-spec.ps1
    └── check-spec.sh
```

The `specs/` workspace and `check-spec` validator make the project **SDD-ready immediately**: write a spec, gate it, implement. Then ask the agent to run the lifecycle phases, which instantiate `templates/*` into real artifacts.

---

```text id="qs-5"
The spec-gated loop (day-to-day)
```

```text
Request
  ↓
Classify lane                     # L0..L4 or SPIKE (see qs-2b)
  ↓
Produce/confirm behavior spec     # templates/specifications/behavior-specification.md
  ↓
Review → status APPROVED          # only APPROVED is implementable
  ↓
Delivery gate                     # templates/specifications/specification-delivery-review.md
  ↓
Implement (+ TDD if activated)    # AC → RED → GREEN → REFACTOR
  ↓
Verify → DoD report               # DONE / PARTIAL / BLOCKED, with evidence paths
  ↓
Update traceability               # AC → Spec → Test → Evidence

Validate the gate mechanically:  scripts/check-spec.ps1 -Path .\specs -RequireApproved
```

---

```text id="qs-6"
Key rules
```

- Only `APPROVED` specifications are implementable. Absence of status is **not** approval.
- An implementable spec **must** have Acceptance Criteria (`AC-1`, `AC-2`, ...).
- Completeness: an implementable spec also needs an explicit **Scope** (In/Out) and a **Test Plan** or **Traceability** mapping.
- Local decisions live in the spec; **architectural decisions escalate to an ADR**.
- TDD is **opt-in** per scope/risk (recommended for business rules, validation, contracts).
- Claims require **evidence paths**; no "verified" without proof.
- Never invent domain entities, APIs, events, or capacity numbers.
- Enforce the gate with `scripts/check-spec.ps1` / `check-spec.sh` (CI-friendly, exit code 1 on violation).

---

```text id="qs-7"
Where to look next
```

| Topic | Location |
|---|---|
| Triage: choose a lane (start here) | `references/triage-routing.md` |
| Agent procedure & escalation | `references/agent-procedure.md` |
| Full lifecycle & rules | `SKILL.md` |
| Worked example from an empty directory | `examples/from-scratch/` |
| Short-task spec-gated delivery example | `examples/mealmind/` |
| Spec gate validator | `scripts/check-spec.ps1`, `scripts/check-spec.sh` |
| Full-depth greenfield example | `examples/greenfield/` |
| Legacy system assessment example | `examples/existing-system/` |
| Delivery gate / TDD / DoD | `references/implementation-delivery-gate.md`, `references/tdd-workflow.md`, `references/definition-of-done.md` |
| Bootstrap policy | `references/project-bootstrap.md` |
| All templates | `templates/` |
