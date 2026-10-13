# Test Specification

## 1. Document Metadata

| Field                  | Value                |
| ---------------------- | -------------------- |
| Document Type          | Test Specification   |
| Lifecycle Phase        | Specifications / SDD |
| Specification Type     | `TEST`               |
| Status                 | `DRAFT`              |
| Version                | `0.1`                |
| System                 | `<system>`           |
| Test Scope             | `<scope>`            |
| Owner                  | `<owner>`            |
| Created                | `<date>`             |
| Last Updated           | `<date>`             |
| Architecture Baseline  | `<baseline>`         |
| Specification Baseline | `<baseline>`         |
| ADR Baseline           | `<baseline>`         |

---

# 2. Purpose

This document specifies how the system, its boundaries, behaviors, contracts, architecture, and operational characteristics are verified against approved expectations.

It defines:

* what must be verified,
* why it must be verified,
* the expected behavior,
* verification scope,
* test levels,
* test scenarios,
* test data,
* test environments,
* dependencies,
* negative behavior,
* failure behavior,
* security verification,
* contract verification,
* quality attribute verification,
* migration verification,
* deployment verification,
* evidence requirements,
* and traceability.

The purpose is not to prescribe a specific testing framework or tool.

---

# 3. Core Principle

> **Test Specification defines how approved requirements, domain behavior, architecture, contracts, specifications, and operational expectations are verified without treating tests as a substitute for those artifacts.**

A test is evidence.

A test is not automatically:

* a requirement,
* a business rule,
* an architecture decision,
* a contract,
* a specification,
* or proof of correctness beyond its defined scope.

---

# 4. Fundamental Distinctions

## Requirement

Defines what must be achieved.

## Business Rule

Defines domain behavior or constraints.

## Contract

Defines what a boundary participant may rely upon.

## Specification

Defines implementation-relevant expected behavior.

## Test Specification

Defines how those expectations are verified.

## Test Implementation

Implements the verification mechanism.

## Test Result

Provides evidence from an executed verification.

---

# 5. Entry Conditions

Before creating this specification:

* [ ] Requirements are available.
* [ ] Business rules are available where relevant.
* [ ] Domain model is sufficiently understood.
* [ ] Architecture baseline is available.
* [ ] Relevant contracts are available.
* [ ] Relevant ADRs are available.
* [ ] Relevant specifications are available.
* [ ] Quality attributes are identified.
* [ ] Security expectations are identified.
* [ ] Operational expectations are identified.
* [ ] Migration requirements are identified where applicable.
* [ ] Blocking verification unknowns are identified.

---

# 6. Verification Scope

```text id="r6m4pk"
Scope:
<scope>

Included:

- <area>
- <area>

Excluded:

- <area>
- <area>

Reason:
<reason>
```

Test scope must reflect the system scope and verification objectives.

---

# 7. Verification Objectives

```text id="v8q3mx"
Objective:

Verify that:
<expected behavior>

Evidence:
<evidence>

Source:
<requirement / contract / specification / ADR>
```

Verification should be driven by meaningful expectations rather than test-count targets.

---

# 8. Test Strategy

```text id="k5m9vp"
Test Strategy:
<strategy>

Primary Risks:
<risks>

Critical Behaviors:
<behaviors>

Critical Boundaries:
<boundaries>

Required Evidence:
<evidence>
```

The strategy should prioritize:

* critical behavior,
* high-risk boundaries,
* important business rules,
* security,
* data integrity,
* contract compatibility,
* failure behavior,
* and consequential quality attributes.

---

# 9. Test Levels

Possible verification levels include:

* unit,
* component,
* integration,
* contract,
* system,
* end-to-end,
* acceptance,
* security,
* performance,
* resilience,
* operational,
* deployment,
* infrastructure,
* migration.

Not every system requires every level.

---

# 10. Test Level Selection

