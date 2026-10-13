# Data / Persistence Specification

## 1. Document Metadata

| Field                 | Value                            |
| --------------------- | -------------------------------- |
| Document Type         | Data / Persistence Specification |
| Lifecycle Phase       | Specifications / SDD             |
| Specification Type    | `DATA` / `PERSISTENCE`           |
| Status                | `DRAFT`                          |
| Version               | `0.1`                            |
| System                | `<system>`                       |
| Container             | `<container>`                    |
| Data Scope            | `<scope>`                        |
| Owner                 | `<owner>`                        |
| Created               | `<date>`                         |
| Last Updated          | `<date>`                         |
| Data Contract         | `<contract-id>`                  |
| Architecture Baseline | `<baseline>`                     |
| ADR Baseline          | `<baseline>`                     |

---

# 2. Purpose

This document specifies how approved data semantics, ownership, consistency requirements, lifecycle rules, and persistence responsibilities are to be realized.

It provides implementation-relevant detail for:

* data representation,
* persistence,
* retrieval,
* mutation,
* mapping,
* consistency,
* transactions,
* indexing,
* lifecycle,
* retention,
* migration,
* security,
* and verification.

It must preserve the distinction between:

```text
Domain Meaning
      ↓
Data Contract
      ↓
Persistence Specification
      ↓
Database / Storage Implementation
```

---

# 3. Core Principle

> **Persistence realizes approved data semantics; it does not define the domain model merely because the data is stored there.**

The persistence specification must not silently redefine:

* data ownership,
* source of truth,
* domain concepts,
* business rules,
* contracts,
* security requirements,
* retention obligations,
* consistency guarantees,
* or architectural boundaries.

---

# 4. Fundamental Distinctions

## Domain Model

Defines business concepts and behavior.

## Data Contract

Defines data meaning and expectations across a boundary.

## Persistence Model

Defines how data is represented for storage and retrieval.

## Database Schema

Defines the concrete physical structure of a storage technology.

These are related but not equivalent.

```text id="n7q4xc"
Domain Model
     │
     ├── defines meaning
     │
Data Contract
     │
     ├── defines shared data expectations
     │
Persistence Specification
     │
     ├── defines realization
     │
Database Schema
     │
     └── implements storage
```

---

# 5. Entry Conditions

Before creating this specification:

* [ ] Data ownership is understood.
* [ ] Relevant Data Contract exists.
* [ ] Source of truth is known.
* [ ] Relevant domain concepts are understood.
* [ ] Relevant architecture is accepted.
* [ ] Relevant ADRs are active.
* [ ] Security and privacy requirements are known.
* [ ] Consistency requirements are understood.
* [ ] Lifecycle requirements are known where applicable.
* [ ] Blocking data decisions are resolved.

---

# 6. Data Scope

```text id="m5x8vr"
Data Scope:
<scope>

Purpose:
<purpose>

In Scope:
<data>

Out of Scope:
<data>

Deferred:
<data>
```

Do not allow persistence concerns to expand system scope implicitly.

---

# 7. Data Ownership

```text id="x4q9mk"
Data:
<data>

Business Owner:
<owner>

Technical Owner:
<owner>

Authoritative Owner:
<owner>

Read Authority:
<authority>

Write Authority:
<authority>
```

Access does not imply ownership.

---

# 8. Source of Truth

```text id="q8m3vc"
Data:
<data>

Source of Truth:
<source>

Authority:
<authority>

Replication:
<YES | NO | CONDITIONAL>

Derived:
<YES | NO>

Derivation Source:
<source>
```

Replication must not be confused with ownership.

---

# 9. Data Classification

```text id="v6x4mr"
Data:
<data>

Classification:
<PUBLIC | INTERNAL | CONFIDENTIAL | SENSITIVE | RESTRICTED | OTHER>

Reason:
<reason>

Protection:
<requirements>
```

Classification must be supported by security, privacy, regulatory, or organizational evidence.

---

# 10. Data Element Specification

```text id="n9q3xc"
Data Element:
<name>

Meaning:
<meaning>

Business Definition:
<definition>

Type:
<type>

Required:
<YES | NO | CONDITIONAL>

Nullable:
<YES | NO | CONDITIONAL>

Default:
<value or unspecified>

Source:
<source>

Owner:
<owner>

Sensitivity:
<classification>
```

A field name alone is not sufficient to establish semantic meaning.

---

