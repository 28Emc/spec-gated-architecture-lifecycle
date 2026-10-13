# API Specification

## 1. Document Metadata

| Field                 | Value                |
| --------------------- | -------------------- |
| Document Type         | API Specification    |
| Lifecycle Phase       | Specifications / SDD |
| Specification Type    | `API`                |
| Status                | `DRAFT`              |
| Version               | `0.1`                |
| System                | `<system>`           |
| API                   | `<api>`              |
| Owner                 | `<owner>`            |
| Created               | `<date>`             |
| Last Updated          | `<date>`             |
| API Contract          | `<contract-id>`      |
| Architecture Baseline | `<baseline>`         |
| ADR Baseline          | `<baseline>`         |

---

# 2. Purpose

This document specifies the implementation-relevant behavior of an approved API Contract.

It translates the API Contract into sufficient detail for:

* implementation,
* integration,
* testing,
* security validation,
* observability,
* compatibility verification,
* and operational readiness.

The specification must preserve the semantics established by the API Contract.

---

# 3. Core Principle

> **The API Contract defines what consumers may rely upon; the API Specification defines sufficient detail to implement and verify that behavior.**

The specification must not silently redefine:

* business semantics,
* domain responsibilities,
* API ownership,
* security boundaries,
* consistency guarantees,
* error semantics,
* compatibility requirements,
* or architectural responsibilities.

---

# 4. Entry Conditions

Before creating this specification, verify:

* [ ] API Contract exists.
* [ ] API Contract is `ACCEPTED` or `ACTIVE`.
* [ ] API provider is known.
* [ ] Consumers are known or explicitly identified as unknown.
* [ ] API boundary is understood.
* [ ] Relevant use cases are understood.
* [ ] Relevant domain behavior is sufficiently stable.
* [ ] Relevant ADRs are active.
* [ ] Security requirements are available.
* [ ] Data ownership is understood.
* [ ] Blocking architectural decisions are resolved.

---

# 5. API Identity

```text
API ID:
<API-ID>

Name:
<name>

Purpose:
<purpose>

Classification:
<INTERNAL | EXTERNAL | PUBLIC | PRIVATE | TRANSITIONAL | LEGACY>

Version:
<version>

Status:
<DRAFT | ACCEPTED | ACTIVE | SUPERSEDED | DEPRECATED>

Criticality:
<LOW | MEDIUM | HIGH | CRITICAL>
```

---

# 6. Ownership

```text
Business Owner:
<owner>

Domain Owner:
<owner>

Technical Owner:
<owner>

Change Authority:
<authority>

Provider:
<provider>

Consumers:
<consumers>
```

Ownership must remain consistent with the API Contract and architecture.

---

# 7. Architectural Context

```text
System:
<system>

Provider Container:
<container>

Provider Component:
<component, if applicable>

Bounded Context:
<context>

Capability:
<capability>

Use Case:
<use case>

Relevant Domain Model:
<model>

Relevant ADRs:
<ADR IDs>
```

Do not introduce architectural elements that do not exist in the approved architecture.

---

# 8. API Boundary

Define:

```text
Provider Boundary:
<boundary>

Consumer Boundary:
<boundary>

Trust Boundary:
<boundary>

Data Boundary:
<boundary>

Responsibility Boundary:
<boundary>
```

The API specification must make clear which responsibilities belong to the provider and which remain with the consumer.

---

# 9. Interaction Model

```text
Interaction:
<SYNCHRONOUS | ASYNCHRONOUS | STREAMING | OTHER>

Request Initiated By:
<actor/system>

Response Expected:
<YES | NO | CONDITIONAL>

State Change:
<YES | NO | CONDITIONAL>

Long-Running:
<YES | NO | UNKNOWN>
```

This must remain consistent with the API Contract.

---

# 10. API Surface

| Operation ID | Purpose     | Method / Interaction | Consumer     | State Change | Criticality |
| ------------ | ----------- | -------------------- | ------------ | ------------ | ----------- |
| `<id>`       | `<purpose>` | `<method>`           | `<consumer>` | `<yes/no>`   | `<level>`   |

Do not generate CRUD operations merely because resources exist.

---

# 11. Operation Specification

For each operation:

