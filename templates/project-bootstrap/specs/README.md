# Specs

This directory is the **unit of work** for `<project>` under Specification-Driven Development (SDD).

## How it works

1. Copy `_TEMPLATE-behavior-specification.md` to `SPEC-<AREA>-<NNN>-<slug>.md`.
2. Fill it in. Keep the **Document ID** and **Status** metadata rows — the validator reads them.
3. Move `Status`: `DRAFT` → `IN_REVIEW` → `APPROVED`.
4. Before implementing, complete a delivery review from
   `spec-gated-architecture-lifecycle/templates/specifications/specification-delivery-review.md`
   and confirm the gate is `PASSED` or `PASSED_WITH_RISKS`.
5. Implement **only** `APPROVED` specs. Record evidence in the Definition of Done
   (`docs/definition-of-done.md`).
6. Update traceability (AC → test → evidence).

## Rules

- Only `APPROVED` specifications are implementable.
- An implementable spec **must** contain Acceptance Criteria (`AC-1`, `AC-2`, ...).
- Local decisions live in the spec; architectural decisions escalate to an ADR.
- Small changes need **one** spec — do not create architecture/contracts/adrs unless the
  change crosses a boundary. See `references/triage-routing.md` in the skill.

## Validate

```powershell
# Windows
powershell -ExecutionPolicy Bypass -File .\scripts\check-spec.ps1 -Path .\specs -RequireApproved
```

```bash
# POSIX
./scripts/check-spec.sh ./specs --require-approved
```

Exit code `0` = all specs valid. Use it locally or in CI (see `.github/workflows` if present).

## Status values

`DRAFT` · `IN_REVIEW` · `APPROVED` · `IMPLEMENTING` · `VALIDATED` · `DEPRECATED` · `REJECTED`

Docs under this folder that are **not** specs (e.g. traceability matrices, indexes) are
ignored by the validator unless their ID begins with `SPEC`.