# 11. Data Element Register

| Element     | Meaning     | Type     | Required   | Nullable   | Source     | Sensitive  |
| ----------- | ----------- | -------- | ---------- | ---------- | ---------- | ---------- |
| `<element>` | `<meaning>` | `<type>` | `<yes/no>` | `<yes/no>` | `<source>` | `<yes/no>` |

---

# 12. Identity

```text id="m7x5vr"
Entity / Data:
<data>

Identity:
<identity>

Meaning:
<meaning>

Authority:
<authority>

Uniqueness:
<requirement>

Stability:
<requirement>

Generation:
<defined / unspecified>
```

Do not expose persistence identifiers as domain identities without evidence.

---

# 13. Relationships

```text id="x8q4mk"
Source:
<data>

Target:
<data>

Relationship:
<relationship>

Meaning:
<meaning>

Ownership:
<ownership>

Cardinality:
<cardinality>

Lifecycle Dependency:
<dependency>
```

Relationships must represent meaningful semantics rather than merely database foreign keys.

---

# 14. Optionality

For each relevant element:

```text id="q5m9vc"
Element:
<element>

Optional:
<YES | NO | CONDITIONAL>

Meaning of Missing:
<meaning>

Meaning of Null:
<meaning>

Meaning of Empty:
<meaning>

Default:
<default or NONE>
```

`null`, missing, empty, zero, and default values must not be treated as interchangeable without evidence.

---

# 15. Value Constraints

```text id="v7x3mr"
Element:
<element>

Constraint:
<constraint>

Type:
<STRUCTURAL | SEMANTIC | BUSINESS>

Source:
<requirement / rule / contract>

Validation:
<validation>

Failure:
<behavior>
```

Business rules remain authoritative in domain/business-rule artifacts.

---

# 16. Data Invariants

```text id="n6q8xc"
Invariant:
<invariant>

Data:
<data>

Meaning:
<meaning>

Owner:
<owner>

Enforcement:
<enforcement>

Verification:
<verification>
```

Database constraints may enforce an invariant, but the database does not automatically become the owner of its business meaning.

---

# 17. Persistence Model

Define the persistence representation:

```text id="m4x9vr"
Persistence Entity:
<entity>

Purpose:
<purpose>

Source Domain Concept:
<concept>

Mapping:
<mapping>

Persistence-Specific Fields:
<fields>

Persistence-Specific Constraints:
<constraints>
```

Persistence entities should not automatically be treated as domain entities.

---

# 18. Domain-to-Persistence Mapping

| Domain Concept | Persistence Representation | Mapping Type | Semantic Transformation |
| -------------- | -------------------------- | ------------ | ----------------------- |
| `<concept>`    | `<representation>`         | `<mapping>`  | `<yes/no>`              |

Possible mapping types:

```text id="x9q5mk"
DIRECT
EMBEDDED
COMPOSED
FLATTENED
NORMALIZED
DENORMALIZED
TRANSFORMED
DERIVED
OTHER
```

---

# 19. Persistence-to-Domain Mapping

```text id="q6m3vc"
Persistence Data:
<data>

Domain Concept:
<concept>

Transformation:
<transformation>

Validation:
<validation>

Lossy:
<YES | NO | UNKNOWN>
```

Lossy transformations require explicit review.

---

# 20. Storage Responsibility

```text id="v8x4mr"
Storage:
<storage>

Purpose:
<purpose>

Owner:
<owner>

Data:
<data>

Operations:
<READ | WRITE | READ_WRITE>

Authoritative:
<YES | NO>

Lifecycle:
<lifecycle>
```

---

# 21. Storage Technology

Technology may be documented when already decided:

```text id="n5q9xc"
Storage Technology:
<technology>

Decision Source:
<ADR / existing architecture / constraint>

Reason:
<reason>

Alternative:
<alternative>

Status:
<DECIDED | INHERITED | OPEN>
```

Do not select storage technology merely because this specification requires persistence.

If technology selection is unresolved and consequential, escalate to architecture decision governance.

---

# 22. Schema Specification

When a concrete schema is required:

```text id="m7x3vr"
Schema:
<schema>

Purpose:
<purpose>

Objects:
<objects>

Constraints:
<constraints>

Ownership:
<owner>

Migration:
<migration>
```

Schema details belong here only when they are necessary for implementation.

---

# 23. Table / Collection / Object Specification

