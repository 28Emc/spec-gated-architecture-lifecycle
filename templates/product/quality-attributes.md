# Quality Attributes

> Template for defining, analyzing, tracing, and verifying non-functional expectations throughout the Spec-Gated Architecture Lifecycle.

## 1. Document Metadata

| Field            | Value                                             |
| ---------------- | ------------------------------------------------- |
| Document ID      | `PROD-QA-XXX`                                     |
| Title            | `<Quality Attributes Document Title>`             |
| Product / System | `<Product / System Name>`                         |
| Version          | `<version>`                                       |
| Status           | `DRAFT`                                           |
| Lifecycle Mode   | `GREENFIELD / EXISTING_SYSTEM / SYSTEM_EVOLUTION` |
| Owner            | `<owner>`                                         |
| Date             | `<YYYY-MM-DD>`                                    |
| Last Updated     | `<YYYY-MM-DD>`                                    |

### Document Status

Allowed values:

```text id="1j9p7z"
DRAFT
IN_REVIEW
APPROV
| Lifecycle Phase | Product Discovery |
---
SUPERSEDED
```

---

# 2. Purpose

Define the non-functional characteristics that materially influence product behavior, architecture, implementation, infrastructure, or operational readiness.

Quality attributes describe characteristics such as:

* Performance
* Availability
* Reliability
* Security
* Scalability
* Maintainability
* Observability
* Accessibility
* Resilience
* Compatibility
* Privacy
* Recoverability

They should be treated as explicit architectural and product concerns rather than informal expectations.

---

# 3. Core Principle

A quality attribute should be expressed as an observable expectation whenever practical.

Avoid vague statements such as:

```text id="jkjy8d"
The system must be fast.
```

Prefer:

```text id="m0l0ib"
The system should respond within the defined response-time target
under the expected operating conditions.
```

When a numerical target is not yet known, the uncertainty must remain explicit.

```text id="f4hy7h"
Target:
UNKNOWN

Required:
Define acceptable response time before architecture validation.
```

The agent must never invent arbitrary targets merely to make a quality attribute appear complete.

---

# 4. Quality Attribute Categories

The following categories may be used.

```text id="v3zjtx"
PERFORMANCE
AVAILABILITY
RELIABILITY
RESILIENCE
SCALABILITY
SECURITY
PRIVACY
MAINTAINABILITY
OBSERVABILITY
OPERABILITY
ACCESSIBILITY
COMPATIBILITY
RECOVERABILITY
PORTABILITY
```

Not every project requires every category.

The agent should include only relevant attributes.

---

# 5. Quality Attribute Record

Each significant quality attribute should have a stable identifier.

Recommended format:

```text id="qk0v7j"
QA-001
QA-002
QA-003
```

A quality attribute should contain, at minimum:

```text id="w9g2eo"
ID
Category
Statement
Priority
Scope
Target
Conditions
Measurement
Verification
Status
```

---

# 6. Quality Attribute Register

| ID       | Category       | Attribute     | Priority   | Status |
| -------- | -------------- | ------------- | ---------- | ------ |
| `QA-001` | `PERFORMANCE`  | `<Attribute>` | `HIGH`     | `OPEN` |
| `QA-002` | `AVAILABILITY` | `<Attribute>` | `HIGH`     | `OPEN` |
| `QA-003` | `SECURITY`     | `<Attribute>` | `CRITICAL` | `OPEN` |

---

# 7. Detailed Quality Attribute

## QA-001 — `<Quality Attribute Title>`

### Category

```text id="omx7zn"
PERFORMANCE
```

### Statement

```text id="rj46lo"
The system shall <quality expectation>.
```

### Rationale

```text id="2q5m0m"
<Why does this quality attribute matter?>
```

### Priority

```text id="n6ifh5"
CRITICAL / HIGH / MEDIUM / LOW
```

### Scope

```text id="7i0h9g"
<System area, capability, interface, workflow, or environment>
```

### Target

