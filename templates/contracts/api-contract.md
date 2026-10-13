# API Contract

## 1. Document Metadata

| Field                 | Value                   |
| --------------------- | ----------------------- |
| Document Type         | API Contract            |
| Lifecycle Phase       | Contracts               |
| Contract Type         | `API`                   |
| Status                | `DRAFT`                 |
| Version               | `0.1`                   |
| Owner                 | `<owner>`               |
| Created               | `<date>`                |
| Last Updated          | `<date>`                |
| System                | `<system>`              |
| Architecture Boundary | `<boundary>`            |
| Architecture Review   | `<architecture-review>` |

---

# 2. Purpose

This document defines the contractual expectations for an API interaction across an architectural boundary.

It establishes:

* Who provides the API.
* Who consumes it.
* What business capability it exposes.
* What the interaction means.
* What inputs and outputs are valid.
* What behavior is guaranteed.
* What failures mean.
* What security expectations apply.
* What consistency and timing expectations exist.
* How the contract evolves.
* How compatibility is verified.

This document defines **contract semantics and governance**.

It is not a replacement for:

* OpenAPI.
* GraphQL schema.
* RPC IDL.
* Source code.
* Framework configuration.
* Detailed implementation specification.

Those may be generated or produced later during Specifications.

---

# 3. Core Principle

> **An API contract defines what a consumer may reliably expect from a provider across an interaction boundary, independently of how the provider implements that behavior.**

The API must therefore be described from the perspective of the contractual relationship rather than the provider's internal implementation.

---

# 4. Contract Identity

```text id="x7m3qc"
Contract ID:
<API-CONTRACT-ID>

Name:
<name>

Version:
<version>

Status:
<IDENTIFIED | PROPOSED | UNDER_REVIEW | ACCEPTED | ACTIVE | SUPERSEDED | DEPRECATED | RETIRED>

Classification:
<INTERNAL | EXTERNAL | PUBLIC | PRIVATE | TRANSITIONAL | LEGACY>

Criticality:
<CRITICAL | HIGH | MEDIUM | LOW>
```

---

# 5. Provider and Consumer

```text id="m8q4vn"
Provider:
<provider>

Consumer:
<consumer>

Semantic Owner:
<owner>

Technical Owner:
<owner>

Change Authority:
<authority>
```

The provider owns the behavior it exposes.

The consumer does not automatically own the provider's domain semantics.

---

# 6. Business Capability

```text id="r5x9kc"
Capability:
<capability>

Purpose:
<purpose>

Business Outcome:
<outcome>

Relevant Domain:
<bounded context>

Relevant Use Case:
<use case>

Relevant Business Rules:
<rules>
```

An API should expose a meaningful architectural or business capability rather than an arbitrary internal implementation structure.

---

# 7. API Boundary

```text id="v4m7xp"
Boundary:
<boundary>

Inside:
<provider responsibility>

Outside:
<consumer responsibility>

External Systems:
<systems>

Trust Boundary:
<boundary>

Data Ownership:
<owner>
```

---

# 8. API Interaction Model

```text id="q8c3nm"
Interaction Style:
<SYNCHRONOUS | ASYNCHRONOUS | STREAMING | OTHER>

Initiator:
<actor/system>

Provider:
<provider>

Expected Completion:
<synchronous completion | accepted for processing | other>

Result:
<result>
```

The interaction model must match the approved architecture.

An API contract must not silently introduce asynchronous behavior when architecture assumes synchronous completion, or vice versa.

---

# 9. API Operation

```text id="n6x4rq"
Operation ID:
<operation-id>

Name:
<operation-name>

Purpose:
<purpose>

Consumer Intent:
<intent>

Preconditions:
<preconditions>

Postconditions:
<postconditions>

Business Rules:
<rules>

State Changes:
<changes>
```

The operation should be expressed in business or capability terms where appropriate.

---

# 10. Operation Semantics

For each operation document:

### Trigger

What causes the operation?

```text id="c7m4vk"
<trigger>
```

### Preconditions

What must already be true?

```text id="p9x3qa"
<preconditions>
```

### Expected Behavior

What does the provider guarantee?

```text id="w5m8nc"
<behavior>
```

### Postconditions

What is guaranteed after successful completion?

```text id="x4q7mr"
<postconditions>
```

### Side Effects

What relevant state or business behavior may occur?

