# Integration Specification

## 1. Document Metadata

| Field                 | Value                     |
| --------------------- | ------------------------- |
| Document Type         | Integration Specification |
| Lifecycle Phase       | Specifications / SDD      |
| Specification Type    | `INTEGRATION`             |
| Status                | `DRAFT`                   |
| Version               | `0.1`                     |
| System                | `<system>`                |
| Integration           | `<integration>`           |
| Owner                 | `<owner>`                 |
| Created               | `<date>`                  |
| Last Updated          | `<date>`                  |
| Integration Contract  | `<contract-id>`           |
| Architecture Baseline | `<baseline>`              |
| ADR Baseline          | `<baseline>`              |

---

# 2. Purpose

This document specifies implementation-relevant behavior for an approved integration between architectural boundaries.

It defines sufficient detail to implement and verify:

* integration participants,
* interaction flows,
* communication behavior,
* API interactions,
* event interactions,
* data exchange,
* security context,
* failure behavior,
* retries and recovery,
* timeout behavior,
* consistency expectations,
* observability,
* compatibility,
* migration,
* and operational responsibilities.

It does not replace the individual API, Event, Data, Security, or Observability Contracts.

---

# 3. Core Principle

> **An Integration Specification defines how approved architectural boundaries collaborate in a concrete integration scenario while preserving the semantics and responsibilities of their underlying contracts.**

An integration specification must not silently introduce:

* a new architectural boundary,
* a new ownership model,
* a new source of truth,
* a new consistency model,
* a new security trust relationship,
* or a new integration technology.

---

# 4. Fundamental Distinctions

## Integration

A collaboration across an architectural boundary.

## Integration Contract

The agreed expectations governing the integration as a whole.

## API Contract

Defines expectations for an API interaction.

## Event Contract

Defines expectations for an event interaction.

## Data Contract

Defines expectations for exchanged data.

## Security Contract

Defines security expectations across the boundary.

## Observability Contract

Defines observability expectations across the boundary.

## Integration Specification

Defines how these approved contracts are realized together in a concrete integration flow.

```text id="q6m8vr"
Architecture
      ↓
Contracts
 ├── API
 ├── Event
 ├── Data
 ├── Security
 └── Observability
      ↓
Integration Specification
      ↓
Implementation
      ↓
Integration Verification
```

---

# 5. Entry Conditions

Before creating this specification:

* [ ] Integration boundary is identified.
* [ ] Participants are known.
* [ ] Relevant contracts exist.
* [ ] Integration purpose is understood.
* [ ] Data ownership is known.
* [ ] Security expectations are known.
* [ ] Failure expectations are known.
* [ ] Consistency requirements are known.
* [ ] Relevant architecture decisions are resolved.
* [ ] Blocking integration unknowns are identified.

---

# 6. Integration Identity

```text id="m4x9vc"
Integration ID:
<INT-ID>

Name:
<name>

Purpose:
<purpose>

Classification:
<INTERNAL | EXTERNAL | PUBLIC | PRIVATE | TRANSITIONAL | LEGACY>

Criticality:
<LOW | MEDIUM | HIGH | CRITICAL>

Status:
<DRAFT | ACCEPTED | ACTIVE | SUPERSEDED | DEPRECATED>
```

---

# 7. Participants

| Participant     | Type                                 | Responsibility     | Ownership | Trust Context |
| --------------- | ------------------------------------ | ------------------ | --------- | ------------- |
| `<participant>` | `<system/container/external system>` | `<responsibility>` | `<owner>` | `<context>`   |

Participants may include:

* internal containers,
* bounded-context representations,
* external systems,
* partner systems,
* platform services,
* infrastructure dependencies.

Do not classify every participant as a service merely because the implementation happens to use services.

---

# 8. Integration Purpose

```text id="x8q4mk"
Business Purpose:
<purpose>

Technical Purpose:
<purpose>

Expected Outcome:
<outcome>

Why Integration Exists:
<reason>

Out of Scope:
<scope>
```

The integration should have an understandable purpose beyond “systems need to communicate.”

---

# 9. Boundary

```text id="v7m5xr"
Source Boundary:
<boundary>

Destination Boundary:
<boundary>

Crossing:
<boundary>

Ownership:
<ownership>

Trust:
<trust>

Data Ownership:
<ownership>
```

---

# 10. Integration Model

