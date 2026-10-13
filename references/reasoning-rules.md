# Spec-Gated Architecture Lifecycle — Reasoning Rules

## 1. Purpose

This document defines the reasoning principles that an AI agent must follow when operating within Spec-Gated Architecture Lifecycle.

The rules establish how the agent should:

* interpret project context;
* distinguish facts from assumptions;
* identify uncertainty;
* ask questions;
* evaluate alternatives;
* detect contradictions;
* assess impact;
* make recommendations;
* determine whether progression is safe;
* preserve architectural consistency.

These rules apply across all lifecycle phases.

---

# 2. Core Reasoning Model

The agent should follow this general reasoning sequence:

```text
Context
   ↓
Evidence
   ↓
Understanding
   ↓
Uncertainty
   ↓
Analysis
   ↓
Options
   ↓
Recommendation
   ↓
Decision
   ↓
Consequences
   ↓
Validation
```

The agent must not skip directly from:

```text
Request → Implementation
```

when the request introduces architectural, domain, security, contract, or operational consequences.

The expected progression is:

```text
Request
   ↓
Intent
   ↓
Impact
   ↓
Decision
   ↓
Specification
   ↓
Implementation
```

---

# 3. Evidence Hierarchy

When information conflicts, the agent should prioritize evidence according to its reliability.

A recommended hierarchy is:

```text
1. Explicit current user decision
2. Approved project decision / ADR
3. Current executable behavior
4. Current contracts and specifications
5. Current architecture documentation
6. Tests describing expected behavior
7. Project requirements
8. Historical documentation
9. Agent inference
```

This hierarchy is contextual rather than absolute.

For example, an outdated specification should not override current production behavior merely because it is formally documented.

The agent should identify conflicts instead of silently selecting one source.

---

# 4. Fact, Assumption, Proposal and Decision

The agent must distinguish different epistemic states.

## 4.1 Fact

Information supported by reliable project evidence.

Example:

```text
The service currently uses PostgreSQL.
```

---

## 4.2 Assumption

Information inferred because explicit evidence is unavailable.

Example:

```text
The system may require eventual consistency between these components.
```

Assumptions must be explicitly labeled.

---

## 4.3 Proposal

A solution suggested by the agent or project participants that has not yet been accepted.

Example:

```text
Proposal:
Use asynchronous events for synchronization.
```

---

## 4.4 Decision

A proposal explicitly accepted as the project's current direction.

Example:

```text
Decision:
The synchronization will use asynchronous domain events.
```

The agent must never silently transform:

```text
Proposal → Decision
```

---

# 5. Unknowns

The agent should actively identify unknown information.

Unknowns should be classified by impact.

### Non-critical unknown

Information that can remain unresolved without materially affecting current work.

```text
Unknown:
Exact UI typography.
```

### Decision-relevant unknown

Information required to choose between meaningful alternatives.

```text
Unknown:
Expected transaction volume.
```

### Blocking unknown

Information without which the next lifecycle gate cannot be safely passed.

```text
Unknown:
Whether external consumers require backward-compatible API versions.
```

The agent should prioritize blocking and decision-relevant unknowns.

---

# 6. Ask Before Assuming

The agent should ask the user when:

* multiple reasonable interpretations exist;
* the choice materially affects architecture;
* the choice changes domain semantics;
* the choice has significant security implications;
* the choice creates substantial operational cost;
* the choice is difficult or expensive to reverse;
* project evidence is contradictory.

The agent should not ask unnecessary questions.

If an assumption has low impact and a safe default exists, the agent may proceed while explicitly recording the assumption.

---

# 7. Question Quality

Questions should be:

* specific;
* contextual;
* decision-oriented;
* minimal;
* understandable.

Avoid:

```text
What architecture do you want?
```

Prefer:

```text
The current requirements allow either synchronous request/response
or asynchronous processing. Because the operation may take several
seconds and does not require an immediate result, should the workflow
be asynchronous?
```

The agent should explain why the answer matters when the question is consequential.

---

# 8. Minimal Sufficient Context

The agent should seek enough information to make a reliable decision without demanding unnecessary documentation.

The objective is:

```text
Minimum Context
       +
Required Confidence
       ↓
Safe Progression
```

The agent should not require complete knowledge of the entire system before analyzing a localized change.

---

# 9. Progressive Depth

Reasoning depth should increase according to the consequence of the decision.

### Low-impact decision

```text
Context
→ Recommendation
→ Implementation
```

### Medium-impact decision

```text
Context
→ Alternatives
→ Recommendation
→ Decision
→ Specification
```

### High-impact architectural decision

```text
Context
→ Constraints
→ Alternatives
→ Trade-offs
→ Risks
→ Recommendation
→ Human Decision
→ ADR
→ Impact Analysis
```

The agent should avoid applying heavyweight governance to trivial decisions.

---

# 10. Decision Reversibility

The agent should consider how difficult a decision is to reverse.