```text id="m8v3kc"
<side-effects>
```

---

# 11. Request Contract

```text id="r6x9qp"
Request:
<name>

Purpose:
<purpose>

Required Information:
<fields>

Optional Information:
<fields>

Business Constraints:
<constraints>

Validation Rules:
<rules>

Semantic Meaning:
<meaning>
```

Request fields should represent information required by the business interaction, not internal persistence structures.

---

# 12. Request Field

```text id="v3m8qa"
Field:
<name>

Meaning:
<meaning>

Type:
<type>

Required:
<YES | NO | CONDITIONAL>

Constraints:
<constraints>

Default:
<value or NONE>

Sensitive:
<YES | NO | UNKNOWN>

Source:
<actor/system>

Domain Concept:
<concept>
```

Do not invent defaults.

---

# 13. Response Contract

```text id="q7x4nc"
Response:
<name>

Purpose:
<purpose>

Success Meaning:
<meaning>

Returned Information:
<fields>

Business State:
<state>

Consumer Expectations:
<expectations>
```

A response should communicate business-relevant information rather than simply exposing a persistence model.

---

# 14. Response Field

```text id="m5v9kr"
Field:
<name>

Meaning:
<meaning>

Type:
<type>

Required:
<YES | NO | CONDITIONAL>

Semantic Owner:
<owner>

Source:
<source>

Sensitive:
<YES | NO | UNKNOWN>

Stability:
<STABLE | EVOLVING | UNKNOWN>
```

---

# 15. Conditional Fields

When a field depends on state or context:

```text id="x8q3mv"
Field:
<field>

Condition:
<condition>

Present When:
<condition>

Absent When:
<condition>

Consumer Interpretation:
<interpretation>
```

Conditional behavior must be explicit when consumers depend upon it.

---

# 16. Resource Identity

If the API exposes identifiable domain resources:

```text id="n4m7xc"
Resource:
<resource>

Identity:
<identity>

Identity Meaning:
<meaning>

Ownership:
<owner>

Lifecycle:
<lifecycle>

Identifier Stability:
<stable | evolving | unknown>
```

Do not assume that a database primary key is the appropriate API identity.

---

# 17. State Representation

If the API exposes state:

```text id="q6x8rn"
State:
<state>

Meaning:
<meaning>

Allowed Values:
<values>

Transitions:
<transitions>

Transition Authority:
<owner>

Invalid Transitions:
<behavior>
```

State must reflect domain or contractual semantics rather than arbitrary implementation flags.

---

# 18. Business Rules

API behavior must reference relevant business rules.

```text id="v9m3qc"
Rule:
<rule-id>

Rule:
<description>

Operation:
<operation>

Effect:
<effect>

Violation Behavior:
<behavior>
```

Business rules must remain owned by the domain rather than becoming API-specific logic.

---

# 19. Validation

Distinguish:

### Structural Validation

Whether the request has a valid representation.

### Semantic Validation

Whether the requested behavior is valid according to domain rules.

```text id="r4x7mk"
Validation:
<validation>

Type:
<STRUCTURAL | SEMANTIC>

Rule:
<rule>

Failure Meaning:
<meaning>
```

---

# 20. Error Contract

Errors are part of the API contract when consumers depend upon their semantics.

```text id="c8m5vq"
Error:
<error-code>

Meaning:
<meaning>

Category:
<VALIDATION | AUTHENTICATION | AUTHORIZATION | NOT_FOUND | CONFLICT | BUSINESS | DEPENDENCY | SYSTEM | OTHER>

Trigger:
<condition>

Consumer Action:
<expected action>

Retryable:
<YES | NO | CONDITIONAL | UNKNOWN>
```

Do not expose internal exception types as contractual semantics.

---

# 21. Error Response

```text id="p7x3nr"
Error Response:
<response>

Stable Information:
<information>

Diagnostic Information:
<information>

Correlation Identifier:
<yes/no/unknown>

Sensitive Information:
<information>

Consumer Guidance:
<guidance>
```

Internal stack traces and implementation details should not become public contract behavior unless explicitly intended.

---

# 22. Error Stability

Error identifiers should remain stable when consumers depend upon them.

```text id="m9q4xc"
Error Identifier:
<identifier>

Stable:
<YES | NO | UNKNOWN>

Meaning:
<meaning>

Evolution Rule:
<rule>
```