| Level          | Purpose                        | Required   |
| -------------- | ------------------------------ | ---------- |
| Unit           | Isolated behavior              | `<yes/no>` |
| Component      | Component behavior             | `<yes/no>` |
| Integration    | Boundary interaction           | `<yes/no>` |
| Contract       | Contract compatibility         | `<yes/no>` |
| System         | System behavior                | `<yes/no>` |
| End-to-End     | Critical user/business flow    | `<yes/no>` |
| Security       | Security behavior              | `<yes/no>` |
| Performance    | Quality attribute verification | `<yes/no>` |
| Resilience     | Failure/recovery behavior      | `<yes/no>` |
| Deployment     | Deployment behavior            | `<yes/no>` |
| Infrastructure | Infrastructure behavior        | `<yes/no>` |
| Migration      | Transition behavior            | `<yes/no>` |

Selection must be risk-driven.

---

# 11. Test Pyramid / Distribution

The project may define a preferred test distribution.

```text id="r7x4mk"
Test Distribution:
<strategy>

Rationale:
<reason>
```

Do not prescribe a universal ratio.

The appropriate distribution depends on:

* architecture,
* domain complexity,
* integration surface,
* runtime behavior,
* risk,
* and change frequency.

---

# 12. Verification Evidence

Evidence may include:

* automated test results,
* contract verification,
* static analysis,
* runtime measurements,
* security verification,
* infrastructure verification,
* migration evidence,
* manual acceptance evidence,
* controlled experiments,
* operational validation.

```text id="v3m7pq"
Evidence Type:
<type>

Source:
<source>

Retention:
<requirement>

Consumer:
<consumer>
```

---

# 13. Requirement Traceability

| Requirement | Test / Verification | Evidence     | Status     |
| ----------- | ------------------- | ------------ | ---------- |
| `<REQ-001>` | `<TEST-001>`        | `<evidence>` | `<status>` |

Every critical requirement should have an appropriate verification path.

---

# 14. Business Rule Verification

```text id="k8m5vp"
Rule:
<rule>

Scenario:
<scenario>

Expected Result:
<result>

Verification:
<test>

Evidence:
<evidence>
```

Business rules should be verified independently of implementation details where possible.

---

# 15. Domain Behavior Verification

```text id="r4x9mk"
Domain Behavior:
<behavior>

Given:
<condition>

When:
<action>

Then:
<expected outcome>

Invariant:
<invariant>

Verification:
<test>
```

---

# 16. Invariant Verification

```text id="v7q3mx"
Invariant:
<invariant>

Scope:
<aggregate / context / system>

Violation Condition:
<condition>

Expected Result:
<result>

Verification:
<test>
```

Critical invariants must have explicit verification.

---

# 17. State Transition Verification

```text id="k6m8vp"
State:
<current>

Trigger:
<trigger>

Expected State:
<next>

Invalid Transition:
<behavior>

Verification:
<test>
```

---

# 18. Use Case Verification

```text id="r9x4mk"
Use Case:
<use case>

Primary Actor:
<actor>

Preconditions:
<conditions>

Action:
<action>

Expected Outcome:
<outcome>

Alternative Paths:
<paths>

Exception Paths:
<paths>

Verification:
<tests>
```

Important alternative and exception paths should not be omitted merely because the happy path works.

---

# 19. Acceptance Criteria Verification

```text id="v5m7pq"
Requirement:
<requirement>

Acceptance Criterion:
<criterion>

Verification Method:
<method>

Expected Evidence:
<evidence>
```

---

# 20. API Contract Verification

For each relevant API contract:

```text id="k8m3vp"
API Contract:
<contract>

Provider:
<provider>

Consumer:
<consumer>

Verification:

- Request semantics
- Response semantics
- Validation
- Error behavior
- Idempotency
- Consistency
- Ordering
- Security
- Compatibility
```

API verification must validate semantic compatibility, not only schema compatibility.

---

# 21. API Specification Verification

```text id="r6x9mk"
API Operation:
<operation>

Scenario:
<scenario>

Input:
<input>

Expected Output:
<output>

Error:
<error>

Security:
<security>

Observability:
<observability>
```

