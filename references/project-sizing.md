# Spec-Gated Architecture Lifecycle — Project Sizing

## 1. Purpose

Project sizing defines how the depth, rigor, and governance of the Spec-Gated Architecture Lifecycle should adapt to the size, complexity, risk, and change scope of a project.

The Spec-Gated Architecture Lifecycle must be applicable to:

* Small applications
* Internal tools
* Medium-sized systems
* Distributed systems
* Enterprise platforms
* Existing-system modernization
* Incremental system evolution
* High-risk or regulated environments

The agent must not apply the same process intensity to every project.

A small, low-risk change should not require the same architecture ceremony as a multi-system migration.

The objective is:

> Apply enough process to reduce meaningful uncertainty without introducing unnecessary process overhead.

---

# 2. Core Principle

Project size is not determined only by codebase size or number of components.

A project may be small in implementation size but high in risk.

Conversely, a technically large system may contain a low-risk localized change.

Therefore:

```text
Process Intensity ≠ Codebase Size
```

Process intensity should be determined by the combination of:

```text
Scope
+ Complexity
+ Risk
+ Change Impact
+ Uncertainty
+ Criticality
+ Reversibility
+ Integration Surface
```

---

# 3. Sizing Dimensions

The agent should evaluate the project or requested change across multiple dimensions.

## 3.1 Scope

Consider:

* Number of affected modules
* Number of bounded contexts
* Number of services
* Number of applications
* Number of teams
* Number of environments
* Number of external dependencies

Possible classification:

```text
LOCAL
SYSTEM
CROSS_SYSTEM
PLATFORM
```

---

## 3.2 Domain Complexity

Consider:

* Number of business capabilities
* Complexity of business rules
* Number of domain boundaries
* Domain coupling
* Number of actors
* Number of workflows
* Number of invariants
* Frequency of domain changes

Possible classification:

```text
LOW
MEDIUM
HIGH
```

---

## 3.3 Technical Complexity

Consider:

* Distributed communication
* Asynchronous processing
* Event-driven behavior
* Data synchronization
* Multiple persistence technologies
* External integrations
* Deployment complexity
* Runtime dependencies
* Infrastructure requirements

Possible classification:

```text
LOW
MEDIUM
HIGH
```

---

## 3.4 Risk

Consider:

* Security risk
* Data loss risk
* Financial impact
* Availability requirements
* Regulatory impact
* Privacy concerns
* Operational impact
* Migration risk
* Compatibility risk

Possible classification:

```text
LOW
MEDIUM
HIGH
CRITICAL
```

---

## 3.5 Change Impact

For an existing system, determine whether the change is:

```text
LOCAL
BOUNDARY-AFFECTING
CONTRACT-AFFECTING
DATA-AFFECTING
ARCHITECTURE-AFFECTING
SYSTEM-WIDE
```

Change impact is often more important than the absolute size of the system.

---

## 3.6 Reversibility

Consider how easily the decision can be reversed.

```text
REVERSIBLE
PARTIALLY_REVERSIBLE
DIFFICULT_TO_REVERSE
IRREVERSIBLE
```

Less reversible decisions require greater analysis and stronger evidence.

---

## 3.7 Integration Surface

Consider:

* Public APIs
* Internal APIs
* Event brokers
* External providers
* Third-party systems
* Databases shared across boundaries
* Identity providers
* Infrastructure dependencies

A large integration surface increases the need for contract and impact analysis.

---

# 4. Project Profiles

The agent may classify work into one of four broad profiles.

## 4.1 Small / Low Risk

Typical characteristics:

* Limited scope
* Low domain complexity
* Few dependencies
* No significant external contracts
* Easily reversible decisions
* Low operational impact

Typical examples:

* Small internal tool
* Simple CRUD application
* Local feature
* Minor refactoring
* Non-critical configuration change

Recommended process:

```text
Product Context
    ↓
Minimal Domain Analysis
    ↓
Light Architecture Review
    ↓
Implementation Specification
    ↓
Verification
```

Formal ADRs may not be required for trivial decisions.

---

# 5. Medium Complexity

Typical characteristics:

* Multiple modules
* Meaningful domain rules
* Several integrations
* Moderate data complexity
* Some architectural trade-offs
* Moderate operational impact

Recommended process:

```text
Product Discovery
        ↓
Domain Discovery
        ↓
Architecture
        ↓
Contracts
        ↓
Relevant Decisions
        ↓
Specifications
        ↓
Infrastructure
        ↓
Verification
```

