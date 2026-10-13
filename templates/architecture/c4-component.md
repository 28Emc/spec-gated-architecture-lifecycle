# C4 Component Architecture

## 1. Document Metadata

| Field                          | Value                     |
| ------------------------------ | ------------------------- |
| Document Type                  | C4 Component Architecture |
| Architecture Level             | C4 Level 3                |
| Lifecycle Phase                | Architecture              |
| Status                         | `DRAFT`                   |
| Version                        | `0.1`                     |
| Owner                          | `<owner>`                 |
| Created                        | `<date>`                  |
| Last Updated                   | `<date>`                  |
| Parent System                  | `<system>`                |
| Parent Container               | `<container>`             |
| C4 System Context              | `<c4-system-context>`     |
| C4 Container Architecture      | `<c4-container>`          |
| Related Domain Model           | `<domain-model>`          |
| Related Architecture Decisions | `<ADRs>`                  |

---

# 2. Purpose

This document defines the **C4 Level 3 Component Architecture** for a selected container.

Component Architecture explains the meaningful internal structural responsibilities of a container without descending into implementation-level details.

It identifies:

* Major internal components
* Component responsibilities
* Component boundaries
* Component relationships
* Domain responsibilities
* Data responsibilities
* Internal dependencies
* External dependencies
* Important architectural patterns
* Quality-attribute implications
* Security responsibilities
* Component-level risks
* Component-level decision candidates

Component Architecture exists to clarify meaningful internal structure.

It must not become a catalog of classes, files, methods, controllers, repositories, or framework constructs.

---

# 3. Core Principle

> **Component Architecture is selective elaboration, not mandatory decomposition.**

Not every container requires a Component Diagram.

Component-level architecture is justified when internal structure materially affects:

* Domain integrity
* Responsibility separation
* Security
* Data ownership
* Change isolation
* Testability
* Reliability
* Performance
* Integration
* Maintainability
* Complexity management
* Migration
* Architectural governance

If a container is sufficiently simple and its internal structure does not require architectural reasoning, Level 3 may be intentionally omitted.

---

# 4. When to Use Component Architecture

A container should be considered for Level 3 analysis when one or more conditions apply:

* The container contains multiple significant responsibilities.
* Multiple domain responsibilities coexist.
* Internal boundaries affect business invariants.
* Internal components have different quality requirements.
* Internal integration logic is significant.
* Security responsibilities are separated.
* Internal failure isolation matters.
* Multiple teams or ownership areas interact inside the container.
* The container has significant architectural complexity.
* A migration requires internal decomposition.
* A major architectural pattern must be explained.
* The container is likely to evolve independently in meaningful areas.
* Component boundaries influence important ADRs.

---

# 5. When Not to Use Component Architecture

Do not create a Component Architecture artifact merely because:

* The project uses C4.
* A container exists.
* A framework has modules.
* There are many source files.
* A repository contains many classes.
* Documentation completeness is desired.
* Every other container has a Component Diagram.

A simple container may remain at Level 2.

The absence of a Component Diagram is valid when the architecture does not require one.

---

# 6. Component Architecture Entry Conditions

Before creating this artifact:

* Container Architecture must be sufficiently stable.
* The selected container must have an identified reason for deeper analysis.
* The container responsibility must be understood.
* Important domain responsibilities must be known.
* Relevant invariants must be understood.
* Major quality drivers must be identified.
* Significant internal complexity must be evidenced.

Required inputs may include:

* C4 Container Architecture
* Domain Model
* Bounded Contexts
* Domain Processes
* Domain Events
* Business Rules
* Requirements
* Quality Attributes
* Architecture Decisions
* Contracts where already known
* Existing implementation evidence where applicable

---

# 7. Component Analysis Trigger

Every Component Architecture should document why Level 3 is required.

```text id="m6x2qa"
Container:
<container>

Reason for Component Analysis:
<reason>

Architectural Driver:
<driver>

Complexity:
<LOW | MEDIUM | HIGH>

Risk:
<LOW | MEDIUM | HIGH | CRITICAL>

Expected Benefit:
<benefit>

Decision:
<REQUIRED | OPTIONAL | NOT_REQUIRED>
```

