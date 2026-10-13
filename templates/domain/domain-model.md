# Domain Model

## 1. Document Metadata

| Field                   | Value                    |
| ----------------------- | ------------------------ |
| Document Type           | Domain Model             |
| Lifecycle Phase         | Domain Discovery / DDD   |
| Scope                   | Domain / Bounded Context |
| Status                  | `DRAFT`                  |
| Version                 | `0.1`                    |
| Owner                   | `<owner>`                |
| Created                 | `<date>`                 |
| Last Updated            | `<date>`                 |
| Related Bounded Context | `<bounded-context>`      |
| Related Documents       | `<references>`           |

---

## 2. Purpose

This document defines the conceptual and tactical domain model discovered for a bounded context or domain area.

It identifies the domain elements required to represent meaningful business behavior, including:

* Entities
* Value Objects
* Aggregates
* Aggregate Roots
* Domain Services
* Domain Policies
* Factories
* Domain Events
* Relationships
* State and lifecycle
* Invariants
* Domain-level operations

The model provides a bridge between strategic domain discovery and subsequent architecture and specification work.

It is intentionally technology-agnostic.

---

## 3. Core Principle

The domain model must represent the business concepts, behavior, rules, state, and consistency boundaries that matter to the domain.

It must not be derived primarily from:

* Database tables
* API endpoints
* UI screens
* Framework structures
* Microservice boundaries
* Repository classes
* Deployment units
* Technical workflows

The model should explain **how the domain behaves**, not how the software will eventually implement it.

---

## 4. Entry Conditions

Domain modeling should begin only when sufficient strategic domain understanding exists.

Minimum expected inputs:

* Product context
* Relevant actors
* Product requirements
* Business rules
* Significant use cases
* Domain capabilities
* Domain processes
* Domain concepts
* Domain glossary
* Candidate bounded contexts
* Ownership information
* Important invariants
* Relevant domain events or state changes
* Known assumptions and unknowns

If these inputs are insufficient, the agent must identify the missing information rather than inventing domain structures.

---

## 5. Modeling Scope

Define the exact area being modeled.

```text
Bounded Context:
<name>

Domain Area:
<area>

Included Capabilities:
- <capability>

Included Processes:
- <process>

Included Business Rules:
- <rule>

Excluded Areas:
- <area>

Modeling Objective:
<what this model must explain>
```

The scope must prevent unrelated concepts from being introduced into the model.

---

## 6. Modeling Objectives

The model should provide sufficient understanding of:

1. Which concepts have independent identity.
2. Which concepts are defined by value.
3. Which concepts must change together to preserve invariants.
4. Where consistency boundaries exist.
5. Which behaviors belong to domain concepts.
6. Which behaviors require domain services or policies.
7. Which state transitions matter.
8. Which events represent meaningful domain occurrences.
9. Which concepts are owned by the bounded context.
10. Which relationships cross domain boundaries.
11. Which assumptions remain unresolved.

The goal is not maximum model detail.

The goal is a model that explains the relevant domain behavior with sufficient precision.

---

# 7. Domain Model Overview

Provide a high-level representation of the model.

```text
Bounded Context
│
├── Aggregate
│   ├── Aggregate Root
│   ├── Entity
│   ├── Value Object
│   └── Invariants
│
├── Aggregate
│   ├── Aggregate Root
│   └── Value Object
│
├── Domain Service
├── Domain Policy
├── Factory
└── Domain Events
```

The overview should identify major model elements without prematurely describing implementation structures.

---

# 8. Domain Element Types

The model may contain the following elements:

| Element              | Purpose                                                                        |
| -------------------- | ------------------------------------------------------------------------------ |
| Entity               | Represents a concept with identity and lifecycle continuity                    |
| Value Object         | Represents a concept defined by its value and meaning                          |
| Aggregate            | Defines a consistency and behavioral boundary                                  |
| Aggregate Root       | Controls access to an aggregate's externally visible behavior/state            |
| Domain Service       | Represents domain behavior that does not naturally belong to one domain object |
| Domain Policy        | Represents an explicit business policy used to determine domain behavior       |
| Factory              | Encapsulates significant domain creation logic                                 |
| Domain Event         | Represents a meaningful occurrence that happened in the domain                 |
| Domain Specification | Represents a reusable domain predicate or rule when appropriate                |

