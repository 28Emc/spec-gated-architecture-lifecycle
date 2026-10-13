# C4 System Context

## 1. Document Metadata

| Field                     | Value                         |
| ------------------------- | ----------------------------- |
| Document Type             | C4 System Context             |
| Architecture Level        | C4 Level 1                    |
| Lifecycle Phase           | Architecture                  |
| Status                    | `DRAFT`                       |
| Version                   | `0.1`                         |
| Owner                     | `<owner>`                     |
| Created                   | `<date>`                      |
| Last Updated              | `<date>`                      |
| Architecture Context      | `<architecture-context>`      |
| Domain Boundary Review    | `<domain-boundary-review>`    |
| Product Discovery Summary | `<product-discovery-summary>` |

---

# 2. Purpose

This document defines the **C4 Level 1 System Context** for the system being architected.

It provides the highest-level architectural view of the system by showing:

* The system under design
* The people and actors interacting with it
* External systems interacting with it
* The meaningful relationships between them
* The business or operational purpose of those relationships
* Important architectural context surrounding the system

The System Context view establishes the boundary of the system before internal architectural structure is introduced.

---

# 3. Core Principle

> **The System Context diagram explains where the system exists and how it relates to its environment, not how the system is internally implemented.**

A System Context diagram should answer:

1. What is the system?
2. Who interacts with it?
3. Which external systems does it depend on?
4. Why do those interactions exist?
5. What responsibilities belong to the system?
6. What remains outside its boundary?

It should not answer:

* What containers exist?
* What components exist?
* Which database is used?
* Which framework is used?
* Which API endpoints exist?
* How services communicate internally?
* Where components are deployed?

Those concerns belong to later architecture views.

---

# 4. Entry Conditions

This artifact should be created after sufficient Architecture Context understanding exists.

Expected inputs:

* Architecture Context
* Product Context
* Product Scope
* Actors
* Significant Use Cases
* Requirements
* Quality Attributes
* Domain Boundary Review
* Bounded Contexts
* Context Map
* Architecture Constraints
* Architecture Risks
* Existing Architecture evidence where applicable

The System Context view must not compensate for unresolved fundamental domain or product uncertainty.

---

# 5. System Identity

```text
System ID:
<system-id>

System Name:
<system-name>

System Type:
<PRODUCT | PLATFORM | SERVICE | APPLICATION | SUBSYSTEM | OTHER>

Purpose:
<purpose>

Primary Responsibility:
<responsibility>

Business Context:
<context>

Current State:
<current state>

Target State:
<target state>
```

The system identity must be consistent with the Product and Architecture Context artifacts.

---

# 6. System Description

Provide a concise description of the system.

```text
The <System Name> is a <system type> that <primary responsibility>
for <actors/users/business area>, enabling <main outcome>.
```

The description should:

* Explain the system in business or operational terms.
* Avoid implementation details.
* Be understandable without knowledge of the codebase.
* Reflect the current or target architectural scope explicitly.

---

# 7. System Boundary

The System Context view must clearly distinguish:

```text
┌───────────────────────────────────────┐
│           SYSTEM UNDER DESIGN         │
│                                       │
│        <System Name>                  │
│                                       │
│        <Primary Responsibility>       │
│                                       │
└───────────────────────────────────────┘
```

Inside the boundary:

* Responsibilities owned by the system.
* Behavior explicitly within architectural scope.

Outside the boundary:

* External actors.
* External systems.
* Responsibilities explicitly owned elsewhere.

Do not infer the system boundary from:

* Repository structure.
* Current deployment.
* Team ownership.
* Database ownership.
* Existing API boundaries.

---

# 8. Primary Actors

Identify the primary actors interacting with the system.

| ID      | Actor     | Type                 | Goal     | Interaction     | Status     |
| ------- | --------- | -------------------- | -------- | --------------- | ---------- |
| ACT-001 | `<actor>` | `<HUMAN/ORG/SYSTEM>` | `<goal>` | `<interaction>` | `<status>` |

