# Product Requirements

> Template for defining, organizing, validating, and tracing product requirements throughout the Spec-Gated Architecture Lifecycle.

## 1. Document Metadata

| Field            | Value                                             |
| ---------------- | ------------------------------------------------- |
| Document ID      | `PROD-REQ-XXX`                                    |
| Title            | `<Requirements Document Title>`                   |
| Product / System | `<Product / System Name>`                         |
| Version          | `<version>`                                       |
| Status           | `DRAFT`                                           |
| Lifecycle Mode   | `GREENFIELD / EXISTING_SYSTEM / SYSTEM_EVOLUTION` |
| Owner            | `<owner>`                                         |
| Date             | `<YYYY-MM-DD>`                                    |
| Last Updated     | `<YYYY-MM-DD>`                                    |

### Document Status

Allowed values:

```text
DRAFT
IN_REVIEW
APPROVED
SUPERSEDED
| Lifecycle Phase | Product Discovery |
---`

---

# 2. Purpose

Describe the purpose of this requirements document.

```text
<What product or system expectations are being captured?>
```

Requirements should describe what the product or system needs to achieve.

They should not prescribe implementation unless the implementation constraint is itself an explicit requirement.

---

# 3. Requirement Model

Each requirement should have a stable identifier.

Recommended format:

```text
REQ-001
REQ-002
REQ-003
```

A requirement should contain, at minimum:

```text
ID
Statement
Type
Priority
Status
Source
Acceptance Criteria
```

Additional fields should be introduced only when useful.

---

# 4. Requirement Statement

A requirement should express an observable expectation.

Preferred structure:

```text
The system/product shall <expected behavior or capability>.
```

Example:

```text
The product shall allow a user to create a weekly plan.
```

Avoid implementation-oriented statements such as:

```text
The product shall use Service X to create the weekly plan.
```

unless the technology or architecture is an explicit external constraint.

---

# 5. Requirement Types

Use one or more of the following categories.

```text
FUNCTIONAL
QUALITY_ATTRIBUTE
SECURITY
DATA
INTEGRATION
OPERATIONAL
COMPLIANCE
CONSTRAINT
```

### Functional

Describes behavior or capability.

### Quality Attribute

Describes characteristics such as:

* Performance
* Availability
* Reliability
* Scalability
* Maintainability
* Accessibility

### Security

Describes security expectations.

### Data

Describes data-related expectations.

### Integration

Describes interaction with external or internal systems.

### Operational

Describes deployment, monitoring, recovery, support, or operational behavior.

### Compliance

Describes regulatory or organizational obligations.

### Constraint

Describes a restriction that the solution must respect.

---

# 6. Priority

Recommended values:

```text
CRITICAL
HIGH
MEDIUM
LOW
```

Priority should reflect product or business importance.

Priority must not be confused with implementation complexity.

---

# 7. Requirement Status

Allowed values:

```text
OPEN
PROPOSED
ACCEPTED
IN_PROGRESS
IMPLEMENTED
VERIFIED
REJECTED
DEFERRED
SUPERSEDED
```

Recommended lifecycle:

```text
OPEN
  ↓
PROPOSED
  ↓
ACCEPTED
  ↓
IN_PROGRESS
  ↓
IMPLEMENTED
  ↓
VERIFIED
```

Alternative paths may include:

```text
PROPOSED → REJECTED
ACCEPTED → DEFERRED
ACCEPTED → SUPERSEDED
```

A requirement should not be marked `VERIFIED` merely because implementation exists.

Verification requires evidence.

---

# 8. Requirements Register

| ID        | Requirement     | Type         | Priority | Status     |
| --------- | --------------- | ------------ | -------- | ---------- |
| `REQ-001` | `<Requirement>` | `FUNCTIONAL` | `HIGH`   | `ACCEPTED` |
| `REQ-002` | `<Requirement>` | `SECURITY`   | `HIGH`   | `OPEN`     |

---

# 9. Detailed Requirement

Use this structure for requirements that require additional context.

## REQ-001 — `<Requirement Title>`

### Statement

```text
The system shall <expected behavior>.
```

