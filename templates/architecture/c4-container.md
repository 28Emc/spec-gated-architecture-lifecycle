# C4 Container Architecture

## 1. Document Metadata

| Field                  | Value                      |
| ---------------------- | -------------------------- |
| Document Type          | C4 Container Architecture  |
| Architecture Level     | C4 Level 2                 |
| Lifecycle Phase        | Architecture               |
| Status                 | `DRAFT`                    |
| Version                | `0.1`                      |
| Owner                  | `<owner>`                  |
| Created                | `<date>`                   |
| Last Updated           | `<date>`                   |
| Architecture Context   | `<architecture-context>`   |
| C4 System Context      | `<c4-system-context>`      |
| Domain Boundary Review | `<domain-boundary-review>` |
| Context Map            | `<context-map>`            |

---

# 2. Purpose

This document defines the **C4 Level 2 Container Architecture** of the system.

It translates the established System Context into a high-level internal architecture by identifying the major **containers** required to fulfill system responsibilities.

The Container Architecture establishes:

* Major internal responsibilities
* Container boundaries
* Communication relationships
* Data ownership
* Integration responsibilities
* Runtime responsibilities
* Quality-attribute implications
* Security boundaries
* Failure boundaries
* Architectural dependencies
* Container-level risks
* Container-level decision candidates

It prepares the project for Component Architecture where detailed internal structures are justified.

---

# 3. Core Principle

> **A container is an independently meaningful architectural unit that represents a major responsibility or runtime boundary; it is not automatically a microservice, database, repository, module, or deployment unit.**

The C4 definition of a container is broader than a specific technology.

A container may represent, depending on the architecture:

* An application
* A backend application
* A frontend application
* A worker
* A scheduled process
* A message consumer
* A server-side application
* A data store
* Another independently meaningful runtime or storage unit

The representation must reflect the actual architecture.

---

# 4. C4 Level 2 Scope

The Container Architecture sits between:

```text id="2qf7kn"
C4 Level 1
System Context
      ↓
      ↓
C4 Level 2
Container Architecture
      ↓
      ↓
C4 Level 3
Component Architecture
```

Level 2 should explain:

> **What are the major internal architectural units of the system, what responsibility does each have, and how do they interact?**

It should not attempt to explain:

* Classes
* Methods
* Internal algorithms
* Framework internals
* Detailed API schemas
* Detailed database schemas
* Deployment infrastructure
* Source-code structure

unless explicitly required to explain a container boundary.

---

# 5. Entry Conditions

Container Architecture should begin only when:

* System Context is sufficiently stable.
* System boundary is understood.
* Major actors are known.
* External systems are known.
* Domain boundaries have been reviewed.
* Major architectural drivers are known.
* Significant quality attributes are understood.
* Important constraints are explicit.
* Major architecture risks are visible.

Expected inputs:

* Architecture Context
* C4 System Context
* Product Discovery Summary
* Domain Boundary Review
* Bounded Contexts
* Domain Model
* Context Map
* Domain Events
* Quality Attributes
* Requirements
* Constraints
* Architecture decisions already accepted
* Existing architecture evidence where applicable

---

# 6. Container Architecture Objectives

The Container Architecture should establish:

1. Major internal responsibilities.
2. Container boundaries.
3. Ownership of responsibilities.
4. Relationships between containers.
5. External dependencies.
6. Data ownership.
7. Communication characteristics.
8. Security boundaries.
9. Failure boundaries.
10. Quality-attribute implications.
11. Architectural coupling.
12. Major container-level risks.
13. Container-level decision candidates.
14. Appropriate Component Architecture scope.

---

# 7. Container Architecture Scope

```text id="h4x9mw"
System:
<system>

Container Architecture Scope:
<scope>

Included:
- <container responsibility>

Excluded:
- <excluded responsibility>

Current State:
<current state>

Target State:
<target state>

Transition State:
<transition state>
```

Container scope must remain consistent with the System Context.

---

# 8. Container Definition

For this lifecycle, use the following conceptual definition:

> A container is a major architectural unit that encapsulates a meaningful responsibility, runtime behavior, or data responsibility within the system boundary.

A container should exist because it provides a meaningful architectural boundary.

It should not exist merely because:

* A framework encourages it.
* A team uses it.
* A repository exists.
* A database table exists.
* A class group exists.
* A deployment tool can create it.

---

# 9. Container Classification

Classify containers where useful.

Possible classifications:

* `APPLICATION`
* `WEB_APPLICATION`
* `BACKEND_APPLICATION`
* `WORKER`
* `PROCESSOR`
* `SCHEDULED_PROCESS`
* `MESSAGE_CONSUMER`
* `DATA_STORE`
* `CACHE`
* `SEARCH`
* `OTHER`
* `UNKNOWN`

Classification is descriptive, not prescriptive.

---

# 10. Container Catalog