---

# 22. Event Contract Verification

```text id="v7m4pq"
Event Contract:
<contract>

Publisher:
<publisher>

Consumer:
<consumer>

Verification:

- Event semantics
- Payload meaning
- Metadata
- Identity
- Ordering
- Delivery
- Duplicate behavior
- Replay behavior
- Failure behavior
- Security
- Evolution
```

Do not assume delivery guarantees that are not defined by the approved Event Contract.

---

# 23. Event Specification Verification

```text id="k5x8vp"
Event:
<event>

Publication Scenario:
<scenario>

Expected Publication:
<expected>

Consumer Behavior:
<expected>

Failure:
<expected>

Verification:
<test>
```

---

# 24. Data Contract Verification

```text id="r8m3pk"
Data Contract:
<contract>

Provider:
<provider>

Consumer:
<consumer>

Verification:

- Meaning
- Ownership
- Structure
- Constraints
- Null semantics
- Quality
- Freshness
- Security
- Lifecycle
- Compatibility
```

---

# 25. Data / Persistence Verification

```text id="v4q7mx"
Data Element:
<data>

Persistence Behavior:
<behavior>

Verification:

- Creation
- Update
- Retrieval
- Deletion
- Consistency
- Integrity
- Concurrency
- Migration
- Recovery
```

Persistence verification must not redefine domain semantics.

---

# 26. Security Verification

Security verification should cover relevant:

* authentication,
* authorization,
* privilege boundaries,
* data protection,
* secret handling,
* session behavior,
* failure behavior,
* auditability,
* security observability.

```text id="k9m5vp"
Security Requirement:
<requirement>

Threat / Risk:
<risk>

Scenario:
<scenario>

Expected Result:
<result>

Evidence:
<evidence>
```

---

# 27. Authorization Verification

```text id="r5x8mk"
Principal:
<principal>

Action:
<action>

Resource:
<resource>

Expected:
<allow | deny>

Reason:
<reason>

Verification:
<test>
```

Business authority and technical authorization must remain distinguishable.

---

# 28. Negative Security Verification

```text id="v3m9pq"
Scenario:
<unauthorized behavior>

Given:
<condition>

When:
<attempt>

Then:
<denial / protection>

Evidence:
<evidence>
```

Security verification must test important invalid and unauthorized paths.

---

# 29. Sensitive Data Verification

```text id="k7m4vp"
Data:
<data>

Protected:
<YES>

Exposure Risk:
<risk>

Verification:

- API response
- logs
- events
- traces
- errors
- storage
```

Sensitive data must not appear in unauthorized channels.

---

# 30. Observability Verification

Observability verification should confirm that important operational questions can actually be answered.

```text id="r8x5mk"
Operational Question:
<question>

Signal:
<signal>

Expected Evidence:
<evidence>

Verification:
<test>
```

---

# 31. Runtime Verification

Runtime tests should cover relevant:

* startup,
* initialization,
* readiness,
* liveness,
* shutdown,
* dependency failure,
* concurrency,
* cancellation,
* timeout,
* resource exhaustion,
* recovery,
* restart.

```text id="v6m3pq"
Runtime Scenario:
<scenario>

Expected Behavior:
<behavior>

Verification:
<test>
```

---

# 32. Configuration Verification

```text id="k9m5vp"
Configuration:
<configuration>

Scenario:
<scenario>

Expected Result:
<result>

Verification:

- valid configuration
- invalid configuration
- missing configuration
- default behavior
- precedence
- conflict
- secret handling
```

---

# 33. Deployment Verification

Deployment verification should cover:

* artifact identity,
* deployment success,
* startup,
* readiness,
* dependency connectivity,
* compatibility,
* rollback,
* migration where relevant.

```text id="r4x8mk"
Deployment:
<deployment>

Scenario:
<scenario>

Expected Result:
<result>

Evidence:
<evidence>
```

---

# 34. Infrastructure Verification