```text id="gohjv6"
<Target value or defined qualitative expectation>
```

### Conditions

```text id="f5p9fz"
Expected conditions under which the target applies.
```

### Measurement

```text id="f7v4fh"
<How the attribute will be measured>
```

### Verification

```text id="v3v9v8"
<How compliance will be verified>
```

### Status

```text id="u5p7qk"
OPEN
PROPOSED
ACCEPTED
IMPLEMENTED
VERIFIED
DEFERRED
SUPERSEDED
```

---

# 8. Performance

Performance concerns how efficiently the system responds or processes work.

Relevant dimensions may include:

* Response time
* Throughput
* Latency
* Processing time
* Resource consumption
* Concurrent workload
* Batch processing duration

Example:

```text id="7q7y5x"
QA-001 — Read Operation Latency

Category:
PERFORMANCE

Statement:
The system shall provide read operations within the defined latency
target under expected operating conditions.

Target:
<Target>

Conditions:
<Expected workload>

Measurement:
<Measurement method>
```

The agent should distinguish between:

```text id="i8pkis"
LATENCY
THROUGHPUT
CAPACITY
RESOURCE CONSUMPTION
```

They are related but not interchangeable.

---

# 9. Availability

Availability describes the expected ability of the system to remain accessible and operational.

Possible concerns:

* Service availability
* Planned downtime
* Dependency failures
* Recovery behavior
* Maintenance windows

Example:

```text id="k6rfl6"
QA-002 — Service Availability

Statement:
The service shall remain available according to the defined
availability objective.

Target:
<Availability objective>

Measurement:
<Measurement>
```

Availability targets should be evidence-based.

Do not invent a target such as `99.99%` unless the project actually requires it.

---

# 10. Reliability

Reliability concerns consistent correct behavior over time.

Possible concerns:

* Failure frequency
* Data integrity
* Error rates
* Retry behavior
* Idempotency
* Consistency

Example:

```text id="3x3cvk"
QA-003 — Operation Reliability

Statement:
The system shall preserve the required correctness guarantees
when processing repeated or retried operations.
```

The agent should connect reliability requirements to domain invariants and operational behavior where applicable.

---

# 11. Resilience

Resilience describes how the system behaves when failures occur.

Relevant scenarios may include:

* Service unavailability
* Network failure
* Dependency timeout
* Partial failure
* Message delivery failure
* Resource exhaustion

Example:

```text id="6p8hpo"
QA-004 — Dependency Failure

Statement:
The system shall handle failure of the designated external dependency
without violating critical business invariants.
```

Resilience requirements should identify what must remain true during failure.

---

# 12. Scalability

Scalability concerns the system's ability to handle changing workload or system size.

Relevant dimensions:

* Users
* Requests
* Data volume
* Concurrent operations
* Geographic distribution
* Processing volume

Example:

```text id="h0a0qy"
QA-005 — Workload Growth

Expected Workload:
<Current workload>

Target Workload:
<Expected future workload>

Required Behavior:
<Expected system behavior as workload increases>
```

The agent must not assume that horizontal scaling is always required.

Scalability is an outcome, not an automatic architectural pattern.

---

# 13. Security

Security quality attributes describe protection requirements.

Possible dimensions:

```text id="9d7z3y"
AUTHENTICATION
AUTHORIZATION
CONFIDENTIALITY
INTEGRITY
ACCOUNTABILITY
AUDITING
SECRETS MANAGEMENT
SECURE COMMUNICATION
INPUT PROTECTION
```

Example:

```text id="v1x6a8"
QA-006 — Authorization

Statement:
The system shall enforce access according to the defined
authorization boundaries.

Scope:
<Resource / capability>

Verification:
<Security test / authorization test / audit>
```

Security quality attributes should be traced to:

* Security requirements
* Security decisions
* Architecture boundaries
* Contracts
* Implementation
* Security verification

---

# 14. Privacy

Privacy concerns how personal or sensitive information is handled.