| ID      | Container     | Type     | Primary Responsibility | Owner     | Status     |
| ------- | ------------- | -------- | ---------------------- | --------- | ---------- |
| CON-001 | `<container>` | `<type>` | `<responsibility>`     | `<owner>` | `<status>` |

Recommended statuses:

* `IDENTIFIED`
* `PROPOSED`
* `UNDER_REVIEW`
* `ACCEPTED`
* `ACTIVE`
* `DEPRECATED`
* `SUPERSEDED`
* `UNKNOWN`

---

# 11. Container Definition Record

For each container:

```text id="4c7jzv"
Container ID:
<id>

Name:
<name>

Type:
<type>

Purpose:
<purpose>

Primary Responsibility:
<responsibility>

Domain Responsibilities:
<responsibilities>

Owned Data:
<data>

Consumed Data:
<data>

Provided Capabilities:
<capabilities>

External Dependencies:
<dependencies>

Internal Dependencies:
<dependencies>

Runtime Characteristics:
<characteristics>

Security Boundary:
<boundary>

Failure Boundary:
<boundary>

Status:
<status>

Confidence:
<HIGH | MEDIUM | LOW>
```

---

# 12. Container Responsibility

Each container should have a clear responsibility.

```text id="7p1x4m"
Container:
<name>

Responsible For:
<responsibility>

Not Responsible For:
<excluded responsibility>

Domain Basis:
<domain evidence>

Architectural Basis:
<architectural evidence>
```

The `Not Responsible For` field is important because explicit responsibility boundaries reduce accidental coupling.

---

# 13. Container Boundary Rationale

Every significant container boundary should have a reason.

Possible drivers:

* Domain responsibility
* Data ownership
* Change isolation
* Security isolation
* Failure isolation
* Scaling requirement
* Availability requirement
* Integration isolation
* Operational independence
* Regulatory boundary
* Organizational constraint
* Migration boundary
* Existing-system constraint

```text id="3j8qaw"
Container Boundary:
<boundary>

Primary Driver:
<driver>

Secondary Drivers:
<drivers>

Domain Evidence:
<evidence>

Quality Attribute Evidence:
<evidence>

Constraint:
<constraint>

Trade-off:
<trade-off>

Confidence:
<confidence>
```

---

# 14. Domain-to-Container Mapping

Map domain responsibilities to architectural containers.

| Domain Element      | Responsibility     | Container     | Mapping          | Confidence     |
| ------------------- | ------------------ | ------------- | ---------------- | -------------- |
| `<bounded context>` | `<responsibility>` | `<container>` | `<relationship>` | `<confidence>` |

Possible mappings:

* `PRIMARY_OWNER`
* `PARTIAL_OWNER`
* `SUPPORTING`
* `ORCHESTRATES`
* `ADAPTER`
* `READ_MODEL`
* `UNKNOWN`

A bounded context may map to:

* One container
* Multiple containers
* Part of a container

There is no mandatory one-to-one relationship.

---

# 15. Bounded Context vs Container

The agent must explicitly evaluate the relationship.

```text id="n2r6cz"
Bounded Context:
<context>

Container:
<container>

Relationship:
<relationship>

Reason:
<reason>

Semantic Integrity Preserved:
<YES | PARTIAL | NO>

Architecture Implication:
<implication>
```

Important rule:

> **Bounded Context ≠ Container**

A bounded context protects a domain model.

A container represents an architectural/runtime boundary.

They may align, but the alignment requires justification.

---

# 16. Container Relationships

For every significant container relationship:

```text id="8c5m1y"
Source:
<container>

Target:
<container>

Purpose:
<purpose>

Direction:
<INBOUND | OUTBOUND | BIDIRECTIONAL>

Interaction Type:
<SYNCHRONOUS | ASYNCHRONOUS | BATCH | INTERNAL | UNKNOWN>

Information:
<information>

Criticality:
<criticality>

Consistency Requirement:
<requirement>

Failure Impact:
<impact>
```

The relationship should describe why the interaction exists.

---

# 17. Container Communication

Communication mechanisms may be recorded only when known or explicitly decided.

Possible categories:

* Request/response
* Event
* Command
* Query
* Stream
* Batch
* File
* Shared data access
* Internal invocation
* Unknown

Do not select:

* REST
* GraphQL
* gRPC
* Kafka
* AMQP
* Specific brokers

unless supported by a decision or explicit constraint.

---

# 18. Communication Decision Boundary

When communication style is architecturally significant:

```text id="8n2jkp"
Interaction:
<interaction>

Problem:
<problem>

Options:
- <option>

Drivers:
<drivers>

Trade-offs:
<trade-offs>

Recommendation:
<recommendation>

Decision:
<decision or OPEN>

ADR:
<ADR if available>
```

Communication style should be treated as an architecture decision when it materially affects:

* Coupling
* Consistency
* Reliability
* Scalability
* Failure behavior
* Operational complexity

---

# 19. Container Data Ownership

For each important data responsibility:

```text id="7f3qvm"
Data:
<data>

Authoritative Container:
<container>

Reason:
<reason>

Consumers:
<containers>

Modification Authority:
<authority>

Consistency Requirement:
<requirement>

Lifecycle:
<lifecycle>

Sensitivity:
<sensitivity>
```

Data ownership must align with semantic ownership unless a deliberate architecture decision establishes another model.

---

# 20. Data Store Containers

If a data store is represented as a C4 container, document its role.

```text id="1r8ycv"
Data Store:
<name>

Purpose:
<purpose>

Authoritative For:
<data>

Consumed By:
<containers>

Write Owners:
<owners>

Read Consumers:
<consumers>

Consistency:
<requirement>

Lifecycle:
<lifecycle>

Security Sensitivity:
<level>
```

Do not infer database technology from the existence of a data store container.

For example:

```text
Customer Data Store
```

does not imply:

```text
PostgreSQL
```

unless explicitly decided.

---

# 21. Shared Data Evaluation

Shared data access is an important architecture concern.

For each shared data relationship:

```text id="0t4kxa"
Data:
<data>

Consumers:
<containers>

Shared Access:
<description>

Semantic Ownership:
<owner>

Consistency Risk:
<risk>

Change Coupling:
<impact>

Alternative:
<alternative>

Decision:
<decision>
```

Shared storage should not be used merely for convenience.

---

# 22. Container API Responsibilities

At this level, define capabilities rather than endpoint specifications.

```text id="w8h2sd"
Container:
<container>

Provided Capability:
<capability>

Consumers:
<consumers>

Business Purpose:
<purpose>

Contract Required:
<yes/no/unknown>

Contract Type:
<API/EVENT/DATA/OTHER/UNKNOWN>
```

Detailed contracts belong to the Contracts phase.

---

# 23. Container Integration Responsibilities

Identify which containers own external integrations.

| Container     | External System | Responsibility     | Integration Role |
| ------------- | --------------- | ------------------ | ---------------- |
| `<container>` | `<system>`      | `<responsibility>` | `<role>`         |

Possible roles:

* Adapter
* Gateway
* Orchestrator
* Consumer
* Producer
* Translator
* Synchronizer
* Validator
* Unknown

The role must be justified.

---

# 24. Anti-Corruption Layer Candidates

When domain models differ across boundaries, identify potential translation boundaries.

```text id="j7c3nf"
Source Context:
<context>

Target Context:
<context>

Semantic Difference:
<difference>

Translation Required:
<yes/no/unknown>

Potential Boundary:
<container>

Reason:
<reason>

Decision:
<decision>
```

An Anti-Corruption Layer should not be introduced merely because two systems communicate.

It is justified when semantic protection is needed.

---

# 25. Domain Event to Container Mapping

Map significant domain events to architecture only when useful.

```text id="m4y8qs"
Domain Event:
<event>

Origin Context:
<context>

Origin Container:
<container>

Potential Consumer:
<container>

Business Reaction:
<reaction>

Integration Required:
<yes/no/unknown>

Architectural Representation:
<internal/external/unknown>
```

Do not assume that every domain event must become an integration event.

---

# 26. Container Security Boundaries

Identify security-relevant container boundaries.

| Boundary     | Trust Difference | Protected Asset | Security Concern | Priority     |
| ------------ | ---------------- | --------------- | ---------------- | ------------ |
| `<boundary>` | `<difference>`   | `<asset>`       | `<concern>`      | `<priority>` |

Consider:

* Public exposure
* Privileged operations
* Sensitive data
* External integration
* Administrative operations
* Tenant isolation
* Organization boundaries
* Untrusted input

Do not define detailed security implementation here unless already decided.

---

# 27. Container Authentication and Authorization Responsibility

Identify responsibility without prescribing technology.

```text id="v6s2kd"
Concern:
<authentication/authorization>

Responsible Container:
<container>

Actors:
<actors>

Protected Resource:
<resource>

Authority:
<authority>

Delegation:
<delegation>

Architectural Decision:
<decision>
```

Authentication and authorization responsibilities should not be duplicated across containers without justification.

---

# 28. Container Failure Boundaries

A container boundary may also represent a failure boundary.

For each significant container:

```text id="6q1v9x"
Container:
<container>

Failure Modes:
<failure modes>

Dependent Containers:
<dependencies>

Failure Propagation:
<propagation>

Business Impact:
<impact>

Isolation Expectation:
<expectation>

Recovery Responsibility:
<responsibility>
```

Failure isolation is an architectural concern, not merely an operational concern.

---

# 29. Dependency Graph

Represent major container dependencies.

```text id="g8p2zr"
Container A
    │
    ├── depends on ──> Container B
    │
    └── depends on ──> External System

Container B
    │
    └── depends on ──> Data Store
```