```text id="x4q8mk"
Storage Object:
<name>

Purpose:
<purpose>

Owned Data:
<data>

Identity:
<identity>

Relationships:
<relationships>

Constraints:
<constraints>

Lifecycle:
<lifecycle>
```

The physical object may be a:

* table,
* collection,
* document,
* key-value structure,
* graph structure,
* file,
* object store representation,
* or other storage construct.

---

# 24. Index Specification

Indexes should be specified only when materially relevant.

```text id="q9m5vc"
Index:
<index>

Storage Object:
<object>

Purpose:
<purpose>

Access Pattern:
<pattern>

Fields:
<fields>

Uniqueness:
<YES | NO>

Performance Driver:
<driver>

Trade-Off:
<trade-off>
```

Do not create indexes merely because a field exists.

---

# 25. Query Specification

```text id="v6x3mr"
Query:
<query>

Purpose:
<purpose>

Consumer:
<consumer>

Data:
<data>

Filtering:
<filter>

Ordering:
<ordering>

Consistency:
<requirement>

Expected Result:
<result>
```

Query specifications should describe meaningful access behavior rather than SQL or query-language syntax unless implementation detail is explicitly required.

---

# 26. Write Specification

```text id="n8q4xc"
Write Operation:
<operation>

Purpose:
<purpose>

Data:
<data>

Validation:
<validation>

Invariants:
<invariants>

Atomicity:
<requirement>

Consistency:
<requirement>

Failure:
<behavior>
```

---

# 27. Update Semantics

```text id="m5x8vr"
Data:
<data>

Mutable:
<YES | NO | CONDITIONAL>

Update Authority:
<authority>

Allowed Changes:
<changes>

Forbidden Changes:
<changes>

Concurrency:
<behavior>
```

Immutability should not be assumed merely because it simplifies persistence.

---

# 28. Delete Semantics

```text id="x7q3mk"
Data:
<data>

Deletion Allowed:
<YES | NO | CONDITIONAL>

Authority:
<authority>

Deletion Type:
<PHYSICAL | LOGICAL | ANONYMIZATION | EXPIRATION | OTHER>

Consequences:
<consequences>

Dependencies:
<dependencies>

Recovery:
<behavior>
```

Deletion semantics must consider domain, contractual, security, compliance, and lifecycle requirements.

---

# 29. Retention

```text id="q4m9vc"
Data:
<data>

Retention Requirement:
<requirement>

Source:
<requirement / policy / regulation / decision>

Start Event:
<event>

Expiration:
<condition>

Deletion:
<behavior>

Exceptions:
<exceptions>
```

Do not invent retention periods.

---

# 30. Historical Data

```text id="v9x5mr"
Historical Data:
<data>

Required:
<YES | NO | CONDITIONAL>

Purpose:
<purpose>

Authoritative:
<YES | NO>

Immutable:
<YES | NO>

Retention:
<requirement>

Access:
<requirements>
```

Historical records must not automatically become event sourcing.

---

# 31. Derived Data

```text id="n6q8xc"
Derived Data:
<data>

Source:
<source>

Transformation:
<transformation>

Authority:
<source>

Refresh:
<behavior>

Staleness:
<allowed / prohibited / conditional>

Rebuild:
<behavior>
```

Derived data must not be mistaken for authoritative data.

---

# 32. Aggregated Data

```text id="m3x7vr"
Aggregate:
<data>

Source:
<source>

Aggregation:
<aggregation>

Purpose:
<purpose>

Consistency:
<requirement>

Refresh:
<behavior>

Failure:
<behavior>
```

---

# 33. Data Freshness

When relevant:

```text id="x8q4mk"
Data:
<data>

Freshness Requirement:
<requirement>

Measurement:
<measurement>

Allowed Staleness:
<value or unspecified>

Consumer Impact:
<impact>

Verification:
<method>
```

Do not invent freshness targets.

---

# 34. Consistency

```text id="q5m9vc"
Data:
<data>

Consistency Requirement:
<requirement>

Scope:
<scope>

Model:
<STRONG | EVENTUAL | CONDITIONAL | OTHER>

Visibility:
<behavior>

Conflict:
<behavior>

Verification:
<method>
```

The consistency model must remain aligned with architecture and contracts.

---

# 35. Concurrency

```text id="v7x3mr"
Data:
<data>

Concurrent Access:
<scenario>

Conflict:
<conflict>

Detection:
<mechanism>

Resolution:
<behavior>

Lost Update Risk:
<YES | NO | UNKNOWN>
```