### Rationale

```text
<Why is this requirement necessary?>
```

### Source

```text
<User / Stakeholder / Product Context / Regulation / Existing System / Other>
```

### Priority

```text
CRITICAL / HIGH / MEDIUM / LOW
```

### Status

```text
OPEN / PROPOSED / ACCEPTED / IN_PROGRESS / IMPLEMENTED / VERIFIED /
REJECTED / DEFERRED / SUPERSEDED
```

### Scope

```text
<Product area / capability / context affected>
```

### Constraints

```text
<Relevant constraints>
```

### Dependencies

```text
<Other requirements or external dependencies>
```

### Acceptance Criteria

```text
AC-001:
Given <context>
When <action>
Then <expected outcome>
```

### Verification

```text
Verification Method:
<TEST / CONTRACT_TEST / E2E / MANUAL / OPERATIONAL / OTHER>

Evidence:
<Test ID / Report / Artifact>
```

### Traceability

```text
DERIVES_FROM:
<Product Artifact>

SATISFIES:
<Domain Capability>

REALIZES:
<Architecture Element>

IMPLEMENTS:
<Implementation Artifact>

VERIFIES:
<Verification Artifact>
```

---

# 10. Acceptance Criteria

Acceptance criteria define observable conditions that determine whether a requirement has been satisfied.

Recommended structure:

```text
Given <initial context>
When <action or event>
Then <expected result>
```

Example:

```text
Given a user has an active plan
When the user requests the consolidated list
Then the system provides the items associated with the selected plan.
```

Acceptance criteria should focus on observable behavior.

They should not unnecessarily prescribe implementation.

---

# 11. Quality Attribute Requirements

Quality attributes should be expressed in measurable or evaluable terms whenever practical.

Example:

```text
REQ-010 — API Response Time

Type:
QUALITY_ATTRIBUTE

Statement:
The system shall respond to standard read operations within the defined
performance target under the expected operating conditions.
```

The target should be defined when evidence or project requirements support it.

Avoid inventing arbitrary numerical targets.

---

# 12. Security Requirements

Security requirements should explicitly describe relevant expectations.

Examples of categories:

```text
AUTHENTICATION
AUTHORIZATION
DATA_PROTECTION
AUDITING
SECRETS_MANAGEMENT
SESSION_MANAGEMENT
INPUT_VALIDATION
SECURE_COMMUNICATION
```

Example:

```text
REQ-020 — Authorization

The system shall prevent users from accessing resources
outside their authorized scope.
```

Security requirements should be traced to relevant:

* Domain rules
* Architecture boundaries
* Security decisions
* Contracts
* Specifications
* Verification

---

# 13. Data Requirements

Data requirements may describe:

* Required information
* Ownership
* Retention
* Lifecycle
* Consistency expectations
* Privacy requirements
* Migration requirements

Example:

```text
REQ-030 — Data Retention

The system shall retain <data> according to the defined
retention requirement.
```

Data requirements should not automatically dictate a database technology.

---

# 14. Integration Requirements

Integration requirements describe interactions with other systems.

Example:

```text
REQ-040 — External Integration

The system shall exchange <information> with <external system>
according to the agreed integration contract.
```

Integration requirements should identify, when known:

* External system
* Direction
* Purpose
* Data exchanged
* Expected behavior
* Failure expectations
* Compatibility requirements

---

# 15. Operational Requirements

Operational requirements may include:

* Deployment
* Availability
* Monitoring
* Logging
* Alerting
* Recovery
* Backup
* Scaling
* Configuration
* Operational support

Example:

```text
REQ-050 — Observability

The system shall expose sufficient operational information
to detect and diagnose relevant failures.
```

---

# 16. Constraints

Requirements may depend on constraints.

Example:

```text
REQ-060
Constraint:
The system must integrate with the existing identity provider.

Impact:
Architecture and security design must preserve the existing
authentication boundary.
```

The agent must distinguish:

```text
Requirement
≠
Constraint
≠
Architecture Decision
```

A requirement states what is needed.

A constraint limits the solution space.

A decision selects an option within that solution space.

---

# 17. Requirement Dependencies