The dependency graph should expose:

* Strong coupling
* Circular dependencies
* Centralized dependencies
* Shared data dependencies
* External dependency concentration
* Potential bottlenecks

---

# 30. Dependency Direction

For every significant dependency:

```text id="3x5v9m"
Source:
<container>

Target:
<container>

Why Source Depends On Target:
<reason>

Dependency Type:
<domain/application/data/integration/operational>

Direction Justification:
<reason>

Change Coupling:
<impact>
```

Dependency direction should preserve intended ownership and minimize unnecessary coupling.

---

# 31. Circular Dependency Analysis

Identify cycles.

```text id="2k9m1c"
Cycle:
<A → B → C → A>

Reason:
<reason>

Business Justification:
<reason>

Architectural Risk:
<risk>

Resolution Options:
- <option>

Decision:
<decision>
```

Circular dependencies should be explicitly justified or removed.

---

# 32. Coupling Analysis

Evaluate coupling between containers.

| Source        | Target        | Coupling Type | Strength     | Risk     | Mitigation     |
| ------------- | ------------- | ------------- | ------------ | -------- | -------------- |
| `<container>` | `<container>` | `<type>`      | `<strength>` | `<risk>` | `<mitigation>` |

Possible coupling types:

* Semantic
* Data
* Temporal
* Runtime
* Deployment
* Security
* Contract
* Operational

---

# 33. Change Coupling

Determine which containers tend to change together.

```text id="e4r8wy"
Containers:
<A, B>

Change Relationship:
<relationship>

Reason:
<reason>

Evidence:
<evidence>

Architectural Concern:
<concern>
```

High change coupling may indicate:

* Wrong boundary
* Shared responsibility
* Shared contract
* Shared data ownership
* Intentional coordination

It should not automatically trigger container merging.

---

# 34. Runtime Coupling

Identify dependencies that require simultaneous availability or synchronous execution.

| Relationship     | Runtime Coupling | Failure Sensitivity | Architectural Concern |
| ---------------- | ---------------- | ------------------- | --------------------- |
| `<relationship>` | `<level>`        | `<level>`           | `<concern>`           |

Runtime coupling should be evaluated against quality attributes.

---

# 35. Deployment Coupling

Record whether containers must be deployed together.

```text id="x7q3fa"
Containers:
<containers>

Deployment Relationship:
<relationship>

Reason:
<reason>

Required:
<yes/no/unknown>

Architectural Impact:
<impact>
```

Deployment coupling is distinct from domain coupling.

---

# 36. Scaling Characteristics

Identify scaling drivers.

```text id="p5z8jk"
Container:
<container>

Scaling Driver:
<driver>

Load Characteristic:
<characteristic>

Independently Scalable:
<yes/no/unknown>

Reason:
<reason>

Quality Attribute:
<attribute>
```

Do not invent traffic numbers.

---

# 37. Performance Boundaries

Identify performance-sensitive container relationships.

```text id="s9f2wl"
Interaction:
<interaction>

Performance Concern:
<concern>

Affected Containers:
<containers>

Known Requirement:
<requirement>

Unknown:
<unknown>

Architectural Consequence:
<consequence>
```

Performance requirements must come from evidence or explicit requirements.

---

# 38. Availability Boundaries

Identify important availability relationships.

```text id="c6v4ny"
Container:
<container>

Availability Requirement:
<requirement>

Dependency:
<dependency>

Failure Impact:
<impact>

Architectural Concern:
<concern>
```

Do not invent availability percentages.

---

# 39. Observability Responsibilities

At container level, identify observability responsibilities.

Potential concerns:

* Operational health
* Business process visibility
* Error visibility
* Dependency failures
* Security-relevant events
* Performance visibility
* Auditability

```text id="k4m8xv"
Container:
<container>

Observability Concern:
<concern>

Required Signal:
<METRIC | LOG | TRACE | AUDIT | EVENT | UNKNOWN>

Purpose:
<purpose>

Consumer:
<operator/system>

Criticality:
<criticality>
```

Detailed observability contracts may be defined later.

---

# 40. Configuration Responsibilities

Identify configuration ownership.

```text id="b7n3qp"
Configuration:
<configuration>

Owner:
<container/system>

Scope:
<scope>

Sensitivity:
<level>

Change Frequency:
<frequency>

Operational Impact:
<impact>
```

Do not prescribe a configuration technology.

---

# 41. Container Lifecycle

Document lifecycle states when container existence or responsibility changes over time.

```text id="t8v2mc"
Container:
<container>

Current:
<state>

Target:
<state>

Transition:
<state>

Lifecycle:
<ACTIVE | INTRODUCED | MIGRATING | DEPRECATED | RETIRED>
```

This is especially important for system evolution.

---

# 42. Existing Container Architecture

