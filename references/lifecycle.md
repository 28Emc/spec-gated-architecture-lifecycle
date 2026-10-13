# Spec-Gated Architecture Lifecycle

## 1. Purpose

Spec-Gated Architecture Lifecycle defines a progressive and iterative methodology for guiding software projects from initial product discovery to architecture, contracts, implementation specifications, infrastructure preparation, and release readiness.

The lifecycle provides an operational framework for AI agents that participate in software architecture and engineering activities.

Its purpose is to ensure that:

* architectural decisions are based on sufficient context;
* important assumptions are made explicit;
* unresolved questions are identified before they become implementation problems;
* domain, architecture, contracts, specifications, and infrastructure remain aligned;
* decisions are traceable;
* contradictions between artifacts are detected;
* implementation is preceded by an appropriate level of discovery and design;
* architectural work remains iterative rather than strictly linear.

Spec-Gated Architecture Lifecycle is technology-agnostic. It does not prescribe a programming language, framework, database, cloud provider, deployment platform, or architectural style.

---

# 2. Lifecycle Overview

The standard lifecycle consists of the following phases:

```text
Product Discovery
       ↓
Domain Discovery
       ↓
Architecture
       ↓
Contracts
       ↓
Architecture Decisions
       ↓
Specifications
       ↓
Infrastructure
       ↓
Release Readiness
```

The lifecycle should be understood as a directed progression with controlled feedback loops rather than a strictly linear process.

A later discovery may invalidate or modify an earlier decision.

```text
                         ┌─────────────────────┐
                         │ Product Discovery   │
                         └──────────┬──────────┘
                                    ↓
                         ┌─────────────────────┐
                         │ Domain Discovery    │
                         └──────────┬──────────┘
                                    ↓
                         ┌─────────────────────┐
                         │ Architecture        │
                         └──────────┬──────────┘
                                    ↓
                         ┌─────────────────────┐
                         │ Contracts           │
                         └──────────┬──────────┘
                                    ↓
                         ┌─────────────────────┐
                         │ Architecture       │
                         │ Decisions           │
                         └──────────┬──────────┘
                                    ↓
                         ┌─────────────────────┐
                         │ Specifications      │
                         └──────────┬──────────┘
                                    ↓
                         ┌─────────────────────┐
                         │ Infrastructure      │
                         └──────────┬──────────┘
                                    ↓
                         ┌─────────────────────┐
                         │ Release Readiness   │
                         └─────────────────────┘

                    ↖────── Controlled Feedback ──────↙
```

The sequence establishes a preferred order of reasoning, not an absolute restriction on project activity.

---

# 3. Lifecycle Principles

## 3.1 Context before implementation

The agent must seek sufficient context before proposing or implementing consequential technical decisions.

The agent should not infer architecture solely from an isolated implementation request.

For example:

```text
"Create an endpoint for X"
```

does not automatically imply:

```text
POST /x
```

The agent should first determine:

* the business capability involved;
* the responsible domain boundary;
* the expected behavior;
* relevant invariants;
* authorization requirements;
* existing contracts;
* existing architectural decisions;
* compatibility requirements.

---

## 3.2 Explicit over implicit

Important assumptions, constraints, decisions, and unresolved questions should be made explicit.

The agent should distinguish at minimum:

```text
DECIDED
PROPOSED
OPEN
UNKNOWN
CONFLICTING
```

The agent must not present a proposal as an established project decision.

---

## 3.3 Evidence over assumption

The agent should prioritize evidence from:

* project documentation;
* existing source code;
* existing contracts;
* configuration;
* infrastructure definitions;
* tests;
* established decisions;
* explicit user statements.

When evidence is insufficient, the agent should identify the uncertainty instead of fabricating information.

---

## 3.4 Progressive elaboration

Architecture should become more detailed as project understanding increases.

Early phases should answer questions such as:

```text
Why are we building this?
What problem are we solving?
Who needs it?
What capabilities are required?
```

Later phases should answer:

```text
How is the system structured?
How do components communicate?
What contracts exist?
How are decisions enforced?
How is the system deployed?
How is it operated?
```

The agent should avoid premature detail.

---

## 3.5 Traceability

Significant artifacts should be traceable across the lifecycle.

A typical chain is:

```text
Business Need
      ↓
Requirement
      ↓
Domain Capability
      ↓
Architecture Element
      ↓
Contract
      ↓
Architecture Decision
      ↓
Specification
      ↓
Implementation
      ↓
Verification
```

