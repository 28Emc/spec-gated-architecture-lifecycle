# Data Contract

## 1. Document Metadata

| Field                 | Value                   |
| --------------------- | ----------------------- |
| Document Type         | Data Contract           |
| Lifecycle Phase       | Contracts               |
| Contract Type         | `DATA`                  |
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

This document defines the contractual expectations for data exchanged, shared, exposed, transferred, or otherwise relied upon across an architectural boundary.

It establishes:

* What the data means.
* Who owns its meaning.
* Who owns the authoritative source.
* Who produces and consumes it.
* Which fields and semantics are guaranteed.
* What constraints apply.
* How data quality is understood.
* How sensitive data is handled.
* How consistency and freshness should be interpreted.
* How data evolves.
* How compatibility is maintained.
* How the contract is verified.

This document does not define a physical database schema unless that schema is itself the explicit architectural boundary.

---

# 3. Core Principle

> **A Data Contract defines the meaning, ownership, structure, constraints, and expectations of data across an architectural boundary.**

A Data Contract is not automatically:

* A database schema.
* A table definition.
* An ORM model.
* A domain model.
* A serialization format.
* An API specification.
* A data warehouse schema.
* A persistence implementation.

---

# 4. Data Model Distinctions

The following concepts must remain separate:

```text id="8r2mxc"
Domain Model
    ↓
Business meaning and behavior
    ↓
Data Contract
    ↓
Cross-boundary data expectations
    ↓
Data Representation
    ↓
API / Event / File / Query / Exchange
    ↓
Persistence Model
    ↓
Database Schema
```

A domain concept may have multiple technical representations.

A database structure does not automatically define the domain meaning.

---

# 5. Contract Identity

```text id="m7q4vn"
Contract ID:
<DATA-CONTRACT-ID>

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

# 6. Data Provider and Consumers

```text id="x5c8mr"
Provider:
<provider>

Consumers:
<consumers>

Semantic Owner:
<owner>

Authoritative Owner:
<owner>

Technical Owner:
<owner>

Change Authority:
<authority>
```

Semantic ownership and physical storage ownership may differ.

---

# 7. Data Purpose

```text id="q9m3vk"
Data:
<name>

Business Purpose:
<purpose>

Consumer Need:
<need>

Architectural Purpose:
<purpose>

Expected Use:
<use>
```

The purpose must explain why the data crosses the boundary.

---

# 8. Data Ownership

```text id="v4x7mq"
Data Concept:
<concept>

Semantic Owner:
<owner>

Authoritative Source:
<source>

Storage Owner:
<owner>

Consumer:
<consumer>

Ownership Rule:
<rule>
```

A consumer must not become the authoritative owner simply because it stores a copy.

---

# 9. Authority and Source of Truth

```text id="n6q4xr"
Data:
<data>

Authoritative Source:
<source>

Authority Scope:
<scope>

Derived Data:
<YES | NO | UNKNOWN>

Derivation:
<derivation>

Conflict Resolution:
<rule>
```

“Source of truth” must be scoped.

One system may be authoritative for one aspect of a concept and not for another.

---

# 10. Data Boundary

```text id="m8x3vc"
Provider Boundary:
<boundary>

Consumer Boundary:
<boundary>

Crosses Bounded Context:
<YES | NO | UNKNOWN>

Crosses System Boundary:
<YES | NO | UNKNOWN>

Trust Boundary:
<boundary>

Data Ownership Boundary:
<boundary>
```

---

# 11. Data Semantics

```text id="x7q5mk"
Concept:
<concept>

Business Meaning:
<meaning>

Context:
<context>

Definition:
<definition>

Allowed Interpretation:
<interpretation>

Excluded Interpretation:
<interpretation>
```

The meaning must be defined in the language of the owning domain.

---

# 12. Data Vocabulary

```text id="q4m8vr"
Term:
<term>

Definition:
<definition>

Domain Context:
<context>

Owner:
<owner>

Equivalent Terms:
<terms>

Forbidden Ambiguity:
<ambiguity>
```

The same technical field name may represent different concepts in different contexts.

---

# 13. Data Element

```text id="v9x3mc"
Field:
<name>

Meaning:
<meaning>

Type:
<type>

Required:
<YES | NO | CONDITIONAL>

Allowed Values:
<values>

Source:
<source>

Owner:
<owner>

Sensitive:
<YES | NO | UNKNOWN>

Stability:
<STABLE | EVOLVING | UNKNOWN>
```

---

# 14. Identity

If the data contains identifiable business concepts:

```text id="n5q7xm"
Identifier:
<identifier>