Requirements may depend on other requirements.

| Requirement | Relationship     | Related Requirement |
| ----------- | ---------------- | ------------------- |
| `REQ-005`   | `DEPENDS_ON`     | `REQ-002`           |
| `REQ-008`   | `CONSTRAINS`     | `REQ-003`           |

Dependency relationships should be explicit where they materially affect implementation or sequencing.

---

# 18. Conflicting Requirements

Requirements may conflict.

Example:

```text
REQ-011:
Maximize data retention.

REQ-012:
Minimize retained personal information.
```

The agent should not silently resolve such conflicts.

It should record:

```text
Conflict:
REQ-011 ↔ REQ-012

Severity:
SIGNIFICANT

Impact:
Data lifecycle and compliance behavior cannot be finalized.

Resolution:
<Required decision>
```

Conflicting requirements may block progression when they materially affect architecture or product behavior.

---

# 19. Ambiguous Requirements

A requirement is ambiguous when multiple interpretations could produce materially different outcomes.

Example:

```text
REQ-015:
"The system should be fast."
```

This is insufficient if performance design depends on a specific target.

The agent should identify:

```text
Ambiguity:
"Fast" has no measurable or contextual definition.

Impact:
Performance requirements cannot be reliably designed.

Status:
OPEN
```

The agent should ask a focused question or document the uncertainty.

---

# 20. Assumptions Associated With Requirements

Requirements may depend on assumptions.

| ID        | Requirement | Assumption     | Confidence | Validation     |
| --------- | ----------- | -------------- | ---------- | -------------- |
| `ASM-001` | `REQ-010`   | `<Assumption>` | `MEDIUM`   | `<Validation>` |

Assumptions should not silently become requirements.

If an assumption becomes a confirmed constraint or requirement, the artifact should be updated explicitly.

---

# 21. Requirement Traceability

Every significant requirement should have a traceability path.

Minimum conceptual path:

```text
Requirement
    ↓
Domain Capability
    ↓
Architecture
    ↓
Specification
    ↓
Implementation
    ↓
Verification
```

Not every requirement will map to every layer.

For example, a security requirement may map directly to:

```text
Requirement
    ↓
Security Decision
    ↓
Architecture Constraint
    ↓
Implementation
    ↓
Security Verification
```

The agent should preserve the actual relationship.

---

# 22. Requirement Coverage

Requirement coverage should evaluate whether important requirements have meaningful downstream relationships.

| Requirement | Domain   | Architecture | Specification | Implementation | Verification |
| ----------- | -------- | ------------ | ------------- | -------------- | ------------ |
| `REQ-001`   | `CAP-01` | `ARCH-02`    | `SPEC-04`     | `MOD-07`       | `TEST-11`    |
| `REQ-002`   | `CAP-03` | `ARCH-05`    | `SPEC-08`     | `MOD-10`       | `TEST-15`    |

Possible statuses:

```text
COMPLETE
PARTIAL
MISSING
UNKNOWN
NOT_APPLICABLE
```

Coverage is not equivalent to correctness.

---

# 23. Requirement Change

When a requirement changes, the agent should perform impact analysis.

Recommended sequence:

```text
Requirement Change
       ↓
Affected Domain
       ↓
Affected Architecture
       ↓
Affected Contracts
       ↓
Affected Decisions
       ↓
Affected Specifications
       ↓
Affected Implementation
       ↓
Affected Verification
```

The agent should distinguish:

```text
DIRECT IMPACT
INDIRECT IMPACT
POTENTIAL IMPACT
NO IDENTIFIED IMPACT
UNKNOWN
```

---

# 24. Requirement Supersession

Requirements should not be silently deleted when they become obsolete.

Use:

```text
Status: SUPERSEDED
Superseded By: REQ-XXX
Reason: <Reason>
Date: <YYYY-MM-DD>
```

Historical traceability should be preserved where useful.

---

# 25. Requirement Rejection

Rejected requirements should retain their history.

```text
Status:
REJECTED

Reason:
<Why the requirement was rejected>

Decision:
<Related decision or authority>

Date:
<YYYY-MM-DD>
```