---

# 36. Transaction Specification

```text id="n9q4xc"
Transaction:
<transaction>

Scope:
<scope>

Operations:
<operations>

Atomicity:
<requirement>

Consistency:
<requirement>

Isolation:
<requirement or unspecified>

Failure:
<behavior>

Recovery:
<behavior>
```

Exact isolation requirements must not be invented.

---

# 37. Cross-Boundary Data Consistency

```text id="m6x8vr"
Data:
<data>

Boundary:
<boundary>

Consistency:
<requirement>

Synchronization:
<mechanism or unspecified>

Source of Truth:
<source>

Conflict:
<behavior>
```

If maintaining cross-boundary consistency requires a new architectural mechanism, escalate it.

---

# 38. Replication

```text id="x4q7mk"
Data:
<data>

Replicated:
<YES | NO | CONDITIONAL>

Source:
<source>

Target:
<target>

Purpose:
<purpose>

Consistency:
<requirement>

Lag:
<known / unspecified>

Failure:
<behavior>
```

Replication does not transfer data ownership unless explicitly decided.

---

# 39. Caching

When relevant:

```text id="q8m3vc"
Data:
<data>

Cached:
<YES | NO | CONDITIONAL>

Purpose:
<purpose>

Source of Truth:
<source>

Freshness:
<requirement>

Invalidation:
<behavior>

Stale Data:
<allowed / prohibited / conditional>
```

Caching must not silently alter data semantics.

---

# 40. Data Security

```text id="v5x9mr"
Data:
<data>

Classification:
<classification>

Protection:
<requirements>

Access:
<requirements>

Encryption:
<requirement or inherited>

Masking:
<requirement>

Exposure:
<allowed / prohibited / conditional>
```

Specific cryptographic or infrastructure implementation belongs here only when already governed by security architecture or ADRs.

---

# 41. Access Control

```text id="n7q3xc"
Data:
<data>

Read Authority:
<authority>

Write Authority:
<authority>

Delete Authority:
<authority>

Administrative Access:
<requirements>

Denied Behavior:
<behavior>
```

Business authority and technical access control must remain distinguishable.

---

# 42. Privacy

When relevant:

```text id="m4x8vr"
Data:
<data>

Personal / Sensitive:
<YES | NO | UNKNOWN>

Purpose:
<purpose>

Minimization:
<requirement>

Collection:
<requirement>

Usage:
<requirement>

Retention:
<requirement>

Deletion / Erasure:
<requirement>

Access:
<requirement>
```

Do not infer regulatory obligations without evidence.

---

# 43. Data Lifecycle

```text id="x9q5mk"
Lifecycle:

CREATE:
<behavior>

ACTIVE:
<behavior>

UPDATE:
<behavior>

ARCHIVE:
<behavior>

EXPIRE:
<behavior>

DELETE:
<behavior>
```

Not every lifecycle requires every state.

---

# 44. Data State

```text id="q6m3vc"
State:
<state>

Meaning:
<meaning>

Transition:
<trigger>

Guard:
<condition>

Result:
<state>

Owner:
<owner>
```

Domain state and persistence state must not be conflated.

---

# 45. Data Validation

```text id="v8x4mr"
Validation:
<validation>

Type:
<STRUCTURAL | SEMANTIC | BUSINESS | SECURITY>

Execution Boundary:
<boundary>

Source:
<rule / contract / requirement>

Failure:
<behavior>
```

Validation may be repeated at multiple boundaries when justified, but ownership should remain clear.

---

# 46. Serialization

When relevant:

```text id="n5q9xc"
Data:
<data>

Representation:
<representation>

Transformation:
<transformation>

Compatibility:
<requirement>

Lossy:
<YES | NO | UNKNOWN>
```

Serialization format must not be confused with domain meaning.

---

# 47. Import

```text id="m7x3vr"
Source:
<source>

Import Purpose:
<purpose>

Input:
<data>

Validation:
<validation>

Transformation:
<transformation>

Failure:
<behavior>

Partial Import:
<allowed / prohibited / conditional>
```

---

# 48. Export

```text id="x4q8mk"
Destination:
<destination>

Export Purpose:
<purpose>

Data:
<data>

Filtering:
<filter>

Security:
<requirements>

Transformation:
<transformation>

Failure:
<behavior>
```

---

# 49. Data Migration

