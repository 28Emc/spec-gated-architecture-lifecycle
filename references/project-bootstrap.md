# Project Bootstrap — Scaffolding a Spec-Gated Project

## 1. Document Metadata

| Field | Value |
|---|---|
| Document ID | `REF-BOOT-001` |
| Title | Project Bootstrap |
| Version | 0.1 |
| Status | `ACTIVE` |
| Created | 2026-10-12 |
| Last Modified | 2026-10-12 |
| Owner | Spec-Gated Architecture Lifecycle Skill |
| Applies To | Any consuming project using this skill |

---

## 2. Purpose

Define how to bootstrap a new (or empty) consuming project with the spec-gated structure using `templates/project-bootstrap/`. This ensures consistency while keeping the bootstrap **generic** (no domain content).

---

## 3. Principles

1. **Start from empty** — Do not copy MealMind/domain content. Only stubs and placeholders.
2. **Placeholders only** — Use `<project>`, `<system>`, `<context>`, `<owner>`, `<date>`. Never invent domain names, entities, APIs, events.
3. **Idempotent guidance** — Scaffold into an empty target directory or a new repo. Avoid overwriting existing domain files.
4. **Technology-agnostic** — Bootstrap contains Markdown/docs only; no language-specific code.
5. **Composable** — Works with the existing lifecycle (Phases 0-8) plus Phase 6.5 (Delivery).
6. **Traceable** — Links to references/templates defined by this skill.

---

## 4. Bootstrap Target Structure

Running the scaffold produces this structure (relative to target root):

```text
<target>/
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

The `specs/` workspace and the `check-spec` validator make the project **SDD-ready on day one**: write a spec, gate it, then implement. Additional directories (e.g. `adr/`, `contracts/`, `architecture/`) are added later as the project crosses those boundaries — the bootstrap provides the **minimal spec-gated baseline**.

---

## 5. What Each File Contains

| File | Purpose |
|---|---|
| `AGENTS.md` | Agent operating contract for this project: use spec-gated-architecture-lifecycle, respect specification gate, follow DoD, report format. Generic placeholders. |
| `docs/specification-map.md` | Specification registry: numbering scheme, statuses (`DRAFT→REVIEW→APPROVED→IMPLEMENTING→VALIDATED`, terminals), gate rules, ownership. |
| `docs/sdd-tdd-workflow.md` | Project-local summary pointing to skill references (`implementation-delivery-gate.md`, `tdd-workflow.md`). |
| `docs/definition-of-done.md` | Project-local DoD (or reference to skill DoD). Can be tailored minimally without changing core rules. |
| `docs/agent-context.md` | Agent context: project purpose, constraints, boundaries, links to lifecycle. All placeholder-based. |
| `docs/project-context.md` | Human-facing project context: goals, scope boundaries, success criteria (placeholders). |
| `specs/_TEMPLATE-behavior-specification.md` | Starter behavior spec (copy per feature). Carries `Document ID` + `Status` metadata read by the validator. |
| `specs/README.md` | How the spec workflow works: naming, statuses, gate, and how to run the validator. |
| `scripts/check-spec.ps1` / `check-spec.sh` | Spec gate validator: enforces status validity and that implementable specs have Acceptance Criteria. |

---

## 6. Scaffolding Procedure (Manual or Scripted)

### 6.1 Using Scripts

Scripts live in `scripts/` of this skill:

- `scripts/scaffold.ps1` (Windows, primary)
- `scripts/scaffold.sh` (POSIX)

Usage:
```powershell
# Windows (from skill root or anywhere; pass target)
powershell -ExecutionPolicy Bypass -File C:\Users\Edi\.agents\skills\spec-gated-architecture-lifecycle\scripts\scaffold.ps1 -Target "C:\path\to\new-project"
```

```bash
# POSIX
bash /path/to/spec-gated-architecture-lifecycle/scripts/scaffold.sh /path/to/new-project
```

### 6.2 What Scripts Do

1. Validate target directory exists or create it (if allowed).
2. Copy `templates/project-bootstrap/` contents to target.
3. Replace placeholders: `<project>`, `<system>`, `<context>`, `<owner>`, `<date>`.
4. Add SDD extras: copy `templates/specifications/behavior-specification.md` to `specs/_TEMPLATE-behavior-specification.md` and copy `scripts/check-spec.ps1` / `check-spec.sh` into the target's `scripts/`.
5. Preserve encoding (UTF-8).
6. Do **not** copy examples, MealMind content, or skill internals (other than the validator + template above).
7. Emit a summary of created files.

### 6.3 Post-Scaffold Checklist

- [ ] Review `AGENTS.md` — ensure it references spec-gated-architecture-lifecycle.
- [ ] Review `docs/specification-map.md` — confirm numbering convention fits project.
- [ ] Review `docs/project-context.md` — fill placeholders with real values (human task).
- [ ] Confirm no domain content was invented.
- [ ] Run `scripts/check-spec.*` against `specs/` once the first spec exists.
- [ ] Link to skill references as needed.

---

## 7. Placeholder Policy

| Placeholder | Purpose | Example |
|---|---|---|
| `<project>` | Project name | `payments-platform` (user-supplied) |
| `<system>` | System name | `payments-system` (user-supplied) |
| `<context>` | Short context | `payment processing` (user-supplied) |
| `<owner>` | Owner/maintainer | `team-payments` (user-supplied) |
| `<date>` | ISO date | `2026-10-12` (script sets to today) |

**Never replace placeholders with example values from MealMind.** Placeholders must remain unless the user explicitly provides real values.

---

## 8. Integration with Lifecycle

- **Phase 0 (Context)** — `docs/project-context.md` + `docs/agent-context.md` establish boundaries.
- **Phase 6 (Specifications)** — `docs/specification-map.md` governs spec lifecycle and gate.
- **Phase 6.5 (Delivery)** — References gate/DoD/TDD.
- **Gates** — Specification gate (`implementation-delivery-gate.md`) applies to any `APPROVED` spec.

---

## 9. Safety Guarantees

- Bootstrap produces **generic** Markdown only (plus the `check-spec` validator scripts).
- No application/business code generated.
- No domain entities/rules copied.
- Scripts refuse to overwrite non-empty target unless explicitly handled (defensive).
- Examples remain under `examples/` and are never scaffolded.

---

## 10. References

- `references/triage-routing.md` — lane selection and the new-project (L4) path
- `references/implementation-delivery-gate.md`
- `references/tdd-workflow.md`
- `references/definition-of-done.md`
- `templates/project-bootstrap/` (source)
- `scripts/scaffold.ps1`, `scripts/scaffold.sh`
- `scripts/check-spec.ps1`, `scripts/check-spec.sh` — spec gate validator
- `examples/from-scratch/` — end-to-end walkthrough of bootstrap + first approved spec

See `examples/from-scratch/scenario-guide.md` for a worked example that starts from an empty directory and reaches an implemented specification.