Possible concerns:

* Collection
* Usage
* Retention
* Access
* Deletion
* Anonymization
* Exposure

Example:

```text id="u1l2v8"
QA-007 — Personal Data Handling

Statement:
The system shall process personal information only within
the defined usage and access boundaries.
```

Privacy requirements should not be invented where no relevant data exists.

---

# 15. Maintainability

Maintainability concerns the ability to understand, modify, test, and evolve the system.

Possible dimensions:

* Modularity
* Coupling
* Testability
* Documentation
* Change isolation
* Deployment independence

Example:

```text id="u4x4oz"
QA-008 — Change Isolation

Statement:
Changes within <defined boundary> should not require
unrelated components to change unless an explicit dependency exists.
```

Maintainability should be expressed in terms of meaningful engineering outcomes rather than subjective preferences.

---

# 16. Observability

Observability concerns the ability to understand system behavior from available operational evidence.

Possible dimensions:

* Logs
* Metrics
* Traces
* Health information
* Correlation
* Alerting
* Diagnostic information

Example:

```text id="3f9r8w"
QA-009 — Diagnostic Visibility

Statement:
The system shall expose sufficient operational information
to identify and diagnose relevant failures.
```

The agent should avoid prescribing a specific observability technology unless it is an explicit project decision or constraint.

---

# 17. Operability

Operability concerns the ability to deploy, operate, configure, monitor, and support the system.

Possible dimensions:

* Deployment
* Configuration
* Rollback
* Health checks
* Monitoring
* Alerting
* Maintenance

Example:

```text id="q3qsm6"
QA-010 — Deployment Safety

Statement:
The system shall support the defined deployment and rollback
process without violating critical data or business invariants.
```

---

# 18. Accessibility

Accessibility concerns the ability of intended users to interact with the product.

Relevant concerns may include:

* Keyboard navigation
* Screen-reader support
* Contrast
* Alternative text
* Input accessibility
* Error communication

Example:

```text id="5jgr9d"
QA-011 — Accessible Interaction

Statement:
The user interface shall support the accessibility requirements
defined for the target users and applicable standards.
```

Applicable standards should be identified when they are known.

---

# 19. Compatibility

Compatibility concerns interoperability with expected environments, versions, clients, or systems.

Possible concerns:

* API versions
* Client compatibility
* Browser compatibility
* Protocol compatibility
* Data compatibility
* Backward compatibility

Example:

```text id="m8v5k0"
QA-012 — API Compatibility

Statement:
The API shall preserve compatibility with supported clients
according to the defined compatibility policy.
```

Compatibility expectations should be explicitly scoped.

---

# 20. Recoverability

Recoverability concerns restoring acceptable system behavior after failure.

Relevant dimensions:

* Recovery time
* Recovery point
* Data restoration
* Service restoration
* Operational procedures

Example:

```text id="5qv5g4"
QA-013 — Data Recovery

Statement:
The system shall support recovery of required data
according to the defined recovery objectives.
```

Targets such as RTO and RPO should be included only when relevant.

---

# 21. Quality Attribute Scenarios

For important attributes, use structured scenarios.

```text id="8r3jxh"
Source:
<Actor / Event>

Stimulus:
<What happens?>

Environment:
<Normal / Peak / Failure / Maintenance / Other>

Artifact:
<Component / Service / System>

Response:
<Expected behavior>

Measure:
<How the response is evaluated>
```

Example:

```text id="c4m7xk"
Source:
External client

Stimulus:
High request volume

Environment:
Expected peak workload

Artifact:
API boundary

Response:
Requests continue to receive responses within the
defined performance objective.

Measure:
Observed response latency and error rate.
```

Quality attribute scenarios should be used when they provide meaningful precision.

---

# 22. Quality Attribute Trade-Offs

Quality attributes may conflict.

Examples:

```text id="h0d9r7"
Security ↔ Convenience
Performance ↔ Consistency
Availability ↔ Strong Coordination
Scalability ↔ Simplicity
Maintainability ↔ Short-Term Delivery Speed
```