If `NOT_REQUIRED`, the agent should not create unnecessary component detail.

---

# 8. Component Scope

```text id="v8r3nc"
Container:
<container>

Component Scope:
<scope>

Included Responsibilities:
- <responsibility>

Excluded Responsibilities:
- <responsibility>

Current State:
<state>

Target State:
<state>

Transition State:
<state>
```

The Component Architecture must remain inside the selected container boundary.

---

# 9. Component Definition

A component is:

> A meaningful internal architectural unit within a container that groups related responsibilities and provides a useful boundary for reasoning about behavior, dependencies, change, quality, or ownership.

A component is not necessarily:

* A class
* A package
* A module
* A framework module
* A library
* A controller
* A service class
* A repository
* A database table

Those may be implementation representations of a component, but they are not automatically architectural components.

---

# 10. Component Catalog

| ID      | Component     | Responsibility     | Domain Role | Status     |
| ------- | ------------- | ------------------ | ----------- | ---------- |
| CMP-001 | `<component>` | `<responsibility>` | `<role>`    | `<status>` |

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

# 11. Component Definition Record

```text id="q5n8xd"
Component ID:
<id>

Name:
<name>

Purpose:
<purpose>

Primary Responsibility:
<responsibility>

Domain Responsibility:
<domain responsibility>

Provided Capabilities:
<capabilities>

Consumed Capabilities:
<capabilities>

Owned State:
<state>

Dependencies:
<dependencies>

Security Responsibility:
<responsibility>

Quality Attributes:
<attributes>

Change Boundary:
<boundary>

Failure Boundary:
<boundary>

Status:
<status>

Confidence:
<HIGH | MEDIUM | LOW>
```

---

# 12. Component Responsibility

Each component must have a clear architectural responsibility.

```text id="j4p7vz"
Component:
<component>

Responsible For:
<responsibility>

Not Responsible For:
<excluded responsibility>

Reason for Boundary:
<reason>

Evidence:
<evidence>
```

Avoid components with vague responsibilities such as:

* "Handle everything"
* "Common logic"
* "Business services"
* "Utilities"
* "Miscellaneous"

unless their architectural purpose is explicitly justified.

---

# 13. Component Boundary Rationale

For each significant component boundary:

```text id="n7c2wa"
Boundary:
<boundary>

Driver:
<driver>

Domain Evidence:
<evidence>

Quality Attribute:
<attribute>

Change Isolation:
<impact>

Security Isolation:
<impact>

Data Responsibility:
<impact>

Trade-off:
<trade-off>

Confidence:
<confidence>
```

Potential drivers:

* Domain responsibility
* Business rule ownership
* Invariant protection
* Change isolation
* Security
* Performance
* Reliability
* Integration
* Testability
* Maintainability
* Migration

---

# 14. Domain-to-Component Mapping

Map important domain elements to components.

| Domain Element     | Responsibility     | Component     | Mapping     | Confidence     |
| ------------------ | ------------------ | ------------- | ----------- | -------------- |
| `<domain element>` | `<responsibility>` | `<component>` | `<mapping>` | `<confidence>` |

Possible mappings:

* `OWNER`
* `REALIZES`
* `ENFORCES`
* `ORCHESTRATES`
* `SUPPORTS`
* `TRANSLATES`
* `READS`
* `WRITES`
* `UNKNOWN`

The mapping should preserve domain semantics.

---

# 15. Aggregate Alignment

Evaluate component relationships with aggregate boundaries.

```text id="u3k9fm"
Aggregate:
<aggregate>

Component:
<component>

Responsibility:
<responsibility>

Invariant:
<invariant>

Boundary Alignment:
<ALIGNED | PARTIAL | CONFLICTING | UNKNOWN>

Reason:
<reason>
```

A component boundary should not accidentally split an invariant without explicit reasoning.

---

# 16. Domain Service Alignment

Where domain services exist:

```text id="c7m4yx"
Domain Service:
<service>

Component:
<component>

Responsibility:
<responsibility>

Reason:
<reason>

Domain Integrity Preserved:
<yes/no/unknown>
```

Do not create technical service components merely because domain services exist.

---

# 17. Domain Event Alignment

```text id="r8x5nb"
Domain Event:
<event>

Origin Component:
<component>

Affected Component:
<component>

Business Meaning:
<meaning>

Internal or External:
<INTERNAL | EXTERNAL | UNKNOWN>

Reason:
<reason>
```

Domain events remain domain concepts.

Their technical representation is addressed later through contracts and architecture decisions.

---

# 18. Component Relationships

For each meaningful relationship:

```text id="w4p8qc"
Source:
<component>

Target:
<component>

Purpose:
<purpose>

Interaction:
<interaction>

Direction:
<direction>

Data:
<data>

Coupling:
<coupling>

Criticality:
<criticality>
```

Relationships should explain architectural dependency.

---

# 19. Component Communication

Possible communication categories:

* Direct invocation
* Query
* Command
* Event
* Callback
* Internal workflow
* Shared state
* External integration
* Unknown

Do not prescribe implementation mechanisms unless already decided.

---

# 20. Component Dependency Graph

Represent meaningful dependencies:

```text id="a6m2vx"
Component A
      │
      ├──> Component B
      │
      └──> Component C

Component B
      │
      └──> Component D
```

Use the dependency graph to identify:

* Cycles
* Central components
* Excessive fan-out
* Excessive fan-in
* Hidden coupling
* Responsibility leakage

---

# 21. Dependency Direction

For each significant dependency:

```text id="x9q3sk"
Source:
<component>

Target:
<component>

Reason:
<reason>

Dependency Type:
<domain/application/data/integration/technical>

Direction:
<direction>

Risk:
<risk>
```

Dependencies should follow intentional architectural direction.

---

# 22. Circular Dependency Analysis

```text id="k5v8rd"
Cycle:
<A → B → C → A>

Reason:
<reason>

Business Justification:
<reason>

Risk:
<risk>

Resolution Options:
- <option>

Decision:
<decision>
```

Circular dependencies should be treated as architectural findings unless explicitly justified.

---

# 23. Component Cohesion

Evaluate whether each component represents a coherent responsibility.

| Component     | Responsibility Cohesion | Domain Cohesion | Change Cohesion | Assessment     |
| ------------- | ----------------------- | --------------- | --------------- | -------------- |
| `<component>` | `<HIGH/MEDIUM/LOW>`     | `<level>`       | `<level>`       | `<assessment>` |

Indicators of low cohesion:

* Multiple unrelated responsibilities.
* Multiple unrelated business concepts.
* Frequent unrelated changes.
* Multiple owners.
* Conflicting quality requirements.

---

# 24. Component Coupling

| Source        | Target        | Coupling Type | Strength     | Risk     |
| ------------- | ------------- | ------------- | ------------ | -------- |
| `<component>` | `<component>` | `<type>`      | `<strength>` | `<risk>` |

Potential coupling types:

* Semantic
* Data
* Control
* Temporal
* Runtime
* Security
* Contract
* Change
* Technical

---

# 25. Change Coupling

Identify components that frequently change together.

```text id="p3z7mw"
Components:
<A, B>

Change Relationship:
<relationship>

Evidence:
<evidence>

Reason:
<reason>

Architectural Concern:
<concern>
```

High change coupling does not automatically require merging.

It may represent:

* Intentional coordination.
* Shared business behavior.
* Shared invariant.
* Poor boundary.
* Temporary migration state.

---

# 26. Data Responsibility

For each component:

```text id="f8c2ny"
Component:
<component>

Owned Data:
<data>

Read Data:
<data>

Written Data:
<data>

Authoritative:
<yes/no>

Shared:
<yes/no>

Consistency Requirement:
<requirement>

Sensitivity:
<level>
```

Data access should not become the only basis for component boundaries.

---

# 27. Shared State Analysis