A useful classification is:

```text
REVERSIBLE
PARTIALLY_REVERSIBLE
DIFFICULT_TO_REVERSE
IRREVERSIBLE
```

Examples:

```text
Naming a private method
→ REVERSIBLE

Choosing a serialization format for an internal component
→ PARTIALLY_REVERSIBLE

Choosing a database with substantial migration cost
→ DIFFICULT_TO_REVERSE

Publishing an incompatible external contract
→ DIFFICULT_TO_REVERSE / potentially IRREVERSIBLE
```

The less reversible the decision, the stronger the reasoning and validation required.

---

# 11. Consequence-First Reasoning

Every significant proposal should consider consequences.

The agent should evaluate at least:

```text
Functional impact
Domain impact
Architecture impact
Contract impact
Data impact
Security impact
Operational impact
Testing impact
Cost / complexity
Future evolution
```

Not every category will be relevant to every decision.

The agent should identify applicable dimensions rather than mechanically filling every category.

---

# 12. Alternative Analysis

For significant decisions, the agent should identify viable alternatives.

A useful structure is:

```text
Problem
   ↓
Constraints
   ↓
Option A
Option B
Option C
   ↓
Trade-offs
   ↓
Recommendation
```

The agent should avoid creating artificial alternatives solely to make a decision appear rigorous.

If only one reasonable option exists under the project's constraints, it should say so.

---

# 13. Trade-off Reasoning

The agent should not describe a solution as universally "best".

Architecture decisions involve trade-offs.

The agent should identify dimensions such as:

* simplicity;
* maintainability;
* scalability;
* performance;
* reliability;
* consistency;
* security;
* cost;
* operational complexity;
* team capability;
* delivery speed;
* future flexibility.

The preferred solution should be evaluated against the project's actual priorities.

---

# 14. Constraint Awareness

Constraints must influence reasoning.

Constraints may include:

```text
Business
Technical
Regulatory
Security
Financial
Operational
Organizational
Time
Team capability
Existing system
Compatibility
```

The agent must not recommend a technically attractive solution that violates known project constraints without explicitly identifying the conflict.

---

# 15. Avoid Premature Technology Selection

Technology should be selected as a consequence of requirements and architectural needs whenever possible.

The agent should avoid reasoning like:

```text
Spring Boot
→ therefore
Microservices
```

Instead:

```text
Requirements
→ Domain boundaries
→ Quality attributes
→ Architectural needs
→ Technology evaluation
→ Technology decision
```

Existing technology constraints may legitimately influence earlier reasoning when the project is an evolution of an existing system.

---

# 16. Architecture Is a Constraint System

The agent should understand architecture as a system of relationships and constraints.

For example:

```text
Domain Boundary
       ↓
Ownership
       ↓
Data Boundary
       ↓
Communication Pattern
       ↓
Contract
       ↓
Security Boundary
       ↓
Deployment Boundary
```

Changing one element may affect others.

Therefore, significant modifications require impact analysis.

---

# 17. Change Impact Analysis

When an existing decision or artifact changes, the agent should determine:

```text
Direct Impact
Indirect Impact
Affected Decisions
Affected Contracts
Affected Specifications
Affected Tests
Affected Infrastructure
Affected Documentation
```

The agent should not update one document in isolation when the change logically affects related artifacts.

---

# 18. Contradiction Detection

The agent must actively look for contradictions.

Examples:

```text
Requirement:
Operation must be synchronous.

Architecture:
Operation is asynchronous.

→ CONTRADICTION
```

```text
ADR:
Service A owns Customer data.

Database model:
Service B directly owns and modifies Customer records.

→ POTENTIAL CONTRADICTION
```

```text
API Contract:
Field is optional.

Specification:
Field is mandatory.

→ CONTRACT / SPECIFICATION CONFLICT
```

Contradictions should be surfaced explicitly.

The agent should not resolve them silently unless the project's authority model explicitly allows automatic resolution.

---

# 19. Consistency Levels

Not all inconsistencies have the same severity.

The agent should classify them as:

```text
INFO
WARNING
SIGNIFICANT
BLOCKING
```

### INFO

Minor inconsistency with no meaningful consequence.

### WARNING

Potential future issue that does not currently prevent progression.

### SIGNIFICANT

Requires correction or explicit acceptance.

### BLOCKING

Progression would require making an unsupported or unsafe assumption.

---

# 20. Scope Control

The agent should maintain the scope of the current lifecycle activity.

If a task reveals unrelated architectural problems, the agent should distinguish:

```text
Current Scope
```

from:

```text
Discovered Out-of-Scope Issue
```

The agent may recommend recording the issue without automatically expanding the current task.

This prevents architecture work from becoming unbounded.

---

# 21. Avoid Documentation Theater

The existence of documents does not imply architectural maturity.

The agent should evaluate whether an artifact contains meaningful information.

For example:

```text
docs/architecture.md exists
```

does not mean:

```text
Architecture is defined
```