For existing systems:

```text id="q9m5vc"
Migration:
<migration>

Source:
<source>

Target:
<target>

Transformation:
<transformation>

Ordering:
<ordering>

Validation:
<validation>

Rollback:
<behavior>

Completion:
<condition>
```

---

# 50. Migration Compatibility

```text id="v6x3mr"
Current Representation:
<representation>

Target Representation:
<representation>

Compatibility:
<compatibility>

Transition Representation:
<representation>

Dual Read:
<YES | NO | CONDITIONAL>

Dual Write:
<YES | NO | CONDITIONAL>

Cutover:
<condition>
```

Dual-write strategies require explicit architectural and operational consideration.

---

# 51. Data Integrity

```text id="n8q4xc"
Integrity Requirement:
<requirement>

Threat:
<threat>

Protection:
<mechanism>

Detection:
<mechanism>

Recovery:
<behavior>

Verification:
<method>
```

---

# 52. Backup and Recovery

When relevant:

```text id="m5x8vr"
Data:
<data>

Backup Required:
<YES | NO | UNKNOWN>

Recovery Requirement:
<requirement>

Recovery Point:
<target or UNKNOWN>

Recovery Time:
<target or UNKNOWN>

Verification:
<method>
```

Do not invent RPO/RTO targets.

---

# 53. Failure Behavior

| Failure     | Detection     | Impact     | Recovery     | Data Integrity |
| ----------- | ------------- | ---------- | ------------ | -------------- |
| `<failure>` | `<detection>` | `<impact>` | `<recovery>` | `<behavior>`   |

---

# 54. Observability

```text id="x7q3mk"
Data Operation:
<operation>

Operational Question:
<question>

Logs:
<requirements>

Metrics:
<requirements>

Traces:
<requirements>

Audit:
<requirements>

Sensitive Data:
<handling>
```

Do not log complete data records merely for debugging convenience.

---

# 55. Performance

When relevant:

```text id="q4m9vc"
Data Operation:
<operation>

Performance Driver:
<driver>

Expected Behavior:
<behavior>

Target:
<target or UNKNOWN>

Measurement:
<measurement>

Trade-Off:
<trade-off>
```

---

# 56. Storage Capacity

When relevant:

```text id="v9x5mr"
Data:
<data>

Growth Driver:
<driver>

Capacity Requirement:
<requirement>

Retention:
<requirement>

Scaling:
<behavior>

Measurement:
<method>
```

Do not invent growth projections.

---

# 57. Schema Evolution

```text id="n6q8xc"
Schema:
<schema>

Change:
<change>

Compatibility:
<BACKWARD | FORWARD | FULL | NONE | CONDITIONAL>

Migration:
<migration>

Consumers:
<consumers>

Verification:
<verification>
```

Schema compatibility is not sufficient to guarantee semantic compatibility.

---

# 58. Data Contract Alignment

```text id="m3x7vr"
Data Contract:
<contract>

Persistence Representation:
<representation>

Semantic Mapping:
<mapping>

Contract Requirement:
<requirement>

Persistence Consequence:
<consequence>
```

Persistence must realize the Data Contract without forcing consumers to depend on storage details.

---

# 59. Domain Alignment

```text id="x8q4mk"
Domain Concept:
<concept>

Data Representation:
<representation>

Meaning Preserved:
<YES | NO | CONDITIONAL>

Transformation:
<transformation>

Domain Rule:
<rule>
```

---

# 60. Specification-to-Implementation Mapping

```text id="q5m9vc"
Specification Element:
<element>

Implementation Unit:
<unit>

Storage Artifact:
<artifact>

Verification:
<test / evidence>
```

This mapping should be used for traceability, not to redefine architecture.

---

# 61. Test Specification

Important data behavior should be verifiable.

```text id="v7x3mr"
Scenario ID:
<scenario>

Given:
<initial condition>

When:
<operation>

Then:
<expected data behavior>

Verification Type:
<UNIT | INTEGRATION | CONTRACT | MIGRATION | SECURITY | PERFORMANCE | OTHER>

Evidence:
<evidence>
```

Recommended categories:

```text id="n9q4xc"
DATA_VALIDATION
INVARIANT
CRUD_BEHAVIOR
TRANSACTION
CONCURRENCY
CONSISTENCY
MIGRATION
COMPATIBILITY
SECURITY
PRIVACY
RECOVERY
PERFORMANCE
```