```text
Operation ID:
<operation-id>

Purpose:
<purpose>

Consumer Intent:
<intent>

Business Capability:
<capability>

Use Case:
<use case>

Domain Behavior:
<behavior>

Preconditions:
<conditions>

Postconditions:
<conditions>

Side Effects:
<effects>

Idempotency:
<behavior>

Consistency:
<behavior>

Ordering:
<behavior>

Failure Behavior:
<behavior>
```

---

# 12. Operation Trigger

```text
Trigger:
<trigger>

Trigger Source:
<actor/system>

Required Context:
<context>

Authorization Context:
<context>

Expected Initial State:
<state>
```

---

# 13. Request Specification

```text
Request:
<request>

Purpose:
<purpose>

Required:
<YES | NO>

Content:
<description>

Validation:
<validation>

Business Rules:
<rules>

Security:
<requirements>
```

---

# 14. Request Fields

| Field     | Meaning     | Type     | Required   | Validation | Sensitive  | Source     |
| --------- | ----------- | -------- | ---------- | ---------- | ---------- | ---------- |
| `<field>` | `<meaning>` | `<type>` | `<yes/no>` | `<rules>`  | `<yes/no>` | `<source>` |

Field semantics must be explicit.

Do not infer business meaning solely from field names.

---

# 15. Request Validation

Separate validation types:

### Structural Validation

Examples:

* type,
* format,
* required fields,
* allowed structure.

### Semantic Validation

Examples:

* business rules,
* domain invariants,
* state-dependent validity,
* authorization-dependent validity.

```text
Validation:
<validation>

Type:
<STRUCTURAL | SEMANTIC>

Source:
<rule / requirement / contract>

Failure:
<behavior>
```

---

# 16. Response Specification

```text
Response:
<response>

Purpose:
<purpose>

Success Condition:
<condition>

Representation:
<representation>

State:
<state>

Consumer Expectations:
<expectations>
```

---

# 17. Response Fields

| Field     | Meaning     | Type     | Required   | Source     | Sensitive  |
| --------- | ----------- | -------- | ---------- | ---------- | ---------- |
| `<field>` | `<meaning>` | `<type>` | `<yes/no>` | `<source>` | `<yes/no>` |

Response fields must represent consumer-relevant semantics rather than persistence structure.

---

# 18. Resource Identity

When the API exposes identifiable resources:

```text
Resource:
<resource>

Identity:
<identity>

Identity Meaning:
<meaning>

Identity Authority:
<owner>

Stable:
<YES | NO | UNKNOWN>
```

Do not expose internal database identifiers merely because they exist.

---

# 19. Resource State

```text
Resource:
<resource>

State:
<state>

State Meaning:
<meaning>

Allowed Transitions:
<transitions>

Invalid Transitions:
<behavior>

State Authority:
<authority>
```

State behavior must align with domain and contract semantics.

---

# 20. Pagination

When pagination is required:

```text
Pagination:
<OFFSET | CURSOR | PAGE | OTHER>

Ordering:
<ordering>

Default:
<value or unspecified>

Maximum:
<value or unspecified>

Stable Ordering:
<YES | NO | UNKNOWN>

Consistency:
<behavior>
```

Do not invent limits or defaults without evidence.

---

# 21. Filtering

```text
Filter:
<filter>

Meaning:
<meaning>

Allowed Fields:
<fields>

Operators:
<operators>

Validation:
<validation>

Security Restrictions:
<restrictions>
```

---

# 22. Sorting

```text
Sort Field:
<field>

Meaning:
<meaning>

Direction:
<ASC | DESC>

Default:
<value or unspecified>

Stability:
<behavior>
```

---

# 23. Idempotency

For operations where repeated requests matter:

```text
Operation:
<operation>

Idempotent:
<YES | NO | CONDITIONAL>

Idempotency Key:
<mechanism or NONE>

Scope:
<scope>

Validity:
<duration or unspecified>

Repeated Request:
<behavior>

Conflict:
<behavior>
```

Do not invent idempotency mechanisms when the contract does not define them.

---

# 24. Consistency

```text
Operation:
<operation>

Consistency Model:
<model>

Required Visibility:
<behavior>

Cross-Boundary Consistency:
<behavior>

Eventual Consistency:
<YES | NO | CONDITIONAL>

Consumer Expectation:
<expectation>
```

