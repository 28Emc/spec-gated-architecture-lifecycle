# Architecture Context

## 1. Document Metadata

| Field                          | Value                           |
| ------------------------------ | ------------------------------- |
| Document Type                  | Architecture Context            |
| Lifecycle Phase                | Architecture                    |
| Scope                          | System / Architecture Landscape |
| Status                         | `DRAFT`                         |
| Version                        | `0.1`                           |
| Owner                          | `<owner>`                       |
| Created                        | `<date>`                        |
| Last Updated                   | `<date>`                        |
| Related Product Context        | `<product-context>`             |
| Related Domain Boundary Review | `<domain-boundary-review>`      |
| Related Context Map            | `<context-map>`                 |
| Related C4 Context             | `<c4-context>`                  |

---

# 2. Purpose

This document establishes the architectural context of the system before detailed architecture modeling begins.

It translates established product and domain understanding into an initial architectural view covering:

* System boundaries
* External actors
* External systems
* Architectural responsibilities
* Major architectural drivers
* System-level quality attributes
* Trust boundaries
* Integration landscape
* Current architectural state
* Target architectural state
* Major architectural constraints
* Significant architectural risks
* Architecture-relevant unknowns
* Initial architecture concerns

This artifact prepares the project for detailed C4 modeling and architecture decisions.

It must not prematurely define implementation details.

---

# 3. Core Principle

> **Architecture begins by establishing what the system must protect, expose, depend on, and guarantee—not by selecting technologies.**

Architecture should preserve:

* Product intent
* Domain boundaries
* Domain responsibilities
* Business invariants
* Quality attributes
* Security expectations
* Data ownership
* Integration semantics

Technology selection comes after the relevant architectural problem is understood.

---

# 4. Architecture Entry Conditions

Architecture should begin only after sufficient domain understanding exists.

Expected inputs include:

* Product Discovery Summary
* Product scope
* Requirements
* Quality attributes
* Business rules
* Significant use cases
* Domain capabilities
* Domain processes
* Bounded contexts
* Domain model
* Domain events
* Context Map
* Domain Boundary Review
* Relevant product and domain decisions
* Known constraints
* Known risks
* Important assumptions and unknowns

For existing systems, also include:

* Current architecture evidence
* Current runtime behavior
* Existing integrations
* Existing contracts
* Existing deployment information where relevant
* Current operational constraints

If critical domain uncertainty remains, Architecture must not silently resolve it.

---

# 5. Architecture Objectives

The architecture phase should establish:

1. What system boundary exists.
2. Which actors and external systems interact with it.
3. Which responsibilities belong inside the system.
4. Which responsibilities remain external.
5. Which domain boundaries must be preserved.
6. Which quality attributes drive architectural choices.
7. Which dependencies are unavoidable.
8. Which integrations require explicit contracts.
9. Which architectural constraints exist.
10. Which architectural risks require decisions.
11. Which architecture views are required.
12. Which questions must be resolved before implementation.

---

# 6. Architecture Scope

```text id="k6s2xm"
System:
<system>

Architectural Scope:
<scope>

Included:
- <area>

Excluded:
- <area>

Current State:
<description>

Target State:
<description>

Transition State:
<description>

Architecture Objective:
<objective>
```

Architecture scope must remain aligned with Product Scope and Domain Boundary Review.

---

# 7. Architecture Drivers

Architecture decisions should be driven by explicit forces.

Typical drivers include:

* Functional requirements
* Quality attributes
* Security
* Privacy
* Reliability
* Availability
* Scalability
* Performance
* Maintainability
* Operability
* Integration requirements
* Data ownership
* Regulatory requirements
* Delivery constraints
* Existing-system constraints
* Migration requirements
* Cost constraints
* Organizational constraints

Record significant drivers:

| ID      | Driver     | Source     | Importance          | Architectural Impact |
| ------- | ---------- | ---------- | ------------------- | -------------------- |
| DRV-001 | `<driver>` | `<source>` | `<HIGH/MEDIUM/LOW>` | `<impact>`           |

Do not invent architectural drivers merely because they are common industry concerns.

---

# 8. System Boundary

Define what belongs to the system being architected.

```text id="u4x8qa"
System:
<name>

Inside Boundary:
- <responsibility>

Outside Boundary:
- <responsibility>

Boundary Rationale:
<reason>

Evidence:
<evidence>
```