When infrastructure is part of the test scope:

```text id="v7m3pq"
Infrastructure Capability:
<capability>

Verification:

- provisioning
- connectivity
- security
- availability
- backup
- recovery
- resource behavior
```

---

# 35. Integration Verification

```text id="k5x9vp"
Integration:
<integration>

Participants:
<participants>

Scenario:
<scenario>

Expected Result:
<result>

Failure:
<failure behavior>

Recovery:
<recovery>
```

Integration tests must verify boundary semantics, not merely technical connectivity.

---

# 36. Failure Testing

```text id="r8m4pk"
Failure:
<failure>

Injection / Trigger:
<trigger>

Expected Behavior:
<behavior>

Containment:
<containment>

Recovery:
<recovery>

Evidence:
<evidence>
```

Failure testing should focus on meaningful failure modes.

---

# 37. Dependency Failure Testing

```text id="v4q8mx"
Dependency:
<dependency>

Failure:
<failure>

Expected Runtime Behavior:
<behavior>

Expected User/Consumer Behavior:
<behavior>

Recovery:
<recovery>
```

---

# 38. Partial Failure Testing

```text id="k9m3vp"
Scenario:
<partial failure>

Available Capabilities:
<capabilities>

Unavailable Capabilities:
<capabilities>

Expected Behavior:
<behavior>
```

---

# 39. Resilience Verification

```text id="r5x7mk"
Failure Scenario:
<scenario>

Resilience Mechanism:
<mechanism>

Expected Behavior:
<behavior>

Recovery:
<recovery>

Residual Risk:
<risk>
```

Do not claim resilience simply because failure was tolerated once.

---

# 40. Concurrency Verification

```text id="v8m4pq"
Scenario:
<scenario>

Concurrent Operations:
<operations>

Expected Result:
<result>

Consistency:
<requirement>

Race Condition Risk:
<risk>

Verification:
<test>
```

---

# 41. Idempotency Verification

```text id="k6x9vp"
Operation:
<operation>

Repeated Request:
<request>

Expected Result:
<result>

Duplicate Side Effect:
<expected behavior>

Verification:
<test>
```

Idempotency must be verified only where the contract or specification requires it.

---

# 42. Ordering Verification

```text id="r4m8pk"
Operations / Events:
<operations>

Ordering Requirement:
<requirement>

Scenario:
<scenario>

Expected Result:
<result>
```

---

# 43. Timeout Verification

```text id="v7q3mx"
Operation:
<operation>

Timeout Condition:
<condition>

Expected Behavior:
<behavior>

Recovery:
<recovery>

Verification:
<test>
```

Do not invent timeout values.

---

# 44. Cancellation Verification

```text id="k5m9vp"
Operation:
<operation>

Cancellation Trigger:
<trigger>

Expected Behavior:
<behavior>

Cleanup:
<cleanup>

Consistency:
<requirement>
```

---

# 45. Backpressure Verification

When applicable:

```text id="r8x4mk"
Workload:
<workload>

Pressure Condition:
<condition>

Expected Behavior:
<behavior>

Overflow:
<behavior>

Recovery:
<recovery>
```

---

# 46. Performance Verification

Performance tests must derive their objectives from approved quality attributes or architectural decisions.

```text id="v3m7pq"
Quality Attribute:
<attribute>

Scenario:
<scenario>

Workload:
<workload>

Expected Behavior:
<approved target>

Measurement:
<measurement>

Evidence:
<evidence>
```

Do not invent performance thresholds.

---

# 47. Load Testing

```text id="k7m4vp"
Scenario:
<scenario>

Load Model:
<model>

Workload Source:
<source>

Expected Behavior:
<approved requirement>

Failure Threshold:
<approved requirement>

Evidence:
<evidence>
```

---

# 48. Stress Testing

```text id="r6x8mk"
Scenario:
<scenario>

Stress Condition:
<condition>

Expected Behavior:
<behavior>

Failure Mode:
<failure>

Recovery:
<recovery>
```

