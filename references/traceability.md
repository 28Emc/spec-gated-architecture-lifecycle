# Spec-Gated Architecture Lifecycle — Traceability

## 1. Purpose

Traceability establishes explicit relationships between the artifacts, decisions, requirements, architectural elements, contracts, specifications, implementation elements, and verification evidence produced throughout the Spec-Gated Architecture Lifecycle.

The purpose of traceability is to ensure that project evolution remains understandable, explainable, auditable, and change-aware.

Traceability allows the agent to answer questions such as:

* Why does this architectural component exist?
* Which business or product requirement does this capability support?
* Which domain concept led to this architectural boundary?
* Which decision introduced this constraint?
* Which contract is affected by this decision?
* Where is this requirement implemented?
* How is this behavior verified?
* What will be affected if this requirement changes?
* Which artifacts are no longer justified?
* Which decisions have no visible implementation consequence?
* Which implementation elements have no identifiable architectural or product rationale?

Traceability is not intended to create documentation for its own sake.

Its purpose is to preserve meaningful relationships between project intent, design, implementation, and verification.

---

# 2. Core Principle

A project should maintain a traceable chain from intent to verification.

The canonical lifecycle relationship is:

```text
Product Need
    ↓
Requirement
    ↓
Domain Capability
    ↓
Domain Model
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

This is not a mandatory linear sequence for every artifact.

Some relationships may skip intermediate levels, while others may branch into multiple elements.

For example:

```text
Product Requirement
        ↓
Domain Capability
        ↓
 â”Œâ”€â”€â”€â”€â”€â”€â”´â”€â”€â”€â”€â”€â”€â”
 ↓             ↓
Service A    Service B
 ↓             ↓
API Contract  Event Contract
 ↓             ↓
Specification Specification
 ↓             ↓
Implementation Implementation
 â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”˜
        ↓
    Verification
```

The agent must preserve meaningful relationships rather than forcing every artifact into an artificial one-to-one chain.

---

# 3. Traceability Principles

## 3.1 Intent Must Be Traceable

Important implementation and architectural elements should have an identifiable reason for existing.

The agent should be able to trace significant elements toward one or more of:

* Product needs
* Requirements
* Domain capabilities
* Explicit architectural decisions
* Required technical constraints
* Operational requirements
* Security requirements
* Regulatory or compliance requirements

An element with no identifiable rationale should be considered potentially orphaned.

---

## 3.2 Consequences Must Be Traceable

Important decisions should have visible consequences.

A significant architecture decision should normally affect one or more of:

* Architecture elements
* Contracts
* Data design
* Security boundaries
* Infrastructure
* Specifications
* Implementation
* Operational behavior

A decision that produces no identifiable consequence should be reviewed to determine whether:

* it is informational rather than consequential,
* it is not yet implemented,
* its impact has not been documented,
* or the decision is unnecessary.

---

## 3.3 Verification Must Be Traceable

Important requirements and behaviors should have a verification mechanism.

Verification may include:

* Automated tests
* Integration tests
* Contract tests
* End-to-end tests
* Architecture tests
* Static analysis
* Security validation
* Performance validation
* Operational validation
* Manual verification
* Production evidence

The absence of automated testing does not automatically mean that a requirement is invalid or incomplete.

However, the project should understand how important behavior is verified.

---

## 3.4 Traceability Must Be Evidence-Based

The agent must not create traceability relationships merely because they appear plausible.

Relationships should be supported by evidence such as:

* Explicit project decisions
* Approved requirements
* Architecture documentation
* ADRs
* Contracts
* Specifications
* Source code
* Tests
* Infrastructure definitions
* Runtime behavior
* User-provided context

If a relationship is inferred rather than explicitly established, the agent must classify it appropriately.

For example:

```text
TRACEABILITY STATUS: INFERRED
CONFIDENCE: MEDIUM
EVIDENCE: Current implementation
```

The agent must not present inferred relationships as explicit project decisions.

---

# 4. Traceability Model

Traceability can be represented as a graph.

```text
                    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
                    â”‚ Product Need â”‚
                    â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”˜
                           â”‚
                        derives
                           â”‚
                           â–¼
                    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
                    â”‚ Requirement  â”‚
                    â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”˜
                           â”‚
                       satisfies
                           â”‚
                           â–¼
                    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
                    â”‚   Domain     â”‚
                    â”‚  Capability  â”‚
                    â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”˜
                           â”‚
                       realized by
                           â”‚
                           â–¼
                    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
                    â”‚ Architecture â”‚
                    â”‚    Element   â”‚
                    â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”˜
                           â”‚
                       exposes/
                       consumes
                           â”‚
                           â–¼
                    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
                    â”‚   Contract   â”‚
                    â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”˜
                           â”‚
                       specified by
                           â”‚
                           â–¼
                    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
                    â”‚Specification â”‚
                    â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”˜
                           â”‚
                       implemented by
                           â”‚
                           â–¼
                    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
                    â”‚Implementationâ”‚
                    â””â”€â”€â”€â”€â”€â”€â”¬â”€â”€â”€â”€â”€â”€â”€â”˜
                           â”‚
                       verified by
                           â”‚
                           â–¼
                    â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
                    â”‚ Verification â”‚
                    â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