The system boundary must be based on:

* Product scope
* Domain responsibility
* Ownership
* External dependencies
* Business authority

It should not be defined merely by:

* Repository boundaries
* Existing server boundaries
* Deployment boundaries
* Team boundaries

---

# 9. System Responsibilities

List major responsibilities assigned to the system.

| ID      | Responsibility     | Domain Source         | System Scope | Priority     | Status     |
| ------- | ------------------ | --------------------- | ------------ | ------------ | ---------- |
| SYS-001 | `<responsibility>` | `<domain capability>` | `<scope>`    | `<priority>` | `<status>` |

A system responsibility should be meaningful at architectural level.

Avoid converting every domain operation into a separate system responsibility.

---

# 10. External Actors

Identify actors interacting with the system boundary.

| ID      | Actor     | Type                 | Goal     | Interaction     | Trust Level | Status     |
| ------- | --------- | -------------------- | -------- | --------------- | ----------- | ---------- |
| ACT-001 | `<actor>` | `<HUMAN/SYSTEM/ORG>` | `<goal>` | `<interaction>` | `<level>`   | `<status>` |

Actors may include:

* End users
* Administrators
* Operators
* External organizations
* External systems acting on behalf of users
* Regulatory entities
* Supporting systems

Do not invent actor permissions that were not established during Product or Domain Discovery.

---

# 11. External Systems

Identify systems outside the architectural boundary.

| ID      | External System | Responsibility     | Interaction     | Direction     | Criticality     | Status     |
| ------- | --------------- | ------------------ | --------------- | ------------- | --------------- | ---------- |
| EXT-001 | `<system>`      | `<responsibility>` | `<interaction>` | `<direction>` | `<criticality>` | `<status>` |

For each external system, determine:

* Why it exists
* What the system depends on
* What the external system depends on
* What information crosses the boundary
* What business responsibility remains external
* What happens if the dependency is unavailable

---

# 12. External Dependency Classification

Classify dependencies.

Possible categories:

* `IDENTITY`
* `PAYMENT`
* `COMMUNICATION`
* `DATA`
* `INTEGRATION`
* `REGULATORY`
* `ANALYTICS`
* `SEARCH`
* `STORAGE`
* `INFRASTRUCTURE`
* `OTHER`
* `UNKNOWN`

Classification must remain technology-agnostic unless a technology is already an explicit constraint.

---

# 13. System Context View

Provide a high-level system context representation.

```text id="w2p7nr"
                  ┌──────────────────┐
                  │   External       │
                  │      Actor       │
                  └────────┬─────────┘
                           │
                           ▼
                  ┌──────────────────┐
                  │                  │
                  │      SYSTEM      │
                  │                  │
                  │  Core Scope      │
                  │                  │
                  └────────┬─────────┘
                           │
             ┌─────────────┴─────────────┐
             ▼                           ▼
    ┌────────────────┐          ┌────────────────┐
    │ External       │          │ External       │
    │ System A       │          │ System B       │
    └────────────────┘          └────────────────┘
```

The diagram should show:

* System boundary
* Actors
* External systems
* Meaningful relationships
* High-level responsibilities

It should not yet show:

* Internal containers
* Databases
* Frameworks
* Deployment topology
* Internal APIs

---

# 14. System Context Relationship

For each external interaction:

```text id="a7k5qx"
Source:
<actor/system>

Target:
<system>

Relationship:
<relationship>

Business Purpose:
<purpose>

Information:
<information>

Direction:
<direction>

Criticality:
<criticality>

Failure Impact:
<impact>

Evidence:
<evidence>
```

Relationships should describe meaningful interaction rather than simply network connectivity.

---

# 15. Trust Boundaries

Identify important trust boundaries.

A trust boundary represents a meaningful change in:

* Trust level
* Authority
* Ownership
* Security responsibility
* Data sensitivity
* External exposure

```text id="r8w2km"
Boundary:
<boundary>

Inside:
<scope>

Outside:
<scope>

Trust Difference:
<difference>

Sensitive Data:
<data>

Authority Difference:
<difference>

Security Implication:
<implication>

Evidence:
<evidence>
```

Do not design authentication or authorization mechanisms here unless required to understand the architectural boundary.

---

# 16. Security-Relevant Architecture Boundaries