For existing systems:

```text id="r3k7wa"
Documented Container:
<description>

Actual Container:
<description>

Target Container:
<description>

Differences:
<differences>

Evidence:
<evidence>
```

The agent must distinguish:

* What documentation says.
* What implementation demonstrates.
* What architecture intends.

---

# 43. Container Migration

For architecture evolution:

```text id="m8q4zx"
Source Container:
<container>

Target Container:
<container>

Migration Strategy:
<strategy>

Preserved Behavior:
<behavior>

Changed Responsibility:
<responsibility>

Data Migration:
<known/unknown>

Contract Migration:
<known/unknown>

Compatibility Requirement:
<requirement>

Migration Risk:
<risk>
```

Do not define a migration strategy without understanding the current and target boundaries.

---

# 44. Container Architecture Alternatives

Where multiple container decompositions are viable:

```text id="q2v7kn"
Architecture Concern:
<concern>

Option A:
<decomposition>

Option B:
<decomposition>

Option C:
<decomposition>

Evaluation Criteria:
- Domain integrity
- Coupling
- Quality attributes
- Data ownership
- Operational complexity
- Change isolation
- Reversibility

Trade-offs:
<trade-offs>

Recommendation:
<recommendation>

Decision:
<decision>
```

---

# 45. Container Granularity

Evaluate whether containers are too large or too small.

### Possible indicators of an overly large container

* Multiple unrelated responsibilities.
* Independent change boundaries.
* Conflicting quality requirements.
* Separate ownership.
* Strong internal coupling with weak conceptual cohesion.

### Possible indicators of excessive fragmentation

* High inter-container communication.
* Shared data everywhere.
* Distributed transactions.
* Strong synchronous coupling.
* Deployment complexity.
* Operational overhead without meaningful isolation.

No fixed number of containers is inherently correct.

---

# 46. Container Granularity Review

```text id="a9c4wy"
Container:
<container>

Cohesion:
<HIGH | MEDIUM | LOW>

Coupling:
<HIGH | MEDIUM | LOW>

Independent Change:
<HIGH | MEDIUM | LOW>

Operational Cost:
<LOW | MEDIUM | HIGH>

Boundary Justification:
<justification>

Granularity Assessment:
<APPROPRIATE | TOO_LARGE | TOO_SMALL | UNCERTAIN>
```

---

# 47. Distributed-System Complexity Assessment

If the proposed architecture introduces distribution, explicitly assess the resulting complexity.

Consider:

* Network failure
* Partial failure
* Latency
* Ordering
* Retry behavior
* Duplicate delivery
* Consistency
* Observability
* Deployment coordination
* Version compatibility
* Operational overhead
* Testing complexity

```text id="w5k2rs"
Distributed Interaction:
<interaction>

Added Complexity:
<complexity>

Required Benefit:
<benefit>

Evidence:
<evidence>

Decision:
<decision>
```

Distribution must be justified by meaningful architectural drivers.

---

# 48. Transaction and Consistency Boundaries

Identify important consistency boundaries.

```text id="d8x3mv"
Business Operation:
<operation>

Containers:
<containers>

Invariant:
<invariant>

Consistency Scope:
<scope>

Cross-Container:
<yes/no>

Consistency Model:
<known/unknown>

Failure Consequence:
<consequence>

Architectural Concern:
<concern>
```

Do not choose a consistency mechanism before understanding the business invariant.

---

# 49. Cross-Container Transactions

For each cross-container transaction-like behavior:

```text id="p7m4za"
Business Operation:
<operation>

Containers Involved:
<containers>

Invariant:
<invariant>

Atomicity Requirement:
<requirement>

Alternative:
<alternative>

Risk:
<risk>

Decision:
<decision>
```

The agent must not introduce distributed transactions merely to preserve a technical convenience.

---

# 50. Container-Level Business Invariants

Identify invariants that affect container boundaries.

| Invariant     | Owner     | Container     | Cross-Container | Risk     |
| ------------- | --------- | ------------- | --------------- | -------- |
| `<invariant>` | `<owner>` | `<container>` | `<yes/no>`      | `<risk>` |

If a core invariant crosses multiple containers, explicitly evaluate whether the container boundary is appropriate.

---

# 51. Architecture-to-Container Traceability

Recommended chain:

```text id="u6j9pf"
Product Requirement
       ↓
Domain Capability
       ↓
Bounded Context
       ↓
Domain Responsibility
       ↓
Architecture Responsibility
       ↓
Container
       ↓
Container Relationship
```

Possible relationships:

* `REALIZES`
* `IMPLEMENTS`
* `OWNS`
* `DEPENDS_ON`
* `EXPOSES`
* `CONSUMES`
* `PROTECTS`
* `CONSTRAINS`
* `SUPPORTS`

---

# 52. Container Traceability Register

