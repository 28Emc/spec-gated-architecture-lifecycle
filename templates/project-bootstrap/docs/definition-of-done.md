# Definition of Done (Project)

```text id="dod-1"
Purpose
```

Project-local view of DoD. Core rules live in the Spec-Gated Architecture Lifecycle skill: `references/definition-of-done.md`.

**Project:** `<project>` | **Owner:** `<owner>`

---

```text id="dod-2"
Minimum Criteria
```

All implementations against `APPROVED` specs must satisfy:
- All ACs satisfied with evidence
- Build/lint/typecheck pass (project commands)
- Tests present per TDD activation
- Contracts honored; no unapproved breaking changes
- Traceability updated (AC→Spec→Test→Evidence)
- Evidence-based delivery report issued

See full dimensions in `references/definition-of-done.md`.

---

```text id="dod-3"
Project Commands (TBD)
```

| Check | Command | Required |
|---|---|---|
| Build | `<build-cmd>` | Y |
| Lint | `<lint-cmd>` | Y |
| Typecheck | `<typecheck-cmd>` | Conditional |
| Test | `<test-cmd>` | Y (as applicable) |

Fill these when project tooling exists.