```text id="v5m8qx"
State:
<state>

Components:
<components>

Ownership:
<owner>

Shared:
<yes/no>

Reason:
<reason>

Coupling:
<coupling>

Risk:
<risk>

Alternative:
<alternative>
```

Shared state should be explicit.

---

# 28. Business Rule Ownership

Map important rules to components.

| Rule     | Component     | Responsibility     | Enforcement Point | Status     |
| -------- | ------------- | ------------------ | ----------------- | ---------- |
| `<rule>` | `<component>` | `<responsibility>` | `<point>`         | `<status>` |

Business rules should have a clear semantic owner.

Avoid duplicating the same rule across components unless explicitly required.

---

# 29. Invariant Protection

For important invariants:

```text id="n6q4vy"
Invariant:
<invariant>

Owner:
<component>

Protected State:
<state>

Operations:
<operations>

Cross-Component:
<yes/no>

Risk:
<risk>

Resolution:
<resolution>
```

If an invariant crosses component boundaries, the architecture must explicitly evaluate the resulting coupling.

---

# 30. Internal Workflow

For meaningful internal workflows:

```text id="h7x3pc"
Workflow:
<workflow>

Trigger:
<trigger>

Components:
<components>

Sequence:
<sequence>

Business Rules:
<rules>

Failure Paths:
<failure paths>

Compensation:
<compensation>

Outcome:
<outcome>
```

The workflow should remain business-meaningful.

Do not document trivial technical call chains.

---

# 31. Component State

Only model component state when it is architecturally meaningful.

```text id="q8w5ma"
Component:
<component>

State:
<state>

Transition:
<transition>

Trigger:
<trigger>

Business Meaning:
<meaning>

Persistence:
<known/unknown>
```

Avoid reproducing every implementation state.

---

# 32. Component Failure Boundaries

```text id="s4v9kx"
Component:
<component>

Failure Mode:
<failure>

Dependent Components:
<dependencies>

Propagation:
<propagation>

Business Impact:
<impact>

Isolation:
<expectation>

Recovery Responsibility:
<responsibility>
```

Component failure analysis is required only where it materially affects architecture.

---

# 33. Component Security Responsibilities

```text id="y2m7fc"
Component:
<component>

Security Responsibility:
<responsibility>

Protected Asset:
<asset>

Trust Boundary:
<boundary>

Actor:
<actor>

Authorization Responsibility:
<responsibility>

Security Risk:
<risk>
```

Avoid duplicating authorization logic across components without architectural justification.

---

# 34. Component Integration Responsibilities

Where a component interacts with an external system:

```text id="d6r3nz"
Component:
<component>

External System:
<system>

Responsibility:
<responsibility>

Translation Required:
<yes/no/unknown>

Failure Handling:
<known/unknown>

Contract:
<contract or unknown>
```

Detailed integration contracts belong to the Contracts phase.

---

# 35. Anti-Corruption Responsibilities

```text id="k9x4vq"
Component:
<component>

Protected Domain Model:
<model>

External Model:
<model>

Translation:
<translation>

Reason:
<reason>

Risk If Removed:
<risk>
```

An Anti-Corruption Layer should protect semantic integrity, not merely hide technical complexity.

---

# 36. Quality Attribute Responsibilities

| Component     | Quality Attribute | Responsibility     | Architectural Concern |
| ------------- | ----------------- | ------------------ | --------------------- |
| `<component>` | `<attribute>`     | `<responsibility>` | `<concern>`           |

Examples:

* Performance-sensitive computation.
* Security-sensitive processing.
* Reliability-sensitive integration.
* High-change business behavior.
* Audit-sensitive behavior.

---

# 37. Component Performance Concerns

```text id="x5n8mr"
Component:
<component>

Performance Concern:
<concern>

Affected Operation:
<operation>

Requirement:
<requirement>

Dependency:
<dependency>

Unknown:
<unknown>

Architectural Consequence:
<consequence>
```

Do not invent performance numbers.

---

# 38. Component Scalability

```text id="b4q7ws"
Component:
<component>

Scaling Driver:
<driver>

Independently Scalable:
<yes/no/unknown>

Reason:
<reason>

Quality Attribute:
<attribute>

Operational Cost:
<cost>
```

