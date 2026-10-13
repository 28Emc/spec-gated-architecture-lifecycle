# Event Specification

## 1. Document Metadata

| Field                 | Value                |
| --------------------- | -------------------- |
| Document Type         | Event Specification  |
| Lifecycle Phase       | Specifications / SDD |
| Specification Type    | `EVENT`              |
| Status                | `DRAFT`              |
| Version               | `0.1`                |
| System                | `<system>`           |
| Event                 | `<event>`            |
| Owner                 | `<owner>`            |
| Created               | `<date>`             |
| Last Updated          | `<date>`             |
| Event Contract        | `<contract-id>`      |
| Architecture Baseline | `<baseline>`         |
| ADR Baseline          | `<baseline>`         |

---

# 2. Purpose

This document specifies the implementation-relevant behavior of an approved event representation.

It translates an accepted Event Contract into sufficient detail for:

* event production,
* event consumption,
* serialization,
* publication,
* delivery handling,
* validation,
* failure handling,
* observability,
* security,
* compatibility,
* testing,
* and migration.

It must preserve the semantics established by the Event Contract.

---

# 3. Core Principle

> **The Event Contract defines what event consumers may rely upon; the Event Specification defines sufficient detail to implement and verify that behavior.**

The specification must not silently redefine:

* event meaning,
* ownership,
* causality,
* publication semantics,
* consumer expectations,
* delivery guarantees,
* ordering guarantees,
* security requirements,
* compatibility,
* or architectural boundaries.

---

# 4. Fundamental Distinctions

## Domain Event

A meaningful business occurrence inside the domain.

Example:

```text
RecipePlanGenerated
```

## Integration Event

A representation of an occurrence crossing an architectural boundary.

Example:

```text
RecipePlanGeneratedIntegrationEvent
```

## Event Contract

Defines what consumers may rely upon.

## Event Specification

Defines how the approved event contract is realized and verified.

```text id="k8r4mc"
Domain Event
      ↓
Integration Decision
      ↓
Event Contract
      ↓
Event Specification
      ↓
Implementation
      ↓
Verification
```

An event specification must not imply event sourcing.

---

# 5. Entry Conditions

Before creating this specification:

* [ ] Event Contract exists.
* [ ] Event Contract is `ACCEPTED` or `ACTIVE`.
* [ ] Event publisher is known.
* [ ] Consumers are known or explicitly identified as unknown.
* [ ] Event semantics are understood.
* [ ] Publication decision is established.
* [ ] Relevant domain event is understood.
* [ ] Security requirements are known.
* [ ] Observability requirements are known.
* [ ] Compatibility requirements are known.
* [ ] Blocking architectural decisions are resolved.

---

# 6. Event Identity

```text id="m5x9vr"
Event ID:
<EVENT-ID>

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

# 7. Ownership

```text id="x7q3mk"
Business Owner:
<owner>

Domain Owner:
<owner>

Technical Owner:
<owner>

Publication Authority:
<authority>

Publisher:
<publisher>

Consumers:
<consumers>
```

Consumers do not automatically become owners of event semantics.

---

# 8. Architectural Context

```text id="q4m8vc"
System:
<system>

Publisher Container:
<container>

Publisher Component:
<component>

Bounded Context:
<context>

Domain Event:
<domain event>

Event Contract:
<contract>

Relevant ADRs:
<ADR IDs>
```

---

# 9. Publication Decision

```text id="v9x5mr"
Publication Required:
<YES | NO | CONDITIONAL>

Reason:
<reason>

Cross-Boundary:
<YES | NO>

Publication Trigger:
<trigger>

Publication Authority:
<authority>
```

A domain event does not automatically require publication outside its bounded context.

---

# 10. Event Meaning

```text id="n6q3xc"
Event:
<event>

Meaning:
<meaning>

Business Occurrence:
<occurrence>

Why It Matters:
<reason>

Not Meaning:
<explicit exclusions>
```

The event name must not be the only source of semantic meaning.

---

# 11. Event Origin

```text id="m8x4vr"
Origin:
<aggregate / domain service / policy / process / other>

Trigger:
<trigger>

Business Action:
<action>

State Before:
<state>

State After:
<state>

Domain Event:
<event>
```

---

# 12. Event Causality

```text id="x5q9mk"
Cause:
<cause>

Event:
<event>

Causation:
<relationship>

Correlation:
<relationship>