Actor types may include:

* Human
* Organization
* External system
* Automated actor
* Administrative actor
* Operational actor

The actor's business role must be distinguished from technical authorization.

Do not invent permissions or roles that have not been established.

---

# 9. Supporting Actors

Supporting actors may participate in system behavior without being the primary beneficiary.

| ID          | Actor     | Responsibility     | Interaction     | Dependency     |
| ----------- | --------- | ------------------ | --------------- | -------------- |
| ACT-SUP-001 | `<actor>` | `<responsibility>` | `<interaction>` | `<dependency>` |

Supporting actors should only be included when they materially affect system context.

---

# 10. External Systems

Identify external systems that interact with the system under design.

| ID      | External System | Responsibility     | Relationship     | Criticality     | Status     |
| ------- | --------------- | ------------------ | ---------------- | --------------- | ---------- |
| EXT-001 | `<system>`      | `<responsibility>` | `<relationship>` | `<criticality>` | `<status>` |

An external system remains external when:

* It has independent ownership.
* It has an independent responsibility.
* It is outside the system's architectural scope.
* It provides or consumes capabilities from the system.

---

# 11. External System Responsibility

For each external system, document its responsibility.

```text
External System:
<name>

Owns:
<responsibility>

Provides:
<capability/data/service>

Consumes:
<capability/data/service>

Why It Is External:
<reason>

Evidence:
<evidence>
```

The external system's responsibility should be expressed in domain or operational terms rather than technology terms.

---

# 12. System Context Relationships

Every significant relationship should have an explicit purpose.

```text
Source:
<actor/system>

Target:
<actor/system>

Relationship:
<relationship>

Purpose:
<purpose>

Information Exchanged:
<information>

Direction:
<INBOUND | OUTBOUND | BIDIRECTIONAL>

Criticality:
<LOW | MEDIUM | HIGH | CRITICAL>

Evidence:
<evidence>
```

A relationship represents meaningful interaction.

It does not necessarily represent:

* HTTP
* REST
* GraphQL
* Messaging
* RPC
* Database access
* Network connectivity

Those are implementation details for later architecture stages.

---

# 13. Relationship Naming

Relationship descriptions should communicate intent.

Prefer:

```text
Customer submits orders to Order Management System.
Order Management System requests payment authorization from Payment Provider.
Notification Provider sends delivery notifications to customers.
```

Avoid:

```text
Customer → POST /orders
System → Kafka
Service A → PostgreSQL
Frontend → Backend
```

The first form explains system context.

The second describes implementation.

---

# 14. System Context Diagram

The canonical representation should follow the C4 System Context model.

```text
                           ┌────────────────────┐
                           │      Actor A       │
                           │                    │
                           │ <business goal>    │
                           └─────────┬──────────┘
                                     │
                                     │ <relationship>
                                     ▼
                    ┌────────────────────────────────┐
                    │                                │
                    │        SYSTEM UNDER DESIGN     │
                    │                                │
                    │        <System Name>            │
                    │                                │
                    │        <Purpose>                 │
                    │                                │
                    └───────────────┬────────────────┘
                                    │
                       ┌────────────┴─────────────┐
                       │                          │
                       ▼                          ▼
              ┌────────────────┐        ┌────────────────┐
              │ External       │        │ External       │
              │ System A       │        │ System B       │
              │                │        │                │
              │ <responsibility>│       │ <responsibility>│
              └────────────────┘        └────────────────┘
```

The diagram should contain only:

* People/actors
* System under design
* External systems
* Meaningful relationships

---

# 15. Diagram Scope Rules

The System Context diagram must not contain:

* Containers
* Components
* Classes
* Databases
* Queues
* Topics
* Internal modules
* Internal APIs
* Infrastructure resources
* Cloud services used internally
* Deployment nodes
* Frameworks
* Programming languages