Stress testing should answer a meaningful question.

---

# 49. Capacity Verification

```text id="v9m3pq"
Resource:
<resource>

Capacity Question:
<question>

Measurement:
<measurement>

Evidence:
<evidence>

Decision:
<decision>
```

Capacity should be measured or estimated from evidence rather than assumed.

---

# 50. Compatibility Testing

```text id="k5x8vp"
Producer:
<producer>

Consumer:
<consumer>

Version A:
<version>

Version B:
<version>

Compatibility:
<expected>

Verification:
<test>
```

Compatibility must include semantic behavior where relevant.

---

# 51. Migration Testing

```text id="r8m4pk"
Migration:
<migration>

Current State:
<state>

Transition:
<transition>

Expected State:
<state>

Rollback:
<rollback>

Verification:
<test>
```

---

# 52. Data Migration Verification

```text id="v6q3mx"
Data Set:
<data>

Migration:
<migration>

Integrity:
<requirement>

Completeness:
<requirement>

Compatibility:
<requirement>

Verification:
<method>
```

---

# 53. Deployment Migration Verification

```text id="k9m5vp"
Current Deployment:
<deployment>

Target Deployment:
<deployment>

Compatibility:
<requirement>

Cutover:
<condition>

Rollback:
<condition>

Verification:
<test>
```

---

# 54. End-to-End Verification

End-to-end tests should be reserved for meaningful business/system flows.

```text id="r5x8mk"
Scenario:
<business scenario>

Actor:
<actor>

Entry:
<entry>

Flow:
<flow>

Expected Outcome:
<outcome>

External Dependencies:
<dependencies>

Evidence:
<evidence>
```

End-to-end tests should not replace lower-level verification.

---

# 55. Test Data Strategy

```text id="v3m9pq"
Data Strategy:
<strategy>

Sources:
<source>

Generation:
<generation>

Privacy:
<requirements>

Isolation:
<requirements>

Lifecycle:
<lifecycle>
```

---

# 56. Test Data Classification

Test data may include:

* synthetic,
* anonymized,
* representative,
* production-derived,
* generated,
* fixed fixtures.

Production data should not be used merely for convenience.

---

# 57. Test Data Security

```text id="k7m4vp"
Data:
<data>

Sensitivity:
<classification>

Protection:
<protection>

Access:
<access>

Retention:
<retention>

Deletion:
<deletion>
```

---

# 58. Test Environment

```text id="r8x5mk"
Environment:
<environment>

Purpose:
<purpose>

Runtime:
<runtime>

Dependencies:
<dependencies>

Data:
<data>

Configuration:
<configuration>

Isolation:
<isolation>
```

---

# 59. Environment Fidelity

```text id="v6m3pq"
Production Characteristic:
<characteristic>

Test Environment:
<representation>

Fidelity:
<HIGH | MEDIUM | LOW>

Risk:
<risk>

Mitigation:
<mitigation>
```

Not every test requires production-like infrastructure.

---

# 60. External Dependency Strategy

For external dependencies, choose explicitly:

* real dependency,
* controlled test environment,
* simulator,
* stub,
* mock,
* contract test,
* sandbox.

```text id="k9m5vp"
Dependency:
<dependency>

Strategy:
<strategy>

Reason:
<reason>

Limitations:
<limitations>
```

Do not mock boundaries whose real behavior is critical to the verification objective.

---

# 61. Test Doubles

Test doubles may include:

* stub,
* mock,
* fake,
* simulator,
* spy.

Selection should be driven by the verification objective.

A test double must not hide the behavior the test intends to verify.

---

# 62. Contract Testing

```text id="r4x8mk"
Contract:
<contract>

Provider:
<provider>

Consumer:
<consumer>

Verification Direction:
<provider / consumer / both>

Compatibility:
<criteria>

Evidence:
<evidence>
```

---

# 63. Test Isolation