```text id="q5m9vc"
Interaction Model:
<SYNCHRONOUS | ASYNCHRONOUS | STREAMING | BATCH | HYBRID | OTHER>

Primary Interaction:
<interaction>

Secondary Interaction:
<interaction>

Reason:
<reason>
```

The model must come from architectural decisions and contract requirements rather than technology preference.

---

# 11. Integration Flow

```text id="m8x3vr"
1. <step>
2. <step>
3. <step>
4. <step>
5. <step>
```

Each step should identify:

* participant,
* action,
* input,
* output,
* relevant contract,
* failure possibility,
* resulting state.

---

# 12. Sequence

| Step | Actor           | Action     | Contract     | Result     |
| ---- | --------------- | ---------- | ------------ | ---------- |
| 1    | `<participant>` | `<action>` | `<contract>` | `<result>` |
| 2    | `<participant>` | `<action>` | `<contract>` | `<result>` |

The sequence should represent meaningful integration behavior, not every internal implementation call.

---

# 13. API Interaction

When the integration uses APIs:

```text id="x6q9mk"
API Contract:
<contract>

Provider:
<provider>

Consumer:
<consumer>

Operation:
<operation>

Purpose:
<purpose>

Request:
<request>

Response:
<response>

Failure:
<failure>
```

Detailed operation behavior belongs in the API Specification.

---

# 14. Event Interaction

When the integration uses events:

```text id="v4m8xr"
Event Contract:
<contract>

Publisher:
<publisher>

Consumer:
<consumer>

Event:
<event>

Purpose:
<purpose>

Trigger:
<trigger>

Consumer Reaction:
<reaction>
```

Detailed event behavior belongs in the Event Specification.

---

# 15. Data Exchange

```text id="q7x3vc"
Data Contract:
<contract>

Provider:
<provider>

Consumer:
<consumer>

Purpose:
<purpose>

Data:
<data>

Authority:
<source of truth>

Transformation:
<transformation>
```

Data exchange must not transfer ownership accidentally.

---

# 16. Data Ownership

```text id="m5x9vr"
Data:
<data>

Authoritative Owner:
<owner>

Provider:
<provider>

Consumer:
<consumer>

Write Authority:
<authority>

Read Authority:
<authority>

Replication:
<behavior>
```

A consumer receiving data does not automatically own it.

---

# 17. Data Transformation

```text id="x8q4mk"
Source Model:
<model>

Destination Model:
<model>

Transformation:
<mapping>

Semantic Translation:
<translation>

Information Loss:
<loss>

Validation:
<validation>
```

Transformations should preserve intended semantics rather than merely map fields mechanically.

---

# 18. Anti-Corruption Boundary

When required:

```text id="v6m3xr"
Source Model:
<model>

Destination Model:
<model>

Semantic Difference:
<difference>

Translation Responsibility:
<component>

Protected Meaning:
<meaning>
```

An Anti-Corruption Layer is a domain/architecture decision, not an automatic integration pattern.

---

# 19. Security Context

```text id="q9m5vc"
Security Contract:
<contract>

Authentication:
<requirement>

Authorization:
<requirement>

Trust:
<trust>

Security Context:
<context>

Sensitive Data:
<data>
```

---

# 20. Integration Trust

```text id="m7x4vr"
Source:
<participant>

Destination:
<participant>

Trust Assumption:
<assumption>

Verification:
<method>

Failure:
<behavior>
```

Internal network location must not automatically imply trust.

---

# 21. Integration Authentication

```text id="x4q8mk"
Caller:
<caller>

Target:
<target>

Authentication:
<requirement>

Identity:
<identity>

Credential:
<credential mechanism>

Failure:
<behavior>
```

Do not specify credentials as literal values.

---

# 22. Integration Authorization

```text id="v8m5xr"
Principal:
<principal>

Resource:
<resource>

Action:
<action>

Condition:
<condition>

Decision:
<ALLOW | DENY | CONDITIONAL>

Source:
<security contract>
```

---

# 23. Synchronous Interaction

When applicable:

```text id="q6m3vc"
Request:
<request>

Response:
<response>

Expected Completion:
<behavior>

Timeout:
<requirement>

Failure:
<behavior>

Consumer Behavior:
<behavior>
```

Do not invent timeout values.

---

# 24. Asynchronous Interaction

When applicable:

```text id="m9x4vr"
Trigger:
<trigger>

Publication:
<behavior>

Consumption:
<behavior>

Completion:
<behavior>

Failure:
<behavior>

Correlation:
<identifier>
```