Meaning:
<meaning>

Identity Scope:
<scope>

Owner:
<owner>

Stability:
<stable/unknown>

Uniqueness:
<scope>

Consumer Reliance:
<yes/no>
```

Do not assume technical database identifiers are valid business identifiers.

---

# 15. Relationships

```text id="m3v8qc"
Data Element:
<element>

Related Element:
<element>

Relationship:
<relationship>

Meaning:
<meaning>

Ownership:
<ownership>

Constraint:
<constraint>
```

Relationships must describe meaningful semantics, not merely foreign-key structure.

---

# 16. Optionality

```text id="x8q4mr"
Field:
<field>

Required:
<YES | NO | CONDITIONAL>

Condition:
<condition>

Meaning When Absent:
<meaning>

Meaning When Present:
<meaning>
```

Optionality is semantic, not merely a database `NULL` property.

---

# 17. Null and Missing Semantics

If applicable:

```text id="q6m9vk"
Field:
<field>

Missing Means:
<meaning>

Null Means:
<meaning>

Unknown Means:
<meaning>

Not Applicable Means:
<meaning>
```

Do not collapse distinct business meanings into a single technical null value.

---

# 18. Value Constraints

```text id="v5x3mq"
Field:
<field>

Constraint:
<constraint>

Type:
<structural/semantic>

Allowed Range:
<range>

Allowed Values:
<values>

Validation Authority:
<owner>
```

Avoid inventing limits that are not supported by requirements or domain rules.

---

# 19. Business Rules

```text id="n8q4xc"
Data:
<data>

Business Rule:
<rule>

Effect:
<effect>

Validation:
<validation>

Owner:
<owner>
```

Data constraints must not silently replace business rules.

---

# 20. Data Quality

Evaluate data quality when it materially affects consumers.

Dimensions may include:

* Accuracy.
* Completeness.
* Consistency.
* Timeliness.
* Validity.
* Uniqueness.
* Integrity.

```text id="m4x7vr"
Dimension:
<dimension>

Expectation:
<expectation>

Evidence:
<evidence>

Impact:
<impact>
```

Do not invent numerical quality targets.

---

# 21. Freshness

```text id="x9q3mk"
Data:
<data>

Freshness Expectation:
<expectation>

Meaning:
<meaning>

Maximum Known Delay:
<known/unknown>

Consumer Consequence:
<consequence>
```

Freshness must be explicit when consumers depend on how current the information is.

---

# 22. Temporal Semantics

```text id="q7m5xc"
Data:
<data>

Effective From:
<field>

Effective Until:
<field>

Observed At:
<field>

Recorded At:
<field>

Temporal Meaning:
<meaning>
```

Do not confuse:

* When something happened.
* When it became effective.
* When it was observed.
* When it was stored.

---

# 23. Historical Data

```text id="v3x8mq"
Historical Data:
<YES | NO | UNKNOWN>

Historical Meaning:
<meaning>

Retention:
<requirement>

Historical Authority:
<owner>

Consumer Need:
<need>
```

Historical availability must not be assumed merely because records happen to remain stored.

---

# 24. Derived Data

```text id="n6q4vr"
Derived Data:
<data>

Source Data:
<data>

Derivation:
<rule>

Authority:
<source>

Recalculation:
<behavior>

Staleness:
<behavior>
```

Consumers must understand whether they are receiving authoritative or derived information.

---

# 25. Aggregated Data

```text id="m9x5qc"
Aggregate:
<data>

Source:
<data>

Aggregation Rule:
<rule>

Aggregation Scope:
<scope>

Time Window:
<window>

Meaning:
<meaning>
```

An aggregate must not be interpreted as an authoritative source unless explicitly established.

---

# 26. Data Transformation

```text id="x4q7mk"
Source:
<data>

Target:
<data>

Transformation:
<transformation>

Reason:
<reason>

Semantic Impact:
<impact>

Owner:
<owner>
```

Transformations may change meaning and therefore may require explicit governance.

---

# 27. Data Mapping

```text id="q8m3vr"
Source Field:
<field>

Target Field:
<field>

Mapping:
<mapping>

Transformation:
<transformation>

Loss of Information:
<YES | NO | UNKNOWN>

Semantic Risk:
<risk>
```

Mapping must be reviewed when different bounded contexts use different models.

---

# 28. Data Completeness

```text id="v6x4mc"
Data Set:
<data>

Required Elements:
<elements>

Optional Elements:
<elements>