```text id="v7m3pq"
Test:
<test>

Isolation Requirement:
<requirement>

Shared Resources:
<resources>

State Reset:
<method>

Parallel Safety:
<requirement>
```

Tests should not pass or fail unpredictably because of uncontrolled shared state.

---

# 64. Determinism

```text id="k5m9vp"
Test:
<test>

Determinism Requirement:
<requirement>

External Variability:
<source>

Control:
<control>

Known Flakiness:
<risk>
```

---

# 65. Time and Clock Testing

When time affects behavior:

```text id="r8x4mk"
Time-Dependent Behavior:
<behavior>

Clock Source:
<source>

Timezone:
<timezone>

Test Control:
<mechanism>

Expected Result:
<result>
```

Time behavior must be explicit where domain or operational semantics depend on it.

---

# 66. Randomness Testing

When randomness affects behavior:

```text id="v3m7pq"
Random Behavior:
<behavior>

Seed Control:
<control>

Expected Properties:
<properties>

Verification:
<method>
```

Do not require deterministic randomness where unpredictability is part of the intended behavior.

---

# 67. Security Abuse Cases

```text id="k7m4vp"
Abuse Case:
<abuse case>

Asset:
<asset>

Attacker Capability:
<capability>

Expected Protection:
<protection>

Evidence:
<evidence>
```

---

# 68. Observability Verification During Failure

```text id="r6x8mk"
Failure:
<failure>

Operational Question:
<question>

Expected Signal:
<signal>

Expected Context:
<context>

Sensitive Data Protection:
<protection>
```

The system should remain diagnosable during relevant failures.

---

# 69. Test Execution

```text id="v9m3pq"
Test Suite:
<suite>

Environment:
<environment>

Version:
<version>

Executed:
<date>

Executor:
<actor/system>

Result:
<PASS | FAIL | BLOCKED | NOT_EXECUTED>
```

---

# 70. Test Result

```text id="k5x8vp"
Test:
<test>

Status:
<PASS | FAIL | BLOCKED | SKIPPED>

Expected:
<expected>

Actual:
<actual>

Evidence:
<evidence>

Issue:
<issue>
```

---

# 71. Failure Classification

A failed test may indicate:

* implementation defect,
* specification mismatch,
* contract mismatch,
* architecture problem,
* test defect,
* environment defect,
* infrastructure failure,
* data problem,
* unknown cause.

Do not automatically classify every failure as an implementation defect.

---

# 72. Test Failure Investigation

```text id="r8m4pk"
Failure:
<failure>

Observed:
<observed>

Expected:
<expected>

Evidence:
<evidence>

Possible Causes:
<causes>

Classification:
<classification>

Action:
<action>
```

---

# 73. Flaky Tests

```text id="v6q3mx"
Test:
<test>

Flaky:
<YES>

Observed Pattern:
<pattern>

Likely Cause:
<cause>

Impact:
<impact>

Action:
<action>
```

Flakiness must not be hidden by repeated execution until the test passes.

---

# 74. Test Coverage

Coverage may be evaluated across:

* requirements,
* business rules,
* use cases,
* contracts,
* critical domain behavior,
* architecture risks,
* security risks,
* failure modes,
* quality attributes,
* migration paths.

Coverage percentage alone does not prove correctness.

---

# 75. Traceability Coverage

| Artifact     | Verification Exists | Verification Quality | Status     |
| ------------ | ------------------- | -------------------- | ---------- |
| `<artifact>` | `<yes/no>`          | `<quality>`          | `<status>` |

Critical artifacts should not remain without an appropriate verification path.

---

# 76. Verification Gaps

| ID           | Gap     | Impact     | Severity     | Resolution     |
| ------------ | ------- | ---------- | ------------ | -------------- |
| TEST-GAP-001 | `<gap>` | `<impact>` | `<severity>` | `<resolution>` |

---

# 77. Test Risks

| ID         | Risk     | Severity     | Impact     | Mitigation     |
| ---------- | -------- | ------------ | ---------- | -------------- |
| TEST-R-001 | `<risk>` | `<severity>` | `<impact>` | `<mitigation>` |