Identify boundaries that require explicit security analysis.

Examples:

* Public vs private
* User vs administrator
* Internal vs external system
* Trusted vs untrusted environment
* Sensitive vs non-sensitive data
* Cross-organization interaction

```text id="c5n1yd"
Boundary:
<boundary>

Threat or Concern:
<concern>

Protected Asset:
<asset>

Trust Difference:
<difference>

Architectural Consequence:
<consequence>

Related Security Requirement:
<requirement>
```

Detailed security architecture belongs to the appropriate contract and architecture artifacts.

---

# 17. Domain-to-Architecture Mapping

Map established domain boundaries to initial architectural responsibility.

| Domain Element      | Domain Responsibility | Architectural Responsibility    | Mapping Status |
| ------------------- | --------------------- | ------------------------------- | -------------- |
| `<bounded context>` | `<responsibility>`    | `<architecture responsibility>` | `<status>`     |

Important:

This is a responsibility mapping, not yet a microservice mapping.

Possible architectural representations include:

* Module
* Container
* Component
* Service
* Monolith subsystem
* External dependency
* Other

The representation should remain undecided where evidence is insufficient.

---

# 18. Architectural Boundary Candidates

Identify potential architecture boundaries.

```text id="m8q3tf"
Candidate:
<boundary>

Domain Basis:
<domain evidence>

Responsibility:
<responsibility>

Quality Attribute Driver:
<driver>

Integration Driver:
<driver>

Data Ownership:
<ownership>

Change Boundary:
<change boundary>

Current Representation:
<current>

Target Representation:
<target>

Confidence:
<HIGH | MEDIUM | LOW>

Status:
<PROPOSED | ACCEPTED | UNKNOWN>
```

A candidate is not automatically an architectural decision.

---

# 19. Architectural Responsibilities

Identify responsibilities that architecture must organize.

Examples:

* Domain behavior execution
* External integration
* Identity handling
* Data persistence
* Event publication
* Query access
* Scheduling
* Workflow coordination
* Observability
* Configuration
* Security enforcement

These should be expressed at the appropriate abstraction level.

---

# 20. Quality Attribute Drivers

Map important quality attributes to architectural concerns.

| Quality Attribute | Requirement     | Architectural Concern | Priority     |
| ----------------- | --------------- | --------------------- | ------------ |
| `<attribute>`     | `<requirement>` | `<concern>`           | `<priority>` |

Examples:

```text id="m7v4cs"
Availability
    ↓
Failure isolation
    ↓
Dependency strategy

Scalability
    ↓
Load distribution
    ↓
Boundary design

Maintainability
    ↓
Change isolation
    ↓
Module/container boundaries
```

These are conceptual relationships, not predefined solutions.

---

# 21. Architectural Scenarios

Translate significant quality requirements into architecture-relevant scenarios.

```text id="s5n8kp"
Scenario:
<scenario>

Source:
<quality requirement>

Stimulus:
<stimulus>

Environment:
<environment>

Expected Response:
<response>

Response Measure:
<measure if defined>

Architectural Impact:
<impact>

Verification:
<method>
```

Do not invent numerical targets.

If a measurable target has not been established, record the scenario qualitatively.

---

# 22. Integration Landscape

Summarize meaningful interactions.

| Integration | Source     | Target     | Business Purpose | Criticality     | Contract Needed    |
| ----------- | ---------- | ---------- | ---------------- | --------------- | ------------------ |
| INT-001     | `<source>` | `<target>` | `<purpose>`      | `<criticality>` | `<yes/no/unknown>` |

This is an architectural overview.

Detailed API/event/data contracts belong to the Contracts phase.

---

# 23. Integration Characteristics

For each significant integration, record known characteristics.

```text id="q1w7hc"
Integration:
<integration>

Interaction Type:
<SYNCHRONOUS | ASYNCHRONOUS | BATCH | FILE | UNKNOWN>

Direction:
<direction>

Business Criticality:
<criticality>

Failure Sensitivity:
<impact>

Consistency Expectation:
<expectation>

Availability Dependency:
<dependency>

Latency Sensitivity:
<LOW/MEDIUM/HIGH/UNKNOWN>

Evidence:
<evidence>
```

Do not select protocols prematurely.

---

# 24. Data Architecture Context

At this stage, identify semantic data responsibilities rather than physical storage.

For important data:

```text id="b9k3xa"
Data Concept:
<concept>

Semantic Owner:
<context/system>

Consumers:
<consumers>

Sensitivity:
<level>

Lifecycle:
<lifecycle>

Consistency Requirement:
<requirement>

Retention Requirement:
<known/unknown>

Architectural Concern:
<concern>
```

Do not choose:

* SQL vs NoSQL
* Database engine
* Sharding
* Replication topology
* Storage vendor

unless they are already explicit constraints or decisions.

---

# 25. Data Ownership

Data ownership should align with domain responsibility where possible.

Evaluate:

* Who defines meaning?
* Who can modify authoritative state?
* Who consumes derived information?
* Who owns lifecycle?
* Who is responsible for integrity?

```text id="d3w6vy"
Data:
<data>

Authoritative Owner:
<owner>

Consumers:
<consumers>

Derived Copies:
<copies>

Synchronization:
<known/unknown>

Risk:
<risk>
```

---

# 26. Architectural Constraints

Record constraints that limit architectural options.

| ID          | Constraint     | Source     | Strength                | Impact     |
| ----------- | -------------- | ---------- | ----------------------- | ---------- |
| ARC-CON-001 | `<constraint>` | `<source>` | `<MANDATORY/PREFERRED>` | `<impact>` |

Potential categories:

* Existing technology
* Regulatory
* Organizational
* Security
* Data
* Integration
* Platform
* Compatibility
* Cost
* Delivery
* Migration
* Operational

Do not create constraints from preferences.

---

# 27. Existing Architecture

For an existing system, document the current architecture independently from the target architecture.

```text id="t4v8pc"
Current Architecture:
<description>

Current Responsibilities:
<responsibilities>

Current Boundaries:
<boundaries>

Current Integrations:
<integrations>

Current Data Ownership:
<ownership>

Known Strengths:
<strengths>

Known Weaknesses:
<weaknesses>

Evidence:
<evidence>
```

Current architecture is evidence, not automatically the target architecture.

---

# 28. Actual vs Documented Architecture

For existing systems, distinguish:

### Documented Architecture

What architecture documentation claims.

### Actual Architecture

What implementation, runtime behavior, deployment, contracts, and operational evidence demonstrate.

### Target Architecture

What the intended system should become.

```text id="z7m3qa"
Documented:
<description>

Actual:
<description>

Target:
<description>

Differences:
<differences>

Confidence:
<confidence>
```

When documented and actual architecture conflict, the difference must be explicit.

---

# 29. Target Architecture Context

Describe the target architecture at a high level.

```text id="e2r6wh"
Target System Boundary:
<boundary>

Target Responsibilities:
<responsibilities>

Target External Relationships:
<relationships>

Target Domain Boundaries:
<boundaries>

Target Quality Attributes:
<attributes>

Target Migration Characteristics:
<characteristics>

Known Uncertainties:
<uncertainties>
```

Do not prematurely define detailed components.

---

# 30. Architecture Evolution

For evolving systems:

```text id="k9x1vd"
Current:
<architecture>

Target:
<architecture>

Transition:
<architecture>

Major Changes:
- <change>

Preserved Elements:
- <element>

Deprecated Elements:
- <element>

Migration Constraints:
- <constraint>

Migration Risks:
- <risk>
```

Architecture evolution should preserve domain semantics established earlier.

---

# 31. Architecture Risks

Identify major architectural risks before detailed design.

Examples:

* Unclear boundary
* Strong coupling
* External dependency
* Data ownership ambiguity
* Security exposure
* Performance uncertainty
* Availability dependency
* Migration complexity
* Legacy constraint
* Contract instability
* Operational complexity

| ID           | Risk     | Driver     | Impact     | Likelihood     | Reversibility | Mitigation     |
| ------------ | -------- | ---------- | ---------- | -------------- | ------------- | -------------- |
| RISK-ARC-001 | `<risk>` | `<driver>` | `<impact>` | `<likelihood>` | `<level>`     | `<mitigation>` |

---

# 32. Architecture Unknowns

Record unresolved questions that materially affect architecture.

| ID          | Unknown      | Why It Matters | Impact     | Blocking   | Resolution |
| ----------- | ------------ | -------------- | ---------- | ---------- | ---------- |
| UNK-ARC-001 | `<question>` | `<reason>`     | `<impact>` | `<yes/no>` | `<method>` |