This graph should be understood as a conceptual model rather than a requirement to create a dedicated graph database or specialized tool.

Traceability may be represented through:

* Markdown references
* Document identifiers
* ADR references
* Contract identifiers
* Requirement identifiers
* Specification identifiers
* Test identifiers
* Architecture diagrams
* Traceability matrices
* Structured metadata
* Repository conventions

---

# 5. Artifact Types

The agent should recognize the following major traceability artifact categories.

## 5.1 Product Artifacts

Examples:

* Product goals
* Product outcomes
* User needs
* Product requirements
* Business requirements
* Success criteria
* Product constraints

---

## 5.2 Domain Artifacts

Examples:

* Bounded contexts
* Domain capabilities
* Actors
* Aggregates
* Entities
* Value objects
* Domain services
* Domain events
* Business rules
* Policies
* Invariants

---

## 5.3 Architecture Artifacts

Examples:

* System context
* Containers
* Components
* Deployment elements
* Architecture boundaries
* Dependencies
* Integration boundaries
* Data ownership boundaries

---

## 5.4 Contract Artifacts

Examples:

* REST APIs
* GraphQL schemas
* Event contracts
* Message schemas
* Data contracts
* Authentication contracts
* Authorization requirements
* Observability conventions

---

## 5.5 Decision Artifacts

Examples:

* ADRs
* Architecture decisions
* Domain decisions
* Security decisions
* Data decisions
* Infrastructure decisions
* Product decisions with architectural consequences

---

## 5.6 Specification Artifacts

Examples:

* Functional specifications
* Technical specifications
* Behavior specifications
* Acceptance criteria
* Error specifications
* Validation rules
* State transition specifications

---

## 5.7 Implementation Artifacts

Examples:

* Source code
* Modules
* Services
* Controllers
* Consumers
* Producers
* Database migrations
* Configuration
* Infrastructure-as-code
* Deployment definitions

---

## 5.8 Verification Artifacts

Examples:

* Unit tests
* Integration tests
* Contract tests
* End-to-end tests
* Architecture tests
* Security tests
* Performance tests
* Validation reports
* Runtime evidence

---

# 6. Relationship Types

Traceability relationships should have explicit semantic meaning.

Common relationship types include:

| Relationship   | Meaning                                             |
| -------------- | --------------------------------------------------- |
| `DERIVES_FROM` | Artifact originates from another artifact           |
| `REFINES`      | Artifact adds detail to another artifact            |
| `SATISFIES`    | Artifact addresses a requirement or need            |
| `REALIZES`     | Architecture element realizes a domain capability   |
| `IMPLEMENTS`   | Implementation realizes a specification or contract |
| `EXPOSES`      | Architecture element exposes a contract             |
| `CONSUMES`     | Architecture element consumes a contract            |
| `CONSTRAINS`   | Artifact imposes a limitation on another element    |
| `INFLUENCES`   | Artifact affects a decision or design               |
| `DECIDES`      | Decision establishes a project choice               |
| `SPECIFIES`    | Specification defines expected behavior             |
| `VERIFIES`     | Verification validates another artifact             |
| `DEPENDS_ON`   | Artifact depends on another artifact                |
| `SUPERSEDES`   | New artifact replaces an earlier artifact           |
| `INVALIDATES`  | Artifact makes another artifact no longer valid     |
| `MITIGATES`    | Artifact addresses a known risk                     |
| `JUSTIFIES`    | Artifact provides rationale for another artifact    |

The agent should prefer precise relationships over generic references such as:

```text
Related to: X
```

when a more meaningful relationship can be established.

---

# 7. Forward Traceability

Forward traceability follows intent toward implementation and verification.

Example:

```text
Requirement
    ↓
Domain Capability
    ↓
Architecture Element
    ↓
Contract
    ↓
Specification
    ↓
Implementation
    ↓
Verification
```

Forward traceability answers:

> What happened to this requirement?

The agent should use forward traceability when:

* validating implementation completeness,
* analyzing requirement coverage,
* preparing release readiness,
* reviewing specifications,
* identifying unimplemented requirements,
* verifying that architecture supports product intent.

A requirement without a meaningful forward path may indicate:

* missing design work,
* missing implementation,
* deferred scope,
* obsolete requirement,
* unresolved ambiguity.

---

# 8. Backward Traceability

Backward traceability follows an implementation or architectural element toward its rationale.

Example:

```text
Implementation
    ↓
Specification
    ↓
Contract
    ↓
Architecture
    ↓
Domain
    ↓
Requirement
    ↓
Product Need
```

Backward traceability answers:

> Why does this exist?

The agent should use backward traceability when:

* reviewing an existing system,
* auditing architecture,
* evaluating unnecessary complexity,
* analyzing unexpected dependencies,
* identifying accidental architecture,
* evaluating whether an implementation element is still justified.

An implementation element without meaningful backward traceability should be classified as potentially orphaned.

It must not automatically be deleted or declared incorrect.

The agent should investigate first.

---

# 9. Decision Traceability

Architecture decisions require explicit traceability.

A significant decision should be traceable to:

```text
Problem
   ↓
Context
   ↓
Options
   ↓
Decision
   ↓
Consequences
   ↓
Affected Artifacts
   ↓
Implementation
   ↓
Validation
```

For example:

```text
ADR-007
   â”‚
   â”œâ”€â”€ constrains → Architecture Element A
   â”œâ”€â”€ constrains → API Contract B
   â”œâ”€â”€ influences → Data Model C
   â”œâ”€â”€ requires   → Specification D
   â””â”€â”€ verified by → Architecture Test E
```

The agent should identify decisions that are:

* documented but not implemented,
* implemented but not documented,
* superseded but still referenced,
* contradicted by current behavior,
* referenced by artifacts that no longer exist.

These conditions should be reported as traceability issues.

---

# 10. Domain-to-Architecture Traceability

Domain concepts should have understandable relationships with architecture.

Examples:

```text
Domain Capability
        ↓
Bounded Context
        ↓
Application Boundary
        ↓
Service / Module
```

The exact mapping depends on the architecture.

A domain capability does not necessarily require:

* a microservice,
* a separate database,
* a separate deployment unit,
* or a separate application.

The agent must not infer architectural decomposition solely from domain concepts.

Instead, traceability should document the actual relationship.

For example:

```text
Domain Capability: Order Management
        ↓
REALIZES
        ↓
Application Module: Order Management
```

or:

```text
Domain Capability: Order Management
        ↓
REALIZES
        ↓
Service: Order Service
```

The relationship should reflect the actual architecture rather than an assumed architecture pattern.

---

# 11. Contract Traceability

Contracts should be traceable to the behavior they expose or support.

For an API:

```text
Requirement
    ↓
Use Case
    ↓
Application Behavior
    ↓
API Contract
    ↓
Specification
    ↓
Implementation
    ↓
Contract Test
```

For an event:

```text
Domain Event
    ↓
Event Contract
    ↓
Producer
    ↓
Consumer
    ↓
Consumer Behavior
    ↓
Verification
```

Contract traceability should identify:

* producer,
* consumer,
* ownership,
* purpose,
* source behavior,
* related requirement,
* related decision,
* compatibility expectations,
* verification mechanism.

An externally visible contract should not exist without an understandable purpose.

---

# 12. Specification Traceability

Specifications should connect design intent with implementation expectations.

A specification may trace to:

```text
Requirement
       ↓
Specification
       ↓
Contract
       ↓
Implementation
       ↓
Verification
```

The agent should detect specifications that are:

* not implemented,
* implemented differently,
* superseded,
* contradicted by contracts,
* contradicted by runtime behavior,
* missing verification.

When current executable behavior conflicts with a historical specification, the agent must not automatically assume that the specification is correct.

The discrepancy should be classified and investigated.

---

# 13. Implementation Traceability

Implementation should be traceable to the current design wherever meaningful.

Examples:

```text
Application Service
    → Specification
    → Use Case
    → Domain Capability
```

```text
Controller
    → API Contract
    → Specification
    → Requirement
```

```text
Database Migration
    → Data Decision
    → Data Model
    → Specification
```

```text
Event Consumer
    → Event Contract
    → Integration Requirement
    → Business Behavior
```

Not every line of code requires traceability.

Traceability should be proportional to architectural and business significance.

---

# 14. Verification Traceability

Verification should provide evidence that important expectations are satisfied.

Example:

```text
Requirement
     ↓
Specification
     ↓
Implementation
     ↓
Integration Test
```

Or:

```text
Architecture Decision
     ↓
Architecture Constraint
     ↓
Architecture Test
```

Or:

```text
API Contract
     ↓
Contract Test
```

The agent should distinguish between:

* verified,
* partially verified,
* manually verified,
* unverified,
* verification not applicable,
* verification unknown.

The absence of automated verification should not be silently interpreted as failure.

---

# 15. Traceability States

A traceability relationship may have one of the following states:

### `VALID`

The relationship is supported by current evidence.

### `INFERRED`

The relationship is derived from available evidence but was not explicitly established.

### `MISSING`

A relationship is expected but cannot currently be identified.

### `STALE`

The relationship existed previously but may no longer reflect the current system.

### `CONFLICTING`

Available evidence indicates contradictory relationships.

### `SUPERSEDED`

The relationship belonged to an artifact that has been intentionally replaced.

### `UNKNOWN`

There is insufficient evidence to determine the relationship.

The agent should not convert `UNKNOWN` into `VALID` through assumption.

---

# 16. Orphan Detection

An orphaned artifact is an artifact that has no meaningful relationship to the surrounding lifecycle.

Examples include:

* Requirement with no domain or implementation consequence
* Domain capability with no architectural realization
* Architecture component with no identifiable purpose
* Contract with no consumer or producer
* ADR with no visible consequence
* Specification with no implementation
* Implementation element with no identifiable rationale
* Test verifying behavior that no longer exists

Orphan detection should be treated as an investigation mechanism.

The agent must not immediately conclude that an orphaned artifact is invalid.

Possible explanations include:

* Future planned work
* Intentionally isolated infrastructure
* Transitional migration element
* External dependency
* Legacy behavior
* Missing documentation
* Missing implementation
* Obsolete artifact