Completeness Expectation:
<expectation>

Incomplete Data Behavior:
<behavior>
```

---

# 29. Consistency

```text id="n7q5xr"
Data:
<data>

Consistency Model:
<STRONG | EVENTUAL | CONDITIONAL | UNKNOWN>

Meaning:
<meaning>

Consumer Expectation:
<expectation>

Business Consequence:
<consequence>
```

Do not assume that data exposed across boundaries is immediately consistent.

---

# 30. Concurrency

When multiple parties may modify or rely upon the same data:

```text id="m3x8vq"
Data:
<data>

Concurrent Modification:
<possible/impossible/unknown>

Conflict:
<conflict>

Authority:
<authority>

Resolution:
<resolution>
```

---

# 31. Mutability

```text id="x5q9mk"
Data:
<data>

Mutable:
<YES | NO | CONDITIONAL>

Mutation Authority:
<owner>

Mutation Rules:
<rules>

Consumer Expectation:
<expectation>
```

Read-only access does not imply immutable data.

---

# 32. Data Lifecycle

```text id="q4m7vc"
Lifecycle:
<lifecycle>

States:
<states>

Transitions:
<transitions>

Ownership:
<owner>

Retention:
<retention>

Deletion:
<deletion>
```

---

# 33. Data Retention

```text id="v8x3mr"
Data:
<data>

Retention Requirement:
<requirement>

Reason:
<reason>

Authority:
<authority>

Deletion Condition:
<condition>

Consumer Impact:
<impact>
```

Do not invent retention periods.

---

# 34. Deletion and Erasure

Where relevant:

```text id="n5q8xm"
Deletion:
<behavior>

Trigger:
<trigger>

Scope:
<scope>

Dependent Copies:
<copies>

Consumer Responsibility:
<responsibility>

Verification:
<verification>
```

Deletion semantics may have architectural and compliance consequences.

---

# 35. Data Synchronization

```text id="m7x4qc"
Source:
<data>

Consumer:
<consumer>

Synchronization:
<SYNCHRONOUS | ASYNCHRONOUS | BATCH | ON_DEMAND | UNKNOWN>

Trigger:
<trigger>

Freshness:
<expectation>

Failure:
<behavior>
```

Do not choose synchronization strategy before understanding business requirements.

---

# 36. Data Replication

```text id="x9q5vr"
Data:
<data>

Replication:
<YES | NO | UNKNOWN>

Purpose:
<purpose>

Replica Owner:
<owner>

Consistency:
<consistency>

Failure:
<behavior>

Retirement:
<condition>
```

A replica does not become an authoritative source merely because it contains the data.

---

# 37. Shared Data

```text id="q6m3vk"
Data:
<data>

Shared By:
<boundaries>

Shared Meaning:
<meaning>

Shared Ownership:
<YES | NO | UNKNOWN>

Synchronization:
<strategy>

Risk:
<risk>
```

Shared data should trigger explicit architectural analysis.

---

# 38. Data Access

```text id="v4x8mc"
Consumer:
<consumer>

Access Purpose:
<purpose>

Allowed Data:
<data>

Access Mode:
<read/write/derived/query/etc.>

Authorization:
<authorization>

Constraints:
<constraints>
```

---

# 39. Write Authority

```text id="n8q5xr"
Data:
<data>

Write Authority:
<owner>

Allowed Writers:
<writers>

Allowed Operations:
<operations>

Conflict Resolution:
<resolution>
```

A contract should make ownership explicit where multiple components interact with the same conceptual data.

---

# 40. Security and Privacy

```text id="m5x7qc"
Data:
<data>

Classification:
<classification>

Sensitivity:
<level>

Privacy Requirement:
<requirement>

Allowed Consumers:
<consumers>

Protection:
<requirement>

Audit:
<requirement>

Security Contract:
<SECURITY-CONTRACT-ID>
```

Do not expose sensitive information simply because it is technically available.

---

# 41. Data Minimization

```text id="x3q9mv"
Consumer:
<consumer>

Requested Data:
<data>

Required Data:
<data>

Excluded Data:
<data>

Reason:
<reason>
```

Only data necessary for the consumer's legitimate purpose should cross the boundary.

---

# 42. Data Contract and API Contract

A Data Contract may support an API Contract.

```text id="q8m4xc"
API Contract:
<API-CONTRACT-ID>

Data Contract:
<DATA-CONTRACT-ID>

Relationship:
<relationship>

Shared Semantics:
<semantics>