Only applicable categories should be used.

---

# 62. Existing System Analysis

For existing persistence:

```text id="m6x8vr"
Documented Model:
<model>

Observed Model:
<model>

Actual Data:
<behavior>

Target Model:
<model>

Differences:
<differences>
```

Observed data and schema are evidence, not automatically the desired model.

---

# 63. System Evolution

```text id="x4q7mk"
Current:
<current>

Target:
<target>

Transition:
<transition>

Compatibility:
<compatibility>

Migration:
<migration>

Cutover:
<condition>
```

---

# 64. Open Questions

| ID         | Question     | Impact     | Blocking   | Owner     | Resolution |
| ---------- | ------------ | ---------- | ---------- | --------- | ---------- |
| DATA-Q-001 | `<question>` | `<impact>` | `<yes/no>` | `<owner>` | `<method>` |

---

# 65. Assumptions

| ID         | Assumption     | Evidence     | Confidence     | Impact     | Validation |
| ---------- | -------------- | ------------ | -------------- | ---------- | ---------- |
| DATA-A-001 | `<assumption>` | `<evidence>` | `<confidence>` | `<impact>` | `<method>` |

---

# 66. Risks

| ID         | Risk     | Severity     | Impact     | Mitigation     |
| ---------- | -------- | ------------ | ---------- | -------------- |
| DATA-R-001 | `<risk>` | `<severity>` | `<impact>` | `<mitigation>` |

---

# 67. Architecture Escalation Triggers

Escalate to Architecture / ADR governance when persistence work introduces:

* a new data owner,
* a new source of truth,
* a new architectural boundary,
* shared ownership of authoritative data,
* a new cross-boundary transaction,
* a new consistency model,
* a significant replication strategy,
* a major storage technology decision,
* a new integration pattern,
* significant security boundary changes,
* major migration risk,
* or materially different quality attributes.

---

# 68. Traceability

| Data Specification Element | Upstream Artifact | Relationship | Verification     |
| -------------------------- | ----------------- | ------------ | ---------------- |
| `<element>`                | `<artifact>`      | `REFINES`    | `<verification>` |

Typical chain:

```text id="v5x9mr"
Domain Concept
      ↓
Data Contract
      ↓
Data / Persistence Specification
      ↓
Persistence Implementation
      ↓
Verification
```

---

# 69. Specification Review Checklist

### Semantics

* [ ] Data meaning is explicit.
* [ ] Domain concepts are not confused with storage structures.
* [ ] Data ownership is explicit.
* [ ] Source of truth is explicit.
* [ ] Derived data is distinguished from authoritative data.

### Structure

* [ ] Data elements are defined.
* [ ] Optionality is clear.
* [ ] Null/missing semantics are clear.
* [ ] Relationships are understood.
* [ ] Constraints are justified.

### Persistence

* [ ] Persistence responsibility is clear.
* [ ] Persistence model is distinguished from domain model.
* [ ] Schema detail is proportional.
* [ ] Queries/writes are specified where relevant.
* [ ] Indexes are justified where relevant.

### Consistency

* [ ] Transaction boundaries are clear.
* [ ] Consistency expectations are clear.
* [ ] Concurrency is addressed where relevant.
* [ ] Replication does not imply ownership.

### Security

* [ ] Data classification is defined.
* [ ] Access authority is defined.
* [ ] Sensitive data is protected.
* [ ] Privacy requirements are addressed where relevant.
* [ ] Telemetry exposure is controlled.

### Lifecycle

* [ ] Retention is defined where required.
* [ ] Deletion semantics are defined.
* [ ] Historical data is addressed where relevant.
* [ ] Migration is addressed for evolution.

### Verification

* [ ] Important data behavior is testable.
* [ ] Migration can be verified.
* [ ] Integrity can be verified.
* [ ] Security/privacy behavior can be verified.

### Governance

* [ ] Data Contract is preserved.
* [ ] ADRs are respected.
* [ ] No architectural decision is hidden.
* [ ] Assumptions are explicit.
* [ ] Unknowns are explicit.
* [ ] Traceability is maintained.

---

# 70. Specification Outcome

```text id="n7q3xc"
Outcome:

READY
READY_WITH_RISKS
INCOMPLETE
BLOCKED
NOT_REQUIRED
```

## READY

Data behavior and persistence are sufficiently specified for implementation and verification.

## READY_WITH_RISKS

Implementation may proceed with explicit non-blocking risks.