Most lifecycle phases should be evaluated.

However, the documentation depth should remain proportional to risk.

---

# 6. Large / High Complexity

Typical characteristics:

* Multiple services
* Multiple bounded contexts
* Distributed architecture
* External integrations
* Significant data ownership
* Asynchronous communication
* High operational requirements
* Significant security concerns
* Difficult architectural decisions

Recommended process:

```text
Full Spec-Gated Architecture Lifecycle
+
Formal Gates
+
Decision Governance
+
Traceability
+
Contract Reviews
+
Architecture Validation
+
Infrastructure Review
+
Release Readiness
```

Important decisions should normally have formal ADRs.

---

# 7. Critical / High-Risk Systems

Critical systems require the strongest lifecycle rigor.

Typical characteristics:

* Financial consequences
* Safety-sensitive behavior
* Regulatory requirements
* Sensitive information
* Mission-critical availability
* Irreversible data operations
* Significant external exposure
* High operational consequences

The agent should apply:

* Full lifecycle analysis
* Explicit requirements
* Formal domain analysis
* Architecture reviews
* Contract governance
* Formal ADRs
* Strong traceability
* Security analysis
* Data impact analysis
* Operational readiness
* Verification evidence
* Explicit risk acceptance where applicable

The agent must not reduce rigor solely because implementation scope is small.

---

# 8. Change Profiles

Project sizing should also classify individual changes.

## 8.1 Local Change

Affects a limited implementation area without changing:

* Public contracts
* Domain boundaries
* Data ownership
* Security boundaries
* Architecture boundaries

Typical process:

```text
Context
→ Impact Check
→ Specification
→ Implementation
→ Verification
```

---

## 8.2 Domain Change

Changes business behavior or domain rules.

Requires additional:

* Domain analysis
* Invariant analysis
* Requirement validation
* Specification updates
* Verification updates

---

## 8.3 Contract Change

Changes an externally or internally consumed contract.

Requires:

* Contract analysis
* Consumer identification
* Compatibility analysis
* Versioning strategy where applicable
* Impact analysis
* Contract verification

---

## 8.4 Data Change

Changes:

* Data ownership
* Persistence structure
* Data lifecycle
* Data migration
* Consistency behavior

Requires:

* Data impact analysis
* Migration analysis
* Compatibility analysis
* Recovery considerations
* Verification

---

## 8.5 Architecture Change

Changes:

* Component boundaries
* Service boundaries
* Integration patterns
* Deployment topology
* Communication model
* Security boundaries
* Data ownership boundaries

Requires architecture-level analysis and normally formal decision governance.

---

## 8.6 System-Wide Change

Affects multiple architectural boundaries or major system behavior.

The full lifecycle should normally be applied to the relevant scope.

---

# 9. Complexity vs Risk Matrix

The agent should evaluate complexity and risk independently.

| Complexity | Risk   | Recommended Approach                  |
| ---------- | ------ | ------------------------------------- |
| Low        | Low    | Lightweight lifecycle                 |
| Medium     | Low    | Standard lifecycle                    |
| High       | Low    | Strong architecture analysis          |
| Low        | High   | High-rigor targeted analysis          |
| Medium     | Medium | Standard lifecycle with formal gates  |
| High       | Medium | Full lifecycle                        |
| Medium     | High   | Full lifecycle with strong governance |
| High       | High   | Full lifecycle + formal governance    |

The key rule is:

> High risk requires high rigor even when technical complexity is low.

---

# 10. Sizing Is Contextual

Sizing must be performed relative to the requested work.

For example:

```text
Existing System
    ├── 50 services
    ├── 12 databases
    └── 8 external integrations
```

A change affecting one isolated internal component may still be a:

```text
LOCAL CHANGE
```

Conversely:

```text
Small Application
    └── Introduce external payment integration
```

may become:

```text
CONTRACT-AFFECTING
SECURITY-AFFECTING
DATA-AFFECTING
HIGH-RISK
```

The agent must classify the actual change rather than the project based solely on global size.

---

# 11. Minimum Sufficient Process

The agent should apply the smallest process that safely resolves the relevant uncertainty.

This principle can be expressed as:

```text
Required Rigor = Minimum Rigor Necessary to Control Relevant Risk
```

The agent should ask:

* What uncertainty exists?
* What decision must be made?
* What could go wrong?
* Which boundaries are affected?
* What evidence is required?
* Which lifecycle phases are actually relevant?