Changing an error identifier may be a breaking change even if successful responses remain unchanged.

---

# 23. Idempotency

When relevant:

```text id="x5v8mq"
Operation:
<operation>

Idempotency Required:
<YES | NO | UNKNOWN>

Idempotency Key:
<mechanism>

Repeated Request:
<expected behavior>

State Effect:
<effect>
```

Do not assume idempotency merely because an operation appears safe.

---

# 24. Ordering

When multiple operations or messages interact:

```text id="q3m7vc"
Ordering Required:
<YES | NO | UNKNOWN>

Ordering Scope:
<scope>

Guarantee:
<guarantee>

Violation Behavior:
<behavior>
```

Do not imply ordering guarantees that are not supported.

---

# 25. Consistency

```text id="v6x9rk"
Operation:
<operation>

Consistency Requirement:
<STRONG | EVENTUAL | CONDITIONAL | UNKNOWN>

Consistency Boundary:
<boundary>

Consumer Expectation:
<expectation>

Business Consequence:
<consequence>
```

Avoid using technical consistency terminology without defining its contractual meaning.

---

# 26. Timing Expectations

When timing is contractually relevant:

```text id="n8q4cm"
Operation:
<operation>

Timing Expectation:
<expectation>

Timeout Responsibility:
<consumer/provider/both/unknown>

Delayed Completion:
<behavior>

Business Impact:
<impact>
```

Do not invent latency targets.

---

# 27. Pagination

If the API returns collections:

```text id="r7m3xq"
Collection:
<collection>

Pagination:
<REQUIRED | NOT_REQUIRED | UNKNOWN>

Ordering:
<ordering>

Page Semantics:
<semantics>

Continuation:
<mechanism>

Total Count:
<required/not required/unknown>
```

Pagination behavior is contractual when consumers depend upon it.

---

# 28. Filtering and Sorting

```text id="c4x8vn"
Collection:
<collection>

Filtering:
<supported filters>

Sorting:
<supported ordering>

Default Behavior:
<behavior>

Invalid Criteria:
<behavior>
```

Do not expose arbitrary database filtering as an API contract.

---

# 29. Security Contract

Reference the Security Contract when security expectations apply.

```text id="p8q3mk"
Authentication:
<requirement>

Authorization:
<requirement>

Identity Context:
<requirement>

Protected Data:
<data>

Security Classification:
<classification>

Audit Requirement:
<requirement>

Security Contract:
<SECURITY-CONTRACT-ID>
```

Security semantics should not be duplicated inconsistently across artifacts.

---

# 30. Authorization Semantics

```text id="m6v9xc"
Operation:
<operation>

Actor:
<actor>

Required Authority:
<authority>

Resource Scope:
<scope>

Decision:
<allow/deny/conditional>

Business Rule:
<rule>
```

Do not invent roles merely to complete this section.

---

# 31. Observability Contract

Reference the Observability Contract when relevant.

```text id="x9q4nr"
Correlation:
<requirement>

Audit:
<requirement>

Metrics:
<requirement>

Tracing:
<requirement>

Operational Signals:
<signals>

Observability Contract:
<OBSERVABILITY-CONTRACT-ID>
```

---

# 32. Data Contract Relationship

If the API exchanges significant structured data:

```text id="q5m8vk"
Data Contract:
<DATA-CONTRACT-ID>

Data Ownership:
<owner>

Data Semantics:
<semantics>

Transformation:
<transformation>

Sensitive Data:
<yes/no/unknown>
```

Do not duplicate data definitions without identifying the authoritative source.

---

# 33. API and Domain Events

An API operation may cause domain events.

```text id="v4x7mc"
Operation:
<operation>

Domain Event:
<event>

Causality:
<causality>

Publication:
<PUBLISHED | INTERNAL | UNKNOWN>

Integration Event:
<event or NONE>

Contract Relationship:
<relationship>
```

The existence of a domain event does not automatically imply event publication.

---

# 34. External Dependencies

```text id="n7m3qr"
Dependency:
<system/service>

Purpose:
<purpose>

Required:
<YES | NO | CONDITIONAL>

Failure Behavior:
<behavior>

Contract:
<contract>

Ownership:
<owner>
```

External dependency behavior should be explicit when it affects the API's contractual guarantees.

---

# 35. Partial Failure