---

# 78. Test Unknowns

| ID         | Unknown     | Impact     | Blocking   | Resolution |
| ---------- | ----------- | ---------- | ---------- | ---------- |
| TEST-U-001 | `<unknown>` | `<impact>` | `<yes/no>` | `<method>` |

---

# 79. Test Assumptions

| ID         | Assumption     | Evidence     | Confidence     | Validation |
| ---------- | -------------- | ------------ | -------------- | ---------- |
| TEST-A-001 | `<assumption>` | `<evidence>` | `<confidence>` | `<method>` |

---

# 80. Architecture Escalation Triggers

Testing must escalate to Architecture / ADR governance when verification reveals:

* architecture cannot satisfy a requirement,
* contracts are internally inconsistent,
* domain invariants cannot be preserved,
* quality attributes conflict with architecture,
* security boundaries are insufficient,
* deployment assumptions are invalid,
* infrastructure cannot support required behavior,
* migration cannot preserve compatibility,
* or a new architectural decision is required.

A test must not silently redefine the architecture to make itself pass.

---

# 81. Specification Escalation Triggers

Escalate to Specification review when:

* expected behavior is ambiguous,
* failure behavior is undefined,
* input/output semantics are unclear,
* state transitions are incomplete,
* compatibility expectations are missing,
* security behavior is unspecified,
* operational behavior is undefined,
* or implementation requires unsupported assumptions.

---

# 82. Test Specification Traceability

```text id="k5m9vp"
Product Requirement
       ↓
Domain Behavior
       ↓
Architecture
       ↓
Contract / Specification
       ↓
Test Specification
       ↓
Test Implementation
       ↓
Execution Evidence
```

Typical relationships:

* `VERIFIES`
* `VALIDATES`
* `CONFIRMS`
* `CHALLENGES`
* `REVEALS_CONFLICT`
* `PROVIDES_EVIDENCE_FOR`

---

# 83. Verification Evidence Retention

```text id="r8x4mk"
Evidence:
<evidence>

Retention:
<requirement>

Owner:
<owner>

Storage:
<location>

Integrity:
<requirement>

Access:
<requirement>
```

Evidence retention should be proportional to risk and governance requirements.

---

# 84. Release Verification

Before release:

* [ ] Critical requirements verified.
* [ ] Critical business rules verified.
* [ ] Critical contracts verified.
* [ ] Security verification completed.
* [ ] Relevant quality attributes verified.
* [ ] Critical failure scenarios verified.
* [ ] Migration verified where required.
* [ ] Deployment verified.
* [ ] Infrastructure verified where required.
* [ ] Known failures are classified.
* [ ] Accepted risks are explicit.
* [ ] Traceability is sufficient.
* [ ] Release blockers are resolved or formally waived.

---

# 85. Test Specification Outcome

```text id="v3m7pq"
Outcome:

READY
READY_WITH_RISKS
INCOMPLETE
BLOCKED
NOT_REQUIRED
```

## READY

Verification is sufficiently specified to provide reliable evidence of conformance.

## READY_WITH_RISKS

Verification may proceed with explicit non-blocking gaps or risks.

## INCOMPLETE

Important verification paths remain unspecified.

## BLOCKED

A missing requirement, contract, architecture decision, specification, environment, or critical verification path prevents safe progression.

## NOT_REQUIRED

An independent Test Specification is unnecessary for the relevant scope.

---

# 86. Handoff

### Implementation Must Preserve

* verification intent,
* expected behavior,
* critical scenarios,
* contract semantics,
* security expectations,
* quality attribute expectations,
* failure behavior,
* migration verification,
* evidence requirements,
* traceability.

### Test Implementation May Choose

* test framework,
* assertion library,
* test runner,
* fixture mechanism,
* test organization,
* automation strategy,

provided the verification objective remains unchanged.

### Test Implementation Must Not Introduce