The agent should not execute unnecessary phases simply because they exist.

---

# 12. Scaling Lifecycle Depth

Each lifecycle phase may be applied at different depths.

For example:

### Product Discovery

```text
LIGHT
- Goal
- Scope
- Main users

STANDARD
- Goals
- Actors
- Requirements
- Constraints
- Success criteria

DEEP
- Full product analysis
- Outcomes
- Stakeholders
- Risks
- Non-functional expectations
- Prioritization
```

The same principle applies to other phases.

---

# 13. Lifecycle Depth Levels

The agent may use three process-depth levels.

## Level 1 — Lightweight

Used for low-risk localized work.

Typical outputs:

* Context summary
* Relevant requirements
* Minimal design
* Implementation specification
* Verification plan

Formal architecture documentation may be unnecessary.

---

## Level 2 — Standard

Used for normal feature development and medium-complexity systems.

Typical outputs:

* Product context
* Domain analysis
* Architecture impact
* Relevant contracts
* Decisions
* Specifications
* Verification
* Traceability

---

## Level 3 — Full

Used for high-risk, high-complexity, or strategic work.

Typical outputs:

* Full Product Discovery
* Domain Discovery / DDD
* C4 architecture
* Contract reviews
* Formal ADRs
* Full traceability
* Security analysis
* Data analysis
* Infrastructure analysis
* Release readiness
* Risk acceptance where required

---

# 14. Sizing Decision Process

The agent should perform sizing before selecting the depth of the lifecycle.

Recommended sequence:

```text
1. Understand the requested outcome
        ↓
2. Identify scope
        ↓
3. Identify affected boundaries
        ↓
4. Evaluate complexity
        ↓
5. Evaluate risk
        ↓
6. Evaluate reversibility
        ↓
7. Evaluate integration surface
        ↓
8. Determine change impact
        ↓
9. Select lifecycle depth
        ↓
10. Execute relevant phases
```

The agent should explain the classification when the selected depth materially affects the process.

---

# 15. Sizing Evidence

The classification should be evidence-based.

Useful evidence includes:

* Project structure
* Existing architecture
* Number of components
* Existing contracts
* Requirements
* ADRs
* Runtime topology
* Deployment architecture
* Data stores
* External integrations
* Security requirements
* User-provided constraints
* Existing incidents or known risks

The agent must not invent complexity or risk characteristics.

---

# 16. Unknown Sizing Information

Sometimes project size cannot be reliably determined.

The agent should distinguish:

```text
KNOWN
INFERRED
UNKNOWN
```

If unknown information could materially affect the required process depth, the agent should ask for clarification or perform additional discovery.

Example:

```text
UNKNOWN:
Whether the API is consumed by external clients.

IMPACT:
Contract governance and compatibility analysis may be required.

STATUS:
Sizing cannot be finalized.
```

---

# 17. Dynamic Resizing

Sizing is not permanent.

The project may become more complex during discovery.

For example:

```text
Initial:
LEVEL 1

Discovery reveals:
- Shared database
- External consumers
- Security boundary change

Reclassification:
LEVEL 3
```

The agent must be able to increase process depth when new evidence reveals greater risk or complexity.

Likewise, unnecessary process may be reduced when assumptions are disproven.

---

# 18. Downscaling

The agent should avoid unnecessary ceremony.

If discovery establishes that a proposed change is:

* isolated,
* low-risk,
* reversible,
* internally scoped,
* contract-neutral,

then the agent may recommend a lighter lifecycle path.

Downscaling should not bypass mandatory requirements imposed by:

* project governance,
* regulation,
* security policy,
* organizational standards,
* explicit user decisions.

---

# 19. Upscaling Triggers

The agent should increase lifecycle rigor when it discovers:

* New external dependencies
* New public contracts
* Data ownership changes
* Security boundary changes
* Cross-service coupling
* Significant migration
* Irreversible decisions
* Critical business rules
* Financial impact
* Regulatory implications
* Significant operational changes
* High uncertainty
* Conflicting architecture evidence
* Significant domain boundary changes

These triggers should cause a reassessment of process depth.

---

# 20. Project Size and Documentation

Documentation depth should follow risk and decision significance.

A small project may need only:

```text
README
Architecture Overview
Relevant Specifications
Tests
```

A larger system may require:

```text
Product Documentation
Domain Documentation
C4 Architecture
Contracts
ADRs
Specifications
Infrastructure Documentation
Traceability
Release Readiness
```

The agent must not prescribe large documentation structures merely because they are available.