Known Causal Chain:
<chain>
```

Correlation must not be interpreted as causation.

---

# 13. Event Facts

An event should describe facts that have occurred.

```text id="q7m3vc"
Fact:
<fact>

Meaning:
<meaning>

Required:
<YES | NO | CONDITIONAL>

Source:
<source>

Sensitive:
<YES | NO>
```

Avoid adding data merely because it may be useful to a current consumer.

---

# 14. Event Payload

```text id="v8x5mr"
Payload:
<payload>

Purpose:
<purpose>

Semantic Meaning:
<meaning>

Required:
<YES | NO>

Source:
<source>

Consumer Dependency:
<dependency>
```

The payload must contain information required by the event semantics and contract.

---

# 15. Payload Field Specification

| Field     | Meaning     | Type     | Required   | Source     | Sensitive  | Versioned  |
| --------- | ----------- | -------- | ---------- | ---------- | ---------- | ---------- |
| `<field>` | `<meaning>` | `<type>` | `<yes/no>` | `<source>` | `<yes/no>` | `<yes/no>` |

Do not infer semantic meaning from field names alone.

---

# 16. Event Metadata

```text id="n4q8xc"
Event ID:
<identifier>

Event Type:
<type>

Event Version:
<version>

Occurred At:
<timestamp>

Published At:
<timestamp>

Producer:
<producer>

Correlation ID:
<identifier>

Causation ID:
<identifier>

Trace Context:
<context>

Additional Metadata:
<metadata>
```

Only metadata with defined semantic or operational purpose should be included.

---

# 17. Event Identity

```text id="m6x9vr"
Event Identity:
<identity>

Uniqueness:
<requirement>

Generation:
<mechanism or unspecified>

Scope:
<scope>

Consumer Use:
<use>
```

Event identity must be distinguished from the identity of the business entity that caused the event.

---

# 18. Occurrence Time

```text id="x8q4mk"
Occurrence Time:
<timestamp>

Meaning:
<meaning>

Source:
<source>

Required:
<YES | NO>

Clock Assumption:
<assumption>
```

Do not invent time semantics when the distinction between event occurrence and publication time is unresolved.

---

# 19. Event Version

```text id="q5m3vc"
Version:
<version>

Meaning:
<meaning>

Compatibility:
<compatibility>

Change:
<change>

Migration:
<migration>
```

Versioning should respond to meaningful compatibility requirements rather than become automatic ceremony.

---

# 20. Serialization

```text id="v7x9mr"
Representation:
<representation>

Serialization:
<mechanism>

Encoding:
<encoding>

Transformation:
<transformation>

Lossy:
<YES | NO | UNKNOWN>

Compatibility:
<requirement>
```

Specific serialization technology should only be included when already decided.

---

# 21. Publication Trigger

```text id="n8q4xc"
Trigger:
<trigger>

Required Domain State:
<state>

Condition:
<condition>

Publication:
<behavior>

Suppressed:
<conditions>
```

Publication must represent a meaningful occurrence, not merely a technical operation.

---

# 22. Publication Timing

```text id="m4x8vr"
Timing:
<IMMEDIATE | DEFERRED | ASYNCHRONOUS | CONDITIONAL | OTHER>

Requirement:
<requirement>

Reason:
<reason>

Consumer Impact:
<impact>
```

Do not invent timing guarantees.

---

# 23. Transactional Relationship

When event publication relates to state persistence:

```text id="x9q5mk"
Domain State Change:
<change>

Event Publication:
<publication>

Consistency Requirement:
<requirement>

Atomicity:
<requirement>

Failure:
<behavior>

Recovery:
<behavior>
```

If reliable publication requires an architectural mechanism, that mechanism must be governed appropriately.

---

# 24. Delivery Semantics

```text id="q6m3vc"
Delivery:
<AT_MOST_ONCE | AT_LEAST_ONCE | EXACTLY_ONCE | BEST_EFFORT | OTHER | UNKNOWN>

Source:
<contract / ADR / infrastructure>

Consumer Expectation:
<expectation>

Duplicate Handling:
<behavior>
```

Never claim `EXACTLY_ONCE` merely because the underlying technology supports a feature with that name.

---

# 25. Duplicate Events

```text id="v8x4mr"
Duplicates Possible:
<YES | NO | UNKNOWN>

Detection:
<mechanism>

Consumer Behavior:
<behavior>

Idempotency:
<requirement>

Verification:
<method>
```

Consumers must not rely on accidental duplicate behavior.

---

# 26. Ordering

```text id="n5q9xc"
Ordering Required:
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