Not every model requires every element type.

---

# 9. Entity Catalog

List entities identified within the model.

| ID      | Name     | Purpose     | Identity     | Lifecycle     | Aggregate     | Status     |
| ------- | -------- | ----------- | ------------ | ------------- | ------------- | ---------- |
| ENT-001 | `<name>` | `<purpose>` | `<identity>` | `<lifecycle>` | `<aggregate>` | `<status>` |

Possible statuses:

* `IDENTIFIED`
* `PROPOSED`
* `UNDER_REVIEW`
* `ACCEPTED`
* `ACTIVE`
* `SUPERSEDED`
* `DEPRECATED`
* `REJECTED`
* `UNKNOWN`

---

# 10. Entity Definition

An entity represents a domain concept whose identity remains meaningful independently of changes to its attributes.

## Entity Record

```text
ID:
Name:
Purpose:

Business Meaning:
<why this concept exists in the domain>

Identity:
<what establishes identity>

Identity Stability:
<how identity behaves over lifecycle>

Lifecycle:
<important states or stages>

Owned Behavior:
<behavior naturally belonging to the entity>

Invariants:
<rules that must remain true>

Attributes:
<conceptual attributes>

Related Value Objects:
<value objects>

Aggregate:
<aggregate>

Domain Events:
<events produced or associated>

Business Rules:
<rules governing this entity>

Actors:
<relevant actors>

Evidence:
<supporting evidence>

Confidence:
<HIGH | MEDIUM | LOW>

Traceability:
<relationships>
```

### Entity Rules

An entity should be modeled when:

* Identity matters independently of attributes.
* The concept has meaningful lifecycle continuity.
* Domain behavior or rules depend on its identity.
* Different instances must be distinguishable.

Do not classify every noun as an entity.

---

# 11. Value Object Catalog

List concepts whose meaning is determined by their value rather than independent identity.

| ID     | Name     | Meaning     | Attributes     | Immutable  | Used By      | Status     |
| ------ | -------- | ----------- | -------------- | ---------- | ------------ | ---------- |
| VO-001 | `<name>` | `<meaning>` | `<attributes>` | `<yes/no>` | `<concepts>` | `<status>` |

---

# 12. Value Object Definition

A Value Object represents a domain concept whose identity is determined by its complete value and meaning.

Typical examples may include:

* Money
* Address
* Date range
* Quantity
* Measurement
* Email address
* Coordinates
* Identifier value with domain semantics

Examples are illustrative only. The model must derive from the actual domain.

## Value Object Record

```text
ID:
Name:
Purpose:

Business Meaning:
<meaning>

Attributes:
<attributes>

Value Semantics:
<how equality is determined>

Validation Rules:
<validity rules>

Invariants:
<value-level invariants>

Immutability:
<expected behavior>

Used By:
<entities/aggregates/services>

Related Business Rules:
<rules>

Evidence:
<evidence>

Confidence:
<HIGH | MEDIUM | LOW>

Traceability:
<relationships>
```

### Value Object Rules

A Value Object should not receive an artificial identity merely because its data is persisted separately.

The model should prioritize semantic meaning over storage representation.

---

# 13. Aggregate Catalog

List candidate aggregates.

| ID      | Aggregate | Root     | Responsibility     | Main Invariants | Consistency Scope | Status     |
| ------- | --------- | -------- | ------------------ | --------------- | ----------------- | ---------- |
| AGG-001 | `<name>`  | `<root>` | `<responsibility>` | `<invariants>`  | `<scope>`         | `<status>` |

---

# 14. Aggregate Definition

An Aggregate is a domain consistency and behavioral boundary.

It groups concepts that must be governed together to preserve domain invariants.

An aggregate normally contains:

* One Aggregate Root
* Zero or more entities
* Zero or more value objects
* Domain behavior
* Invariants
* Domain-level operations
* Relevant domain events

## Aggregate Record

```text
ID:
Name:
Purpose:

Business Responsibility:
<responsibility>

Aggregate Root:
<root>

Contained Entities:
<entities>

Contained Value Objects:
<value objects>

Owned Invariants:
<invariants>

Domain Operations:
<operations>

State:
<state>

Lifecycle:
<lifecycle>

Domain Events:
<events>

External Relationships:
<relationships>

Consistency Boundary:
<what must remain consistent together>

Ownership:
<business ownership>

Evidence:
<evidence>

Confidence:
<HIGH | MEDIUM | LOW>

Traceability:
<relationships>
```

---

# 15. Aggregate Root

The Aggregate Root is the domain concept through which external domain interactions with the aggregate are governed.

The root is responsible for preserving aggregate invariants.

External consumers should not manipulate internal aggregate elements in ways that bypass the root's domain rules.

This is a domain modeling rule, not necessarily a programming-language visibility rule.

---

# 16. Aggregate Boundary and Consistency

For every aggregate, answer:

1. Which concepts must change together?
2. Which invariants must hold immediately?
3. Which business rules depend on the complete aggregate state?
4. Which concepts can change independently?
5. Which relationships are internal?
6. Which relationships should remain references to concepts outside the aggregate?
7. What business ownership justifies the boundary?
8. What scenarios would break if the boundary were different?

### Aggregate Boundary Test

A proposed aggregate boundary should have evidence that its members share meaningful:

* Consistency requirements
* Invariants
* Business ownership
* Lifecycle coupling
* Behavioral responsibility

Do not define aggregates based primarily on:

* Database tables
* Entity count
* CRUD screens
* API endpoints
* Repository classes
* Microservice boundaries

---

# 17. Aggregate Invariants

Record invariants explicitly.

| ID      | Aggregate     | Invariant     | Severity     | Evidence     | Verification     |
| ------- | ------------- | ------------- | ------------ | ------------ | ---------------- |
| INV-001 | `<aggregate>` | `<invariant>` | `<severity>` | `<evidence>` | `<verification>` |

An invariant represents a condition that must remain true within its applicable domain boundary.

Severity may be:

* `CRITICAL`
* `HIGH`
* `MEDIUM`
* `LOW`

The model must distinguish:

* Domain invariant
* Business rule
* Validation rule
* Technical constraint

They may overlap, but they are not automatically equivalent.

---

# 18. Aggregate Domain Operations

Describe operations in domain language.

```text
Operation:
<purpose>

Initiated By:
<actor or domain behavior>

Preconditions:
<conditions>

Behavior:
<domain behavior>

Rules Applied:
<rules>

State Changes:
<changes>

Result:
<result>

Events:
<events>

Failure Conditions:
<domain failures>
```

These are domain behaviors, not API commands.

Do not define:

```text
POST /orders
PUT /orders/{id}
```

at this stage.

---

# 19. Domain Services

A Domain Service represents domain behavior that does not naturally belong to a single entity or aggregate.

Use a Domain Service only when the behavior is genuinely domain-significant.

## Domain Service Record

```text
ID:
Name:

Purpose:
<domain responsibility>

Behavior:
<behavior>

Inputs:
<domain concepts>

Outputs:
<domain result>

Rules:
<rules>

Affected Aggregates:
<aggregates>

State Ownership:
<who owns state>

Events:
<events>

Evidence:
<evidence>

Confidence:
<HIGH | MEDIUM | LOW>

Traceability:
<relationships>
```

A Domain Service should not become a generic dumping ground for business logic.

---

# 20. Domain Policies

A Domain Policy represents a business decision rule or policy that determines domain behavior.

Examples may include:

* Eligibility policy
* Pricing policy
* Selection policy
* Allocation policy
* Approval policy
* Prioritization policy

## Policy Record