```text id="c6q9xm"
Scenario:
<scenario>

Partial Failure:
<description>

Response:
<response>

State:
<state>

Consumer Action:
<action>

Recovery:
<recovery>
```

Do not hide partial failure behind generic success/failure semantics when consumers need to distinguish it.

---

# 36. API Security and Privacy

Evaluate whether the API exposes:

* Personal data.
* Sensitive business data.
* Credentials.
* Authorization information.
* Internal identifiers.
* Security-sensitive state.

```text id="r8x4vn"
Data:
<data>

Sensitivity:
<level>

Exposure:
<exposure>

Protection:
<requirement>

Reason:
<reason>
```

---

# 37. API Evolution

Document the evolution strategy.

```text id="m5q8xc"
Evolution Strategy:
<strategy>

Compatibility Rule:
<rule>

Breaking Change Policy:
<policy>

Deprecation:
<policy>

Consumer Migration:
<strategy>

Versioning:
<strategy>
```

---

# 38. API Versioning

Possible strategies:

* No explicit versioning.
* URI versioning.
* Header/media-type versioning.
* Schema evolution.
* Parallel endpoints.
* Consumer-specific migration.
* Other governed strategy.

The strategy must be an explicit architectural or contract decision where significant.

```text id="x7m3qr"
Versioning Strategy:
<strategy>

Reason:
<reason>

Decision:
<ADR-ID>

Status:
<status>
```

Do not prescribe a versioning strategy universally.

---

# 39. Deprecation

```text id="q4v8nc"
Operation:
<operation>

Status:
<ACTIVE | DEPRECATED | RETIRED>

Reason:
<reason>

Replacement:
<replacement>

Consumer Migration:
<migration>

Removal Condition:
<condition>

Owner:
<owner>
```

Do not remove a contractual operation without understanding its consumers.

---

# 40. Compatibility Matrix

| Change                 | Provider Compatible | Consumer Compatible | Breaking   | Migration                 |
| ---------------------- | ------------------- | ------------------- | ---------- | ------------------------- |
| Add optional field     | `<yes/no>`          | `<yes/no>`          | `<yes/no>` | `<required/not required>` |
| Remove field           | `<yes/no>`          | `<yes/no>`          | `<yes/no>` | `<required/not required>` |
| Change meaning         | `<yes/no>`          | `<yes/no>`          | `<yes/no>` | `<required/not required>` |
| Add operation          | `<yes/no>`          | `<yes/no>`          | `<yes/no>` | `<required/not required>` |
| Remove operation       | `<yes/no>`          | `<yes/no>`          | `<yes/no>` | `<required/not required>` |
| Change error semantics | `<yes/no>`          | `<yes/no>`          | `<yes/no>` | `<required/not required>` |
| Change authorization   | `<yes/no>`          | `<yes/no>`          | `<yes/no>` | `<required/not required>` |

Compatibility must be evaluated semantically, not only syntactically.

---

# 41. Existing API Analysis

For existing systems:

```text id="v8m4xq"
Documented Contract:
<contract>

Observed Behavior:
<behavior>

Actual Consumers:
<consumers>

Undocumented Dependencies:
<dependencies>

Target Contract:
<target>

Differences:
<differences>
```

Observed behavior may represent an effective contract.

It must not automatically become the desired target contract.

---

# 42. API Migration

For system evolution:

```text id="n5q9mc"
Current API:
<api>

Target API:
<api>

Compatibility Layer:
<yes/no>

Migration Strategy:
<strategy>

Consumer Migration:
<strategy>

Coexistence:
<yes/no>

Rollback:
<strategy>

Removal:
<condition>
```

---

# 43. API Contract Traceability

```text id="c7x3vm"
API Contract
    ↓
Use Case
    ↓
Requirement
    ↓
Business Rule
    ↓
Domain Behavior
    ↓
Architecture Boundary
    ↓
Architecture Decision
    ↓
Specification
    ↓
Implementation
    ↓
Contract Verification
```

Relevant relationships should be recorded explicitly.

---

# 44. Traceability Record

```text id="r9m4xk"
Contract:
<contract>

Source:
<artifact>

Relationship:
<DERIVES_FROM | REALIZES | CONSTRAINS | SPECIFIES | VERIFIES>

Evidence:
<evidence>

Status:
<VALID | INFERRED | MISSING | STALE | CONFLICTING | SUPERSEDED>
```