If an element is internal to the system under design, it belongs to a later C4 level.

---

# 16. System Context Narrative

The diagram must be accompanied by a short narrative.

```text
<System Name> is responsible for <responsibility>.

<Actor A> interacts with the system to <goal>.

<External System A> provides <capability> required for <purpose>.

<External System B> receives <information> from the system for <purpose>.

The system remains responsible for <responsibility>, while
<external system> remains responsible for <external responsibility>.
```

The narrative should explain relationships that are not obvious from the diagram.

---

# 17. Context Boundary Validation

Validate each element.

| Element     | Inside/Outside     | Reason     | Evidence     |
| ----------- | ------------------ | ---------- | ------------ |
| `<element>` | `<inside/outside>` | `<reason>` | `<evidence>` |

Questions:

* Does the system own this responsibility?
* Is the element independently governed?
* Does it have its own business responsibility?
* Is it external to the current architectural scope?
* Is it merely an internal implementation detail?

---

# 18. Actor vs External System Classification

Use the following distinction:

### Actor

An actor interacts with the system to pursue a goal or participate in behavior.

### External System

An external system provides or consumes capabilities/data through a system-to-system relationship.

An external system may act on behalf of an actor, but the two concepts should not be collapsed without justification.

```text
Actor:
<actor>

External System:
<system>

Relationship:
<relationship>

Reason for Distinction:
<reason>
```

---

# 19. External Dependency Criticality

Classify external dependencies.

| Dependency     | Criticality | Failure Impact | Business Impact | Recovery Expectation |
| -------------- | ----------- | -------------- | --------------- | -------------------- |
| `<dependency>` | `<level>`   | `<impact>`     | `<impact>`      | `<expectation>`      |

Possible criticality:

* `LOW`
* `MEDIUM`
* `HIGH`
* `CRITICAL`
* `UNKNOWN`

Do not invent availability or recovery targets.

---

# 20. External Dependency Failure

For important dependencies, record the architectural consequence of failure.

```text
Dependency:
<dependency>

Normal Role:
<role>

Failure:
<failure condition>

System Impact:
<impact>

Business Impact:
<impact>

Known Recovery Behavior:
<behavior>

Unknown:
<unknown>

Architectural Concern:
<concern>
```

This does not define the resilience implementation yet.

---

# 21. Trust Boundaries

Show trust boundaries when they are meaningful at system-context level.

Examples:

```text
Public User
     │
     │ trust boundary
     ▼
System Under Design
     │
     │ external organization boundary
     ▼
External System
```

Record:

```text
Trust Boundary:
<boundary>

Actors/Systems:
<elements>

Trust Difference:
<difference>

Security Relevance:
<relevance>

Evidence:
<evidence>
```

Do not clutter the System Context diagram with detailed security mechanisms.

---

# 22. Security-Relevant Relationships

Identify relationships that require later security analysis.

| Relationship     | Protected Asset | Security Concern | Priority     |
| ---------------- | --------------- | ---------------- | ------------ |
| `<relationship>` | `<asset>`       | `<concern>`      | `<priority>` |

Examples:

* User submits sensitive information.
* External organization sends authoritative information.
* System exposes data to an external service.
* Administrative actor performs privileged actions.

---

# 23. Domain Alignment

The System Context must remain aligned with Domain Discovery.

For each important system responsibility:

```text
System Responsibility:
<responsibility>

Bounded Context:
<context>

Domain Capability:
<capability>

Reason for Mapping:
<reason>

Confidence:
<HIGH | MEDIUM | LOW>
```

The System Context does not redefine bounded contexts.

It represents their architectural relevance at system level.

---

# 24. Cross-Context Visibility

Only expose domain relationships that are relevant to system context.

```text
Domain Relationship:
<relationship>

Architectural Relevance:
<relevance>

Externalized:
<yes/no/unknown>

Reason:
<reason>
```