```text
ID:
Name:
Purpose:

Question Answered:
<what decision does the policy determine?>

Inputs:
<domain inputs>

Conditions:
<conditions>

Decision:
<policy outcome>

Exceptions:
<exceptions>

Affected Rules:
<rules>

Affected Aggregates:
<aggregates>

Evidence:
<evidence>

Status:
<status>

Traceability:
<relationships>
```

Policies should remain expressed in domain terms rather than technical implementation terms.

---

# 21. Factories

A Factory may be introduced when object creation contains meaningful domain behavior or complex creation rules.

A Factory is appropriate when creation requires:

* Significant validation
* Multiple domain decisions
* Invariant establishment
* Complex construction
* Selection among valid domain variants

Simple object construction does not require a Factory.

## Factory Record

```text
ID:
Name:

Creates:
<domain concept>

Purpose:
<creation responsibility>

Inputs:
<domain inputs>

Creation Rules:
<rules>

Invariants Established:
<invariants>

Failure Conditions:
<conditions>

Evidence:
<evidence>

Traceability:
<relationships>
```

Do not introduce factories merely because a framework or coding convention suggests them.

---

# 22. Domain Events

A Domain Event represents a meaningful occurrence that has happened within the domain.

Examples:

```text
<Business Concept>Created
<Business Concept>Approved
<Business Concept>Rejected
<Business Concept>Completed
<Business Concept>Cancelled
```

These names are illustrative.

A domain event should express a domain fact, not a technical operation.

---

# 23. Domain Event Record

```text
ID:
Name:

Meaning:
<what happened?>

Trigger:
<domain behavior that caused the event>

Occurrence:
<when it becomes true>

Facts Carried:
<domain facts>

Affected Aggregate:
<aggregate>

Resulting State:
<state after occurrence>

Business Significance:
<why it matters>

Consumers:
<known domain consumers>

Evidence:
<evidence>

Confidence:
<HIGH | MEDIUM | LOW>

Traceability:
<relationships>
```

### Domain Event Rules

A domain event is different from an integration event or message.

A domain event describes a business occurrence.

Whether that occurrence later becomes an external message is an architecture decision.

Do not assume:

```text
Domain Event = Message Broker Message
```

---

# 24. Domain Specifications

A Specification may be used when a domain predicate or business condition has meaningful reusable semantics.

Possible forms include:

* Eligibility
* Qualification
* Compatibility
* Validity
* Selection
* Compliance

## Specification Record

```text
ID:
Name:

Purpose:
<business predicate>

Question:
<what does it determine?>

Inputs:
<domain concepts>

Condition:
<domain condition>

Result:
<true/false or domain result>

Rules:
<rules>

Consumers:
<domain behaviors>

Evidence:
<evidence>

Traceability:
<relationships>
```

Specifications are optional and should not be introduced merely to formalize simple validations.

---

# 25. Relationships

Record meaningful relationships among model elements.

| ID      | Source     | Relationship     | Target     | Meaning     | Evidence     |
| ------- | ---------- | ---------------- | ---------- | ----------- | ------------ |
| REL-001 | `<source>` | `<relationship>` | `<target>` | `<meaning>` | `<evidence>` |

Possible relationship types:

* `CONTAINS`
* `OWNS`
* `REFERENCES`
* `DEPENDS_ON`
* `COLLABORATES_WITH`
* `GOVERNS`
* `CONSTRAINS`
* `PRODUCES`
* `CONSUMES`
* `TRIGGERS`
* `REALIZES`
* `SPECIALIZES`
* `COMPOSES`
* `ASSOCIATES_WITH`

Only relationships with meaningful domain semantics should be modeled.

---

# 26. Association vs Ownership

The model must distinguish association from ownership.

### Association

Two concepts are related because the domain requires the relationship.

### Ownership

One concept is responsible for the lifecycle or consistency of another concept.

Ownership should influence:

* Aggregate boundaries
* Invariant ownership
* Lifecycle responsibility
* Change authority
* Domain behavior

Technical containment must not be confused with domain ownership.

---

# 27. Identity

For each entity, explicitly determine:

```text
Identity Source:
<what establishes identity>

Identity Scope:
<where identity is meaningful>

Identity Lifecycle:
<how identity behaves>

Identity Stability:
<whether identity changes>

Identity Evidence:
<evidence>
```

Do not invent identifiers merely because persistence will eventually require one.

A technical identifier may exist without being the domain's meaningful identity.

---

# 28. Lifecycle and State Modeling

Model state only where state has domain meaning.

```text
State:
<state>

Entry Conditions:
<conditions>

Allowed Transitions:
<transitions>

Transition Trigger:
<business event/action>

Rules:
<rules>

Exit Conditions:
<conditions>
```

State transitions should be expressed in domain language.

Avoid creating states merely to represent:

* Database flags
* HTTP statuses
* UI screens
* Internal processing stages

unless those states have genuine domain significance.

---

# 29. Immutability and Value Semantics

For each model element, determine whether its value or state can change.

Important distinctions:

* Immutable value
* Mutable entity
* Lifecycle transition
* Replaced value
* Historical value
* Derived value

For Value Objects, equality should normally derive from semantic value.

For Entities, identity must remain distinguishable across lifecycle changes.

Do not assume that every object should be immutable or mutable without domain evidence.

---

# 30. Invariants and Consistency Rules

For each important invariant, identify:

```text
Invariant:
<statement>

Owner:
<aggregate/domain concept>

Scope:
<where it applies>

When Evaluated:
<condition>

Violation:
<what becomes invalid>

Resolution:
<how domain behavior handles it>

Evidence:
<source>

Verification:
<scenario/test/evidence>
```

Invariant ownership should be explicit.

No invariant should exist without a meaningful domain owner.

---

# 31. Cross-Aggregate Behavior

When behavior involves multiple aggregates, document:

```text
Initiating Aggregate:
<aggregate>

Participating Aggregates:
<aggregates>

Immediate Invariants:
<invariants>

Independent Changes:
<changes>

Domain Events:
<events>

Ordering Requirements:
<requirements>

Failure/Compensation Semantics:
<semantics>

Consistency Expectation:
<what must be immediately consistent vs eventually reconciled>

Evidence:
<evidence>
```

Do not automatically merge aggregates simply because a business process touches them.

Separate aggregates may legitimately participate in the same process.

---

# 32. Domain Consistency vs Technical Transactions

A domain consistency boundary expresses what the business requires to be consistent together.

It does not automatically determine:

* Database transactions
* Distributed transactions
* Message delivery semantics
* Transaction managers
* Persistence mechanisms

Those concerns belong to later architecture and infrastructure decisions unless already constrained by the existing system.

---

# 33. Domain Model vs Persistence Model

The domain model and persistence model are related but not necessarily identical.

Do not assume:

```text
Entity = Table
Value Object = Table
Aggregate = Schema
Aggregate Root = Primary Table
Relationship = Foreign Key
```

Persistence may represent the domain model differently.

Any significant divergence should be understood and, when necessary, recorded as an architectural or implementation concern.

---

# 34. Existing System Analysis

For existing systems, distinguish:

### Documented Model

What existing documentation claims the domain model is.

### Actual Model

What current behavior, code, data, tests, and runtime evidence demonstrate.

### Target Model

What the system should represent after the intended evolution.

Example:

```text
Documented:
<description>

Actual:
<description>

Target:
<description>

Differences:
<differences>

Migration Implications:
<implications>
```

Actual behavior must not automatically become the target domain model.

Likewise, historical documentation must not override stronger current evidence.

---

# 35. Model Conflicts

Record contradictions explicitly.

| ID      | Conflict     | Elements     | Evidence A   | Evidence B   | Severity     | Resolution     |
| ------- | ------------ | ------------ | ------------ | ------------ | ------------ | -------------- |
| CON-001 | `<conflict>` | `<elements>` | `<evidence>` | `<evidence>` | `<severity>` | `<resolution>` |

Possible severity:

* `INFO`
* `WARNING`
* `SIGNIFICANT`
* `BLOCKING`

Never silently choose one interpretation when the difference materially affects the model.