If consistency requirements imply architectural changes, escalate to architecture governance.

---

# 25. Ordering

When ordering matters:

```text
Ordered:
<YES | NO | CONDITIONAL>

Ordering Scope:
<scope>

Ordering Key:
<key>

Guarantee:
<guarantee>

Out-of-Order Behavior:
<behavior>
```

Never claim ordering guarantees without evidence.

---

# 26. Error Model

Define errors semantically.

```text
Error ID:
<error-id>

Meaning:
<meaning>

Trigger:
<trigger>

Category:
<VALIDATION | AUTHENTICATION | AUTHORIZATION | BUSINESS | CONFLICT | NOT_FOUND | DEPENDENCY | SYSTEM | OTHER>

Consumer Action:
<action>

Retryable:
<YES | NO | CONDITIONAL>

Security Exposure:
<exposure>
```

---

# 27. Error Response

```text
Error Response:
<representation>

Stable Fields:
<fields>

Human Message:
<behavior>

Machine Code:
<code>

Correlation Identifier:
<identifier>

Additional Information:
<information>

Sensitive Information:
<handling>
```

Internal exception names should not become API semantics unless explicitly required.

---

# 28. Error Scenarios

| Scenario     | Error     | Consumer Action | Retry      | Observability |
| ------------ | --------- | --------------- | ---------- | ------------- |
| `<scenario>` | `<error>` | `<action>`      | `<yes/no>` | `<signal>`    |

---

# 29. Dependency Failures

```text
Dependency:
<dependency>

Failure:
<failure>

Observed By Consumer:
<behavior>

Provider Recovery:
<behavior>

Retry:
<behavior>

Fallback:
<behavior>

Partial Result:
<YES | NO | CONDITIONAL>
```

Do not introduce fallback behavior that changes business semantics without appropriate governance.

---

# 30. Timeout Behavior

```text
Operation:
<operation>

Timeout Requirement:
<requirement or UNKNOWN>

Timeout Meaning:
<meaning>

Consumer Behavior:
<behavior>

Provider Behavior:
<behavior>
```

Exact timeout values must come from evidence or explicit decisions.

---

# 31. Retry Behavior

```text
Retryable:
<YES | NO | CONDITIONAL>

Retry Conditions:
<conditions>

Maximum Attempts:
<value or unspecified>

Backoff:
<strategy or unspecified>

Idempotency Requirement:
<requirement>

Unsafe Retry:
<conditions>
```

Do not automatically add retries to every failed operation.

---

# 32. Authentication

```text
Authentication Required:
<YES | NO | CONDITIONAL>

Principal:
<principal>

Authentication Context:
<context>

Credential Requirement:
<requirement>

Authentication Failure:
<behavior>
```

Authentication implementation belongs to security specifications and implementation unless otherwise constrained.

---

# 33. Authorization

```text
Authorization Required:
<YES | NO | CONDITIONAL>

Protected Resource:
<resource>

Required Authority:
<authority>

Authorization Context:
<context>

Denied Behavior:
<behavior>
```

Do not infer business roles from technical roles without evidence.

---

# 34. Data Protection

```text
Sensitive Data:
<data>

Classification:
<classification>

Exposure:
<allowed / prohibited / conditional>

Masking:
<behavior>

Logging:
<restriction>

Transmission:
<requirement>

Storage:
<requirement>
```

---

# 35. Observability

For each operation define required observability.

```text
Operation:
<operation>

Operational Question:
<question>

Required Logs:
<requirements>

Required Metrics:
<requirements>

Required Traces:
<requirements>

Correlation:
<behavior>

Audit:
<requirements>

Sensitive Data Handling:
<requirements>
```

---

# 36. Correlation and Causation

```text
Correlation Identifier:
<identifier>

Causation Identifier:
<identifier>

Propagation:
<behavior>

Consumer Visibility:
<behavior>
```

Correlation must not be presented as proof of causality.

---

# 37. Business Rules

Reference rather than duplicate authoritative business rules.

```text
Rule ID:
<rule>

Applied To:
<operation>

Effect:
<effect>

Source:
<business rule artifact>
```

If a rule changes, update the authoritative domain/business-rule artifact first.

---

# 38. Domain Events

If the API operation causes domain events:

```text
Operation:
<operation>

Domain Event:
<event>

Event Meaning:
<meaning>

Trigger:
<condition>

Publication:
<INTERNAL | EXTERNAL | UNDECIDED>

Consumer Dependency:
<dependency>
```

A domain event does not automatically imply an integration event.

---

# 39. Integration Events

If the API operation results in an integration event:

```text
Integration Event:
<event>

Event Contract:
<contract>

Trigger:
<condition>

Publication Semantics:
<semantics>

Consumer Impact:
<impact>
```

Event semantics remain governed by the Event Contract.

---

# 40. Transaction Boundary

```text
Operation:
<operation>

Transaction Scope:
<scope>

Atomicity:
<requirement>

Cross-Boundary:
<YES | NO>

Consistency:
<requirement>

Failure:
<behavior>
```

Do not introduce distributed transactions solely to make an API operation appear atomic.

---

# 41. Concurrency

When relevant:

```text
Concurrency Scenario:
<scenario>

Concurrent Operation:
<operation>

Conflict:
<possible conflict>

Detection:
<mechanism or unspecified>

Resolution:
<behavior>

Verification:
<method>
```

---

# 42. Caching

When caching is architecturally or behaviorally relevant:

```text
Cacheable:
<YES | NO | CONDITIONAL>

Cached Representation:
<representation>

Validity:
<duration or unspecified>

Invalidation:
<behavior>

Stale Data:
<allowed / prohibited / conditional>

Consumer Impact:
<impact>
```

Do not introduce caching merely as a performance default.

---

# 43. Compatibility

Define compatibility expectations:

```text
Change:
<change>

Compatibility:
<BACKWARD | FORWARD | FULL | NONE | CONDITIONAL>

Affected Consumers:
<consumers>

Migration:
<migration>

Verification:
<verification>
```

Compatibility is semantic, not merely schema-based.

---

# 44. Versioning

```text
API Version:
<version>

Versioning Strategy:
<strategy>

Breaking Change:
<YES | NO | CONDITIONAL>

Migration Path:
<path>

Deprecation:
<process>

Removal Condition:
<condition>
```

Versioning strategy must align with the API Contract and ADRs.

---

# 45. Security Failure Scenarios

| Scenario     | Failure     | Expected Behavior | Security Risk | Verification |
| ------------ | ----------- | ----------------- | ------------- | ------------ |
| `<scenario>` | `<failure>` | `<behavior>`      | `<risk>`      | `<test>`     |

---

# 46. Operational Failure Scenarios

| Scenario     | Dependency / Condition | Expected Behavior | Recovery     | Observability |
| ------------ | ---------------------- | ----------------- | ------------ | ------------- |
| `<scenario>` | `<condition>`          | `<behavior>`      | `<recovery>` | `<signal>`    |

---

# 47. API State Transition

When an operation changes domain state:

```text
Initial State:
<state>

Trigger:
<operation>

Guard:
<condition>

Resulting State:
<state>

Domain Event:
<event or NONE>

Failure:
<behavior>
```

The API must not become the owner of domain state semantics merely because it triggers the transition.

---

# 48. Test Scenarios

Each important behavior should have at least one verification scenario.

```text
Scenario ID:
<scenario-id>

Given:
<initial condition>

When:
<operation>

Then:
<expected behavior>

Verification Type:
<type>

Evidence:
<expected evidence>
```

Recommended categories:

```text
HAPPY_PATH
VALIDATION
AUTHENTICATION
AUTHORIZATION
BUSINESS_RULE
STATE
CONFLICT
DEPENDENCY_FAILURE
TIMEOUT
RETRY
IDEMPOTENCY
CONCURRENCY
SECURITY
OBSERVABILITY
COMPATIBILITY
```

Only applicable categories should be included.

---

# 49. Contract Verification

Verify that implementation satisfies the API Contract.

```text
Contract:
<contract>

Requirement:
<requirement>

Verification:
<method>

Expected Result:
<result>

Evidence:
<evidence>
```

---

# 50. Specification-to-Implementation Mapping

```text
Specification Section:
<section>

Implementation Unit:
<unit>

Responsibility:
<responsibility>

Verification:
<test / evidence>
```

Implementation mappings should remain descriptive rather than dictating source-code structure unnecessarily.