---

# 45. API Contract Decisions

Record decisions involving:

* API boundary.
* Operation semantics.
* Error semantics.
* Idempotency.
* Consistency.
* Security.
* Versioning.
* Compatibility.
* Pagination.
* External exposure.
* Migration.

```text id="m8q5vc"
Decision:
<decision>

Reason:
<reason>

Alternatives:
<alternatives>

Consequences:
<consequences>

ADR:
<ADR-ID>
```

---

# 46. API Contract Risks

| ID           | Risk     | Operation     | Impact     | Severity     | Mitigation     |
| ------------ | -------- | ------------- | ---------- | ------------ | -------------- |
| RISK-API-001 | `<risk>` | `<operation>` | `<impact>` | `<severity>` | `<mitigation>` |

Typical risks:

* Ambiguous semantics.
* Hidden consumer dependency.
* Breaking evolution.
* Unclear ownership.
* Security ambiguity.
* Inconsistent errors.
* Undefined idempotency.
* Undefined consistency.
* External dependency instability.

---

# 47. API Contract Unknowns

| ID          | Unknown     | Operation     | Why It Matters | Impact     | Resolution |
| ----------- | ----------- | ------------- | -------------- | ---------- | ---------- |
| UNK-API-001 | `<unknown>` | `<operation>` | `<reason>`     | `<impact>` | `<method>` |

Unknowns affecting security, semantics, ownership, consistency, or compatibility may be blocking.

---

# 48. API Validation Scenarios

Each significant operation should have representative validation scenarios.

```text id="x6v9qm"
Scenario:
<scenario>

Operation:
<operation>

Input:
<input>

Preconditions:
<preconditions>

Expected Response:
<response>

Expected State:
<state>

Business Rules:
<rules>

Security:
<security>

Failure:
<failure>

Result:
<PASSED | FAILED | PARTIAL | UNKNOWN>
```

Scenarios should cover more than the happy path.

---

# 49. API Contract Verification

Possible verification mechanisms:

* Contract tests.
* Schema validation.
* Integration tests.
* Consumer-driven contract tests.
* Security tests.
* Domain scenario tests.
* Compatibility tests.
* Performance verification when explicitly required.

```text id="q3m7xr"
Verification:
<method>

Contract:
<contract>

Scenario:
<scenario>

Expected:
<expected>

Evidence:
<evidence>

Status:
<status>
```

---

# 50. API Contract Review

### Boundary

* [ ] Provider is identified.
* [ ] Consumer is identified.
* [ ] Boundary is justified.
* [ ] Capability is identified.
* [ ] Semantic ownership is clear.

### Semantics

* [ ] Operation meaning is clear.
* [ ] Preconditions are defined where relevant.
* [ ] Postconditions are defined where relevant.
* [ ] Business rules are referenced.
* [ ] State behavior is clear.

### Data

* [ ] Request fields have defined meaning.
* [ ] Response fields have defined meaning.
* [ ] Data ownership is clear.
* [ ] Sensitive data is identified.

### Errors

* [ ] Important failure semantics are defined.
* [ ] Business errors are distinguishable where required.
* [ ] Retry behavior is defined where relevant.
* [ ] Internal implementation errors are not exposed as contract semantics.

### Behavior

* [ ] Idempotency is addressed where relevant.
* [ ] Ordering is addressed where relevant.
* [ ] Consistency is addressed where relevant.
* [ ] Timing expectations are addressed where relevant.
* [ ] Partial failure is addressed where relevant.

### Security

* [ ] Authentication expectations are known.
* [ ] Authorization expectations are known.
* [ ] Security-sensitive data is identified.
* [ ] Relevant Security Contract is referenced.

### Evolution

* [ ] Compatibility strategy is known.
* [ ] Versioning strategy is explicit where necessary.
* [ ] Deprecation is defined where applicable.
* [ ] Existing consumers are considered.

### Verification

* [ ] Validation scenarios exist.
* [ ] Contract verification strategy exists.
* [ ] Traceability is established.

---

# 51. API Contract Status