---

# 36. Model Unknowns

Record unresolved modeling questions.

| ID      | Unknown      | Why It Matters | Impact     | Blocking   | Resolution Method | Status     |
| ------- | ------------ | -------------- | ---------- | ---------- | ----------------- | ---------- |
| UNK-001 | `<question>` | `<reason>`     | `<impact>` | `<yes/no>` | `<method>`        | `<status>` |

Unknowns should be resolved only when necessary.

A complete domain model does not require zero unknowns.

---

# 37. Model Assumptions

Record assumptions explicitly.

```text
ID:
Assumption:
Reason:
Evidence:
Confidence:
Impact If False:
Affected Model Elements:
Validation Method:
Status:
```

An assumption must never silently become a domain fact.

---

# 38. Domain Model Decisions

Record decisions that materially affect the model.

Possible decisions include:

* Entity vs Value Object
* Aggregate boundary
* Aggregate Root
* Ownership
* Invariant ownership
* Lifecycle representation
* Domain Service introduction
* Policy representation
* Domain Event definition
* Cross-aggregate behavior
* Context relationship
* Model interpretation in an existing system

Architecture decisions should not be mixed into this section unless their decision scope is genuinely architectural.

Use the appropriate decision artifact when the decision crosses lifecycle boundaries.

---

# 39. Scenario Validation

The model must be validated against meaningful domain scenarios.

For each scenario:

```text
Scenario:
<name>

Actors:
<actors>

Initial State:
<state>

Domain Action:
<action>

Model Elements Involved:
<elements>

Rules Applied:
<rules>

Invariant Checks:
<checks>

State Changes:
<changes>

Domain Events:
<events>

Expected Outcome:
<outcome>

Model Gaps:
<gaps>

Validation Result:
<PASSED | FAILED | PARTIAL | UNKNOWN>
```

Scenarios should include, where relevant:

* Normal behavior
* Important alternative behavior
* Invalid behavior
* Boundary conditions
* State transitions
* Important business exceptions
* Cross-aggregate behavior

---

# 40. Traceability

The domain model must connect back to strategic discovery.

Minimum useful relationships include:

```text
Domain Capability
    ↓
Domain Process
    ↓
Domain Concept
    ↓
Domain Model Element
    ↓
Business Rule / Invariant
    ↓
Scenario
```

Relevant traceability relationships may include:

* `DERIVES_FROM`
* `REALIZES`
* `GOVERNS`
* `CONSTRAINS`
* `OWNS`
* `IMPLEMENTS`
* `TRIGGERS`
* `PRODUCES`
* `CONSUMES`
* `VERIFIES`
* `DEPENDS_ON`
* `SUPERSEDES`
* `INVALIDATES`

Every significant model element should have sufficient evidence explaining why it exists.

---

# 41. Strategic-to-Tactical Alignment

Validate alignment between strategic and tactical DDD.

| Strategic Element | Tactical Model Element | Alignment  | Gap     |
| ----------------- | ---------------------- | ---------- | ------- |
| Capability        | Aggregate / Service    | `<status>` | `<gap>` |
| Process           | Domain Behavior        | `<status>` | `<gap>` |
| Business Rule     | Invariant / Policy     | `<status>` | `<gap>` |
| Concept           | Entity / Value Object  | `<status>` | `<gap>` |
| Bounded Context   | Model Scope            | `<status>` | `<gap>` |

A tactical model that cannot explain important strategic domain behavior should not be considered complete.

---

# 42. Model Health

Assess the model for:

### Semantic Coherence

Do model elements use consistent domain language?

### Behavioral Completeness

Can the model explain significant domain behavior?

### Invariant Ownership

Does every important invariant have an appropriate owner?

### Boundary Coherence

Do aggregate boundaries reflect meaningful consistency requirements?

### Lifecycle Coherence

Are meaningful state transitions represented?

### Ownership Coherence

Are responsibilities assigned to appropriate domain concepts?

### Scenario Coverage

Can important scenarios be executed conceptually against the model?

### Evidence Quality