The agent must not silently optimize one attribute at the expense of another.

Conflicts should be recorded.

| Attribute A | Attribute B | Tension       | Resolution   |
| ----------- | ----------- | ------------- | ------------ |
| `<A>`       | `<B>`       | `<Trade-off>` | `<Decision>` |

If resolution requires an architectural decision, create or reference an ADR.

---

# 23. Quality Attribute Prioritization

Not all quality attributes have equal importance.

Use:

```text id="8u5rr0"
CRITICAL
HIGH
MEDIUM
LOW
```

Prioritization should consider:

* Business impact
* User impact
* Security
* Operational impact
* Cost
* Regulatory requirements
* Architecture consequences

A quality attribute with no meaningful priority should be reviewed.

---

# 24. Quality Attribute Constraints

Some quality attributes impose architectural constraints.

Example:

```text id="5k7r9p"
QA-006 — Availability

Requirement:
The critical operation must remain available during
failure of a non-critical dependency.

Potential Architectural Consequence:
Dependency isolation may be required.
```

The agent should distinguish:

```text id="f3f7w4"
Quality Requirement
        ↓
Architectural Consequence
```

from:

```text id="7a4b7f"
Quality Requirement
        ↓
Specific Technology Choice
```

The latter requires additional analysis and should not be assumed.

---

# 25. Verification Strategy

Each significant quality attribute should define how it can be verified.

Possible verification methods:

```text id="r2u9om"
UNIT_TEST
INTEGRATION_TEST
CONTRACT_TEST
END_TO_END_TEST
LOAD_TEST
PERFORMANCE_TEST
SECURITY_TEST
CHAOS / FAILURE_TEST
ARCHITECTURE_TEST
STATIC_ANALYSIS
MANUAL_REVIEW
OPERATIONAL_VALIDATION
RUNTIME_OBSERVATION
```

Not every attribute can be verified through a single automated test.

The agent should select verification appropriate to the attribute.

---

# 26. Quality Attribute Status

Recommended lifecycle:

```text id="6b7jgu"
OPEN
  ↓
PROPOSED
  ↓
ACCEPTED
  ↓
IMPLEMENTED
  ↓
VERIFIED
```

Alternative states:

```text id="0y7gtr"
REJECTED
DEFERRED
SUPERSEDED
```

`IMPLEMENTED` does not mean `VERIFIED`.

---

# 27. Quality Attribute Traceability

Important quality attributes should be traceable through the lifecycle.

Example:

```text id="3dyx0y"
Quality Attribute
       ↓
Requirement
       ↓
Architecture Constraint
       ↓
Architecture Decision
       ↓
Specification
       ↓
Implementation
       ↓
Verification
```

Another example:

```text id="p2i8lo"
Security Requirement
       ↓
Security Boundary
       ↓
Authorization Contract
       ↓
Implementation
       ↓
Security Test
```

Traceability should reflect actual relationships.

---

# 28. Quality Attribute Impact Analysis

When a quality attribute changes, analyze:

```text id="3v1vsi"
Product Impact
Domain Impact
Architecture Impact
Contract Impact
Data Impact
Security Impact
Infrastructure Impact
Operational Impact
Testing Impact
Cost / Complexity Impact
```

Example:

```text id="n9f7qg"
Change:
Increase availability objective.

Potential Impact:
- Architecture
- Infrastructure
- Deployment
- Resilience
- Monitoring
- Cost
- Testing
```

The agent should identify actual impact rather than automatically assuming every dimension is affected.

---

# 29. Existing System Assessment

For an existing system, quality attributes should distinguish:

```text id="qj5j4k"
DOCUMENTED TARGET
ACTUAL BEHAVIOR
MEASURED BEHAVIOR
UNKNOWN
```

Example:

```text id="x7x1j8"
Availability

Documented:
99.9%

Observed:
No reliable measurement available.

Status:
UNKNOWN
```