Differences:
<differences>
```

The API defines interaction behavior.

The Data Contract defines the meaning and expectations of the data exchanged.

---

# 43. Data Contract and Event Contract

```text id="v7x3mr"
Event Contract:
<EVENT-CONTRACT-ID>

Data Contract:
<DATA-CONTRACT-ID>

Relationship:
<relationship>

Shared Data:
<data>

Event-Specific Semantics:
<semantics>
```

An event payload may implement or reference a Data Contract, but an Event Contract and Data Contract remain conceptually distinct.

---

# 44. Data Contract and Domain Model

```text id="n4q8vk"
Domain Concept:
<concept>

Data Representation:
<data>

Relationship:
<relationship>

Transformation:
<transformation>

Semantic Ownership:
<owner>
```

Do not expose the domain model directly merely because it exists.

---

# 45. Persistence Model Separation

```text id="m6x3qc"
Persistence Concept:
<concept>

Contract Concept:
<concept>

Differences:
<differences>

Transformation:
<transformation>

Reason:
<reason>
```

Persistence structures may be optimized for storage while contracts are optimized for stable communication and meaning.

---

# 46. Database Schema Separation

A database schema is an implementation artifact unless the database itself is the explicit architectural boundary.

```text id="x8q5mr"
Database Schema:
<schema>

Data Contract:
<contract>

Shared Boundary:
<yes/no>

Differences:
<differences>

Migration Impact:
<impact>
```

Never assume:

```text
table = contract
column = business concept
foreign key = domain relationship
database = bounded context
```

---

# 47. External Data

For data obtained from external systems:

```text id="q5m9vk"
External Provider:
<provider>

Data:
<data>

Provider Definition:
<definition>

Local Definition:
<definition>

Mapping:
<mapping>

Authority:
<authority>

Dependency:
<dependency>
```

External definitions must not be silently adopted as local domain semantics.

---

# 48. Legacy Data

For existing systems:

```text id="v3x7mc"
Legacy Data:
<data>

Documented Meaning:
<meaning>

Observed Meaning:
<meaning>

Actual Usage:
<usage>

Known Consumers:
<consumers>

Target Meaning:
<meaning>

Migration Risk:
<risk>
```

Observed behavior may reveal an effective contract even when documentation is incomplete.

---

# 49. Data Migration

```text id="n7q4xr"
Current Data:
<data>

Target Data:
<data>

Transformation:
<transformation>

Migration Strategy:
<strategy>

Compatibility:
<compatibility>

Validation:
<validation>

Rollback:
<rollback>
```

Migration details should remain at the appropriate lifecycle level.

---

# 50. Data Compatibility

Compatibility must consider:

* Structural compatibility.
* Semantic compatibility.
* Behavioral compatibility.
* Temporal compatibility.
* Security compatibility.

```text id="m4x8vq"
Change:
<change>

Compatibility Type:
<type>

Breaking:
<YES | NO | UNKNOWN>

Affected Consumers:
<consumers>

Mitigation:
<mitigation>
```

---

# 51. Data Evolution

```text id="x6q3mk"
Current Version:
<version>

Proposed Change:
<change>

Reason:
<reason>

Affected Consumers:
<consumers>

Compatibility:
<compatibility>

Migration:
<migration>

Decision:
<ADR-ID>
```

---

# 52. Data Deprecation

```text id="q9m5xc"
Data:
<data>

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
```

---

# 53. Data Contract Risks

| ID            | Risk     | Data     | Impact     | Severity     | Mitigation     |
| ------------- | -------- | -------- | ---------- | ------------ | -------------- |
| RISK-DATA-001 | `<risk>` | `<data>` | `<impact>` | `<severity>` | `<mitigation>` |

Typical risks:

* Ambiguous semantics.
* Multiple authorities.
* Hidden consumers.
* Sensitive data exposure.
* Stale replicas.
* Inconsistent definitions.
* Uncontrolled schema changes.
* Legacy dependencies.
* Excessive data sharing.
* Unclear deletion behavior.
* Semantic drift.

---

# 54. Data Contract Unknowns

| ID           | Unknown     | Data     | Why It Matters | Impact     | Resolution |
| ------------ | ----------- | -------- | -------------- | ---------- | ---------- |
| UNK-DATA-001 | `<unknown>` | `<data>` | `<reason>`     | `<impact>` | `<method>` |

Unknowns involving ownership, authority, security, semantics, compatibility, or critical consumers may block progression.

---

# 55. Data Contract Decisions

```text id="v8x4mr"
Decision:
<decision>