---

# 51. Open Questions

| ID        | Question     | Impact     | Blocking   | Owner     | Resolution |
| --------- | ------------ | ---------- | ---------- | --------- | ---------- |
| API-Q-001 | `<question>` | `<impact>` | `<yes/no>` | `<owner>` | `<method>` |

---

# 52. Assumptions

| ID        | Assumption     | Evidence     | Confidence     | Impact     | Validation |
| --------- | -------------- | ------------ | -------------- | ---------- | ---------- |
| API-A-001 | `<assumption>` | `<evidence>` | `<confidence>` | `<impact>` | `<method>` |

---

# 53. Risks

| ID        | Risk     | Severity     | Impact     | Mitigation     |
| --------- | -------- | ------------ | ---------- | -------------- |
| API-R-001 | `<risk>` | `<severity>` | `<impact>` | `<mitigation>` |

---

# 54. Traceability

| Specification Element | Upstream Artifact | Relationship | Verification     |
| --------------------- | ----------------- | ------------ | ---------------- |
| `<element>`           | `<artifact>`      | `REFINES`    | `<verification>` |

Minimum relevant traceability:

```text
Requirement
    ↓
Use Case
    ↓
API Contract
    ↓
API Specification
    ↓
Implementation
    ↓
Verification
```

---

# 55. Change Impact

Before modifying this specification, evaluate:

* API Contract impact.
* Consumer impact.
* Domain behavior impact.
* Business-rule impact.
* Security impact.
* Data impact.
* Event impact.
* Observability impact.
* Testing impact.
* Migration impact.
* ADR impact.

If architecture changes are required, stop specification-level progression and escalate.

---

# 56. Existing System Analysis

For existing APIs distinguish:

```text
Documented Behavior:
<behavior>

Observed Behavior:
<behavior>

Target Behavior:
<behavior>

Differences:
<differences>
```

Observed runtime behavior may contradict historical documentation.

Do not automatically preserve undocumented legacy behavior.

---

# 57. System Evolution

For system evolution:

```text
Current API:
<current>

Target API:
<target>

Transition:
<transition>

Compatibility Strategy:
<strategy>

Migration:
<migration>

Completion Condition:
<condition>
```

---

# 58. Specification Review Checklist

### Context

* [ ] API Contract identified.
* [ ] Provider identified.
* [ ] Consumers identified.
* [ ] Boundary understood.
* [ ] Capability/use case identified.

### Behavior

* [ ] Operations are behaviorally defined.
* [ ] Preconditions are clear.
* [ ] Postconditions are clear.
* [ ] State changes are clear.
* [ ] Failure behavior is explicit.
* [ ] Idempotency is addressed where relevant.
* [ ] Consistency is addressed where relevant.

### Data

* [ ] Field semantics are clear.
* [ ] Persistence details do not leak unnecessarily.
* [ ] Data ownership is preserved.
* [ ] Sensitive data is identified.

### Security

* [ ] Authentication behavior is defined.
* [ ] Authorization behavior is defined.
* [ ] Protected resources are identified.
* [ ] Security failures are defined.

### Observability

* [ ] Important operational questions are identified.
* [ ] Required signals are defined.
* [ ] Correlation requirements are defined.
* [ ] Sensitive telemetry is protected.

### Reliability

* [ ] Dependency failures are addressed.
* [ ] Retry behavior is explicit where relevant.
* [ ] Timeout behavior is explicit where relevant.
* [ ] Recovery behavior is defined where necessary.

### Compatibility

* [ ] Compatibility expectations are clear.
* [ ] Versioning is addressed.
* [ ] Migration is defined where required.

### Verification

* [ ] Important behaviors have verification scenarios.
* [ ] Contract compliance can be tested.
* [ ] Security behavior can be verified.
* [ ] Failure behavior can be verified.

### Governance

* [ ] No unresolved architectural decision is hidden in the specification.
* [ ] No contract is silently overridden.
* [ ] Traceability is present.
* [ ] Assumptions are explicit.
* [ ] Unknowns are explicit.
* [ ] Scope is appropriate.

---

# 59. Specification Outcome

```text
Outcome:

READY
READY_WITH_RISKS
INCOMPLETE
BLOCKED
```

## READY