---

# 17. Broken Traceability

A traceability link is broken when its referenced artifact:

* no longer exists,
* has been renamed without updating references,
* has been superseded,
* has materially changed meaning,
* contradicts the current implementation,
* or cannot be validated from available evidence.

Example:

```text
ADR-004
    ↓
CONSTRAINS
    ↓
Service A
```

If Service A was removed but ADR-004 still references it, the relationship is broken.

The agent should report:

```text
TRACEABILITY ISSUE

Artifact: ADR-004
Relationship: CONSTRAINS
Target: Service A
Status: BROKEN
Reason: Target no longer exists
Impact: Decision consequence cannot be verified
```

---

# 18. Stale Traceability

Traceability becomes stale when the relationship may still be historically correct but no longer represents the current state.

Common causes:

* Architecture evolution
* Refactoring
* Service consolidation
* Contract versioning
* Requirement changes
* Migration
* Decision supersession

The agent should preserve historical relationships when they are valuable.

Historical traceability should not be silently rewritten into current traceability.

Instead:

```text
Historical Relationship
        ↓
SUPERSEDED BY
        ↓
Current Relationship
```

This preserves architectural history.

---

# 19. Change Impact Analysis

Traceability provides the foundation for controlled change analysis.

When an artifact changes, the agent should identify downstream and upstream dependencies.

Example:

```text
Requirement R-12
      ↓
Domain Capability C-04
      ↓
Service S-02
      ↓
API Contract API-07
      ↓
Specification SPEC-11
      ↓
Implementation
      ↓
Tests
```

Changing `R-12` may therefore affect:

* Domain modeling
* Architecture
* API contract
* Specifications
* Implementation
* Verification

The agent should not assume that every downstream artifact must change.

Instead, it should determine the actual impact.

---

# 20. Impact Propagation

Impact analysis should consider at least:

* Product impact
* Domain impact
* Architecture impact
* Contract impact
* Data impact
* Security impact
* Infrastructure impact
* Operational impact
* Testing impact
* Documentation impact

The agent should classify each affected artifact as:

```text
DIRECT
INDIRECT
POTENTIAL
NO IMPACT
UNKNOWN
```

Only evidence-supported impact should be presented as confirmed.

---

# 21. Existing Systems

Existing systems require special traceability handling.

The agent should distinguish:

```text
DOCUMENTED STATE
       ↓
ACTUAL STATE
       ↓
TARGET STATE
```

Traceability should primarily reflect actual behavior when the system is being audited.

Historical documentation may still be useful for understanding intent.

For example:

```text
Historical Requirement
        ↓
Historical Architecture
        ↓
Current Implementation
        ↓
Current Behavior
```

If the implementation diverges from the historical architecture, the agent should preserve the discrepancy rather than rewriting history.

---

# 22. System Evolution

For system evolution, traceability should focus on the change boundary.

Example:

```text
Existing Component
       ↓
Change Request
       ↓
Affected Domain Capability
       ↓
Affected Contract
       ↓
Architecture Decision
       ↓
Specification
       ↓
Implementation Change
       ↓
Verification
```

The agent should avoid rebuilding the complete traceability graph when the requested change has a clearly bounded scope.

Trace only what is necessary to understand:

* what changes,
* what depends on it,
* what may break,
* what must be verified.

---

# 23. Traceability Matrix

A traceability matrix may be used when a compact view is useful.

Example:

| Requirement | Domain | Architecture | Contract | Decision | Specification | Implementation | Verification |
| ----------- | ------ | ------------ | -------- | -------- | ------------- | -------------- | ------------ |
| R-01        | C-01   | S-01         | API-01   | ADR-02   | SPEC-03       | MOD-04         | TEST-07      |
| R-02        | C-02   | S-02         | EVT-03   | ADR-05   | SPEC-08       | MOD-09         | TEST-12      |