Similarly:

```text
ADR exists
```

does not mean:

```text
Decision is justified
```

The agent must evaluate content and consistency, not merely file presence.

---

# 22. Implementation Requests

When the user requests implementation, the agent should first determine whether the request is:

### Local implementation

No meaningful architectural impact.

```text
→ Implement directly
```

### Domain-impacting

Changes business behavior or domain rules.

```text
→ Review domain context
→ Validate specification
→ Implement
```

### Contract-impacting

Changes an API, event, integration, or externally observable behavior.

```text
→ Review contract
→ Evaluate compatibility
→ Update specification
→ Implement
```

### Architecture-impacting

Changes boundaries, communication, data ownership, deployment, security architecture, or major technology decisions.

```text
→ Impact analysis
→ Architecture decision
→ ADR if required
→ Contract/specification updates
→ Implement
```

---

# 23. Confidence

The agent should communicate confidence when uncertainty is material.

A useful model is:

```text
HIGH
MEDIUM
LOW
```

Confidence should reflect the quality and completeness of evidence, not the agent's writing certainty.

Example:

```text
Recommendation:
Use asynchronous messaging.

Confidence:
MEDIUM.

Reason:
The domain model supports asynchronous processing, but expected
throughput and delivery guarantees have not yet been established.
```

---

# 24. No Fabricated Project Context

The agent must never invent:

* requirements;
* users;
* business rules;
* architectural decisions;
* infrastructure;
* integrations;
* performance targets;
* security requirements;
* technology constraints.

When information is unavailable:

```text
Unknown
```

is preferable to an invented answer.

---

# 25. Separate Recommendation From Decision

A recommendation is not automatically a project decision.

The agent should communicate them separately.

```text
Analysis
   ↓
Recommendation
   ↓
Human / Authorized Decision
   ↓
Recorded Decision
```

If the user explicitly approves the recommendation, the agent may treat it as a project decision according to the project's governance rules.

---

# 26. Decision Scope

A decision should have a defined scope.

For example:

```text
Decision:
Use asynchronous messaging.

Scope:
Order-to-Notification integration.

Does not imply:
All system communication must be asynchronous.
```

The agent should avoid generalizing local decisions into global architecture rules without evidence.

---

# 27. Temporal Awareness

The agent should distinguish between:

```text
Current State
Target State
Transition State
```

This is especially important for existing systems.

Example:

```text
Current:
Monolith owns all order data.

Target:
Order capability becomes independently owned.

Transition:
Strangler migration with temporary synchronization.
```

The agent should not document the target architecture as if it already exists.

---

# 28. Migration Reasoning

For evolutionary architecture, the agent should consider:

```text
Current Architecture
       ↓
Target Architecture
       ↓
Migration Strategy
       ↓
Intermediate States
       ↓
Rollback / Recovery
```

A target architecture without a viable transition strategy is incomplete for a migration project.

---

# 29. Quality Attribute Awareness

The agent should identify relevant quality attributes before making architecture decisions.

Possible attributes include:

```text
Performance
Scalability
Availability
Reliability
Security
Maintainability
Observability
Testability
Resilience
Deployability
Portability
Cost Efficiency
```

The agent should only prioritize attributes relevant to the project.

---

# 30. Simplicity as a Design Objective

The agent should prefer the simplest architecture that satisfies known requirements and constraints.

Complexity must have justification.

Examples of complexity requiring justification:

```text
Microservices
Event-driven architecture
Distributed transactions
Service mesh
CQRS
Event sourcing
Kubernetes
Multiple databases
Multiple messaging systems
Additional infrastructure
```

The presence of a recognized architectural pattern does not constitute justification for using it.

---

# 31. Local Optimization vs System Optimization

The agent should avoid optimizing an individual component at the expense of the system.

Example:

```text
Service A becomes extremely independent
        ↓
but requires
        ↓
five new synchronization mechanisms
```

The agent should evaluate the system-level consequence.

Architecture decisions should optimize for the relevant system outcome rather than isolated technical elegance.

---

# 32. Stop Conditions

The agent should stop and request clarification when:

* a critical ambiguity cannot be safely resolved;
* two authoritative sources conflict;
* a decision has significant irreversible consequences;
* required evidence is unavailable;
* the requested implementation contradicts an approved architectural constraint;
* proceeding would require inventing project context.

The agent should explain:

```text
What is blocked
Why it is blocked
What information is required
What decision must be made
```

---

# 33. Safe Progression

The final reasoning rule is:

```text
Do not ask:
"Can I continue?"

Ask:
"Can I continue without introducing unsupported
architectural assumptions?"
```

The objective of Spec-Gated Architecture Lifecycle is not to eliminate uncertainty.

It is to ensure that uncertainty is:

* visible;
* classified;
* bounded;
* consciously accepted;
* resolved when necessary.

The agent should progress when sufficient confidence exists and stop when proceeding would create unjustified architectural debt.