---

# 25. Batch Interaction

When applicable:

```text id="x7q5mk"
Batch:
<batch>

Trigger:
<trigger>

Input:
<input>

Processing:
<processing>

Output:
<output>

Partial Failure:
<behavior>

Completion:
<behavior>
```

---

# 26. Streaming Interaction

When applicable:

```text id="v5m8xr"
Stream:
<stream>

Producer:
<producer>

Consumer:
<consumer>

Semantics:
<semantics>

Ordering:
<requirement>

Failure:
<behavior>

Termination:
<behavior>
```

Streaming must not be introduced merely because an event architecture exists.

---

# 27. Request and Response Correlation

```text id="q8m4vc"
Correlation:
<identifier>

Purpose:
<purpose>

Propagation:
<behavior>

Scope:
<scope>

Consumer Use:
<use>
```

Correlation must not be confused with authentication or authorization.

---

# 28. Causation

```text id="m6x9vr"
Cause:
<cause>

Effect:
<effect>

Causation:
<relationship>

Identifier:
<identifier>

Required:
<YES | NO | CONDITIONAL>
```

---

# 29. Idempotency

```text id="x5q3mk"
Operation:
<operation>

Duplicates Possible:
<YES | NO | UNKNOWN>

Idempotency Required:
<YES | NO | CONDITIONAL>

Idempotency Key:
<key or unspecified>

Duplicate Behavior:
<behavior>
```

Do not invent idempotency guarantees.

---

# 30. Ordering

```text id="v9m4xr"
Ordering Required:
<YES | NO | CONDITIONAL>

Scope:
<scope>

Ordering Key:
<key>

Guarantee:
<guarantee>

Out-of-Order Behavior:
<behavior>
```

Ordering must be specified only when required by semantics.

---

# 31. Consistency

```text id="q7m8vc"
Consistency Model:
<model>

Source of Truth:
<source>

Expected Freshness:
<requirement>

Temporary Divergence:
<allowed / not allowed / unknown>

Reconciliation:
<behavior>
```

Do not invent strong consistency simply because multiple systems participate in one business process.

---

# 32. Transaction Boundary

```text id="m4x9vr"
Transaction:
<transaction>

Boundary:
<boundary>

Participants:
<participants>

Atomicity:
<requirement>

Failure:
<behavior>
```

Cross-system atomicity must not be assumed.

---

# 33. Distributed Transaction

If relevant:

```text id="x8q5mk"
Distributed Transaction:
<YES | NO | UNKNOWN>

Reason:
<reason>

Participants:
<participants>

Consistency:
<requirement>

Recovery:
<behavior>

Architecture Decision:
<ADR>
```

This section must not be used to introduce distributed transactions without architectural governance.

---

# 34. Compensation

When a multi-step integration requires recovery:

```text id="v6m3xr"
Failed Step:
<step>

Compensating Action:
<action>

Trigger:
<trigger>

Owner:
<owner>

Consistency:
<result>

Limitations:
<limitations>
```

Compensation is not necessarily rollback.

---

# 35. Timeout

```text id="q9m5vc"
Operation:
<operation>

Timeout:
<value or unspecified>

Source:
<contract / ADR / configuration>

Timeout Behavior:
<behavior>

Consumer Behavior:
<behavior>
```

Never invent timeout values.

---

# 36. Retry

```text id="m7x4vr"
Operation:
<operation>

Retry:
<YES | NO | CONDITIONAL>

Condition:
<condition>

Maximum Attempts:
<value or unspecified>

Backoff:
<strategy or unspecified>

Idempotency:
<requirement>

Final Failure:
<behavior>
```

Retries must be semantically safe.

---

# 37. Partial Failure

```text id="x4q8mk"
Scenario:
<scenario>

Failed Participant:
<participant>

Completed Participants:
<participants>

Observed State:
<state>

Recovery:
<behavior>

Reconciliation:
<behavior>
```

---

# 38. Dependency Failure

| Dependency     | Failure     | Detection  | Consumer Behavior | Recovery     |
| -------------- | ----------- | ---------- | ----------------- | ------------ |
| `<dependency>` | `<failure>` | `<signal>` | `<behavior>`      | `<recovery>` |

---

# 39. Availability Dependency

```text id="v8m5xr"
Dependency:
<dependency>

Required:
<YES | NO | CONDITIONAL>

Failure Impact:
<impact>

Degraded Behavior:
<behavior>

Recovery:
<behavior>
```