Examples:

* Required availability is unknown.
* External system limits are unknown.
* Data ownership is disputed.
* Integration consistency requirement is unknown.
* Migration constraints are unknown.

Do not resolve architecture unknowns through unsupported assumptions.

---

# 33. Architecture Assumptions

```text id="y5p3fs"
ID:
Assumption:
Reason:
Evidence:
Confidence:
Impact If False:
Affected Architecture Elements:
Validation Method:
Status:
```

Critical assumptions must be validated before architecture decisions depending on them are finalized.

---

# 34. Architecture Concerns

Maintain a list of concerns requiring detailed analysis.

| ID           | Concern     | Driver     | Scope     | Priority     | Related Artifact |
| ------------ | ----------- | ---------- | --------- | ------------ | ---------------- |
| CONC-ARC-001 | `<concern>` | `<driver>` | `<scope>` | `<priority>` | `<artifact>`     |

Possible concerns:

* Boundary design
* Integration
* Data ownership
* Security
* Reliability
* Scalability
* Performance
* Observability
* Migration
* Deployment
* Failure isolation
* Consistency
* Operational complexity

---

# 35. Architecture Alternatives

Where a significant architecture concern has multiple viable approaches, record the alternatives without silently selecting one.

```text id="v4c8qm"
Concern:
<concern>

Option A:
<description>

Option B:
<description>

Option C:
<description>

Evaluation Criteria:
- <criterion>

Trade-offs:
<comparison>

Recommendation:
<recommendation>

Decision Status:
<status>
```

Recommendations are not decisions.

Formal decisions should be captured through Architecture Decision Records.

---

# 36. Architecture Principles

Record project-specific principles that materially constrain architecture.

Examples:

* Preserve bounded-context integrity.
* Prefer explicit ownership.
* Minimize unnecessary coupling.
* Prefer reversible decisions where practical.
* Avoid premature distribution.
* Optimize for required quality attributes.
* Keep operational complexity proportional to system needs.

Each principle should include evidence or authority.

```text id="j8s2nf"
Principle:
<principle>

Source:
<source>

Scope:
<scope>

Implication:
<implication>

Exceptions:
<exceptions>
```

Do not introduce generic principles merely for documentation completeness.

---

# 37. Architecture Decision Candidates

Identify questions likely to require ADRs.

| ID          | Decision Question | Driver     | Impact     | Reversibility | Status     |
| ----------- | ----------------- | ---------- | ---------- | ------------- | ---------- |
| DEC-ARC-001 | `<question>`      | `<driver>` | `<impact>` | `<level>`     | `<status>` |

Examples:

* Modular monolith vs distributed architecture
* Service boundary
* Communication style
* Data ownership strategy
* Consistency model
* External integration strategy
* Deployment isolation
* Security boundary
* Migration strategy

These are candidates, not decisions.

---

# 38. Architecture-to-Domain Traceability

Architecture elements must trace back to domain evidence.

Recommended chain:

```text id="n4x7bz"
Product Outcome
      ↓
Requirement
      ↓
Domain Capability
      ↓
Bounded Context
      ↓
Domain Model
      ↓
Domain Constraint / Invariant
      ↓
Architecture Responsibility
      ↓
Architecture Element
```

Possible relationships:

* `DERIVES_FROM`
* `REALIZES`
* `PRESERVES`
* `CONSTRAINS`
* `PROTECTS`
* `DEPENDS_ON`
* `INFLUENCES`

Architecture must not introduce major boundaries without traceable justification.

---

# 39. Quality Attribute Traceability

For each major architectural concern:

```text id="s8k1wd"
Quality Attribute:
<attribute>

Requirement:
<requirement>

Architecture Concern:
<concern>

Candidate Architecture Response:
<response>

Decision:
<decision>

Verification:
<verification>
```

The candidate response remains provisional until formally decided.

---

# 40. Architecture Validation Scenarios

Architecture should be validated against representative scenarios.

```text id="r3v9cm"
Scenario:
<scenario>

Actors:
<actors>

System Boundary:
<boundary>

Architectural Elements Involved:
<elements>

Expected Behavior:
<behavior>

Quality Attribute:
<attribute>

Failure Case:
<failure>

Expected Architecture Response:
<response>

Validation Result:
<PASSED | FAILED | PARTIAL | UNKNOWN>
```