| Source       | Target        | Relationship     | Evidence     | Status     |
| ------------ | ------------- | ---------------- | ------------ | ---------- |
| `<artifact>` | `<container>` | `<relationship>` | `<evidence>` | `<status>` |

Status:

* `VALID`
* `INFERRED`
* `MISSING`
* `STALE`
* `CONFLICTING`
* `SUPERSEDED`
* `UNKNOWN`

---

# 53. Container Validation Scenarios

Validate the decomposition through representative scenarios.

```text id="v9x4cr"
Scenario:
<scenario>

Actor:
<actor>

Business Goal:
<goal>

Containers Involved:
<containers>

Expected Flow:
<flow>

Critical Invariants:
<invariants>

Failure Case:
<failure>

Quality Attribute:
<attribute>

Result:
<PASSED | FAILED | PARTIAL | UNKNOWN>
```

Important scenarios should include, where relevant:

* Main business flows
* Alternative flows
* Failure scenarios
* External dependency failure
* Security-sensitive interactions
* High-load interactions
* Data consistency cases
* Recovery
* Migration

---

# 54. Container Architecture Fitness

| Dimension              | Status     | Confidence     | Findings     |
| ---------------------- | ---------- | -------------- | ------------ |
| Responsibility clarity | `<status>` | `<confidence>` | `<findings>` |
| Domain alignment       | `<status>` | `<confidence>` | `<findings>` |
| Boundary justification | `<status>` | `<confidence>` | `<findings>` |
| Coupling               | `<status>` | `<confidence>` | `<findings>` |
| Cohesion               | `<status>` | `<confidence>` | `<findings>` |
| Data ownership         | `<status>` | `<confidence>` | `<findings>` |
| Communication          | `<status>` | `<confidence>` | `<findings>` |
| Security boundaries    | `<status>` | `<confidence>` | `<findings>` |
| Failure isolation      | `<status>` | `<confidence>` | `<findings>` |
| Quality attributes     | `<status>` | `<confidence>` | `<findings>` |
| Operational complexity | `<status>` | `<confidence>` | `<findings>` |
| Traceability           | `<status>` | `<confidence>` | `<findings>` |

---

# 55. Container Architecture Risks

| ID           | Risk     | Affected Containers | Impact     | Likelihood     | Mitigation     |
| ------------ | -------- | ------------------- | ---------- | -------------- | -------------- |
| RISK-CON-001 | `<risk>` | `<containers>`      | `<impact>` | `<likelihood>` | `<mitigation>` |

Typical risks:

* Incorrect container boundary.
* Excessive coupling.
* Shared database.
* Distributed transaction requirement.
* Hidden invariant crossing boundaries.
* Synchronous dependency chain.
* Operational complexity.
* Premature distribution.
* Unclear ownership.
* Container duplication of domain responsibility.

---

# 56. Container Architecture Unknowns

| ID          | Unknown      | Why It Matters | Impact     | Blocking   | Resolution |
| ----------- | ------------ | -------------- | ---------- | ---------- | ---------- |
| UNK-CON-001 | `<question>` | `<reason>`     | `<impact>` | `<status>` | `<method>` |

Unknowns must remain visible until resolved or explicitly accepted.

---

# 57. Container Architecture Decisions

Only accepted architecture decisions should be recorded as decisions.

```text id="z3m7qa"
Decision ID:
<ADR-ID>

Decision:
<decision>

Context:
<context>

Drivers:
<drivers>

Consequences:
<consequences>

Affected Containers:
<containers>

Status:
<status>
```

Decision candidates remain separate.

---

# 58. Container Decision Candidates

| ID          | Decision Question | Driver     | Impact     | Reversibility | Status     |
| ----------- | ----------------- | ---------- | ---------- | ------------- | ---------- |
| DEC-CON-001 | `<question>`      | `<driver>` | `<impact>` | `<level>`     | `<status>` |

Possible decisions:

* Container boundary
* Communication style
* Data ownership
* Deployment independence
* Consistency model
* Failure isolation
* Integration ownership
* Security boundary

---

# 59. Container Architecture Diagram

The C4 Level 2 diagram should represent:

```text id="m7x2va"
                           ┌────────────────────┐
                           │      Actor         │
                           └─────────┬──────────┘
                                     │
                                     ▼
                  ┌────────────────────────────────┐
                  │        SYSTEM UNDER DESIGN     │
                  │                                │
                  │ ┌────────────┐  ┌────────────┐ │
                  │ │ Container  │  │ Container  │ │
                  │ │     A      │→ │     B      │ │
                  │ └────────────┘  └─────┬──────┘ │
                  │                       │        │
                  │                 ┌─────▼──────┐ │
                  │                 │ Data Store │ │
                  │                 └────────────┘ │
                  └────────────────────────────────┘
                                     │
                                     ▼
                           ┌────────────────────┐
                           │ External System    │
                           └────────────────────┘
```