The API is sufficiently specified for implementation and verification.

## READY_WITH_RISKS

Implementation may proceed, but explicit non-blocking risks remain.

## INCOMPLETE

Important specification information is missing.

## BLOCKED

An unresolved upstream issue prevents safe specification or implementation.

---

# 60. Handoff

### Implementation May Assume

* Accepted API Contract.
* Accepted architectural boundaries.
* Active ADR decisions.
* Defined behavior.
* Defined security requirements.
* Defined verification expectations.

### Implementation Must Preserve

* Contract semantics.
* Domain semantics.
* Business rules.
* Security boundaries.
* Data ownership.
* Error semantics.
* Compatibility requirements.

### Implementation May Choose

* Internal implementation structure.
* Internal abstractions.
* Framework-specific mechanisms.
* Internal algorithms.

Only where these choices do not violate architecture, contracts, ADRs, specifications, or requirements.

### Implementation Must Not Introduce

* New architectural boundaries.
* New ownership models.
* New contract semantics.
* Unapproved distributed transactions.
* Unapproved consistency guarantees.
* Unapproved security assumptions.

---

# 61. Agent Instructions

When producing an API Specification:

1. Locate the authoritative API Contract.
2. Identify the provider and consumers.
3. Identify the relevant capability and use case.
4. Verify the architectural boundary.
5. Preserve domain semantics.
6. Specify observable behavior before implementation detail.
7. Define request and response semantics.
8. Define validation behavior.
9. Define state behavior where relevant.
10. Define errors by observable meaning.
11. Define idempotency explicitly when relevant.
12. Define consistency explicitly when relevant.
13. Define ordering only when supported by evidence.
14. Define dependency failures.
15. Define authentication and authorization behavior.
16. Define sensitive-data handling.
17. Define required observability.
18. Define compatibility and evolution.
19. Define verification scenarios.
20. Maintain traceability.
21. Do not invent undocumented limits, timeouts, retries, defaults, or guarantees.
22. Do not expose persistence structure unnecessarily.
23. Do not silently change an API Contract.
24. Do not introduce architecture through specification.
25. Escalate architectural conflicts to ADR governance.
26. Keep implementation freedom explicit.
27. For existing systems, distinguish documented, observed, and target behavior.
28. For migrations, explicitly define current, transition, and target states.
29. Keep specification depth proportional to risk and complexity.

---

# 62. Anti-Patterns

## Endpoint-First Design

Defining endpoints before understanding capability and behavior.

## CRUD Explosion

Creating an API operation for every persistence operation.

## Schema-Only Specification

Defining fields without defining behavior.

## Persistence Leakage

Exposing database structures as API semantics.

## Internal Exception Contract

Making implementation exceptions part of the external behavior.

## Hidden Idempotency

Assuming repeated requests are safe without specifying the behavior.

## Hidden Consistency

Allowing consumers to infer consistency guarantees.

## Invented Guarantees

Claiming ordering, timing, retries, availability, or delivery semantics without evidence.

## Security Omission

Treating security as external to the API behavior.

## Observability Omission

Defining an API without considering how important failures and behavior will be observed.

## Contract Duplication

Copying the contract independently and allowing the specification to diverge.

## Architecture by API

Allowing API structure to determine domain or architectural boundaries.

## Framework Specification

Defining the API around a framework instead of its behavior.

## Legacy Worship

Treating undocumented legacy behavior as automatically authoritative.

## Specification Theater

Creating highly detailed API documentation without improving implementation or verification clarity.

---

# 63. Safe Progression Question

Before accepting this specification:

> **Does this specification define enough precise, observable, testable behavior for the API to be implemented and verified while preserving the approved contract, domain semantics, security expectations, and architectural boundaries?**

If not, determine whether the missing information belongs to:

```text
Domain
Architecture
Contract
ADR
Specification
Implementation
```

Do not compensate for an upstream gap with unsupported API detail.

---

# 64. Final Principle

> **An API Specification is the implementation-ready expression of an approved API Contract, not a replacement for the contract or architecture.**

A good API Specification makes behavior predictable for both implementation and verification while preserving the separation between:

```text
Domain Meaning
      ↓
Architecture
      ↓
API Contract
      ↓
API Specification
      ↓
Implementation
      ↓
Verification
```