Independent scaling must be justified by evidence.

---

# 39. Component Observability

```text id="m8c3yp"
Component:
<component>

Observability Need:
<need>

Signal:
<METRIC | LOG | TRACE | AUDIT | EVENT | UNKNOWN>

Purpose:
<purpose>

Criticality:
<criticality>
```

Only architecturally relevant observability should be documented here.

---

# 40. Component Configuration

```text id="r7v2kd"
Component:
<component>

Configuration:
<configuration>

Owner:
<owner>

Sensitivity:
<level>

Change Frequency:
<frequency>

Operational Impact:
<impact>
```

Do not prescribe configuration mechanisms.

---

# 41. Component Contracts

At this stage, identify contract boundaries conceptually.

```text id="j5w9cx"
Component:
<component>

Capability:
<capability>

Consumers:
<consumers>

Contract Type:
<API | EVENT | INTERNAL | DATA | OTHER>

Contract Criticality:
<criticality>

Detailed Contract:
<reference or UNKNOWN>
```

Detailed contract definitions belong to the Contracts phase.

---

# 42. Component Architecture Alternatives

When multiple decompositions are viable:

```text id="u8m4pf"
Concern:
<concern>

Option A:
<decomposition>

Option B:
<decomposition>

Option C:
<decomposition>

Evaluation Criteria:
- Cohesion
- Coupling
- Domain integrity
- Quality attributes
- Security
- Change isolation
- Complexity
- Reversibility

Trade-offs:
<trade-offs>

Recommendation:
<recommendation>

Decision:
<decision>
```

---

# 43. Component Granularity

Evaluate whether the component structure is appropriately sized.

### Too Large

Indicators:

* Multiple unrelated responsibilities.
* Multiple independent change areas.
* Conflicting quality requirements.
* Excessive internal coordination.

### Too Small

Indicators:

* Excessive internal communication.
* Artificial abstraction.
* No independent architectural responsibility.
* Components that merely wrap one class or function.

```text id="c7x2nz"
Component:
<component>

Cohesion:
<HIGH | MEDIUM | LOW>

Coupling:
<HIGH | MEDIUM | LOW>

Architectural Value:
<HIGH | MEDIUM | LOW>

Granularity:
<APPROPRIATE | TOO_LARGE | TOO_SMALL | UNCERTAIN>
```

---

# 44. Implementation Mapping

Only after the architectural model is established may implementation mapping be recorded.

```text id="p6v8ym"
Component:
<component>

Implementation Representation:
<class/module/package/etc.>

Implementation Location:
<location>

Mapping:
<DIRECT | PARTIAL | MULTIPLE | UNKNOWN>

Notes:
<notes>
```

Implementation mapping is evidence.

It does not redefine the architectural component.

---

# 45. Existing Component Architecture

For existing systems:

```text id="n4s7qa"
Documented Component:
<description>

Actual Component:
<description>

Target Component:
<description>

Differences:
<differences>

Evidence:
<evidence>
```

Distinguish architecture documentation from implementation reality.

---

# 46. Component Evolution

For system evolution:

```text id="w3k9cv"
Current Component:
<component>

Target Component:
<component>

Change:
<change>

Reason:
<reason>

Preserved Responsibility:
<responsibility>

New Responsibility:
<responsibility>

Removed Responsibility:
<responsibility>

Migration Risk:
<risk>
```

---

# 47. Component Architecture Risks

| ID           | Risk     | Components     | Impact     | Likelihood     | Mitigation     |
| ------------ | -------- | -------------- | ---------- | -------------- | -------------- |
| RISK-CMP-001 | `<risk>` | `<components>` | `<impact>` | `<likelihood>` | `<mitigation>` |

Typical risks:

* Excessive coupling.
* Wrong responsibility.
* Invariant leakage.
* Duplicate business rules.
* Shared state.
* Excessive orchestration.
* Security responsibility duplication.
* Component explosion.
* Framework-driven boundaries.
* Hidden dependency cycles.