The actual diagram must show:

* System boundary
* Containers
* External actors
* External systems
* Meaningful relationships

---

# 60. Container Diagram Rules

The diagram should not become a Component Diagram.

Do not include:

* Classes
* Controllers
* Repositories
* Framework modules
* Individual API endpoints
* Internal libraries
* Infrastructure resources unless they are explicitly represented as containers
* Deployment nodes

The diagram should remain understandable to someone who knows the domain but not the implementation.

---

# 61. Container Description Table

The diagram should be accompanied by a concise table.

| Container     | Type     | Responsibility     | Technology                | Notes     |
| ------------- | -------- | ------------------ | ------------------------- | --------- |
| `<container>` | `<type>` | `<responsibility>` | `<technology or UNKNOWN>` | `<notes>` |

Technology should be included only when:

* Already decided.
* Explicitly constrained.
* Necessary to understand a meaningful architecture trade-off.

Otherwise use:

`UNKNOWN`

or a technology-neutral description.

---

# 62. Architecture Technology Boundary

Technology selection must remain separate from container identification.

Example:

```text
Container:
Order Processing

Architecture Responsibility:
Process order lifecycle and enforce order invariants.

Technology:
UNKNOWN
```

Later:

```text
ADR:
ADR-XXX

Decision:
Use <technology> for Order Processing.

Reason:
<reason>
```

The architecture model should not fabricate technology choices.

---

# 63. Review Checklist

### Container Boundaries

* [ ] Each container has a meaningful responsibility.
* [ ] Each significant boundary has a rationale.
* [ ] Domain responsibilities are preserved.
* [ ] Containers are not created solely from technical structure.
* [ ] Container granularity is appropriate.

### Domain Alignment

* [ ] Bounded contexts have been evaluated against container boundaries.
* [ ] Core invariants remain within appropriate boundaries.
* [ ] Domain ownership is clear.
* [ ] Context relationships are preserved.

### Communication

* [ ] Significant relationships are explicit.
* [ ] Communication purpose is clear.
* [ ] Critical synchronous dependencies are known.
* [ ] Asynchronous behavior is identified where relevant.
* [ ] Protocol selection is not premature.

### Data

* [ ] Data ownership is explicit.
* [ ] Shared data is identified.
* [ ] Shared storage risks are understood.
* [ ] Consistency boundaries are known.

### Security

* [ ] Security-relevant container boundaries are identified.
* [ ] Protected assets are understood.
* [ ] Authentication/authorization responsibilities are not duplicated without reason.

### Reliability

* [ ] Failure boundaries are identified.
* [ ] Important dependency failures are understood.
* [ ] Failure propagation is considered.
* [ ] Recovery responsibilities are visible.

### Quality Attributes

* [ ] Important quality attributes influence architecture where appropriate.
* [ ] Scaling drivers are evidence-based.
* [ ] Performance concerns are explicit.
* [ ] Availability concerns are explicit.
* [ ] Operational complexity is considered.

### Existing Systems

* [ ] Documented architecture is distinguished from actual architecture.
* [ ] Target architecture is explicit.
* [ ] Migration boundaries are understood.

### Governance

* [ ] Risks are recorded.
* [ ] Unknowns are explicit.
* [ ] Decision candidates are separated from decisions.
* [ ] ADRs exist for consequential decisions.
* [ ] Traceability is established.

---

# 64. Gate Contribution

```text id="5x8n2p"
C4 Container Architecture Status:
<READY | READY_WITH_RISKS | INCOMPLETE | BLOCKED>

Container Responsibilities:
<CLEAR | PARTIAL | UNCLEAR>

Container Boundaries:
<JUSTIFIED | PARTIAL | UNCLEAR>

Domain Alignment:
<HIGH | MEDIUM | LOW>

Communication Understanding:
<HIGH | MEDIUM | LOW>

Data Ownership:
<HIGH | MEDIUM | LOW>

Security Boundaries:
<HIGH | MEDIUM | LOW>

Failure Boundaries:
<HIGH | MEDIUM | LOW>

Quality Attribute Alignment:
<HIGH | MEDIUM | LOW>

Operational Complexity:
<LOW | MEDIUM | HIGH | UNKNOWN>

Traceability:
<HEALTHY | DEGRADED | BROKEN>

Blocking Findings:
<findings>

Gate Recommendation:
<READY | READY_WITH_RISKS | NOT_READY>
```

Passing this gate means that the major internal architectural boundaries are sufficiently understood to justify deeper component-level analysis where needed.

It does not mean that every container must have a Component Diagram.

---

# 65. Compact Container Register

```text id="q6v9mc"
System:
<system>

Containers:
- <container>

Primary Responsibilities:
- <responsibility>

Major Relationships:
- <relationship>

Data Owners:
- <container>

Critical Dependencies:
- <dependency>

Security Boundaries:
- <boundary>

Failure Boundaries:
- <boundary>

Major Risks:
- <risk>

Open Decisions:
- <decision>

C4 Container Status:
<status>
```