## INCOMPLETE

Important data behavior or persistence detail remains unresolved.

## BLOCKED

An upstream architectural, contractual, domain, security, or data decision prevents safe progression.

## NOT_REQUIRED

Independent persistence specification is unnecessary for the relevant scope.

---

# 71. Handoff

### Implementation Must Preserve

* Data meaning.
* Ownership.
* Source of truth.
* Domain semantics.
* Business invariants.
* Data Contract semantics.
* Security requirements.
* Privacy requirements.
* Consistency requirements.
* Lifecycle requirements.

### Implementation May Choose

* Internal mapping mechanisms.
* Internal persistence abstractions.
* Query implementation.
* Storage-specific optimizations.

Provided they preserve the approved behavior.

### Implementation Must Not Introduce

* New data ownership.
* New source of truth.
* New consistency guarantees.
* Unapproved shared persistence.
* Unapproved cross-boundary transactions.
* Unapproved data exposure.

---

# 72. Agent Instructions

When producing a Data / Persistence Specification:

1. Start from the Data Contract.
2. Identify authoritative data ownership.
3. Identify the source of truth.
4. Preserve domain semantics.
5. Separate domain model from persistence model.
6. Define data elements and their meaning.
7. Define identity semantics.
8. Define relationships.
9. Define optionality and null semantics.
10. Define relevant invariants.
11. Define persistence responsibilities.
12. Define meaningful read and write behavior.
13. Define transaction boundaries.
14. Define consistency requirements.
15. Define concurrency behavior where relevant.
16. Define lifecycle and retention requirements where relevant.
17. Define deletion semantics where relevant.
18. Define security and privacy requirements.
19. Define migration behavior for evolving systems.
20. Define verification scenarios.
21. Do not invent retention periods.
22. Do not invent RPO/RTO values.
23. Do not invent performance targets.
24. Do not treat replicated data as authoritative automatically.
25. Do not treat database schema as the domain model.
26. Do not introduce storage technology through specification if it is an unresolved architectural choice.
27. Do not create indexes without meaningful access-pattern justification.
28. Do not use persistence structure to define business rules.
29. Escalate architectural consequences.
30. Maintain traceability.

---

# 73. Anti-Patterns

## Database-First Modeling

Allowing the schema to define the domain model.

## Schema = Contract

Treating database structure as a consumer-facing data contract.

## Persistence = Domain

Treating persistence entities as domain entities automatically.

## Shared Database = Shared Ownership

Assuming database access grants ownership of data.

## Replication = Authority

Assuming a replica becomes a source of truth.

## CRUD Persistence Specification

Documenting only create/read/update/delete operations.

## Storage Technology First

Choosing a database before understanding data requirements.

## Premature Normalization

Optimizing schema structure before access and domain requirements are understood.

## Premature Denormalization

Introducing duplicated data without a justified access or architectural requirement.

## Unbounded Data Exposure

Persisting or exposing more data than required.

## Hidden Consistency

Leaving consistency behavior undefined.

## Hidden Null Semantics

Treating null, missing, empty, and default as equivalent.

## Invented Retention

Creating arbitrary retention periods.

## Persistence-Driven Business Rules

Moving domain behavior into storage constraints without understanding ownership.

## Legacy Schema Worship

Treating an existing schema as the target design automatically.

## Migration Theater

Defining migration steps without understanding source, target, compatibility, or verification.

## Specification Explosion

Documenting every column, index, and query regardless of significance.

---

# 74. Safe Progression Question

Before accepting this specification:

> **Does this specification define enough precise data semantics, ownership, persistence behavior, consistency, lifecycle, security, migration, and verification detail to implement the approved data responsibilities without confusing storage structure with domain or contractual meaning?**

If not, determine whether the missing information belongs to:

```text id="m4x8vr"
Domain
Architecture
Data Contract
ADR
Specification
Implementation
```

---

# 75. Final Principle

> **A Data / Persistence Specification defines how approved data semantics and ownership are realized in storage; it does not allow the database to become the accidental source of domain truth.**

The intended relationship is:

```text id="x9q5mk"
Domain Model
      ↓
Data Contract
      ↓
Data / Persistence Specification
      ↓
Persistence Implementation
      ↓
Database / Storage
      ↓
Verification
```

A healthy specification preserves the distinction between **what data means**, **who owns it**, **how it is persisted**, and **how that persistence is implemented**.
