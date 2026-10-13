# Behavior Specification Template

```text id="bs-1"
Document Metadata
```

| Field | Value |
|---|---|
| Document ID | `SPEC-XXX` |
| Title | <behavior-title> |
| Version | `0.1` |
| Status | `DRAFT` |
| Created | `<date>` |
| Last Modified | `<date>` |
| Project | `<project>` |
| Owner | `<owner>` |
| Reviewers | `<reviewers>` |

---

```text id="bs-2"
Purpose
```

<Describe the business/technical purpose of this behavior. State what outcome is achieved.>

---

```text id="bs-3"
Scope
```

**In Scope:**
- <item>

**Out of Scope:**
- <item>

---

```text id="bs-4"
Actors
```

| Actor | Description |
|---|---|
| <actor> | <description> |

---

```text id="bs-5"
Glossary / Ubiquitous Language
```

| Term | Definition |
|---|---|
| <term> | <definition> |

---

```text id="bs-6"
Preconditions
```

- <precondition>

---

```text id="bs-7"
Input
```

| Field | Type | Constraints | Required | Mutability |
|---|---|---|---|---|
| <field> | <type> | <constraints> | Y/N | read/write |

---

```text id="bs-8"
Business Rules / Invariants
```

| Rule ID | Rule | Rationale |
|---|---|---|
| BR-1 | <rule> | <rationale> |

---

```text id="bs-9"
Validation & Error Catalog
```

| Error Code | Condition | Message | HTTP/Domain Mapping |
|---|---|---|---|
| ERR-1 | <condition> | <message> | <mapping> |

---

```text id="bs-10"
Behavior / Process
```

**Happy Path:**
1. <step>
2. <step>

**Alternates:**
- ALT-1: <description + steps>

**Exceptions:**
- EX-1: <description + handling>

---

```text id="bs-11"
State Transitions
```

| From | Event | To | Guard | Action |
|---|---|---|---|---|
| <state> | <event> | <state> | <guard> | <action> |

---

```text id="bs-12"
API Impact
```

| Endpoint/Method | Change Type | Contract Ref | Notes |
|---|---|---|---|
| <api> | add/change/remove | API-XXX | <notes> |

---

```text id="bs-13"
Event Impact
```

| Event | Change Type | Contract Ref | Notes |
|---|---|---|---|
| <event> | add/change/remove | EVT-XXX | <notes> |

---

```text id="bs-14"
Data / Persistence Impact
```

- Entities: <entities>
- Schema changes: <changes>
- Migration needed: Y/N
- Backward compatibility: <notes>

---

```text id="bs-15"
Security & Authorization
```

- AuthN required: Y/N
- AuthZ rules: <rules>
- Sensitive data: <notes>
- Security contract ref: SEC-XXX

---

```text id="bs-16"
Configuration
```

| Key | Type | Default | Required | Notes |
|---|---|---|---|---|
| <key> | <type> | <value> | Y/N | <notes> |

---

```text id="bs-17"
Observability
```

- Logs: <what to log>
- Metrics: <what to measure>
- Traces: <key spans>
- Alerts: <conditions>

---

```text id="bs-18"
Non-Functional Expectations
```

| Aspect | Target | Notes |
|---|---|---|
| Performance | <target> | <notes> |
| Availability | <target> | <notes> |
| Consistency | <target> | <notes> |
| Idempotency | Y/N | <strategy> |

---

```text id="bs-19"
Acceptance Criteria
```

| AC ID | Given | When | Then | Priority |
|---|---|---|---|---|
| AC-1 | <given> | <when> | <then> | P0/P1/P2 |

---

```text id="bs-20"
Test Plan & Traceability (AC → Test)
```

| AC ID | Test ID | Test Type | TDD | Notes |
|---|---|---|---|---|
| AC-1 | TEST-AC-1 | behavior/unit/contract | Y/N | <notes> |

**TDD Activation:** Y/N (rationale: <rationale>)

---

```text id="bs-21"
Dependencies
```

| Dependency | Type | Spec/Contract Ref | Notes |
|---|---|---|---|
| <dep> | internal/external | <ref> | <notes> |

---

```text id="bs-22"
Risks & Open Questions
```

| ID | Type | Description | Mitigation | Status |
|---|---|---|---|---|
| RISK-1 | risk/question | <desc> | <mitigation> | OPEN/RESOLVED |

---

```text id="bs-23"
Open Decisions
```

| Decision | Impact | Escalate to ADR? | Rationale |
|---|---|---|---|
| <decision> | low/med/high | Y/N | <rationale> |

---

```text id="bs-24"
Traceability
```

| Relationship | Target | Status |
|---|---|---|
| DERIVES_FROM | <REQ-XXX> | `VALID` |
| SPECIFIES | <ACs> | `VALID` |
| CONSTRAINS | <ADR-XXX> | `VALID` |
| VERIFIES | <TEST-XXX> | `VALID` |