The matrix should be used when it improves understanding.

The agent should not create large matrices merely to demonstrate documentation completeness.

For complex systems, a graph or structured references may be more effective.

---

# 24. Traceability Graph

For larger systems, traceability may be represented conceptually as a directed graph.

Example:

```text
[R-01]
  â”‚
  â”œâ”€â”€SATISFIESâ”€â”€> [CAP-02]
  â”‚                  â”‚
  â”‚                  â””â”€â”€REALIZESâ”€â”€> [SERVICE-03]
  â”‚                                     â”‚
  â”‚                                     â”œâ”€â”€EXPOSESâ”€â”€> [API-07]
  â”‚                                     â”‚               â”‚
  â”‚                                     â”‚               â””â”€â”€IMPLEMENTSâ”€â”€> [SPEC-11]
  â”‚                                     â”‚
  â”‚                                     â””â”€â”€CONSTRAINSâ”€â”€> [ADR-04]
  â”‚
  â””â”€â”€VERIFIESâ”€â”€> [TEST-18]
```

The graph should remain semantically meaningful.

The goal is not to create a graph for every project, but to preserve important relationships.

---

# 25. Traceability Coverage

Traceability coverage describes how much of the significant project surface has meaningful relationships.

Coverage may be evaluated across:

* Requirements
* Domain capabilities
* Architecture elements
* Contracts
* Decisions
* Specifications
* Implementation
* Verification

The agent should avoid reducing traceability to a single percentage.

A project with 95% link coverage may still contain one critical untraceable security requirement.

Therefore:

> Traceability coverage is an indicator, not a substitute for qualitative analysis.

---

# 26. Critical Traceability

Not every artifact requires the same traceability depth.

Higher traceability expectations should apply to elements involving:

* Security
* Sensitive data
* External contracts
* Financial behavior
* Critical business rules
* Regulatory requirements
* High-risk infrastructure
* Significant architecture decisions
* Irreversible decisions
* Public APIs
* Cross-system integrations

Lower-risk internal elements may use lighter traceability.

The agent should apply proportionality.

---

# 27. Traceability and Confidence

Traceability relationships should carry confidence when evidence is incomplete.

Example:

```text
Relationship:
Service A IMPLEMENTS Requirement R-12

Status:
INFERRED

Confidence:
MEDIUM

Evidence:
- Current source code
- Existing API behavior
- Related integration test

Missing Evidence:
- Explicit requirement reference
```

Confidence should never be used to hide uncertainty.

---

# 28. Traceability Audit

During an architecture audit, the agent should inspect for:

### Coverage

Are important requirements traceable?

### Orphans

Are significant artifacts disconnected?

### Broken Links

Do references point to missing or obsolete artifacts?

### Staleness

Do relationships still represent the current system?

### Contradictions

Do different artifacts claim incompatible relationships?

### Decision Consequences

Do important decisions have visible effects?

### Implementation Alignment

Does implementation reflect current specifications and architecture?

### Verification

Are important behaviors verified?

### Change Impact

Can meaningful dependencies be identified before a change?

---

# 29. Traceability Issues

The agent should classify issues using the project severity model.

### INFO

Minor or non-impacting traceability gap.

### WARNING

A gap that reduces clarity but does not currently threaten correctness.

### SIGNIFICANT

A gap that materially affects maintainability, architecture understanding, or change analysis.

### BLOCKING

A traceability failure that prevents safe progression or reliable decision-making.

Examples of potentially blocking issues:

* Critical security requirement cannot be traced.
* Public contract has unknown ownership.
* Important architecture decision has conflicting implementation.
* Critical business behavior has no identifiable specification or verification.
* Change impact cannot be determined for a high-risk modification.

---

# 30. Agent Responsibilities

The agent should:

1. Establish meaningful relationships between lifecycle artifacts.
2. Prefer explicit evidence over inference.
3. Clearly classify inferred relationships.
4. Detect orphaned artifacts.
5. Detect broken references.
6. Detect stale relationships.
7. Detect contradictions.
8. Preserve historical relationships when relevant.
9. Analyze impact when important artifacts change.
10. Maintain proportional traceability.
11. Avoid unnecessary documentation.
12. Report uncertainty explicitly.
13. Use traceability to support architecture decisions.
14. Use traceability to support gate evaluation.
15. Never fabricate missing relationships.

---

# 31. Agent Traceability Procedure

When analyzing a project, the agent should follow this process:

```text
1. Identify significant artifacts
        ↓
2. Identify known relationships
        ↓
3. Validate relationship evidence
        ↓
4. Classify relationship state
        ↓
5. Detect missing relationships
        ↓
6. Detect orphaned artifacts
        ↓
7. Detect broken or stale links
        ↓
8. Detect contradictions
        ↓
9. Analyze relevant change impact
        ↓
10. Report traceability findings
        ↓
11. Update relationships only when authorized
```

The agent must not silently modify project decisions or historical relationships during an audit.

---

# 32. Traceability Completion Criteria

Traceability is considered sufficient when:

* Significant product requirements have meaningful downstream relationships.
* Important domain capabilities have understandable architectural relationships.
* Significant architecture elements have identifiable rationale.
* Important contracts have identifiable purpose and ownership.
* Significant decisions have identifiable consequences.
* Important specifications connect to implementation.
* Important behaviors have an identifiable verification mechanism.
* Known orphaned artifacts have been classified.
* Broken relationships have been identified.
* Stale relationships have been identified where relevant.
* Major contradictions are resolved or explicitly recorded.
* High-risk changes have sufficient impact visibility.

Traceability does not require every artifact or line of code to be individually linked.

---

# 33. Traceability Gate

Traceability should contribute to architecture and release gates.

A traceability gate should ask:

```text
Can the project explain:

WHY the important elements exist?
WHAT they depend on?
WHICH decisions constrain them?
WHICH contracts they affect?
WHERE they are implemented?
HOW their important behavior is verified?
WHAT would be affected if they changed?
```

If the project cannot answer these questions for a high-risk area, progression may need to be blocked or explicitly accepted with risk.

---

# 34. Anti-Patterns

The agent must avoid:

### Documentation Theater

Creating links solely to increase apparent coverage.

### Generic Relationships

Using vague relationships when a precise relationship from the canonical vocabulary is known.

### False Completeness

Assuming that a complete matrix means that the architecture is correct.

### Retroactive Justification

Inventing a requirement or decision to justify existing code.

### Silent Rewriting

Changing historical traceability to match the current architecture without preserving history.

### Excessive Granularity

Creating traceability for every implementation detail when it provides no meaningful value.

### Unverified Inference

Presenting inferred relationships as explicit project decisions.

### Traceability as a Substitute for Architecture

Using links and matrices instead of actually resolving architectural problems.

---

# 35. Traceability and Lifecycle Integration

Traceability is cross-cutting across the entire Spec-Gated Architecture Lifecycle.

```text
Product Discovery
        ↓
Requirement Traceability
        ↓
Domain Discovery
        ↓
Domain Traceability
        ↓
Architecture
        ↓
Architecture Traceability
        ↓
Contracts
        ↓
Contract Traceability
        ↓
Architecture Decisions
        ↓
Decision Traceability
        ↓
Specifications
        ↓
Specification Traceability
        ↓
Infrastructure
        ↓
Infrastructure Traceability
        ↓
Release Readiness
        ↓
Verification Traceability
```

Traceability should therefore not be treated as a final documentation phase.

It should be established progressively throughout the lifecycle.

---

# 36. Final Principle

Traceability exists to preserve the relationship between **intent, reasoning, design, implementation, and evidence**.

The objective is not to prove that documentation exists.

The objective is to make the system explainable.