Do not expose every internal domain relationship in the C4 Level 1 diagram.

---

# 25. Quality Attribute Context

Identify quality attributes that materially affect system-level relationships.

| Quality Attribute | Contextual Concern | Affected Relationship | Importance   |
| ----------------- | ------------------ | --------------------- | ------------ |
| `<attribute>`     | `<concern>`        | `<relationship>`      | `<priority>` |

Examples:

* Availability of external dependency.
* Security of public interaction.
* Performance of a critical actor interaction.
* Reliability of an external integration.

Detailed quality scenarios belong in architecture and contract artifacts.

---

# 26. Contextual Constraints

Record constraints affecting the System Context.

```text
Constraint:
<constraint>

Source:
<source>

Affected Element:
<element>

Strength:
<MANDATORY | PREFERRED | INFORMATIONAL>

Architectural Effect:
<effect>
```

Do not transform architectural preferences into mandatory constraints.

---

# 27. Existing System Context

For existing systems, distinguish three views.

### Documented Context

What existing documentation claims.

### Actual Context

What current behavior and evidence demonstrate.

### Target Context

What the system should become.

```text
Documented Context:
<description>

Actual Context:
<description>

Target Context:
<description>

Differences:
<differences>

Evidence:
<evidence>
```

---

# 28. Context Drift

Identify differences between documented and actual system context.

| Element     | Documented | Actual    | Target    | Drift           |
| ----------- | ---------- | --------- | --------- | --------------- |
| `<element>` | `<state>`  | `<state>` | `<state>` | `<description>` |

Context drift should be explicitly tracked.

Do not silently update historical architecture documentation as though the documented state had always been correct.

---

# 29. System Evolution Context

For system evolution:

```text
Current System:
<system>

Changed Boundary:
<boundary>

Preserved Boundary:
<boundary>

New Actor:
<actor>

Removed Actor:
<actor>

New External System:
<system>

Removed Dependency:
<dependency>

Migration Concern:
<concern>
```

Evolution should focus on the actual change boundary.

The entire system context does not need to be redesigned when the change is local.

---

# 30. Context Risks

Record risks specific to the system context.

| ID               | Risk     | Affected Element | Impact     | Likelihood     | Mitigation     |
| ---------------- | -------- | ---------------- | ---------- | -------------- | -------------- |
| RISK-CONTEXT-001 | `<risk>` | `<element>`      | `<impact>` | `<likelihood>` | `<mitigation>` |

Typical risks:

* Incorrect system boundary.
* Missing external actor.
* Missing external dependency.
* Incorrect ownership.
* Hidden integration.
* Ambiguous responsibility.
* Unrecognized trust boundary.
* Overly broad system scope.
* Overly narrow system scope.

---

# 31. Context Unknowns

```text
ID:
<unknown>

Question:
<question>

Why It Matters:
<reason>

Affected Element:
<element>

Impact:
<LOW | MEDIUM | HIGH | CRITICAL>

Blocking:
<NON_BLOCKING | DECISION_RELEVANT | GATE_BLOCKING>

Resolution:
<method>

Status:
<OPEN | ANALYZING | RESOLVED | DEFERRED>
```

Unknowns should remain explicit.

Never replace uncertainty with fabricated external systems, actors, responsibilities, or dependencies.

---

# 32. Context Assumptions

```text
ID:
<assumption>

Assumption:
<statement>

Evidence:
<evidence>

Confidence:
<HIGH | MEDIUM | LOW>

Impact If False:
<impact>

Affected Relationships:
<relationships>

Validation Method:
<method>

Status:
<status>
```

Critical assumptions should be validated before architecture decisions depend on them.

---

# 33. Context Decisions

Only explicit architecture decisions should appear here.

```text
Decision ID:
<ADR-ID>

Decision:
<decision>

Context:
<context>

Rationale:
<rationale>

Affected Elements:
<elements>

Status:
<status>
```