---

# 40. Graceful Degradation

When applicable:

```text id="q6m3vc"
Failure:
<failure>

Degraded Mode:
<mode>

Available Functionality:
<functionality>

Unavailable Functionality:
<functionality>

User/Consumer Impact:
<impact>

Recovery:
<behavior>
```

---

# 41. Circuit / Failure Isolation

When already architecturally justified:

```text id="m9x4vr"
Boundary:
<boundary>

Failure Isolation:
<mechanism>

Trigger:
<condition>

Behavior:
<behavior>

Recovery:
<condition>
```

Specific implementation patterns should not be introduced solely because they are common.

---

# 42. Dead-Letter / Quarantine

When applicable:

```text id="x7q5mk"
Condition:
<condition>

Quarantine:
<YES | NO>

Purpose:
<purpose>

Owner:
<owner>

Recovery:
<behavior>

Retention:
<requirement>
```

Do not assume every failed asynchronous message requires a dead-letter mechanism.

---

# 43. Integration Error Model

```text id="v5m8xr"
Error:
<error>

Category:
<VALIDATION | AUTHENTICATION | AUTHORIZATION | TIMEOUT | DEPENDENCY | BUSINESS | TRANSPORT | DATA | UNKNOWN>

Meaning:
<meaning>

Source:
<source>

Consumer Behavior:
<behavior>
```

---

# 44. Error Translation

```text id="q8m4vc"
Source Error:
<error>

Destination Error:
<error>

Translation:
<mapping>

Information Preserved:
<information>

Information Removed:
<information>

Security Consideration:
<consideration>
```

Internal errors must not be exposed as external contracts without explicit meaning.

---

# 45. Integration Recovery

```text id="m6x9vr"
Failure:
<failure>

Detection:
<method>

Recovery:
<method>

Owner:
<owner>

Retry:
<behavior>

Compensation:
<behavior>

Reconciliation:
<behavior>
```

---

# 46. Reconciliation

When eventual consistency or independent systems require reconciliation:

```text id="x5q3mk"
Data / State:
<data>

Source:
<source>

Comparison:
<comparison>

Mismatch:
<condition>

Resolution:
<behavior>

Authority:
<owner>
```

Reconciliation must not silently overwrite authoritative data.

---

# 47. Integration Observability

```text id="v9m4xr"
Observability Contract:
<contract>

Correlation:
<identifier>

Logs:
<signals>

Metrics:
<signals>

Traces:
<signals>

Audit:
<signals>

Health:
<signals>
```

---

# 48. Integration Operational Questions

| Question     | Signal     | Consumer     | Action     |
| ------------ | ---------- | ------------ | ---------- |
| `<question>` | `<signal>` | `<consumer>` | `<action>` |

Examples:

* Is the dependency reachable?
* Is the integration succeeding?
* Are failures increasing?
* Is latency increasing?
* Are messages accumulating?
* Are requests being rejected?
* Is data becoming inconsistent?

---

# 49. Integration Security Observability

```text id="q7m8vc"
Security Question:
<question>

Signal:
<signal>

Sensitive Data:
<data>

Redaction:
<behavior>

Audit:
<requirement>
```

---

# 50. Integration Performance

Only specify performance characteristics supported by requirements or architectural decisions.

```text id="m4x9vr"
Operation:
<operation>

Performance Requirement:
<requirement>

Measurement:
<measurement>

Verification:
<method>
```

Do not invent latency or throughput targets.

---

# 51. Resource Considerations

```text id="x8q5mk"
Resource:
<CPU | MEMORY | NETWORK | STORAGE | OTHER>

Integration Impact:
<impact>

Constraint:
<constraint>

Verification:
<method>
```

---

# 52. Integration Lifecycle

```text id="v6m3xr"
State:
<state>

Transition:
<trigger>

Participant:
<participant>

Result:
<result>
```

Integration lifecycle states may include:

* `NOT_STARTED`
* `CONNECTING`
* `ACTIVE`
* `DEGRADED`
* `FAILED`
* `RECOVERING`
* `DISABLED`
* `DEPRECATED`

Only use states relevant to the integration.

---

# 53. Configuration

```text id="q9m5vc"
Configuration:
<configuration>

Purpose:
<purpose>

Owner:
<owner>

Source:
<source>

Change Authority:
<authority>

Validation:
<method>
```

Configuration must not silently alter contractual semantics.