Context:
<context>

Options:
<options>

Selected:
<option>

Rationale:
<rationale>

Consequences:
<consequences>

ADR:
<ADR-ID>
```

Typical decisions include:

* Data ownership.
* Authority.
* Shared data.
* Replication.
* Transformation.
* Synchronization.
* Retention.
* Privacy.
* Compatibility.
* Migration.

---

# 56. Data Validation Scenarios

```text id="n5q7xc"
Scenario:
<scenario>

Consumer:
<consumer>

Input:
<input>

Expected Data:
<data>

Business Meaning:
<meaning>

Consistency:
<expectation>

Freshness:
<expectation>

Security:
<expectation>

Result:
<PASSED | FAILED | PARTIAL | UNKNOWN>
```

---

# 57. Data Contract Verification

Possible verification mechanisms include:

* Schema validation.
* Contract tests.
* Integration tests.
* Data quality checks.
* Domain scenario tests.
* Migration validation.
* Security/privacy testing.
* Compatibility tests.
* Consumer verification.

```text id="m3x9vk"
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

# 58. Data Contract Traceability

```text id="x7q4mr"
Product Requirement
      ↓
Domain Concept / Rule
      ↓
Architecture Boundary
      ↓
Data Ownership
      ↓
Data Contract
      ↓
API / Event / Data Exchange
      ↓
Specification
      ↓
Implementation
      ↓
Verification
```

Relevant relationships must be explicit.

---

# 59. Traceability Record

```text id="q4m8xc"
Data Contract:
<contract>

Source:
<artifact>

Relationship:
<DERIVES_FROM | REFINES | REALIZES | CONSTRAINS | SPECIFIES | VERIFIES>

Evidence:
<evidence>

Status:
<VALID | INFERRED | MISSING | STALE | CONFLICTING | SUPERSEDED>
```

---

# 60. Existing System Assessment

For existing systems evaluate:

```text id="v6x3mq"
Documented Contract:
<contract>

Observed Contract:
<behavior>

Actual Consumers:
<consumers>

Actual Authority:
<authority>

Undocumented Dependencies:
<dependencies>

Target Contract:
<target>

Gap:
<gap>
```

The observed contract may be stronger evidence than historical documentation.

---

# 61. System Evolution Assessment

For system evolution:

```text id="n8q5vr"
Current Data Contract:
<contract>

Target Data Contract:
<contract>

Changed Semantics:
<changes>

Affected Consumers:
<consumers>

Migration Boundary:
<boundary>

Transition Strategy:
<strategy>

Retirement:
<condition>
```

---

# 62. Data Contract Review

### Semantics

* [ ] Data meaning is explicit.
* [ ] Domain vocabulary is clear.
* [ ] Ambiguous terms are resolved.
* [ ] Semantic ownership is known.

### Ownership

* [ ] Authoritative source is identified.
* [ ] Write authority is understood.
* [ ] Storage ownership is distinguished from semantic ownership.
* [ ] Derived data is identified.

### Structure

* [ ] Important data elements are defined.
* [ ] Optionality is explicit.
* [ ] Null/missing semantics are understood.
* [ ] Relationships are meaningful.
* [ ] Business constraints are identified.

### Quality

* [ ] Important quality expectations are understood.
* [ ] Freshness is addressed where relevant.
* [ ] Consistency is addressed where relevant.
* [ ] Historical semantics are addressed where relevant.

### Security

* [ ] Sensitive data is identified.
* [ ] Privacy requirements are understood.
* [ ] Allowed consumers are known.
* [ ] Data minimization has been considered.

### Evolution

* [ ] Compatibility is assessed.
* [ ] Semantic evolution is considered.
* [ ] Deprecation is governed.
* [ ] Migration is considered where required.

### Verification

* [ ] Validation scenarios exist.
* [ ] Verification mechanisms exist.
* [ ] Traceability exists.

---

# 63. Data Contract Status

```text id="m7x4qc"
Contract:
<contract>

Status:
<status>

Semantic Completeness:
<HIGH | MEDIUM | LOW>

Ownership Clarity:
<HIGH | MEDIUM | LOW>

Data Quality Understanding:
<HIGH | MEDIUM | LOW>

Security:
<CLEAR | PARTIAL | UNKNOWN>

Compatibility:
<CLEAR | PARTIAL | UNKNOWN>

Verification:
<READY | PARTIAL | NOT_READY>

Blocking Issues:
<issues>

Overall:
<READY | READY_WITH_RISKS | INCOMPLETE | BLOCKED>
```