Recommendations must not be recorded as decisions.

If a decision is still open, record it as an architecture decision candidate instead.

---

# 34. Context Decision Candidates

| ID              | Decision Question | Reason     | Impact     | Reversibility | Status     |
| --------------- | ----------------- | ---------- | ---------- | ------------- | ---------- |
| DEC-CONTEXT-001 | `<question>`      | `<reason>` | `<impact>` | `<level>`     | `<status>` |

Examples:

* Whether an external capability belongs inside or outside system scope.
* Whether a dependency is authoritative.
* Whether two externally interacting responsibilities should remain within the same system.
* Whether an integration requires a separate architectural boundary.

---

# 35. Context Alternatives

Where system boundary or external responsibility is ambiguous, document alternatives.

```text
Concern:
<concern>

Option A:
<boundary/relationship>

Option B:
<boundary/relationship>

Option C:
<boundary/relationship>

Evaluation Criteria:
<criteria>

Trade-offs:
<trade-offs>

Recommendation:
<recommendation>

Decision:
<decision status>
```

The recommendation must remain separate from the final decision.

---

# 36. Traceability

The System Context should trace to previous lifecycle artifacts.

Recommended relationships:

```text
Product Outcome
      ↓
Requirement
      ↓
Actor / Use Case
      ↓
Domain Capability
      ↓
Bounded Context
      ↓
System Responsibility
      ↓
System Context Relationship
```

Possible relationship types:

* `DERIVES_FROM`
* `REALIZES`
* `SUPPORTS`
* `EXPOSES`
* `DEPENDS_ON`
* `CONSTRAINS`
* `PROTECTS`
* `INFLUENCES`
* `VERIFIES`

---

# 37. Traceability Register

| Source       | Target      | Relationship     | Evidence     | Status     |
| ------------ | ----------- | ---------------- | ------------ | ---------- |
| `<artifact>` | `<element>` | `<relationship>` | `<evidence>` | `<status>` |

Traceability status:

* `VALID`
* `INFERRED`
* `MISSING`
* `STALE`
* `CONFLICTING`
* `SUPERSEDED`
* `UNKNOWN`

---

# 38. System Context Validation Scenarios

Validate the context using representative interactions.

```text
Scenario:
<scenario>

Actor:
<actor>

External System:
<system if applicable>

System:
<system>

Expected Interaction:
<interaction>

Boundary Correct:
<yes/no/unknown>

Relationship Correct:
<yes/no/unknown>

Evidence:
<evidence>
```

Scenarios should validate whether the diagram reflects actual meaningful system interactions.

---

# 39. Context Completeness

Completeness must be evaluated semantically, not by counting diagram elements.

Evaluate:

| Area             | Status     | Findings     |
| ---------------- | ---------- | ------------ |
| System identity  | `<status>` | `<findings>` |
| System boundary  | `<status>` | `<findings>` |
| Actors           | `<status>` | `<findings>` |
| External systems | `<status>` | `<findings>` |
| Relationships    | `<status>` | `<findings>` |
| Domain alignment | `<status>` | `<findings>` |
| Trust boundaries | `<status>` | `<findings>` |
| Quality concerns | `<status>` | `<findings>` |
| Existing state   | `<status>` | `<findings>` |
| Risks            | `<status>` | `<findings>` |
| Unknowns         | `<status>` | `<findings>` |
| Traceability     | `<status>` | `<findings>` |

---

# 40. Review Findings

Record findings discovered during review.

| ID       | Finding     | Severity     | Evidence     | Affected Element | Resolution     |
| -------- | ----------- | ------------ | ------------ | ---------------- | -------------- |
| FIND-001 | `<finding>` | `<severity>` | `<evidence>` | `<element>`      | `<resolution>` |

Severity:

* `INFO`
* `WARNING`
* `SIGNIFICANT`
* `BLOCKING`

---

