# AGENTS.md — Project Agent Operating Contract

```text id="agents-1"
Purpose
```

This file defines how AI agents should operate in this project. It enforces the use of the **Spec-Gated Architecture Lifecycle** skill and specification-gated delivery.

**Project:** `<project>`  
**System:** `<system>`  
**Context:** `<context>`  
**Owner:** `<owner>`  
**Last Updated:** `<date>`

---

```text id="agents-2"
Core Rules
```

1. **Use Spec-Gated Architecture Lifecycle.** Follow phases, gates, and references defined by `spec-gated-architecture-lifecycle` skill.
2. **Specification-Gated Delivery.** Only implement against specifications with `Status: APPROVED`. See `references/implementation-delivery-gate.md`.
3. **Decisions.** Local decisions live in spec; architectural decisions escalate to ADRs. See `references/decision-governance.md`.
4. **Optional TDD.** Follow `AC → RED → GREEN → REFACTOR` only when activated. See `references/tdd-workflow.md`.
5. **Definition of Done.** Every implementation must satisfy DoD with concrete evidence. See `references/definition-of-done.md`.
6. **Evidence-Based.** Claims require proof (paths/outputs). No "verified" without evidence.
7. **No Domain Fabrication.** Do not invent entities/APIs/events. Ask or use placeholders.
8. **Placeholders.** Respect project placeholders during bootstrap; never invent domain values.

---

```text id="agents-3"
Workflow
```

1. Understand request against approved specs/spec map.
2. If no approved spec exists and work requires implementation, create/update spec to `APPROVED` via gate.
3. Run delivery gate (pre-implementation). Use `templates/specifications/specification-delivery-review.md`.
4. Implement (with TDD if activated). Keep scoped to spec.
5. Verify: build/lint/typecheck + tests + contracts.
6. Update traceability + docs.
7. Emit delivery report per DoD.

---

```text id="agents-4"
References
```

- Spec-Gated Architecture Lifecycle skill (local)
- `docs/specification-map.md` — Spec registry and statuses
- `docs/definition-of-done.md` — DoD
- `docs/sdd-tdd-workflow.md` — Delivery/TDD summary