---

# 64. Compact Data Contract

```text id="x4q9mv"
Data Contract:
<name>

Provider:
<provider>

Consumers:
<consumers>

Semantic Owner:
<owner>

Authoritative Source:
<source>

Meaning:
<meaning>

Core Data:
<data>

Constraints:
<constraints>

Consistency:
<consistency>

Freshness:
<freshness>

Security:
<security>

Evolution:
<strategy>

Verification:
<strategy>

Status:
<status>
```

---

# 65. Agent Instructions

When defining a Data Contract:

1. Start from established product and domain semantics.
2. Identify the architectural boundary.
3. Identify the provider and consumers.
4. Establish semantic ownership.
5. Establish authoritative ownership where relevant.
6. Define the meaning of the data.
7. Define important data elements.
8. Distinguish required, optional, missing, null, and unknown semantics.
9. Identify business constraints.
10. Evaluate data quality where relevant.
11. Evaluate freshness and temporal semantics where relevant.
12. Identify authoritative, derived, and replicated data.
13. Evaluate consistency expectations.
14. Identify write authority.
15. Evaluate synchronization and replication only where relevant.
16. Identify sensitive and restricted information.
17. Apply data minimization.
18. Define evolution and compatibility expectations.
19. Consider undocumented dependencies in existing systems.
20. Define migration expectations when the system is evolving.
21. Define verification scenarios.
22. Never treat a database schema as the domain model.
23. Never treat a persistence model as a contract without explicit justification.
24. Never invent data ownership.
25. Never invent quality targets.
26. Never expose data merely because it exists internally.
27. Never assume replicas are authoritative.
28. Never collapse distinct semantic states into technical nullability.
29. Revisit Domain Discovery when data meaning is ambiguous.
30. Revisit Architecture when data ownership or sharing creates a significant architectural boundary.
31. Keep physical schema and technology-specific representation in Specifications or Infrastructure unless already decided.

---

# 66. Anti-Patterns

## Database Schema Equals Data Contract

Treating tables and columns as the complete semantic contract.

## Persistence Model Equals Domain Model

Exposing storage structures directly as business concepts.

## Shared Database Equals Shared Ownership

Assuming physical access means semantic ownership.

## Data Dump

Exposing complete internal entities or records unnecessarily.

## Consumer-Owned Semantics

Allowing each consumer to redefine shared data meaning.

## Source-of-Truth Ambiguity

Allowing multiple authorities without explicit conflict resolution.

## Null Semantics Collapse

Using one technical representation for several distinct business meanings.

## Replication Equals Authority

Treating a replica as authoritative.

## Schema-Only Contract

Ignoring meaning, ownership, quality, security, and evolution.

## Premature Normalization

Designing physical data structures before understanding the contract.

## Technology-First Data Design

Allowing a database technology to determine the conceptual data model.

## Shared Data by Convenience

Sharing data because it is easier than defining an explicit boundary.

## Unbounded Data Exposure

Publishing data because it is available rather than because it is required.

## Legacy Schema Worship

Treating historical storage structures as immutable target architecture.

## Unsupported Precision

Inventing freshness, retention, quality, or consistency guarantees.

## Contract Duplication

Defining contradictory data semantics in multiple contracts.

## Specification Prematurity

Choosing serialization, database, storage, or query technology before the contract is sufficiently understood.

---

# 67. Safe Progression Question

Before moving this Data Contract into detailed specification:

> **Is the meaning, ownership, authority, structure, constraints, quality, security, consistency, evolution, and verification of the data sufficiently understood across the architectural boundary without depending on an internal persistence implementation?**

If **yes**, proceed to Data Specification.

If **no**, determine whether the missing information belongs to:

```text id="6v2m9x"
Domain Understanding
      ↓
Architecture
      ↓
Data Ownership
      ↓
Data Contract
      ↓
Data Specification
      ↓
Persistence / Infrastructure
```

Do not use a database schema to resolve unresolved domain semantics.

---

# 68. Final Principle

> **A Data Contract makes the meaning and expectations of shared data explicit while protecting consumers from the provider's internal persistence model.**

A strong Data Contract preserves:

```text
Meaning
Ownership
Authority
Structure
Constraints
Quality
Security
Consistency
Evolution
Verification
```

while remaining independent of:

* Database vendor.
* ORM.
* Storage engine.
* Table layout.
* Programming language.
* Framework.
* Serialization implementation.

The contract describes what the data means and what consumers may rely upon—not how the provider happens to store it.