---

# 54. Feature Flags / Progressive Activation

When applicable:

```text id="m7x4vr"
Feature:
<feature>

Purpose:
<purpose>

Activation:
<condition>

Affected Participants:
<participants>

Compatibility:
<requirement>

Rollback:
<behavior>
```

Feature flags must not become an undeclared substitute for architecture decisions.

---

# 55. Compatibility

Potentially breaking integration changes include:

* changing API semantics,
* changing event meaning,
* changing required fields,
* changing security requirements,
* changing ownership,
* changing consistency behavior,
* changing failure semantics,
* changing ordering,
* changing timing expectations.

```text id="x4q8mk"
Change:
<change>

Breaking:
<YES | NO | CONDITIONAL>

Affected Participant:
<participant>

Migration:
<migration>
```

---

# 56. Versioning

```text id="v8m5xr"
Contract:
<contract>

Version:
<version>

Compatibility:
<compatibility>

Consumers:
<consumers>

Migration:
<migration>
```

Versioning strategy must follow contract governance.

---

# 57. Existing System Analysis

For existing integrations:

```text id="q6m3vc"
Documented Integration:
<documented>

Observed Integration:
<observed>

Actual Behavior:
<actual>

Target Integration:
<target>

Differences:
<differences>
```

Observed behavior is evidence, not automatically the target state.

---

# 58. Integration Migration

```text id="m9x4vr"
Current Integration:
<current>

Target Integration:
<target>

Transition:
<transition>

Compatibility:
<compatibility>

Consumer Migration:
<migration>

Cutover:
<condition>

Rollback:
<condition>
```

---

# 59. Parallel Operation

When migration requires coexistence:

```text id="x7q5mk"
Current Path:
<path>

Target Path:
<path>

Parallel:
<YES | NO>

Selection:
<condition>

Consistency:
<requirement>

Removal:
<condition>
```

---

# 60. Integration Testing

Integration verification should cover:

```text id="v5m8xr"
CONNECTIVITY
AUTHENTICATION
AUTHORIZATION
REQUEST
RESPONSE
EVENT_PUBLICATION
EVENT_CONSUMPTION
DATA_MAPPING
DATA_OWNERSHIP
IDEMPOTENCY
ORDERING
CONSISTENCY
TIMEOUT
RETRY
PARTIAL_FAILURE
RECOVERY
SECURITY
OBSERVABILITY
COMPATIBILITY
MIGRATION
```

Only applicable categories should be implemented.

---

# 61. Integration Test Scenario

```text id="q8m4vc"
Scenario ID:
<INT-TEST-001>

Given:
<initial state>

When:
<integration action>

Then:
<expected result>

And:
<expected participant state>

And:
<expected observability>

Verification:
<test type>
```

---

# 62. Failure Test Scenario

```text id="m6x9vr"
Scenario ID:
<INT-FAIL-001>

Failure:
<failure>

Expected Source Behavior:
<behavior>

Expected Destination Behavior:
<behavior>

Expected Recovery:
<behavior>

Expected Observability:
<signals>
```

---

# 63. Security Test Scenario

```text id="x5q3mk"
Scenario ID:
<INT-SEC-001>

Principal:
<principal>

Operation:
<operation>

Expected Authorization:
<result>

Expected Data Protection:
<behavior>

Expected Audit:
<behavior>
```

---

# 64. Consistency Test Scenario

```text id="v9m4xr"
Scenario ID:
<INT-CONS-001>

Initial State:
<state>

Operation:
<operation>

Temporary Divergence:
<allowed>

Expected Final State:
<state>

Reconciliation:
<behavior>
```

---

# 65. Contract Verification

```text id="q7m8vc"
Contract:
<contract>

Integration Behavior:
<behavior>

Expected:
<expectation>

Observed:
<result>

Status:
<PASS | FAIL | UNKNOWN>
```

All participating contracts should be verified consistently.

---

# 66. Architecture Escalation Triggers

Escalate to Architecture / ADR governance when integration work introduces:

* a new architectural boundary,
* a new cross-system dependency,
* a new source of truth,
* a new consistency model,
* a new distributed transaction,
* a new trust boundary,
* a materially different communication model,
* a new integration technology with architectural consequences,
* a new recovery architecture,
* significant migration complexity,
* or significant operational coupling.

---

# 67. Open Questions