```text id="v7x4mq"
Contract:
<contract>

Status:
<IDENTIFIED | PROPOSED | UNDER_REVIEW | ACCEPTED | ACTIVE | SUPERSEDED | DEPRECATED | RETIRED>

Semantic Completeness:
<HIGH | MEDIUM | LOW>

Evidence:
<HIGH | MEDIUM | LOW>

Compatibility:
<CLEAR | PARTIAL | UNKNOWN>

Security:
<CLEAR | PARTIAL | UNKNOWN>

Verification:
<READY | PARTIAL | NOT_READY>

Blocking Issues:
<issues>

Overall:
<READY | READY_WITH_RISKS | INCOMPLETE | BLOCKED>
```

---

# 52. Compact API Contract

```text id="n9q3xc"
API Contract:
<name>

Provider:
<provider>

Consumer:
<consumer>

Capability:
<capability>

Operations:
<operations>

Key Data:
<data>

Security:
<security>

Errors:
<errors>

Idempotency:
<status>

Consistency:
<status>

Compatibility:
<status>

Versioning:
<strategy>

Verification:
<strategy>

Owner:
<owner>

Status:
<status>
```

---

# 53. Agent Instructions

When defining an API Contract:

1. Start from the approved architecture.
2. Identify the architectural boundary.
3. Identify provider and consumer.
4. Identify the business capability.
5. Identify the relevant use case.
6. Define semantic operation behavior.
7. Define request and response meaning.
8. Reference business rules rather than duplicating them.
9. Define state transitions where contractually relevant.
10. Define meaningful error semantics.
11. Evaluate idempotency.
12. Evaluate consistency.
13. Evaluate ordering.
14. Evaluate timing only when relevant.
15. Evaluate partial failure.
16. Evaluate security expectations.
17. Identify sensitive information.
18. Define evolution and compatibility.
19. Consider existing consumers for existing systems.
20. Define verification scenarios.
21. Preserve domain ownership.
22. Do not expose persistence models merely for convenience.
23. Do not invent fields or behavior.
24. Do not invent HTTP semantics or technology-specific mechanisms before they are justified.
25. Do not assume every domain event becomes an API response or event.
26. Revisit Architecture if API design exposes an unresolved boundary.
27. Revisit Domain Discovery if API design exposes semantic ambiguity.
28. Keep detailed protocol specifications for the Specifications phase.

---

# 54. Anti-Patterns

## Endpoint-First Modeling

Starting with URLs or operations before understanding the capability.

## CRUD Contract

Exposing database CRUD as the API model.

## Persistence Leakage

Returning database entities without considering domain meaning.

## Domain Leakage

Exposing internal domain structures that consumers should not depend upon.

## Implementation Contract

Making framework classes, internal methods, or package structures contractual.

## Error-as-Exception

Treating implementation exception types as stable consumer semantics.

## Schema-Only Contract

Defining fields without meaning or behavior.

## Happy-Path Contract

Ignoring errors, state, authorization, retries, or partial failures.

## Hidden Idempotency

Leaving repeated-request behavior undefined when it matters.

## Hidden Consistency

Allowing consumers to make assumptions about state freshness without a contract.

## Security Omission

Defining functional behavior while ignoring security expectations.

## Versioning by Habit

Adding version identifiers without an actual evolution requirement.

## Consumer Coupling

Allowing consumers to depend on implementation details.

## Contract Duplication

Defining the same data semantics independently in multiple contracts.

## Unsupported Precision

Inventing latency, throughput, availability, or timeout targets.

## API as Architecture

Using endpoint structure to define domain or bounded-context boundaries.

## Specification Prematurity

Turning the contract into framework-specific implementation documentation before the contract itself is stable.

---

# 55. Safe Progression Question

Before moving this API Contract into detailed specification:

> **Does the contract clearly define what the consumer may rely upon about the capability, inputs, outputs, behavior, failures, security, consistency, evolution, ownership, and verification without depending on provider implementation details?**

If **yes**, the contract may proceed to API Specification.

If **no**, determine whether the missing information belongs to:

```text id="1f1d7d"
Domain
   ↓
Architecture
   ↓
Contract Governance
   ↓
API Contract
   ↓
API Specification
```

Do not fill conceptual gaps with technical details.

---

# 56. Final Principle

> **An API contract is an agreement about behavior across a boundary, not a description of how the provider happens to implement that behavior.**

The contract should remain meaningful even if:

* Frameworks change.
* Databases change.
* Internal components change.
* Deployment changes.
* Programming languages change.
* Internal algorithms change.

Only the consumer-visible agreement should remain stable.