Scenarios should include, where relevant:

* Normal use
* High load
* External dependency failure
* Internal component failure
* Invalid input
* Security boundary crossing
* Data inconsistency
* Recovery
* Deployment change
* Migration

Only include scenarios relevant to the system.

---

# 41. Architecture Fitness

Assess the architecture context against the established drivers.

| Dimension                    | Status     | Confidence     | Findings     |
| ---------------------------- | ---------- | -------------- | ------------ |
| Domain alignment             | `<status>` | `<confidence>` | `<findings>` |
| Responsibility clarity       | `<status>` | `<confidence>` | `<findings>` |
| Quality attributes           | `<status>` | `<confidence>` | `<findings>` |
| Integration understanding    | `<status>` | `<confidence>` | `<findings>` |
| Data ownership               | `<status>` | `<confidence>` | `<findings>` |
| Security boundaries          | `<status>` | `<confidence>` | `<findings>` |
| Existing-state understanding | `<status>` | `<confidence>` | `<findings>` |
| Target-state clarity         | `<status>` | `<confidence>` | `<findings>` |
| Risk understanding           | `<status>` | `<confidence>` | `<findings>` |
| Traceability                 | `<status>` | `<confidence>` | `<findings>` |

---

# 42. Architecture Debt

Record existing or discovered architectural debt.

Examples:

* Unclear boundaries
* Excessive coupling
* Legacy integration
* Data duplication
* Contract instability
* Operational complexity
* Missing observability
* Security weaknesses
* Deployment coupling
* Unsupported assumptions
* Architecture decisions without rationale

Architecture debt should distinguish:

* Accepted debt
* Accidental debt
* Transitional debt
* Strategic debt
* Unknown debt

---

# 43. Review Checklist

### Scope

* [ ] System boundary is explicit.
* [ ] Current and target scope are distinguished.
* [ ] External actors are identified.
* [ ] External systems are identified.

### Domain Alignment

* [ ] Domain boundaries are preserved.
* [ ] Domain responsibilities map to architectural responsibilities.
* [ ] Important invariants are recognized.
* [ ] Domain ownership is not distorted.

### Quality Attributes

* [ ] Significant quality attributes are identified.
* [ ] Architectural drivers are traceable.
* [ ] Important quality scenarios are defined.
* [ ] No unsupported quantitative targets were invented.

### Integration

* [ ] Significant integrations are known.
* [ ] Business purpose is clear.
* [ ] Critical dependencies are identified.
* [ ] Integration contracts are recognized as a later concern.

### Data

* [ ] Semantic ownership is known.
* [ ] Sensitive data concerns are identified where known.
* [ ] Persistence technology has not been selected prematurely.

### Security

* [ ] Trust boundaries are identified.
* [ ] Important protected assets are known.
* [ ] Security-sensitive interactions are visible.

### Existing Systems

* [ ] Documented and actual architecture are distinguished.
* [ ] Target architecture is explicit.
* [ ] Migration concerns are visible.

### Governance

* [ ] Architecture risks are recorded.
* [ ] Architecture unknowns are explicit.
* [ ] Decision candidates are identified.
* [ ] Recommendations are distinguished from decisions.
* [ ] Traceability is established.

---

# 44. Gate Contribution

This artifact contributes to the Architecture Gate.

```text id="p6w3ya"
Architecture Context Status:
<READY | READY_WITH_RISKS | INCOMPLETE | BLOCKED>

System Boundary:
<CLEAR | PARTIAL | UNCLEAR>

Domain Alignment:
<HIGH | MEDIUM | LOW>

Architecture Drivers:
<COMPLETE | PARTIAL | INCOMPLETE>

External Dependencies:
<UNDERSTOOD | PARTIAL | UNKNOWN>

Quality Attribute Understanding:
<HIGH | MEDIUM | LOW>

Risk Understanding:
<HIGH | MEDIUM | LOW>

Traceability:
<HEALTHY | DEGRADED | BROKEN>

Blocking Issues:
<issues>

Architecture Recommendation:
<READY | READY_WITH_RISKS | NOT_READY>
```

Passing this artifact does not mean that the architecture is complete.

It means that detailed architectural modeling can proceed with an established context.

---

# 45. Architecture Handoff to C4

Before creating detailed C4 views, establish:

```text id="c1m8vz"
System:
<system>

System Boundary:
<boundary>

Actors:
<actors>

External Systems:
<systems>

Major Responsibilities:
<responsibilities>

Domain Boundaries:
<boundaries>

Quality Drivers:
<drivers>

Architecture Constraints:
<constraints>

Major Risks:
<risks>

Open Architecture Decisions:
<decisions>

Required C4 Views:
- System Context
- Container
- Component where justified
- Other required views
```

The C4 model should elaborate this context rather than contradict it.

---

# 46. Agent Instructions

When creating or modifying the Architecture Context:

1. Start from Product Discovery and Domain Boundary Review.
2. Establish the system boundary before designing internal structure.
3. Preserve domain responsibilities.
4. Identify actors and external systems explicitly.
5. Identify architectural drivers.
6. Separate requirements from architecture decisions.
7. Separate constraints from preferences.
8. Identify quality attributes that materially affect architecture.
9. Identify trust boundaries.
10. Identify semantic data ownership.
11. Distinguish current, actual, documented, target, and transition states.
12. Do not choose technologies merely to fill architectural gaps.
13. Do not assume bounded context equals microservice.
14. Do not assume aggregate equals component.
15. Do not assume API boundaries equal domain boundaries.
16. Do not define detailed contracts prematurely.
17. Record architectural alternatives where meaningful.
18. Record decision candidates without silently deciding them.
19. Trace architectural responsibilities to domain evidence.
20. Validate important concerns through scenarios.
21. Carry unresolved risks into subsequent architecture artifacts.
22. Return to Domain Discovery when architectural analysis reveals a domain contradiction.
23. Keep architecture proportional to project scope, risk, and complexity.

Before progressing, ask:

> **Do we understand the system boundary, external relationships, architectural drivers, domain responsibilities, quality attributes, constraints, and major risks well enough to construct detailed architecture views without inventing missing context?**

---

# 47. Anti-Patterns

Avoid:

### Technology-First Architecture

Choosing frameworks, platforms, or databases before understanding architectural drivers.

### Microservice-First Design

Treating every bounded context as a service automatically.

### C4-as-Decoration

Creating diagrams without architectural reasoning.

### Infrastructure-First Design

Starting with deployment or cloud topology before system responsibilities are understood.

### Database-First Architecture

Using persistence structure as the primary architecture boundary.

### API-First Architecture

Defining endpoints before understanding domain and system responsibilities.

### Quality Attribute Theater

Listing every quality attribute without identifying actual architectural impact.

### Architecture by Template

Filling every possible architecture section regardless of relevance.

### Legacy Worship

Treating current architecture as the target merely because it exists.

### Premature Distribution

Introducing distributed-system complexity without a justified driver.

### Hidden Decisions

Allowing recommendations or assumptions to silently become architecture decisions.

### Domain Leakage

Moving domain concepts into technical architecture without preserving their semantics.

### Unsupported Precision

Inventing traffic volumes, latency targets, availability percentages, or infrastructure requirements.

---

# 48. Safe Progression Question

Before moving from Architecture Context into detailed C4 and architecture design:

> **Do we have sufficient evidence-based understanding of the system boundary, external actors and systems, architectural responsibilities, domain alignment, quality drivers, trust boundaries, data ownership, constraints, risks, and open decisions to construct detailed architecture views without introducing unsupported assumptions?**

If:

* **Yes** → proceed to detailed C4 architecture.
* **Yes, with risks** → proceed while explicitly carrying the risks.
* **No, but non-blocking** → record the gaps and continue cautiously.
* **No, because a system boundary is unclear** → revisit Domain Discovery.
* **No, because an architectural driver or constraint is unresolved** → resolve it before committing to detailed structure.

---

# 49. Final Principle

> **Architecture Context establishes the system-level architectural problem before prescribing the solution.**

It creates the bridge between:

```text id="r8f4mk"
Product Understanding
        ↓
Domain Understanding
        ↓
Architecture Context
        ↓
C4 Architecture
        ↓
Architecture Decisions
        ↓
Contracts
        ↓
Specifications
```

The architecture phase should progressively reduce uncertainty while preserving the semantic boundaries established during Domain Discovery.

The purpose of this artifact is therefore not to finish the architecture.

It is to ensure that the architecture begins from the correct problem.