* undocumented business rules,
* hidden architecture decisions,
* new contract semantics,
* unsupported quality targets,
* implementation-specific expectations not required by approved artifacts.

---

# 87. Agent Instructions

When producing a Test Specification:

1. Start from approved requirements.
2. Identify critical business outcomes.
3. Identify business rules.
4. Identify critical use cases.
5. Identify domain invariants.
6. Identify architecture risks.
7. Identify contracts.
8. Identify detailed specifications.
9. Identify security requirements.
10. Identify relevant quality attributes.
11. Identify runtime and deployment behavior.
12. Identify migration behavior.
13. Select appropriate test levels.
14. Define positive scenarios.
15. Define negative scenarios.
16. Define failure scenarios.
17. Define recovery scenarios.
18. Define compatibility scenarios.
19. Define test data requirements.
20. Define environment requirements.
21. Define evidence expectations.
22. Maintain traceability.
23. Do not invent targets or guarantees.
24. Do not test implementation details unless they are architecturally or behaviorally significant.
25. Do not use test coverage percentage as proof of correctness.
26. Do not hide flaky tests.
27. Do not redefine specifications to make tests pass.
28. Escalate conflicts discovered through verification.
29. Keep verification proportional to risk.
30. Preserve implementation freedom outside observable behavior.

---

# 88. Anti-Patterns

## Test-First Architecture Redefinition

Changing architecture merely to satisfy an existing test without reviewing the architectural intent.

## Test as Requirement

Treating an existing test as authoritative business behavior without validating its source.

## Implementation-Coupled Testing

Testing internal implementation details when only observable behavior matters.

## Coverage Theater

Treating code coverage percentage as proof of system correctness.

## Happy-Path Only

Verifying successful behavior while ignoring failures, invalid input, security, recovery, and compatibility.

## Mock Everything

Replacing critical boundaries with mocks so that meaningful integration behavior is never verified.

## Integration Everything

Using expensive end-to-end tests for behavior that can be verified locally.

## End-to-End Everything

Using system-wide tests as the only verification mechanism.

## Test Data Leakage

Using sensitive production data without appropriate protection.

## Flaky Test Suppression

Ignoring intermittent failures because repeated execution eventually passes.

## Threshold Guessing

Inventing performance, availability, capacity, or latency thresholds.

## Test as Specification

Allowing tests to become the only definition of system behavior.

## Legacy Test Worship

Preserving obsolete tests as authoritative requirements without evaluating their intent.

## Unverifiable Requirements

Accepting requirements that cannot be meaningfully verified without escalating the problem.

## False Green

Treating skipped, blocked, or incomplete verification as successful verification.

## Verification Theater

Producing many tests without demonstrating meaningful evidence that critical behavior and risks are controlled.

---

# 89. Safe Progression Question

Before accepting this specification:

> **Can the approved requirements, domain behavior, contracts, architecture, specifications, security expectations, quality attributes, runtime behavior, deployment behavior, and critical failure modes be verified with meaningful, traceable, reproducible evidence without inventing unsupported expectations or redefining the system through tests?**

If not, identify whether the missing information belongs to:

```text id="k7m9vp"
Product
Domain
Architecture
Contract
ADR
Specification
Runtime
Deployment
Infrastructure
Test
Implementation
```

---

# 90. Final Principle

> **A Test Specification turns approved system intent into explicit verification evidence. It does not define the system; it demonstrates whether the implemented system conforms to what has already been decided and specified.**

The intended relationship is:

```text
Product Requirements
        ↓
Domain Behavior
        ↓
Architecture / ADR
        ↓
Contracts
        ↓
Specifications
        ↓
Test Specification
        ↓
Test Implementation
        ↓
Execution
        ↓
Evidence
        ↓
Verification
```

A healthy Test Specification makes clear **what must be verified, why it matters, at which level it should be verified, which scenarios and failures matter, what evidence is expected, how security and quality attributes are validated, how compatibility and migration are tested, and how results remain traceable to the approved system intent**.