---

# 48. Component Architecture Unknowns

| ID          | Unknown      | Why It Matters | Impact     | Blocking   | Resolution |
| ----------- | ------------ | -------------- | ---------- | ---------- | ---------- |
| UNK-CMP-001 | `<question>` | `<reason>`     | `<impact>` | `<status>` | `<method>` |

Unknowns must not be replaced by implementation guesses.

---

# 49. Component Decisions

Accepted decisions:

```text id="v9r4mx"
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

Affected Components:
<components>

Status:
<status>
```

---

# 50. Component Decision Candidates

| ID          | Decision Question | Driver     | Impact     | Reversibility | Status     |
| ----------- | ----------------- | ---------- | ---------- | ------------- | ---------- |
| DEC-CMP-001 | `<question>`      | `<driver>` | `<impact>` | `<level>`     | `<status>` |

Potential decisions include:

* Component boundary.
* Responsibility ownership.
* Internal communication.
* Data ownership.
* Invariant protection.
* Security responsibility.
* Integration adapter.
* Internal workflow.
* Architectural pattern.

---

# 51. Component Diagram

The C4 Level 3 diagram should show:

```text id="g2w7mc"
┌─────────────────────────────────────────────┐
│             CONTAINER                       │
│                                             │
│   ┌───────────────┐       ┌──────────────┐ │
│   │ Component A   │ ────> │ Component B  │ │
│   └───────────────┘       └──────┬───────┘ │
│                                  │         │
│                           ┌──────▼───────┐ │
│                           │ Component C  │ │
│                           └──────────────┘ │
│                                             │
└─────────────────────────────────────────────┘
```

The diagram should show:

* Selected container
* Components
* Meaningful relationships
* Relevant external dependencies
* Important data responsibilities where appropriate

---

# 52. Component Diagram Rules

Do not include:

* Every class.
* Every method.
* Every package.
* Every framework module.
* Every utility.
* Every repository.
* Every endpoint.
* Every dependency.

The diagram must remain architectural.

If the diagram becomes a source-code map, the abstraction level has been lost.

---

# 53. Component Validation Scenarios

Validate the component decomposition against meaningful behavior.

```text id="f5m8qa"
Scenario:
<scenario>

Container:
<container>

Components:
<components>

Business Goal:
<goal>

Expected Behavior:
<behavior>

Invariant:
<invariant>

Failure Case:
<failure>

Quality Attribute:
<attribute>

Result:
<PASSED | FAILED | PARTIAL | UNKNOWN>
```

Scenarios should test whether the component boundaries actually support the intended behavior.

---

# 54. Component Architecture Fitness

| Dimension              | Status     | Confidence     | Findings     |
| ---------------------- | ---------- | -------------- | ------------ |
| Responsibility clarity | `<status>` | `<confidence>` | `<findings>` |
| Domain alignment       | `<status>` | `<confidence>` | `<findings>` |
| Cohesion               | `<status>` | `<confidence>` | `<findings>` |
| Coupling               | `<status>` | `<confidence>` | `<findings>` |
| Invariant protection   | `<status>` | `<confidence>` | `<findings>` |
| Data ownership         | `<status>` | `<confidence>` | `<findings>` |
| Security               | `<status>` | `<confidence>` | `<findings>` |
| Failure isolation      | `<status>` | `<confidence>` | `<findings>` |
| Quality attributes     | `<status>` | `<confidence>` | `<findings>` |
| Complexity             | `<status>` | `<confidence>` | `<findings>` |
| Traceability           | `<status>` | `<confidence>` | `<findings>` |

---

# 55. Architecture-to-Component Traceability

Recommended chain:

```text id="y7n3wb"
Requirement
      ↓
Domain Capability
      ↓
Bounded Context
      ↓
Aggregate / Domain Responsibility
      ↓
Container
      ↓
Component
      ↓
Implementation
      ↓
Verification
```

Possible relationships:

* `REALIZES`
* `OWNS`
* `ENFORCES`
* `IMPLEMENTS`
* `DEPENDS_ON`
* `SUPPORTS`
* `PROTECTS`
* `CONSTRAINS`
* `VERIFIES`

---

# 56. Component Traceability Register

| Source       | Target        | Relationship     | Evidence     | Status     |
| ------------ | ------------- | ---------------- | ------------ | ---------- |
| `<artifact>` | `<component>` | `<relationship>` | `<evidence>` | `<status>` |

Traceability status:

* `VALID`
* `INFERRED`
* `MISSING`
* `STALE`
* `CONFLICTING`
* `SUPERSEDED`
* `UNKNOWN`

---

# 57. Review Checklist

### Applicability

* [ ] A reason for Level 3 exists.
* [ ] Component Architecture is actually useful.
* [ ] Unnecessary component detail has been avoided.

### Responsibilities

* [ ] Each component has a coherent responsibility.
* [ ] Responsibility boundaries are explicit.
* [ ] Domain responsibilities are preserved.
* [ ] Business rules have clear ownership.

### Domain Integrity

* [ ] Aggregates and invariants are respected.
* [ ] Domain services are not confused with technical services.
* [ ] Domain events retain their semantic meaning.

### Dependencies

* [ ] Significant dependencies are known.
* [ ] Dependency direction is intentional.
* [ ] Circular dependencies are identified.
* [ ] Coupling is understood.

### Data

* [ ] Important data ownership is clear.
* [ ] Shared state is explicit.
* [ ] Consistency boundaries are understood.

### Security

* [ ] Security responsibilities are explicit.
* [ ] Protected assets are known.
* [ ] Trust boundaries are preserved.

### Quality

* [ ] Important quality attributes are considered.
* [ ] Performance-sensitive responsibilities are identified.
* [ ] Reliability-sensitive responsibilities are identified.
* [ ] Observability needs are understood where relevant.

### Existing Systems

* [ ] Documented and actual architecture are distinguished.
* [ ] Target architecture is explicit.
* [ ] Evolution concerns are visible.

### Governance

* [ ] Risks are recorded.
* [ ] Unknowns are explicit.
* [ ] Decisions are governed.
* [ ] Traceability exists.

---

# 58. Gate Contribution

```text id="q2x7vn"
Component Architecture Status:
<READY | READY_WITH_RISKS | INCOMPLETE | BLOCKED | NOT_REQUIRED>

Applicability:
<JUSTIFIED | NOT_JUSTIFIED | UNCERTAIN>

Component Responsibilities:
<CLEAR | PARTIAL | UNCLEAR>

Domain Alignment:
<HIGH | MEDIUM | LOW>

Cohesion:
<HIGH | MEDIUM | LOW>

Coupling:
<LOW | MEDIUM | HIGH>

Invariant Protection:
<HIGH | MEDIUM | LOW>

Data Ownership:
<HIGH | MEDIUM | LOW>

Security:
<HIGH | MEDIUM | LOW | NOT_RELEVANT>

Quality Attribute Alignment:
<HIGH | MEDIUM | LOW>

Traceability:
<HEALTHY | DEGRADED | BROKEN>

Blocking Findings:
<findings>

Gate Recommendation:
<READY | READY_WITH_RISKS | NOT_READY | NOT_REQUIRED>
```

`NOT_REQUIRED` is a valid architecture outcome.

The lifecycle must not require Component Architecture where Level 2 already provides sufficient architectural clarity.

---

# 59. Compact Component Register

```text id="m8q4cz"
Container:
<container>

Component Architecture Required:
<yes/no>

Reason:
<reason>

Components:
- <component>

Critical Responsibilities:
- <responsibility>

Major Dependencies:
- <dependency>

Important Invariants:
- <invariant>

Major Risks:
- <risk>

Open Decisions:
- <decision>

Component Status:
<status>
```

---

# 60. Agent Instructions

When deciding whether to create Component Architecture:

1. Start from Container Architecture.
2. Determine whether deeper architectural detail provides real value.
3. Do not create components merely because the container exists.
4. Identify meaningful internal responsibilities.
5. Preserve domain boundaries and invariants.
6. Give each component a coherent responsibility.
7. Evaluate coupling and cohesion.
8. Identify important dependency direction.
9. Identify data ownership.
10. Identify security responsibilities.
11. Identify meaningful quality-attribute responsibilities.
12. Identify internal failure boundaries where relevant.
13. Keep contracts at conceptual level unless detailed contract work has begun.
14. Do not turn classes into components automatically.
15. Do not turn packages into components automatically.
16. Do not turn framework modules into components automatically.
17. Do not document implementation details as architecture.
18. Validate component boundaries against representative scenarios.
19. Record architecture decision candidates.
20. Use ADRs for consequential component decisions.
21. Preserve traceability to domain and container responsibilities.
22. Explicitly allow `NOT_REQUIRED`.
23. If the component structure reveals a domain problem, return to Domain Discovery.
24. If the component structure reveals a container problem, return to Container Architecture.
25. Stop elaborating once sufficient architectural clarity is achieved.

Before finalizing:

> **Does this component model provide meaningful architectural clarity that cannot be obtained adequately from the container view, while preserving domain responsibilities and avoiding implementation-level detail?**

---

# 61. Anti-Patterns

## Mandatory Level 3

Creating Component Diagrams for every container regardless of complexity.

## Class = Component

Treating every class as an architectural component.

## Package = Component

Treating source packages as architectural boundaries automatically.

## Framework = Architecture

Using framework modules as the primary architecture model.

## Controller-Service-Repository Diagram

Presenting common framework layers as though they constitute the architecture.

## Component Explosion

Creating dozens of tiny components without independent architectural meaning.

## Generic Service Component

Creating a component such as `BusinessService` or `CommonService` without a coherent responsibility.

## Utility Dump

Using a component to contain unrelated helper logic.

## Domain Leakage

Splitting domain responsibilities according to technical convenience.

## Invariant Splitting

Separating behavior required to protect the same business invariant without explicit justification.

## Data-First Components

Creating component boundaries solely around tables or persistence structures.

## Endpoint-First Components

Creating components based on API endpoint groupings.

## Framework-Driven Boundaries

Allowing dependency injection, framework modules, or package conventions to determine architectural boundaries.

## Diagram-as-Codebase

Turning the Component Diagram into a visual representation of the source tree.

## Premature Precision

Defining exact classes, methods, packages, or libraries before implementation design requires them.

## False Independence

Calling components independent while they share state, invariants, or strong runtime coupling.

## Architecture Theater

Producing component diagrams solely to make documentation appear complete.

---

# 62. Safe Progression Question

Before leaving C4 Architecture:

> **Has the architecture been elaborated only to the level necessary to make significant responsibilities, boundaries, dependencies, quality attributes, and architectural risks understandable, without turning the architecture model into an implementation map?**

If:

* **Yes** → proceed to architecture decisions and contracts.
* **Yes, with risks** → proceed while carrying the risks explicitly.
* **No, because container boundaries remain unclear** → return to Container Architecture.
* **No, because domain semantics remain unclear** → return to Domain Discovery.
* **No, because the model contains excessive implementation detail** → simplify it.
* **No, because Level 3 adds no meaningful value** → mark Component Architecture as `NOT_REQUIRED`.

---

# 63. Final Principle

> **C4 Level 3 exists to explain architectural complexity, not to document source code.**

The intended progression is:

```text
System Context
      ↓
What is the system and what surrounds it?
      ↓
Container Architecture
      ↓
What are the major internal architectural units?
      ↓
Component Architecture
      ↓
What internal responsibilities require deeper architectural explanation?
      ↓
Implementation
      ↓
How are those responsibilities actually realized in code?
```

The lifecycle must stop elaborating when additional detail no longer improves architectural reasoning.

A mature architecture process therefore treats:

```text
Level 1 → required
Level 2 → normally required
Level 3 → justified selectively
Implementation detail → outside C4 architecture
```

The objective is not maximum documentation.

The objective is **sufficient architectural clarity to make, govern, implement, and verify consequential decisions safely**.