Not every project requires every relationship to be represented explicitly, but significant decisions and requirements must have an identifiable origin and consequence.

---

## 3.6 Gates before progression

Each lifecycle phase has an exit gate.

The agent should not declare a phase complete merely because its documents exist.

A phase is complete when its required outcomes have been sufficiently addressed and its gate conditions are satisfied.

```text
Artifacts exist
      ≠
Phase complete
```

Instead:

```text
Required outcomes
       +
Required decisions
       +
Known risks addressed
       +
No blocking contradictions
       ↓
Architecture Gate PASSED
```

---

## 3.7 Iteration is expected

The lifecycle is intentionally iterative.

A new architectural discovery may reveal a domain problem.

A domain discovery may invalidate an architecture decision.

A contract constraint may require an architecture change.

An infrastructure requirement may require a deployment architecture revision.

Therefore:

```text
Later phase
    ↓
New information
    ↓
Impact analysis
    ↓
Previous phase revisited
```

Revisiting a previous phase is not considered a failure of the lifecycle.

---

# 4. Project Entry Modes

Spec-Gated Architecture Lifecycle supports three primary entry modes.

## 4.1 Greenfield

A new system with little or no existing architecture.

Typical progression:

```text
Product Discovery
→ Domain Discovery
→ Architecture
→ Contracts
→ Decisions
→ Specifications
→ Infrastructure
→ Release
```

The agent should avoid assuming technical architecture before product and domain context are sufficiently understood.

---

## 4.2 Existing System

A system already exists and must be understood before significant changes are introduced.

Typical progression:

```text
System Discovery
→ Domain Discovery
→ Architecture Assessment
→ Contract Assessment
→ Decisions
→ Specifications
→ Evolution
```

Existing implementation is treated as evidence.

Documentation must not automatically be considered authoritative when it contradicts the running system.

---

## 4.3 System Evolution

A specific capability, feature, integration, or architectural change is introduced into an existing system.

The agent should determine the smallest relevant lifecycle scope.

For example:

```text
Existing Architecture
        ↓
Change Discovery
        ↓
Impact Analysis
        ↓
Domain Impact
        ↓
Architecture Impact
        ↓
Contract Impact
        ↓
Decision
        ↓
Specification
        ↓
Implementation
```

The entire lifecycle does not need to be repeated when the change does not affect unrelated areas.

---

# 5. Lifecycle Phases

## 5.1 Product Discovery

### Purpose

Establish why the system exists and what problem it is intended to solve.

### Key questions

* What problem are we solving?
* Who experiences the problem?
* What outcomes are expected?
* What is in scope?
* What is explicitly out of scope?
* What constraints exist?
* What assumptions remain unvalidated?

### Typical outputs

* Problem Statement
* Product Vision
* Goals
* Non-Goals
* Users or Actors
* High-level Requirements
* Constraints
* Initial Success Criteria
* Open Questions

### Exit condition

The product intent is sufficiently understood to begin meaningful domain discovery.

---

## 5.2 Domain Discovery

### Purpose

Understand the business domain and establish meaningful domain boundaries.

### Key questions

* What are the core business capabilities?
* What concepts exist in the domain?
* Which concepts have business rules?
* What are the boundaries between responsibilities?
* Which concepts belong together?
* Where are invariants enforced?
* Which interactions cross domain boundaries?

### Typical outputs

* Domain Model
* Bounded Contexts
* Domain Capabilities
* Core Entities / Aggregates
* Business Rules
* Domain Events
* Context Relationships
* Domain Terminology

### Exit condition

The domain model provides enough clarity to establish an appropriate architectural structure.

---

## 5.3 Architecture

### Purpose

Define the structural organization of the system and its major runtime and deployment boundaries.

### Key questions

* What are the major system components?
* What responsibilities belong to each component?
* What architectural style is appropriate?
* What are the important quality attributes?
* Where are system boundaries?
* How do components communicate?
* What external systems are involved?
* What are the major runtime dependencies?

### Typical outputs

* Architecture Principles
* C4 Level 1 — System Context
* C4 Level 2 — Containers
* Relevant C4 Level 3 diagrams
* Architecture Overview
* Major Components
* Communication Patterns
* Deployment Model
* Quality Attribute Considerations

### Exit condition

The architecture provides a coherent structural model capable of supporting the identified domain and product requirements.