---

# 21. Project Size and ADRs

Not every decision requires an ADR.

ADR governance should normally be applied when a decision:

* has meaningful trade-offs,
* affects multiple components,
* establishes a long-term constraint,
* affects contracts,
* changes data ownership,
* changes security boundaries,
* is difficult to reverse,
* has significant operational consequences.

Trivial implementation choices should normally remain local.

Examples:

```text
Variable naming
→ No ADR

Internal helper extraction
→ No ADR

Choosing between two major integration patterns
→ ADR

Choosing service communication strategy
→ ADR

Changing database ownership
→ ADR
```

---

# 22. Project Size and Traceability

Traceability depth should also scale.

### Lightweight

Trace significant:

* Requirements
* Decisions
* Specifications
* Verification

### Standard

Add:

* Domain capabilities
* Architecture elements
* Contracts

### Full

Include detailed relationships across:

* Product
* Domain
* Architecture
* Contracts
* Decisions
* Specifications
* Implementation
* Infrastructure
* Verification

Traceability should remain proportional to risk.

---

# 23. Project Size and Gates

Gates should also scale.

A lightweight change may require only:

```text
Impact Check
→ Specification Review
→ Verification
```

A full project may require:

```text
Gate 0
→ Gate 1
→ Gate 2
→ Gate 3
→ Gate 4
→ Gate 5
→ Gate 6
→ Gate 7
→ Gate 8
```

However, gates may be scoped rather than globally executed.

For system evolution:

```text
Architecture Gate
    ↓
Affected Boundary Only
```

may be sufficient if the change is well-bounded.

---

# 24. Sizing and Human Decisions

The agent may recommend a lifecycle depth.

The agent must not silently impose organizational governance requirements that have not been established.

For example:

```text
Agent:
"This change appears to warrant full architecture governance because it modifies
a public contract and data ownership."

Human/project governance:
"Full ADR review is mandatory."

```

The second statement represents an organizational decision.

The agent should preserve the distinction.

---

# 25. Sizing Report

For significant projects or changes, the agent may produce a sizing assessment.

Example:

```text
Project Sizing Assessment

Scope:
CROSS_SYSTEM

Domain Complexity:
HIGH

Technical Complexity:
HIGH

Risk:
MEDIUM

Reversibility:
DIFFICULT_TO_REVERSE

Integration Surface:
HIGH

Change Impact:
ARCHITECTURE-AFFECTING

Recommended Lifecycle Depth:
LEVEL 3 — FULL

Reason:
The change affects multiple architectural boundaries,
external contracts, and data ownership.
```

The report should be concise and evidence-based.

---

# 26. Sizing and Lifecycle Modes

Sizing should work together with the lifecycle entry mode.

## Greenfield

Focus on:

* Product scope
* Domain discovery
* Architecture
* Contracts
* Decisions
* Specifications
* Infrastructure

---

## Existing System

Focus on:

* Actual behavior
* Current architecture
* Existing contracts
* Technical debt
* Constraints
* Migration boundaries
* Target architecture

---

## System Evolution

Focus on:

* Change scope
* Impact analysis
* Existing contracts
* Affected domain
* Relevant architecture
* Required decisions
* Verification

The same sizing dimensions apply to all three modes.

---

# 27. Sizing Anti-Patterns

The agent must avoid:

### Codebase-Based Sizing

Assuming more code automatically means more architecture work.

### Microservice Inflation

Assuming many services automatically require full lifecycle analysis for every change.

### Risk Blindness

Treating a small implementation as low risk.

### Ceremony by Default

Running every lifecycle phase for trivial changes.

### Premature Downscaling

Reducing rigor before understanding the actual impact.

### Static Classification

Assuming project size cannot change after discovery.

### Documentation-Driven Sizing

Choosing process depth based on the amount of documentation rather than actual risk.

### Organizational Assumptions

Inventing governance requirements that were never established.

---

# 28. Final Sizing Rule

The Spec-Gated Architecture Lifecycle should be:

```text
Lightweight when possible.
Rigorous when necessary.
Adaptive when evidence changes.
Explicit when risk increases.
```

The agent should continuously optimize for:

```text
Useful Rigor
```

rather than:

```text
Maximum Process
```

The goal is not to make every project look like an enterprise architecture program.

The goal is to ensure that the amount of reasoning, documentation, governance, and verification is appropriate for the consequences of the work.

> **Process should scale with uncertainty and consequence, not with ceremony.**