The agent must not treat an undocumented assumption as a measured characteristic.

---

# 30. Quality Attribute Debt

Quality attribute debt exists when the system knowingly operates below an important quality expectation.

Examples:

* Missing observability
* Known performance bottleneck
* Incomplete recovery capability
* Weak compatibility strategy
* Insufficient automated verification
* Known maintainability issue

Record:

```text id="r4v0z3"
QA Debt:
<Description>

Expected Attribute:
<QA ID>

Current State:
<Current behavior>

Impact:
<Impact>

Risk:
<Risk>

Planned Resolution:
<Resolution or UNKNOWN>
```

---

# 31. Quality Attribute Conflicts

The agent should classify conflicts using the lifecycle severity model.

```text id="o1b9jg"
INFO
WARNING
SIGNIFICANT
BLOCKING
```

A conflict is potentially blocking when:

* Critical security expectations conflict with required functionality.
* Required availability cannot coexist with current constraints.
* Performance targets are incompatible with known architecture constraints.
* Regulatory requirements conflict with product scope.
* Recovery expectations cannot be supported by the current infrastructure.

---

# 32. Review Checklist

Before quality attributes are considered sufficiently defined:

* [ ] Relevant quality categories are identified.
* [ ] Important attributes have stable IDs.
* [ ] Expectations are clearly stated.
* [ ] Priority is defined.
* [ ] Scope is clear.
* [ ] Targets are evidence-based.
* [ ] Unknown targets remain explicit.
* [ ] Relevant conditions are defined.
* [ ] Important trade-offs are identified.
* [ ] Architectural consequences are understood.
* [ ] Verification methods are identified.
* [ ] Important quality attributes are traceable.
* [ ] Existing-system measurements are distinguished from documented targets.
* [ ] Critical conflicts are resolved or explicitly recorded.

---

# 33. Gate Contribution

Quality attributes contribute to Product Discovery and Architecture gates.

Potential blocking conditions include:

* Critical quality expectations are unknown.
* A required security attribute is unresolved.
* A critical operational requirement has no viable verification strategy.
* Quality targets materially conflict with architectural constraints.
* A major quality attribute has significant architectural consequences that have not been analyzed.

---

# 34. Compact Register

For routine projects, the following compact representation may be sufficient:

| ID       | Category      | Statement       | Priority   | Target     | Verification | Status     |
| -------- | ------------- | --------------- | ---------- | ---------- | ------------ | ---------- |
| `QA-001` | `PERFORMANCE` | `<Expectation>` | `HIGH`     | `<Target>` | `<Method>`   | `ACCEPTED` |
| `QA-002` | `SECURITY`    | `<Expectation>` | `CRITICAL` | `<Target>` | `<Method>`   | `OPEN`     |

Use the detailed record only when additional context is necessary.

---

# 35. Agent Instructions

When working with quality attributes, the agent should:

1. Identify only relevant quality concerns.
2. Avoid inventing numerical targets.
3. Separate quality expectations from technology choices.
4. Make important quality expectations explicit.
5. Identify trade-offs.
6. Analyze architectural consequences.
7. Preserve unknowns.
8. Distinguish target behavior from measured behavior.
9. Define appropriate verification methods.
10. Maintain traceability.
11. Scale documentation depth according to project risk.
12. Escalate unresolved critical quality conflicts.
13. Reassess quality attributes when architecture or requirements change.
14. Never claim a quality attribute is verified without evidence.

---

# 36. Final Principle

Quality attributes are not decorative properties added after functional requirements.

They are constraints and expectations that may fundamentally shape:

```text id="l2x7zn"
Domain
  ↓
Architecture
  ↓
Contracts
  ↓
Infrastructure
  ↓
Implementation
  ↓
Verification
```

The agent should therefore treat significant quality attributes as first-class lifecycle inputs.

> **A quality attribute becomes architecturally useful when its expected behavior, context, consequences, and verification method are explicit.**