A mature Spec-Gated Architecture Lifecycle should allow an agent or human reviewer to move in both directions:

```text
WHY?
  ↓
Product
  ↓
Domain
  ↓
Architecture
  ↓
Contracts
  ↓
Decisions
  ↓
Specifications
  ↓
Implementation
  ↓
Verification
  ↓
DOES IT ACTUALLY WORK?
```

and:

```text
WHAT EXISTS?
  ↓
Implementation
  ↓
Specification
  ↓
Contract
  ↓
Architecture
  ↓
Domain
  ↓
Product Intent
  ↓
WHY DOES IT EXIST?
```

The agent should preserve both directions whenever meaningful.

> **Good traceability does not create more documentation. It creates explainable relationships between the decisions a system makes, the structures that implement them, and the evidence that proves they remain valid.**

---

## 25. Delivery Traceability (Implementation-Gated, Optional TDD)

### 25.1 Purpose

Connect specifications to implementation verification and evidence. This section supports the specification-gated delivery rule (only `APPROVED` specifications are implementable) and optional TDD (`AC → Test → Evidence`).

### 25.2 Core Chain

```text
Acceptance Criterion (AC)
  ↓ SPECIFIES / DERIVES_FROM
Specification (Approved)
  ↓ IMPLEMENTS (implementation work)
Implementation Units
  ↓ VERIFIES
Tests (behavior/unit/contract)
  ↓ PRODUCES
Evidence (logs, reports, results)
  ↑ JUSTIFIES / SUPPORTS
Delivery Report (DONE/PARTIAL/BLOCKED)
```

### 25.3 Canonical Relationships for Delivery

| Relationship | Direction | Usage |
|---|---|---|
| `SPECIFIES` | AC → Specification | Acceptance Criteria specify required behavior in the specification. |
| `DERIVES_FROM` | AC → Requirements/Business Rules | When AC derives from higher-level requirements or rules. |
| `IMPLEMENTS` | Implementation → Specification | Implementation work implements the approved specification. |
| `VERIFIES` | Test → Specification/AC | Tests verify the specification and/or specific ACs. |
| `JUSTIFIES` | Evidence → Test/AC | Evidence justifies that an AC is satisfied. |
| `SUPPORTS` | Evidence → Delivery Status | Evidence supports the delivery report status (`DONE`/`PARTIAL`/`BLOCKED`). |

### 25.4 Minimum Delivery Traceability Record

Each delivered behavior must record:

| Element | Required | Notes |
|---|---|---|
| Specification ID | Yes | `SPEC-XXX`, status must be `APPROVED`. |
| Acceptance Criterion ID | Yes | Numbered AC-1, AC-2, ... (or explicit IDs). |
| Test ID(s) | Yes | Tests that verify this AC. |
| Evidence Path(s) | Yes | Concrete paths to test results/logs/reports. |
| Delivery Status | Yes | `DONE`, `PARTIAL`, or `BLOCKED` with rationale. |

### 25.5 Rules

- **Gate enforcement:** Traceability must exist before claiming `DONE`. Missing evidence blocks delivery.
- **AC-first:** Tests are traced to ACs, not to implementation internals (prevents the "test-reproduces-implementation" anti-pattern).
- **Evidence-based:** Every `DONE` claim requires concrete evidence paths (not assertions).
- **Optional TDD:** When TDD is active, the RED→GREEN→REFACTOR cycle produces the `VERIFIES` links at the time tests are written.

### 25.6 Example (concise)

```text
AC-1 (Given valid input, When create, Then success)
  SPECIFIES SPEC-001
  VERIFIES TEST-AC-1
  JUSTIFIES evidence://tests/spec-001/ac-1.txt
  SUPPORTS Delivery Report: SPEC-001 → DONE
```

### 25.7 References

- `references/implementation-delivery-gate.md`
- `references/tdd-workflow.md`
- `references/definition-of-done.md`