---

# 66. Agent Instructions

When creating or reviewing Container Architecture:

1. Start from the approved System Context.
2. Identify major internal responsibilities.
3. Establish boundaries based on architectural drivers.
4. Preserve domain responsibilities.
5. Evaluate bounded context to container relationships explicitly.
6. Give each container a coherent responsibility.
7. Record what each container is not responsible for where useful.
8. Identify important container relationships.
9. Identify data ownership.
10. Identify important consistency boundaries.
11. Identify failure boundaries.
12. Identify security boundaries.
13. Identify quality-attribute implications.
14. Evaluate coupling and cohesion.
15. Evaluate whether distribution is justified.
16. Avoid creating containers solely because technologies exist.
17. Avoid mapping every bounded context directly to a microservice.
18. Avoid database-first decomposition.
19. Avoid team-first decomposition.
20. Avoid API-first decomposition.
21. Do not select technologies unless supported by evidence or explicit decisions.
22. Keep contracts at capability level; detailed contracts belong to the Contracts phase.
23. Record architecture decision candidates.
24. Escalate consequential choices into ADRs.
25. Validate the decomposition against representative scenarios.
26. Keep architecture proportional to project complexity and risk.
27. Return to Domain Discovery if container boundaries reveal unresolved semantic conflicts.
28. Proceed to Component Architecture only where component-level detail provides meaningful value.

Before progressing, ask:

> **Do the proposed containers represent coherent architectural responsibilities with justified boundaries, appropriate ownership, manageable coupling, understood communication and data relationships, and sufficient alignment with domain and quality requirements to justify deeper internal design?**

---

# 67. Anti-Patterns

## Microservice Projection

Assuming every container must be a microservice.

## Bounded Context = Container

Treating the DDD boundary as an automatic technical boundary.

## Database-First Decomposition

Creating containers around databases or tables.

## Repository-First Decomposition

Creating containers from source repositories.

## Team-First Decomposition

Creating architecture boundaries from organizational ownership.

## Endpoint-First Decomposition

Grouping containers around API endpoints.

## Framework-First Decomposition

Letting framework conventions determine architecture.

## Premature Distribution

Introducing network boundaries without a meaningful driver.

## Shared Database by Convenience

Allowing multiple containers to modify authoritative data without explicit reasoning.

## Distributed Transaction by Convenience

Spreading invariants across containers and then solving the resulting problem with technical transactions.

## Event Everything

Turning every internal operation into a distributed event.

## Synchronous Everything

Creating long chains of synchronous dependencies without evaluating failure and latency.

## Asynchronous Everything

Introducing asynchronous processing where immediate consistency or simple synchronous behavior is more appropriate.

## Container Explosion

Creating many small containers without meaningful independence.

## Monolith by Ambiguity

Keeping everything in one container because boundaries were never analyzed.

## Architecture by Diagram

Optimizing the visual diagram rather than the architectural model.

## Technology Leakage

Using framework, database, or cloud terminology as the primary boundary rationale.

## Hidden Coupling

Ignoring shared data, shared contracts, runtime dependency, or synchronized change.

## Unsupported Scalability Claims

Inventing traffic or scaling requirements.

## False Independence

Calling a container independent while it remains tightly coupled through data, runtime, deployment, or contracts.

---

# 68. Safe Progression Question

Before proceeding to Component Architecture:

> **Do the containers provide sufficiently coherent and evidence-based architectural boundaries, with understandable responsibilities, domain alignment, data ownership, communication, consistency, security, failure behavior, quality implications, and coupling, without introducing unnecessary distributed complexity?**

If:

* **Yes** → proceed to Component Architecture where justified.
* **Yes, with risks** → proceed while explicitly carrying the risks.
* **No, because a boundary is unclear** → revisit the container decomposition.
* **No, because a domain responsibility is unclear** → revisit Domain Discovery.
* **No, because the architecture introduces unjustified distribution** → reconsider the decomposition.
* **No, because an architectural decision is unresolved** → record and govern the decision before committing the boundary.

---

# 69. Final Principle

> **C4 Level 2 explains the major internal structure of the system without prematurely collapsing architecture into implementation details.**

The progression is:

```text
System Context
      ↓
What is the system and who interacts with it?
      ↓
Container Architecture
      ↓
What major architectural units make up the system?
      ↓
Component Architecture
      ↓
What meaningful internal components implement those responsibilities?
```

A good Container Architecture does not maximize the number of containers.

It identifies the **smallest set of meaningful architectural boundaries necessary to satisfy domain responsibilities, quality attributes, security requirements, integration needs, operational constraints, and evolution goals**.

The architecture should remain as simple as the problem allows—and no simpler.