The agent must not reinterpret a rejected requirement as active scope.

---

# 26. Requirement Deferral

A deferred requirement remains known but is outside the current implementation scope.

```text
Status:
DEFERRED

Reason:
<Reason>

Target:
<Future phase / release / unknown>

Dependencies:
<Dependencies>
```

Deferred requirements must not be counted as current implementation obligations unless explicitly reactivated.

---

# 27. Existing System Requirements

When working with an existing system, requirements may exist in several states:

```text
DOCUMENTED REQUIREMENT
ACTUAL BEHAVIOR
INFERRED REQUIREMENT
TARGET REQUIREMENT
```

The agent must distinguish them.

Example:

```text
Documented:
Users can cancel an operation.

Actual:
Current implementation does not allow cancellation after processing begins.

Target:
Cancellation should become available until processing starts.
```

These are different facts and must not be merged.

---

# 28. System Evolution Requirements

For system evolution, requirements should focus on the delta.

Example:

```text
Existing Behavior:
A user can create a plan.

New Requirement:
A user shall be able to duplicate an existing plan.

Affected Area:
Plan Management
```

The agent should avoid rewriting the entire requirements model when the change is narrowly scoped.

---

# 29. Requirement Review

Before a requirement is accepted, evaluate:

* Is the requirement understandable?
* Is the expected outcome clear?
* Is it testable or otherwise verifiable?
* Is the source known?
* Is the priority justified?
* Are dependencies known?
* Are important constraints visible?
* Are ambiguities resolved?
* Are conflicts identified?
* Is the scope clear?
* Is the requirement free of unnecessary implementation prescription?

---

# 30. Requirement Quality Checklist

A high-quality requirement should be:

```text
CLEAR
CONSISTENT
RELEVANT
TESTABLE
TRACEABLE
FEASIBLE
UNAMBIGUOUS
SCOPED
```

Not every requirement can be perfectly measurable at the moment it is discovered.

In such cases, the missing information should be made explicit rather than invented.

---

# 31. Requirements Gate Contribution

Requirements contribute to the Product Discovery gate.

Potential blocking conditions include:

* Critical requirements are materially ambiguous.
* Conflicting requirements remain unresolved.
* Critical scope is undefined.
* Important security or compliance requirements are unknown.
* Requirements contain unsupported assumptions.
* The agent cannot distinguish requirements from implementation preferences.
* A high-impact requirement has no identifiable acceptance or verification approach.

---

# 32. Requirements Register Template

Use the following compact structure for routine requirement management.

| ID        | Statement     | Type     | Priority | Status     | Source     | Acceptance | Traceability  |
| --------- | ------------- | -------- | -------- | ---------- | ---------- | ---------- | ------------- |
| `REQ-001` | `<Statement>` | `<Type>` | `HIGH`   | `ACCEPTED` | `<Source>` | `AC-001`   | `<Artifacts>` |

---

# 33. Agent Instructions

When creating or updating requirements, the agent should:

1. Preserve stable requirement identifiers.
2. Separate requirements from implementation decisions.
3. Record the source of important requirements.
4. Identify ambiguity.
5. Identify conflicts.
6. Record assumptions explicitly.
7. Avoid inventing missing requirements.
8. Preserve rejected and superseded requirements where relevant.
9. Maintain meaningful traceability.
10. Analyze downstream impact when requirements change.
11. Keep requirement detail proportional to project scope.
12. Distinguish documented behavior from actual behavior in existing systems.
13. Require explicit confirmation for consequential requirement decisions when authority is unclear.
14. Never mark a requirement verified without evidence.

---

# 34. Final Principle

Requirements establish what the product or system is expected to achieve.

They form one of the primary anchors of the Spec-Gated Architecture Lifecycle:

```text
Product Intent
      ↓
Requirements
      ↓
Domain
      ↓
Architecture
      ↓
Contracts
      ↓
Specifications
      ↓
Implementation
      ↓
Verification
```

The agent should preserve this relationship without turning requirements into premature technical design.

> **A good requirement reduces ambiguity about the outcome while preserving freedom about the implementation.**