Ordering must be specified only where semantically relevant.

---

# 27. Partitioning / Routing

When relevant:

```text id="m7x3vr"
Routing:
<routing>

Purpose:
<purpose>

Routing Key:
<key>

Semantic Meaning:
<meaning>

Ordering Dependency:
<dependency>

Implementation:
<technology or unspecified>
```

Routing must not be confused with domain identity.

---

# 28. Consumer Specification

For each significant consumer:

```text id="x4q8mk"
Consumer:
<consumer>

Purpose:
<purpose>

Required:
<YES | NO>

Expected Behavior:
<behavior>

Fields Used:
<fields>

Failure Dependency:
<dependency>

Compatibility:
<requirement>
```

Consumer requirements must not redefine publisher-owned event semantics.

---

# 29. Consumer Independence

```text id="q9m5vc"
Consumer:
<consumer>

Independent:
<YES | NO | CONDITIONAL>

Dependency:
<dependency>

Required Publisher Knowledge:
<knowledge>

Coupling:
<LOW | MEDIUM | HIGH>
```

A healthy event contract minimizes unnecessary semantic coupling.

---

# 30. Consumer Filtering

```text id="v6x3mr"
Consumer:
<consumer>

Filter:
<filter>

Purpose:
<purpose>

Required Fields:
<fields>

Behavior When Filtered:
<behavior>
```

---

# 31. Consumer Failure

```text id="n8q4xc"
Consumer:
<consumer>

Failure:
<failure>

Retry:
<behavior>

Dead-Letter / Quarantine:
<behavior or unspecified>

Recovery:
<behavior>

Impact:
<impact>
```

Specific infrastructure mechanisms belong here only when already governed.

---

# 32. Invalid Events

```text id="m5x8vr"
Invalid Event:
<condition>

Detection:
<mechanism>

Publisher Behavior:
<behavior>

Consumer Behavior:
<behavior>

Quarantine:
<behavior>

Alert:
<behavior>

Recovery:
<behavior>
```

---

# 33. Poison Events

When relevant:

```text id="x7q3mk"
Poison Event:
<condition>

Detection:
<mechanism>

Handling:
<behavior>

Retry Limit:
<value or unspecified>

Recovery:
<behavior>
```

Do not invent retry limits.

---

# 34. Replay

```text id="q4m9vc"
Replay Supported:
<YES | NO | CONDITIONAL | UNKNOWN>

Purpose:
<purpose>

Source:
<event store / retained stream / other>

Consumer Requirement:
<requirement>

Idempotency:
<requirement>

Ordering:
<requirement>

Side Effects:
<behavior>
```

Replay support must not be interpreted as event sourcing unless explicitly decided.

---

# 35. Retention

```text id="v9x5mr"
Retention:
<requirement>

Purpose:
<purpose>

Source:
<policy / contract / ADR / infrastructure>

Consumer Dependency:
<dependency>

Deletion:
<behavior>
```

Do not invent retention periods.

---

# 36. Event Security

```text id="n6q3xc"
Event:
<event>

Classification:
<classification>

Sensitive Data:
<data>

Protected Fields:
<fields>

Access:
<requirements>

Publication Restriction:
<restriction>

Encryption:
<requirement or inherited>

Audit:
<requirement>
```

---

# 37. Data Minimization

```text id="m8x4vr"
Field:
<field>

Required:
<YES | NO>

Purpose:
<purpose>

Consumer:
<consumer>

Sensitive:
<YES | NO>

Removal Impact:
<impact>
```

Do not add fields solely because a publisher happens to have them available.

---

# 38. Event Schema Evolution

```text id="x5q9mk"
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

Schema compatibility must not be confused with semantic compatibility.

---

# 39. Breaking Changes

Potential breaking changes include:

* removing a required field,
* changing field meaning,
* changing event meaning,
* changing identity semantics,
* changing ordering guarantees,
* changing delivery semantics,
* changing security requirements,
* changing consumer-visible state interpretation,
* changing timing guarantees,
* changing required consumer behavior.

```text id="q7m3vc"
Change:
<change>

Breaking:
<YES | NO | CONDITIONAL>

Reason:
<reason>

Governance:
<ADR / Contract Review / Other>
```

---

# 40. Deprecation

```text id="v8x5mr"
Event:
<event>

Deprecation Reason:
<reason>

Consumers:
<consumers>

Replacement:
<replacement>

Migration:
<migration>