Are model decisions supported by evidence?

### Uncertainty

Are unresolved questions explicit?

---

# 43. Domain Model Debt

Record known weaknesses.

Examples:

* Unclear aggregate boundary
* Unresolved identity
* Missing invariant
* Ambiguous ownership
* Conflicting terminology
* Missing lifecycle
* Unverified domain behavior
* Excessive coupling
* Legacy behavior not yet understood
* Incomplete scenario coverage

Domain model debt should be visible rather than hidden behind apparently complete diagrams.

---

# 44. Review Checklist

Before considering the domain model sufficiently mature:

### Concepts

* [ ] Important domain concepts are identified.
* [ ] Entities have meaningful identity.
* [ ] Value Objects have semantic value equality.
* [ ] Concepts are not classified as entities without evidence.
* [ ] Domain language is consistent.

### Aggregates

* [ ] Aggregate boundaries are justified by invariants and consistency.
* [ ] Aggregate Roots are explicit.
* [ ] Invariant ownership is clear.
* [ ] Aggregates are not derived from database tables.
* [ ] Aggregates are not derived from API boundaries.
* [ ] Cross-aggregate behavior is understood.

### Behavior

* [ ] Significant domain behavior is modeled.
* [ ] Domain operations are expressed in business language.
* [ ] Domain Services are used only where justified.
* [ ] Policies are explicit where needed.
* [ ] Creation rules are modeled where creation is domain-significant.

### Events

* [ ] Important domain occurrences are identified.
* [ ] Domain Events are distinguished from integration events.
* [ ] Event meaning is business-oriented.

### State

* [ ] Important lifecycle states are represented.
* [ ] Valid transitions are understood.
* [ ] State is not merely technical status.

### Validation

* [ ] Important scenarios validate the model.
* [ ] Business rules map to model behavior.
* [ ] Contradictions are documented.
* [ ] Unknowns are explicit.
* [ ] Assumptions are explicit.

### Architecture Independence

* [ ] No premature framework mapping exists.
* [ ] No premature database model determines the domain model.
* [ ] No microservice boundaries are assumed.
* [ ] No API design is embedded unnecessarily.

---

# 45. Gate Contribution

This artifact contributes to the Domain Discovery Gate.

The model may contribute:

```text
Domain Understanding:
<PASSED | PARTIAL | BLOCKED>

Conceptual Coherence:
<PASSED | PARTIAL | BLOCKED>

Behavioral Understanding:
<PASSED | PARTIAL | BLOCKED>

Aggregate Boundary Confidence:
<HIGH | MEDIUM | LOW>

Invariant Coverage:
<HIGH | MEDIUM | LOW>

Scenario Validation:
<PASSED | PARTIAL | BLOCKED>

Traceability:
<HEALTHY | DEGRADED | BROKEN>

Blocking Issues:
<issues>

Gate Recommendation:
<READY | READY_WITH_RISKS | BLOCKED>
```

The existence of a completed model document does not imply that the Domain Discovery Gate has passed.

---

# 46. Compact Model Register

For larger domains, maintain a compact register.

| ID      | Type           | Name     | Responsibility     | Owner     | Aggregate     | Status     | Confidence     |
| ------- | -------------- | -------- | ------------------ | --------- | ------------- | ---------- | -------------- |
| ENT-001 | Entity         | `<name>` | `<responsibility>` | `<owner>` | `<aggregate>` | `<status>` | `<confidence>` |
| VO-001  | Value Object   | `<name>` | `<meaning>`        | `<owner>` | `<aggregate>` | `<status>` | `<confidence>` |
| AGG-001 | Aggregate      | `<name>` | `<responsibility>` | `<owner>` | —             | `<status>` | `<confidence>` |
| DS-001  | Domain Service | `<name>` | `<behavior>`       | `<owner>` | `<scope>`     | `<status>` | `<confidence>` |
| EVT-001 | Domain Event   | `<name>` | `<occurrence>`     | `<owner>` | `<aggregate>` | `<status>` | `<confidence>` |

---