# 41. Architecture Handoff to Container Architecture

The System Context should provide a controlled handoff to the next C4 level.

```text
System:
<system>

Confirmed System Boundary:
<boundary>

Confirmed Responsibilities:
<responsibilities>

Actors:
<actors>

External Systems:
<systems>

External Relationships:
<relationships>

Important Quality Drivers:
<drivers>

Important Constraints:
<constraints>

Trust Boundaries:
<boundaries>

Known Risks:
<risks>

Open Questions:
<questions>

Container-Level Questions:
- What major internal responsibilities require architectural separation?
- Which domain boundaries need explicit representation?
- Which quality attributes influence container boundaries?
- Which integrations require internal coordination?
- Which data responsibilities require architectural isolation?
- Which boundaries are justified by change, ownership, consistency, or risk?
```

The Container view must elaborate the System Context.

It must not contradict the established system boundary without an explicit architecture decision.

---

# 42. C4 Level 1 Review Checklist

### System

* [ ] The system under design is clearly identified.
* [ ] Its purpose is understandable without implementation knowledge.
* [ ] Its boundary is explicit.

### Actors

* [ ] Primary actors are identified.
* [ ] Supporting actors are identified where relevant.
* [ ] Actor goals are understood.
* [ ] Roles and technical permissions have not been invented.

### External Systems

* [ ] Significant external systems are identified.
* [ ] Their responsibilities are understood.
* [ ] Their ownership is understood where relevant.
* [ ] External dependencies are not confused with internal components.

### Relationships

* [ ] Every significant relationship has a meaningful purpose.
* [ ] Relationships are expressed in business/operational terms.
* [ ] Direction is clear where relevant.
* [ ] Critical dependencies are identified.

### Domain Alignment

* [ ] System responsibilities align with domain responsibilities.
* [ ] Bounded contexts have not been converted automatically into services.
* [ ] Domain boundaries are preserved.

### Security

* [ ] Important trust boundaries are identified.
* [ ] Security-sensitive relationships are visible.
* [ ] Protected assets are known where relevant.

### Existing Systems

* [ ] Documented and actual context are distinguished.
* [ ] Target context is explicit.
* [ ] Context drift is recorded.

### Architecture Hygiene

* [ ] No containers appear in the System Context diagram.
* [ ] No components appear in the diagram.
* [ ] No database technology appears.
* [ ] No framework or programming language appears.
* [ ] No deployment topology appears.
* [ ] No implementation protocol is required to understand the context.

---

# 43. Gate Contribution

```text
C4 System Context Status:
<READY | READY_WITH_RISKS | INCOMPLETE | BLOCKED>

System Boundary:
<CLEAR | PARTIAL | UNCLEAR>

Actor Understanding:
<HIGH | MEDIUM | LOW>

External System Understanding:
<HIGH | MEDIUM | LOW>

Relationship Understanding:
<HIGH | MEDIUM | LOW>

Domain Alignment:
<HIGH | MEDIUM | LOW>

Security Context:
<HIGH | MEDIUM | LOW | NOT_RELEVANT>

Traceability:
<HEALTHY | DEGRADED | BROKEN>

Blocking Findings:
<findings>

Gate Recommendation:
<READY | READY_WITH_RISKS | NOT_READY>
```

Passing this gate means that the system's external context is sufficiently understood to begin designing its internal architectural structure.

It does not mean that the architecture itself is complete.

---

# 44. Compact System Context Register

```text
System:
<system>

Purpose:
<purpose>

Boundary:
<boundary>

Primary Actors:
<actors>

External Systems:
<systems>

Critical Relationships:
<relationships>

Quality Drivers:
<drivers>

Trust Boundaries:
<boundaries>

Major Constraints:
<constraints>

Major Risks:
<risks>

Major Unknowns:
<unknowns>

Open Decisions:
<decisions>

C4 Context Status:
<status>
```