| ID        | Question     | Impact     | Blocking   | Owner     | Resolution |
| --------- | ------------ | ---------- | ---------- | --------- | ---------- |
| INT-Q-001 | `<question>` | `<impact>` | `<yes/no>` | `<owner>` | `<method>` |

---

# 68. Assumptions

| ID        | Assumption     | Evidence     | Confidence     | Impact     | Validation |
| --------- | -------------- | ------------ | -------------- | ---------- | ---------- |
| INT-A-001 | `<assumption>` | `<evidence>` | `<confidence>` | `<impact>` | `<method>` |

---

# 69. Risks

| ID        | Risk     | Severity     | Impact     | Mitigation     |
| --------- | -------- | ------------ | ---------- | -------------- |
| INT-R-001 | `<risk>` | `<severity>` | `<impact>` | `<mitigation>` |

---

# 70. Traceability

| Integration Specification Element | Upstream Artifact | Relationship | Verification     |
| --------------------------------- | ----------------- | ------------ | ---------------- |
| `<element>`                       | `<artifact>`      | `REFINES`    | `<verification>` |

Typical chain:

```text id="m4x9vr"
Domain / Product Need
        ↓
Architecture Boundary
        ↓
Contracts
 ├── API
 ├── Event
 ├── Data
 ├── Security
 └── Observability
        ↓
Integration Specification
        ↓
Implementation
        ↓
Integration Verification
```

---

# 71. Specification Review Checklist

### Boundaries

* [ ] Participants are identified.
* [ ] Source and destination boundaries are explicit.
* [ ] Ownership is explicit.
* [ ] Trust assumptions are explicit.

### Interaction

* [ ] Integration purpose is clear.
* [ ] Interaction model is justified.
* [ ] Main flow is defined.
* [ ] Important alternative flows are defined.
* [ ] Failure flows are defined.

### Contracts

* [ ] Relevant API Contracts are referenced.
* [ ] Relevant Event Contracts are referenced.
* [ ] Relevant Data Contracts are referenced.
* [ ] Security Contract is referenced.
* [ ] Observability Contract is referenced.
* [ ] Contracts remain semantically consistent.

### Data

* [ ] Data ownership is explicit.
* [ ] Source of truth is explicit.
* [ ] Transformations are defined.
* [ ] Information loss is understood.
* [ ] Reconciliation is addressed where relevant.

### Reliability

* [ ] Timeout behavior is defined where relevant.
* [ ] Retry behavior is defined where relevant.
* [ ] Idempotency is defined where relevant.
* [ ] Ordering is defined where relevant.
* [ ] Partial failure is addressed.
* [ ] Recovery is defined.

### Consistency

* [ ] Consistency model is explicit.
* [ ] Transaction boundaries are clear.
* [ ] Distributed transactions are not assumed.
* [ ] Compensation/reconciliation is addressed where necessary.

### Security

* [ ] Authentication is defined.
* [ ] Authorization is defined.
* [ ] Trust assumptions are explicit.
* [ ] Sensitive data is protected.
* [ ] Security failures are handled.

### Observability

* [ ] Correlation is defined where required.
* [ ] Integration failures are observable.
* [ ] Important operational questions are covered.
* [ ] Audit requirements are addressed.

### Evolution

* [ ] Compatibility is addressed.
* [ ] Versioning is addressed where necessary.
* [ ] Migration is defined where relevant.
* [ ] Existing and target behavior are distinguished.

### Verification

* [ ] Happy path is tested.
* [ ] Failure paths are tested.
* [ ] Security is tested.
* [ ] Consistency is tested where relevant.
* [ ] Contract compatibility is tested.
* [ ] Migration is tested where relevant.

### Governance

* [ ] Architecture decisions are respected.
* [ ] No new architecture is introduced silently.
* [ ] Assumptions are explicit.
* [ ] Unknowns are explicit.
* [ ] Escalation triggers are evaluated.
* [ ] Traceability is maintained.

---

# 72. Specification Outcome

```text id="x8q5mk"
Outcome:

READY
READY_WITH_RISKS
INCOMPLETE
BLOCKED
NOT_REQUIRED
```

## READY

The integration is sufficiently specified for implementation and verification.

## READY_WITH_RISKS

Implementation may proceed with explicit non-blocking risks.

## INCOMPLETE

Important integration behavior remains unspecified.

## BLOCKED

An unresolved architectural, contractual, security, data, or operational issue prevents safe progression.

## NOT_REQUIRED