# 47. Agent Instructions

When creating or modifying a domain model:

1. Start from established domain understanding.
2. Use the bounded context as the modeling scope.
3. Preserve the established ubiquitous language.
4. Do not invent entities because a noun appears in a requirement.
5. Determine whether identity is genuinely meaningful before creating an Entity.
6. Prefer Value Objects when identity is not independently meaningful.
7. Define aggregates around invariants and consistency requirements.
8. Do not derive aggregates from tables, APIs, repositories, or microservices.
9. Identify the Aggregate Root explicitly.
10. Assign invariant ownership explicitly.
11. Model behavior where meaningful domain behavior exists.
12. Do not create Domain Services merely to avoid putting behavior somewhere.
13. Introduce Policies only when business policy is meaningful.
14. Introduce Factories only when creation contains domain significance.
15. Distinguish Domain Events from integration events.
16. Model lifecycle states only when they have domain meaning.
17. Validate the model against realistic domain scenarios.
18. Record contradictions rather than silently resolving them.
19. Record assumptions separately from facts.
20. Record unknowns when evidence is insufficient.
21. Do not map the model prematurely to frameworks or persistence.
22. Preserve current/target distinctions in existing systems.
23. Trace significant model elements to their domain evidence.
24. Revisit strategic DDD artifacts when the tactical model exposes contradictions.
25. Keep the model proportional to domain complexity and risk.

Before finalizing, ask:

> Can the model explain the significant domain behavior, rules, invariants, state transitions, ownership, and scenarios without relying on implementation details or unsupported assumptions?

If not, continue discovery or mark the unresolved areas explicitly.

---

# 48. Anti-Patterns

Avoid:

### Database-Driven Modeling

Defining the domain model directly from database tables.

### Entity Explosion

Treating every noun as an Entity.

### CRUD Modeling

Creating domain concepts around CRUD operations.

### Aggregate-per-Table

Assuming every persistence entity should be an aggregate.

### Aggregate-per-Microservice

Assuming deployment boundaries define domain boundaries.

### Giant Aggregate

Putting unrelated concepts into one aggregate to simplify transactions.

### Anemic Domain Dogma

Forcing behavior into every model element regardless of actual domain significance.

### Service Dumping Ground

Moving all business behavior into Domain Services.

### Event Equals Message

Treating every Domain Event as an integration message.

### Technical State Leakage

Modeling HTTP, database, queue, or UI states as domain states without evidence.

### Repository-Driven Domain

Creating one domain repository per entity automatically.

### Framework-Driven Modeling

Allowing framework conventions to determine domain concepts.

### Premature Persistence Modeling

Allowing storage concerns to determine aggregate boundaries.

### Legacy Worship

Treating the existing implementation as the correct target domain model.

### Unsupported Precision

Inventing detailed behavior, states, invariants, or relationships without evidence.

### Documentation Theater

Creating elaborate diagrams and catalogs without improving domain understanding.

---

# 49. Safe Progression Question

Before progressing from tactical domain modeling toward architecture, ask:

> **Do the model elements, relationships, invariants, aggregate boundaries, domain behaviors, lifecycle states, and scenarios explain the significant domain behavior well enough to support architecture decisions without relying on implementation details or unsupported assumptions?**

If the answer is:

* **Yes** → proceed toward Architecture.
* **Yes, with risks** → proceed while explicitly carrying the risks.
* **No, but uncertainty is non-blocking** → record and continue cautiously.
* **No, because a critical domain decision is unresolved** → return to Domain Discovery.
* **No, because the bounded context itself is unclear** → revisit strategic DDD.

---

# 50. Final Principle

> **A domain model is a representation of meaningful business concepts, behavior, invariants, and consistency boundaries—not a technical design disguised as domain analysis.**

The model should be sufficiently precise to explain the domain and sufficiently independent to survive changes in frameworks, APIs, databases, deployment models, and implementation technologies.

Its value comes from improving shared understanding and enabling sound architectural decisions, not from maximizing the number of entities, diagrams, aggregates, or patterns.