---

## 5.4 Contracts

### Purpose

Define the externally observable agreements between system boundaries.

Contracts may include:

* API contracts;
* event contracts;
* data contracts;
* integration contracts;
* security contracts;
* observability expectations.

### Key questions

* What does each boundary expose?
* What does it consume?
* What data is exchanged?
* What are the compatibility rules?
* What are the error semantics?
* What security guarantees exist?
* What observability information is required?

### Typical outputs

* API Contracts
* Event Contracts
* Data Contracts
* Integration Contracts
* Authentication / Authorization Contracts
* Error Model
* Compatibility Rules
* Observability Contract

### Exit condition

Relevant boundaries have sufficiently defined contracts to support reliable specification and implementation.

---

## 5.5 Architecture Decisions

### Purpose

Capture significant architectural choices and their rationale.

Architecture Decisions should document:

* the problem;
* the context;
* alternatives considered;
* selected decision;
* rationale;
* consequences;
* affected components;
* affected contracts;
* status.

### Typical outputs

* ADRs
* Decision Register
* Superseded Decisions
* Decision Dependencies

### Exit condition

Significant architectural choices affecting implementation are explicitly decided or intentionally left open with an identified resolution path.

---

## 5.6 Specifications

### Purpose

Translate validated product, domain, architecture, contract, and decision context into implementation-ready specifications.

Specifications should provide enough precision for implementation without requiring the implementer to rediscover architectural intent.

### Typical outputs

* Feature Specifications
* Use Case Specifications
* API Specifications
* Domain Behavior Specifications
* Acceptance Criteria
* Error Scenarios
* Security Requirements
* Testable Behaviors

### Exit condition

The implementation scope is sufficiently specified and does not require unresolved architectural invention during coding.

---

## 5.7 Infrastructure

### Purpose

Define the technical environment required to build, deploy, operate, and maintain the system.

### Areas

* local development;
* environments;
* containers;
* orchestration;
* networking;
* configuration;
* secrets;
* databases;
* messaging infrastructure;
* CI/CD;
* observability;
* backups;
* resilience;
* security infrastructure.

### Typical outputs

* Infrastructure Architecture
* Environment Strategy
* Deployment Configuration
* CI/CD Design
* Operational Requirements
* Observability Configuration
* Infrastructure Specifications

### Exit condition

The infrastructure required for the intended deployment and operation model is sufficiently defined.

---

## 5.8 Release Readiness

### Purpose

Determine whether the system is sufficiently prepared for the intended release or deployment.

### Evaluation areas

* functional completeness;
* architecture consistency;
* contract compatibility;
* security;
* observability;
* resilience;
* testing;
* infrastructure;
* deployment;
* rollback;
* documentation;
* operational readiness.

### Typical outputs

* Release Readiness Assessment
* Known Issues
* Risk Register
* Deployment Checklist
* Rollback Strategy
* Operational Checklist

### Exit condition

The release satisfies the project's defined readiness criteria or explicitly records accepted risks.

---

# 6. Phase Structure

Every lifecycle phase should be evaluated using the same conceptual structure.

```text
Phase
 ├── Purpose
 ├── Inputs
 ├── Activities
 ├── Outputs
 ├── Decisions
 ├── Risks
 ├── Entry Criteria
 └── Exit Criteria / Gate
```

This consistency allows the AI agent to reason about different phases using a common model.

---

# 7. Phase Transitions

A transition occurs when the current phase satisfies its exit gate.

```text
CURRENT PHASE
     │
     ▼
Evaluate Gate
     │
 ┌───┴────┐
 │        │
PASS    BLOCKED
 │        │
 ▼        ▼
Next    Resolve
Phase   Issues
```

A blocked phase should produce:

1. blocking issue;
2. reason;
3. affected artifact;
4. required decision or information;
5. recommended next action.

The agent should not silently continue past a blocking condition.

---

# 8. Feedback Loops

Feedback loops are first-class lifecycle behavior.

Examples:

```text
Contracts
    ↓
Architecture issue detected
    ↓
Revisit Architecture
```

```text
Architecture
    ↓
Domain boundary conflict
    ↓
Revisit Domain Discovery
```

```text
Infrastructure
    ↓
Operational constraint discovered
    ↓
Revisit Architecture
```

The agent should perform impact analysis before modifying previously approved artifacts.

A change should identify:

```text
Changed Artifact
      ↓
Direct Dependencies
      ↓
Indirect Dependencies
      ↓
Potentially Invalid Decisions
      ↓
Required Revalidation
```

---

# 9. Lifecycle State Model

The lifecycle should maintain an explicit state.

A phase may have one of the following states:

```text
NOT_STARTED
IN_PROGRESS
BLOCKED
READY_FOR_REVIEW
PASSED
SUPERSEDED
```

Individual decisions and findings should additionally support:

```text
DECIDED
PROPOSED
OPEN
UNKNOWN
CONFLICTING
SUPERSEDED
```

The project itself may therefore be represented as:

```text
Project
 ├── Current Phase
 ├── Phase Status
 ├── Decisions
 ├── Open Questions
 ├── Risks
 ├── Blocking Issues
 └── Traceability
```

---

# 10. Blocking Conditions

A blocking condition exists when proceeding would require the agent to invent, assume, or bypass information that materially affects the next phase.

Examples include:

* unresolved critical business requirement;
* conflicting domain boundaries;
* missing architectural boundary;
* incompatible contract;
* unresolved security requirement;
* contradictory architecture decisions;
* missing information required to make a consequential decision;
* specification that conflicts with an approved contract;
* infrastructure constraint that invalidates the current architecture.

Not every unknown is blocking.

The agent should distinguish between:

```text
Unknown but non-critical
```

and:

```text
Unknown and decision-critical
```

Only the latter should normally block progression.

---

# 11. Traceability

The lifecycle should preserve relationships between significant artifacts.

A recommended conceptual model is:

```text
Product Requirement
       │
       ▼
Domain Capability
       │
       ▼
Architecture Element
       │
       ├──────────► Contract
       │
       ▼
Architecture Decision
       │
       ▼
Specification
       │
       ▼
Implementation
       │
       ▼
Verification
```

Traceability should support two directions.

### Forward traceability

```text
Why does this implementation exist?
```

### Backward traceability

```text
What implementation consequences does this requirement have?
```

The agent should use traceability to detect orphaned decisions, unsupported requirements, and implementation work without architectural justification.

---

# 12. Agent Responsibilities

The AI agent operating under Spec-Gated Architecture Lifecycle is responsible for:

### Discovery

* inspect available evidence;
* identify missing context;
* ask relevant questions;
* distinguish facts from assumptions.

### Reasoning

* analyze dependencies;
* identify contradictions;
* evaluate alternatives;
* explain consequences.

### Documentation

* create and update lifecycle artifacts;
* maintain consistency between artifacts;
* preserve decision history.

### Governance

* enforce phase gates;
* identify blocking conditions;
* prevent accidental progression through unresolved critical issues.

### Architecture

* evaluate architectural options;
* identify affected boundaries;
* detect architectural risks;
* maintain architecture-to-contract consistency.

### Traceability

* connect requirements, decisions, contracts, specifications, and implementation;
* identify broken or missing relationships.

The agent must not represent an unapproved proposal as an established decision.

---

# 13. Human Decision Boundaries

Spec-Gated Architecture Lifecycle is designed to support human decision-making, not eliminate it.

The agent may:

* analyze;
* propose;
* compare;
* identify risks;
* recommend;
* document;
* validate consistency.

The agent should require human confirmation for consequential decisions when project context does not explicitly delegate that authority.

Examples include:

* major architectural style changes;
* bounded context restructuring;
* irreversible technology choices;
* significant infrastructure commitments;
* security policy decisions;
* data ownership changes;
* externally visible contract changes;
* decisions with substantial cost or operational impact.

The agent should clearly distinguish:

```text
Agent Recommendation
```

from:

```text
Project Decision
```

---

# 14. Lifecycle Completion

Spec-Gated Architecture Lifecycle does not necessarily end when the first production release occurs.

A release establishes a new baseline.

After release, the system may enter another lifecycle iteration:

```text
Production
    ↓
New Requirement
    ↓
Change Discovery
    ↓
Impact Analysis
    ↓
Architecture Evolution
    ↓
Specifications
    ↓
Implementation
    ↓
Release
```

Therefore:

```text
Spec-Gated Architecture Lifecycle
        =
Continuous Architecture Evolution
```

The lifecycle is complete for a given scope when the defined objectives have been achieved and the corresponding release or evolution gate has been satisfied.

The project may then begin a new lifecycle iteration for subsequent changes.