An independent Integration Specification is unnecessary for the relevant scope.

---

# 73. Handoff

### Implementation Must Preserve

* integration purpose,
* participant responsibilities,
* ownership,
* contract semantics,
* data ownership,
* security requirements,
* consistency expectations,
* failure behavior,
* recovery behavior,
* observability,
* compatibility.

### Implementation May Choose

* internal integration adapters,
* internal orchestration structure,
* framework-specific client implementation,
* internal transformation helpers,
* infrastructure abstractions,

provided approved architecture and contracts remain unchanged.

### Implementation Must Not Introduce

* new sources of truth,
* undocumented trust,
* hidden coupling,
* new consistency guarantees,
* distributed transactions,
* new architectural boundaries,
* undocumented security behavior,
* or consumer-visible semantic changes.

---

# 74. Agent Instructions

When producing an Integration Specification:

1. Start from the approved architecture.
2. Identify integration participants.
3. Identify the integration purpose.
4. Identify relevant API, Event, Data, Security, and Observability Contracts.
5. Define the integration boundary.
6. Define ownership.
7. Define the interaction model.
8. Define the meaningful flow.
9. Define data exchange and transformation.
10. Define security behavior.
11. Define consistency behavior.
12. Define timeout behavior only when supported.
13. Define retries only when justified.
14. Define idempotency where relevant.
15. Define ordering where relevant.
16. Define partial failure.
17. Define recovery and reconciliation.
18. Define observability.
19. Define compatibility and migration.
20. Define verification scenarios.
21. Do not invent guarantees.
22. Do not assume distributed transactions.
23. Do not assume strong consistency.
24. Do not assume every integration is synchronous.
25. Do not assume every integration is event-driven.
26. Do not assume internal participants are trusted.
27. Do not duplicate lower-level contract semantics unnecessarily.
28. Escalate architectural consequences.
29. Maintain traceability.

---

# 75. Anti-Patterns

## Endpoint-Only Integration

Treating an integration as merely a collection of API endpoints.

## Event-Only Integration

Treating every cross-boundary interaction as an event.

## Technology-First Integration

Choosing HTTP, messaging, streaming, or a broker before understanding the integration behavior.

## Shared Database Integration

Using a shared database as the default integration mechanism.

## Hidden Ownership

Allowing consumers to modify data without explicit authority.

## Distributed Transaction by Convenience

Introducing distributed transactions to avoid designing consistency or recovery behavior.

## Strong Consistency by Default

Assuming all participants must observe identical state immediately.

## Retry Everything

Adding retries without evaluating idempotency and failure semantics.

## Timeout Guessing

Inventing timeout values without evidence.

## Synchronous Everything

Making every integration blocking merely because it is simpler to implement.

## Asynchronous Everything

Using asynchronous messaging where the business interaction requires immediate response.

## Consumer-Coupled Contract

Designing the integration around one current consumer's implementation.

## Infrastructure Leakage

Allowing broker, protocol, network, or framework details to define domain semantics.

## Data Ownership Leakage

Assuming that receiving data grants ownership.

## Error Leakage

Exposing internal implementation errors as integration contracts.

## Legacy Integration Worship

Preserving historical integration behavior without evaluating its target-state suitability.

## Specification Theater

Documenting communication technology extensively without defining integration semantics.

---

# 76. Safe Progression Question

Before accepting this specification:

> **Does this specification define how the participating architectural boundaries collaborate, exchange information, enforce security, handle consistency and failure, recover, evolve, and remain observable without introducing unsupported architecture or duplicating the meaning of lower-level contracts?**

If not, determine whether the missing information belongs to:

```text id="v6m3xr"
Product
Domain
Architecture
API Contract
Event Contract
Data Contract
Security Contract
Observability Contract
ADR
Specification
Implementation
```

---

# 77. Final Principle

> **An Integration Specification turns approved architectural boundaries and contracts into a concrete, implementable, and verifiable collaboration model without allowing integration mechanics to redefine domain, ownership, security, or architectural semantics.**

The intended relationship is:

```text id="q9m5vc"
Architecture
      ↓
Contracts
      ↓
Integration Specification
      ↓
Integration Implementation
      ↓
Integration Verification
```

A healthy integration specification makes clear **who collaborates, why they collaborate, what crosses the boundary, who owns it, how security and consistency are preserved, what happens when things fail, how recovery works, and how the integration evolves**, while keeping implementation technology subordinate to approved architectural intent.