Removal Condition:
<condition>
```

---

# 41. Observability

```text id="n4q8xc"
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

Publication Monitoring:
<requirements>

Consumer Monitoring:
<requirements>
```

Observability must not expose sensitive event payloads unnecessarily.

---

# 42. Audit

When event publication represents auditable business behavior:

```text id="m6x9vr"
Auditable Event:
<event>

Reason:
<reason>

Actor:
<actor>

Evidence:
<evidence>

Integrity:
<requirement>

Retention:
<requirement>
```

Not every event is an audit record.

---

# 43. Event Ordering Scenarios

| Scenario     | Ordering Requirement | Expected Behavior | Verification |
| ------------ | -------------------- | ----------------- | ------------ |
| `<scenario>` | `<requirement>`      | `<behavior>`      | `<test>`     |

---

# 44. Delivery Scenarios

| Scenario     | Delivery Condition | Expected Behavior | Consumer Impact |
| ------------ | ------------------ | ----------------- | --------------- |
| `<scenario>` | `<condition>`      | `<behavior>`      | `<impact>`      |

---

# 45. Failure Scenarios

| Scenario     | Failure     | Publisher Behavior | Consumer Behavior | Recovery     |
| ------------ | ----------- | ------------------ | ----------------- | ------------ |
| `<scenario>` | `<failure>` | `<behavior>`       | `<behavior>`      | `<recovery>` |

---

# 46. Event State Relationship

```text id="x8q4mk"
Domain State:
<state>

Event:
<event>

State Before:
<state>

State After:
<state>

Meaning:
<meaning>
```

Events describe occurrences; they should not be used as a substitute for authoritative current state unless explicitly designed that way.

---

# 47. Event-to-Domain Mapping

```text id="q5m3vc"
Domain Event:
<event>

Integration Event:
<event>

Mapping:
<mapping>

Semantic Transformation:
<transformation>

Information Loss:
<loss>
```

A domain event and integration event may have different representations.

---

# 48. Event-to-API Relationship

When relevant:

```text id="v7x9mr"
API Operation:
<operation>

Domain Event:
<event>

Integration Event:
<event>

Relationship:
<TRIGGERS | RESULTS_FROM | CORRELATES_WITH | NONE>

Meaning:
<meaning>
```

An API response and an event are not automatically interchangeable.

---

# 49. Event-to-Data Relationship

```text id="n8q4xc"
Event:
<event>

Data:
<data>

Purpose:
<purpose>

Source:
<source>

Authoritative:
<YES | NO>

Snapshot:
<YES | NO | CONDITIONAL>
```

Event payload data should not accidentally become a new source of truth.

---

# 50. Event-to-Security Relationship

```text id="m5x8vr"
Event:
<event>

Security Contract:
<contract>

Protected Data:
<data>

Consumer Authorization:
<requirements>

Publication Restriction:
<restriction>
```

---

# 51. Event-to-Observability Relationship

```text id="x7q3mk"
Event:
<event>

Observability Contract:
<contract>

Correlation:
<behavior>

Trace:
<behavior>

Operational Signals:
<signals>
```

---

# 52. Implementation Mapping

```text id="q4m9vc"
Specification Element:
<element>

Implementation Unit:
<unit>

Publisher:
<unit>

Consumer:
<unit>

Verification:
<test / evidence>
```

Implementation mapping must not become a source-code architecture diagram.

---

# 53. Test Specification

Every significant event behavior should be verifiable.

```text id="v9x5mr"
Scenario ID:
<scenario>

Given:
<condition>

When:
<trigger>

Then:
<expected event>

Verification Type:
<UNIT | COMPONENT | CONTRACT | INTEGRATION | END_TO_END | SECURITY | PERFORMANCE | OTHER>

Evidence:
<evidence>
```

Recommended categories:

```text id="n6q3xc"
PUBLICATION
PAYLOAD
SCHEMA
DELIVERY
DUPLICATE
ORDERING
REPLAY
CONSUMER
FAILURE
SECURITY
OBSERVABILITY
COMPATIBILITY
MIGRATION
```

---

# 54. Consumer Contract Verification

```text id="m8x4vr"
Consumer:
<consumer>

Expectation:
<expectation>

Verification:
<method>

Expected Result:
<result>

Evidence:
<evidence>
```

---

# 55. Existing System Analysis

For existing event systems:

```text id="x5q9mk"
Documented Semantics:
<semantics>

Observed Semantics:
<semantics>

Actual Payload:
<payload>

Target Semantics:
<semantics>