This register may be used by agents when the complete document is unnecessary for immediate reasoning.

---

# 45. Agent Instructions

When creating or reviewing a C4 System Context:

1. Identify the system under design.
2. Establish its boundary from evidence.
3. Identify meaningful actors.
4. Identify meaningful external systems.
5. Describe responsibilities rather than technologies.
6. Describe relationships by business or operational purpose.
7. Preserve domain boundaries.
8. Distinguish actors from external systems.
9. Identify significant external dependencies.
10. Identify meaningful trust boundaries.
11. Distinguish current, actual, documented, and target context when applicable.
12. Record uncertainty explicitly.
13. Do not invent actors or external systems.
14. Do not infer microservices from bounded contexts.
15. Do not introduce containers into the Level 1 diagram.
16. Do not introduce databases into the Level 1 diagram.
17. Do not introduce frameworks or infrastructure into the Level 1 diagram.
18. Do not turn relationships into implementation protocols prematurely.
19. Trace important context elements to domain/product evidence.
20. Record risks and decision candidates.
21. Escalate contradictions instead of silently resolving them.
22. Keep the diagram readable and semantically meaningful.
23. Proceed to Container Architecture only when the system context is sufficiently stable.

---

# 46. Anti-Patterns

## Container Leakage

Showing internal containers in a System Context diagram.

## Database Leakage

Representing internal databases as external systems merely because they are separate technologies.

## Technology Leakage

Including frameworks, programming languages, cloud products, protocols, or deployment infrastructure.

## Endpoint Modeling

Representing REST endpoints or API operations as System Context relationships.

## Actor Explosion

Including every possible user or organizational role without meaningful architectural relevance.

## External-System Explosion

Treating every library, infrastructure service, or internal dependency as an external system.

## Boundary by Repository

Assuming repository structure defines system ownership.

## Boundary by Deployment

Assuming every deployment unit represents a distinct system.

## Boundary by Team

Assuming organizational ownership automatically defines architectural ownership.

## Microservice Projection

Turning every bounded context into an external system or independent service.

## Context Diagram as Architecture

Treating the Level 1 diagram as a complete architecture.

## Diagram-First Reasoning

Drawing elements first and inventing their rationale afterward.

## Missing Relationship Semantics

Showing arrows without explaining why the interaction exists.

## Legacy Worship

Treating the existing System Context as automatically correct.

## False Completeness

Assuming the context is complete because the diagram looks visually finished.

## Unsupported Precision

Inventing performance, availability, traffic, dependency, or operational characteristics.

## Silent Boundary Changes

Changing system scope without recording the architectural reasoning.

---

# 47. Safe Progression Question

Before proceeding to C4 Container Architecture:

> **Does the System Context accurately establish the system under design, its boundary, meaningful actors, external systems, relationships, domain alignment, trust boundaries, major constraints, and architectural drivers well enough to reason about the system's internal structure without redefining the problem?**

If:

* **Yes** → proceed to Container Architecture.
* **Yes, with risks** → proceed while carrying the risks explicitly.
* **No, because an external relationship is unclear** → resolve the context uncertainty.
* **No, because system responsibility is unclear** → revisit Architecture Context or Domain Discovery.
* **No, because the boundary itself is disputed** → do not proceed to detailed C4 until the boundary is resolved or explicitly accepted as an architectural decision.

---

# 48. Final Principle

> **C4 Level 1 establishes the system in its environment before explaining the structure inside it.**

The System Context view is the architectural bridge between:

```text
Domain Understanding
        ↓
Architecture Context
        ↓
C4 System Context
        ↓
C4 Container Architecture
        ↓
C4 Component Architecture
```

Its purpose is to make the system boundary and external relationships explicit.

It should remain intentionally simple.

A good System Context diagram does not demonstrate architectural sophistication through detail.

It demonstrates architectural clarity through **correct boundaries, meaningful relationships, explicit responsibilities, and traceable reasoning**.