Differences:
<differences>
```

Observed event behavior is evidence, not automatically the desired target.

---

# 56. System Evolution

```text id="q7m3vc"
Current Event:
<current>

Target Event:
<target>

Transition:
<transition>

Compatibility:
<compatibility>

Consumer Migration:
<migration>

Cutover:
<condition>
```

---

# 57. Open Questions

| ID          | Question     | Impact     | Blocking   | Owner     | Resolution |
| ----------- | ------------ | ---------- | ---------- | --------- | ---------- |
| EVENT-Q-001 | `<question>` | `<impact>` | `<yes/no>` | `<owner>` | `<method>` |

---

# 58. Assumptions

| ID          | Assumption     | Evidence     | Confidence     | Impact     | Validation |
| ----------- | -------------- | ------------ | -------------- | ---------- | ---------- |
| EVENT-A-001 | `<assumption>` | `<evidence>` | `<confidence>` | `<impact>` | `<method>` |

---

# 59. Risks

| ID          | Risk     | Severity     | Impact     | Mitigation     |
| ----------- | -------- | ------------ | ---------- | -------------- |
| EVENT-R-001 | `<risk>` | `<severity>` | `<impact>` | `<mitigation>` |

---

# 60. Architecture Escalation Triggers

Escalate to Architecture / ADR governance when event work introduces:

* a new cross-boundary event flow,
* a new integration boundary,
* a new delivery guarantee,
* a new ordering guarantee,
* a new consistency mechanism,
* a new source of truth,
* event-driven coupling that materially changes architecture,
* a new replay architecture,
* event sourcing,
* a significant broker/platform decision,
* new security boundaries,
* major consumer migration complexity,
* or significant operational consequences.

---

# 61. Traceability

| Event Specification Element | Upstream Artifact | Relationship | Verification     |
| --------------------------- | ----------------- | ------------ | ---------------- |
| `<element>`                 | `<artifact>`      | `REFINES`    | `<verification>` |

Typical chain:

```text id="v8x5mr"
Domain Event
      ↓
Integration Decision
      ↓
Event Contract
      ↓
Event Specification
      ↓
Implementation
      ↓
Verification
```

---

# 62. Specification Review Checklist

### Semantics

* [ ] Event meaning is explicit.
* [ ] Event origin is understood.
* [ ] Causality is explicit where relevant.
* [ ] Domain Event and Integration Event are distinguished.
* [ ] Event facts are justified.

### Payload

* [ ] Payload fields have explicit semantics.
* [ ] Required fields are identified.
* [ ] Sensitive data is identified.
* [ ] Unnecessary data is excluded.
* [ ] Identity semantics are clear.

### Delivery

* [ ] Delivery semantics are explicit.
* [ ] Duplicate behavior is addressed.
* [ ] Ordering is addressed where relevant.
* [ ] Replay is addressed where relevant.
* [ ] Failure behavior is defined.

### Consumers

* [ ] Consumers are identified.
* [ ] Consumer expectations are clear.
* [ ] Consumer coupling is understood.
* [ ] Consumer migration is addressed where necessary.

### Security

* [ ] Event classification is defined.
* [ ] Sensitive data is protected.
* [ ] Publication restrictions are defined.
* [ ] Access expectations are clear.

### Observability

* [ ] Publication can be observed.
* [ ] Consumer failures can be observed.
* [ ] Correlation is defined where required.
* [ ] Sensitive telemetry is protected.

### Evolution

* [ ] Versioning is addressed.
* [ ] Compatibility is addressed.
* [ ] Breaking changes are understood.
* [ ] Deprecation is defined where relevant.

### Verification

* [ ] Publication is testable.
* [ ] Payload semantics are testable.
* [ ] Consumer expectations are testable.
* [ ] Failure behavior is testable.
* [ ] Compatibility is testable.

### Governance

* [ ] Event Contract is preserved.
* [ ] ADRs are respected.
* [ ] No architecture is introduced implicitly.
* [ ] Assumptions are explicit.
* [ ] Unknowns are explicit.
* [ ] Traceability is maintained.

---

# 63. Specification Outcome

```text id="n4q8xc"
Outcome:

READY
READY_WITH_RISKS
INCOMPLETE
BLOCKED
NOT_REQUIRED
```

## READY

The event is sufficiently specified for implementation and verification.

## READY_WITH_RISKS

Implementation may proceed with explicit non-blocking risks.

## INCOMPLETE

Important event behavior remains unspecified.

## BLOCKED

An unresolved upstream issue prevents safe progression.

## NOT_REQUIRED

Independent event specification is unnecessary for the relevant scope.

---

# 64. Handoff

### Publisher Must Preserve

* Event meaning.
* Event identity.
* Event causality.
* Payload semantics.
* Publication conditions.
* Delivery semantics.
* Security requirements.
* Compatibility requirements.

### Consumers Must Preserve

* Consumer expectations.
* Duplicate handling.
* Ordering assumptions.
* Failure behavior.
* Compatibility behavior.

### Implementation May Choose

* Internal event construction.
* Internal serialization mechanisms.
* Internal handler structure.
* Internal framework abstractions.

Provided they preserve the approved contract.

### Implementation Must Not Introduce

* New event semantics.
* New consumers with architectural significance.
* New delivery guarantees.
* New ordering guarantees.
* Event sourcing.
* New source-of-truth assumptions.

Without appropriate governance.

---

# 65. Agent Instructions

When producing an Event Specification:

1. Start from the accepted Event Contract.
2. Identify the publisher and consumers.
3. Confirm the publication decision.
4. Distinguish Domain Event from Integration Event.
5. Define event meaning before payload structure.
6. Define event origin.
7. Define causality and correlation where relevant.
8. Define payload semantics.
9. Define metadata semantics.
10. Define identity.
11. Define publication conditions.
12. Define delivery semantics only when supported by evidence.
13. Define duplicate behavior.
14. Define ordering only when semantically relevant.
15. Define replay behavior where relevant.
16. Define consumer expectations.
17. Define failure behavior.
18. Define security and sensitive-data handling.
19. Define observability.
20. Define compatibility and evolution.
21. Define verification scenarios.
22. Do not invent delivery guarantees.
23. Do not invent ordering guarantees.
24. Do not invent retention periods.
25. Do not assume event sourcing.
26. Do not assume every domain event must be published.
27. Do not let consumers redefine publisher-owned semantics.
28. Do not use event payloads as accidental sources of truth.
29. Escalate architectural consequences.
30. Maintain traceability.

---

# 66. Anti-Patterns

## Event-First Architecture

Introducing events before identifying meaningful domain occurrences.

## Kafka-First Design

Choosing a broker before defining event semantics.

## Domain Event = Integration Event

Treating every domain event as an external contract.

## Event = Message

Ignoring the business meaning of the occurrence.

## Command-Shaped Event

Naming or designing events as requests for future action.

## Technical Event Leakage

Publishing technical operations as business events without justification.

## Event-Everything

Creating events for every internal state change.

## Consumer-Owned Semantics

Allowing a consumer to redefine what the publisher's event means.

## Schema-Only Event

Defining a payload without defining semantics.

## Invented Delivery Guarantees

Claiming at-least-once or exactly-once behavior without evidence.

## Invented Ordering

Assuming global or per-entity ordering without explicit requirements.

## Replay Assumption

Assuming all events can be replayed safely.

## Event Sourcing Assumption

Treating event publication as event sourcing.

## Payload Dump

Publishing the complete internal entity for convenience.

## Sensitive Event Leakage

Publishing confidential information unnecessarily.

## Event as Source of Truth

Assuming an integration event is authoritative state.

## Consumer Coupling

Designing events around one current consumer.

## Legacy Event Worship

Treating historical technical events as the desired semantic model.

## Event Explosion

Creating excessive event types with little business value.

## Specification Theater

Documenting event infrastructure in detail without clarifying event behavior.

---

# 67. Safe Progression Question

Before accepting this specification:

> **Does this specification define enough precise event semantics, publication behavior, payload meaning, delivery and failure expectations, security, evolution, and verification detail to implement and consume the event safely without inventing new architectural semantics?**

If not, determine whether the missing information belongs to:

```text id="m7x3vr"
Domain
Architecture
Event Contract
ADR
Specification
Implementation
```

---

# 68. Final Principle

> **An Event Specification turns an approved event contract into implementable and verifiable behavior without confusing business occurrences with messaging technology.**

The intended relationship is:

```text id="x4q8mk"
Domain Event
      ↓
Integration Representation
      ↓
Event Contract
      ↓
Event Specification
      ↓
Publisher / Consumer Implementation
      ↓
Verification
```

A healthy event specification makes clear **what happened, why it matters, what consumers may rely upon, how failures behave, and how compatibility is preserved**, without assuming that every event requires a particular messaging technology or architectural pattern.
