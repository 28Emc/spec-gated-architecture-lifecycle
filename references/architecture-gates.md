# Spec-Gated Architecture Lifecycle — Architecture Gates

## 1. Purpose

This document defines the gate system used by Spec-Gated Architecture Lifecycle to determine whether a project may safely progress from one lifecycle phase to another.

A gate is a validation mechanism that evaluates whether the required conditions for progression have been satisfied.

A gate does not measure the amount of documentation produced.

It evaluates whether the project has achieved the required level of:

* understanding;
* decision clarity;
* architectural consistency;
* traceability;
* risk awareness;
* implementation readiness.

The fundamental rule is:

```text id="c6d7x1"
Artifacts exist
        ≠
Gate passed
```

Instead:

```text id="qj2v0s"
Required Outcomes
        +
Required Decisions
        +
Known Risks Addressed
        +
No Blocking Contradictions
        +
Sufficient Traceability
        ↓
Gate Passed
```

---

# 2. Gate Principles

## 2.1 Gates are outcome-oriented

A gate evaluates whether the intended outcome of a phase has been achieved.

For example:

```text id="8o1bcd"
Product Discovery
```

does not pass because:

```text
docs/product/vision.md
```

exists.

It passes when the product problem, scope, goals, actors, constraints, and critical assumptions are sufficiently understood.

---

## 2.2 Gates are risk-oriented

The purpose of a gate is not to eliminate all uncertainty.

It is to prevent progression when unresolved uncertainty creates unacceptable risk.

Therefore:

```text id="c0h8pw"
Unknown
    ≠
Blocking
```

A gate should block only when the unknown materially affects the next phase.

---

## 2.3 Gates are proportional

Gate strictness should reflect the scope and risk of the project.

A small internal tool should not require the same governance as:

* a financial platform;
* a public API;
* a distributed system;
* a safety-critical system.

The agent should apply the minimum governance necessary for the project's risk profile.

---

# 3. Gate States

Every gate should have one of the following states:

```text id="k9z9j2"
NOT_EVALUATED
IN_PROGRESS
PASSED
PASSED_WITH_RISKS
BLOCKED
WAIVED
```

## 3.1 NOT_EVALUATED

The gate has not yet been assessed.

## 3.2 IN_PROGRESS

Required work is being performed.

## 3.3 PASSED

All mandatory conditions are satisfied.

## 3.4 PASSED_WITH_RISKS

The gate can progress despite explicitly identified non-blocking risks.

## 3.5 BLOCKED

At least one blocking condition prevents safe progression.

## 3.6 WAIVED

An authorized project participant explicitly accepts bypassing a gate condition.

A waiver must be recorded.

---

# 4. Gate Evaluation Model

Each gate should be evaluated using:

```text id="h6t7by"
Gate
 ├── Objective
 ├── Required Outcomes
 ├── Required Decisions
 ├── Required Evidence
 ├── Blocking Conditions
 ├── Non-Blocking Risks
 ├── Traceability Requirements
 └── Exit Criteria
```

The agent should produce an explicit assessment.

Example:

```text id="k0p0fl"
Gate: Domain Discovery

Status: BLOCKED

Satisfied:
✓ Core capabilities identified
✓ Main domain concepts identified

Blocking:
✗ Ownership of historical data unresolved

Non-blocking:
⚠ Terminology still being refined

Required next action:
Define ownership and lifecycle of historical records.
```

---

# 5. Gate Severity

Findings should be classified as:

```text id="sqjv8v"
INFO
WARNING
SIGNIFICANT
BLOCKING
```

Only `BLOCKING` findings automatically prevent progression.

`SIGNIFICANT` findings may block depending on the phase and project risk profile.

---

# 6. Gate 0 — Project Initialization

This gate establishes enough information to begin the lifecycle.

## Objective

Determine the project type, scope, available evidence, and lifecycle entry point.

## Required outcomes

* Project identified.
* Lifecycle scope identified.
* Entry mode identified.
* Existing artifacts discovered.
* Known constraints identified.
* Initial stakeholders or decision authority identified.

## Entry modes

```text id="6f9qg2"
GREENFIELD
EXISTING_SYSTEM
SYSTEM_EVOLUTION
```

## Blocking conditions

* Project scope cannot be established.
* The requested lifecycle activity cannot be identified.
* Critical existing system information is inaccessible for an evolution task.

## Exit

```text
PROJECT INITIALIZED
```

---

# 7. Gate 1 — Product Discovery

## Objective

Establish sufficient product context to reason about the domain.

## Required outcomes

* Problem identified.
* Target users or actors identified.
* Product objective established.
* Goals defined.
* Non-goals defined.
* Scope boundaries identified.
* Major constraints identified.
* Critical assumptions identified.

## Required decisions

At minimum:

```text
Product Scope
Primary Objective
Major Non-Goals
```

## Blocking conditions

* No clear problem.
* Scope is fundamentally ambiguous.
* Critical user/business behavior is unresolved.
* Requirements contradict each other without an accepted resolution.

## Non-blocking examples

* Detailed UI requirements not yet defined.
* Secondary personas incomplete.
* Non-critical success metrics still being refined.

## Exit

```text
PRODUCT CONTEXT SUFFICIENT
```

---

# 8. Gate 2 — Domain Discovery

## Objective

Establish sufficient understanding of the business domain and its boundaries.

## Required outcomes

* Core capabilities identified.
* Domain terminology established.
* Important concepts identified.
* Business rules identified.
* Important invariants identified.
* Candidate bounded contexts established.
* Major relationships identified.
* Data ownership considerations identified.

## Required decisions

Where applicable:

```text
Bounded Context Boundaries
Aggregate Ownership
Core Business Invariants
Domain Responsibility
```

## Blocking conditions

* Critical business concepts have conflicting meanings.
* Bounded context boundaries are fundamentally unresolved.
* Critical business invariants are unknown.
* Ownership of critical domain data is undefined.

## Non-blocking examples

* Secondary terminology still evolving.
* Non-critical domain events not yet modeled.
* Internal implementation details not yet determined.

## Exit

```text
DOMAIN MODEL SUFFICIENT
```

---

# 9. Gate 3 — Architecture

## Objective

Establish a coherent structural architecture capable of satisfying known requirements and domain boundaries.

## Required outcomes

* System boundary established.
* Major architectural components identified.
* Responsibilities established.
* Component relationships defined.
* Relevant communication patterns established.
* Major quality attributes considered.
* External systems identified.
* Deployment considerations identified.
* Architectural risks identified.

## Required architecture views

At minimum, where applicable:

```text id="5yixzz"
System Context
Container Architecture
```

Additional views should be created only when useful.

## Required decisions

Examples:

```text
Architectural Style
Component Boundaries
Communication Strategy
Data Ownership
Deployment Model
```

Not every project requires all of these.

## Blocking conditions

* Architecture contradicts domain boundaries.
* Critical system responsibility has no owner.
* Critical external dependency is undefined.
* Required quality attributes cannot be satisfied by the current architecture.
* Major architecture decision remains unresolved.

## Exit

```text
ARCHITECTURE COHERENT
```

---

# 10. Gate 4 — Contracts

## Objective

Establish sufficient agreements between system boundaries.

## Required outcomes

Applicable contracts are defined for:

```text
APIs
Events
Data
Integrations
Security
Errors
Observability
```

The agent should not require every category when irrelevant.

## Required decisions

Examples:

```text
Versioning
Compatibility
Error Semantics
Event Evolution
Authentication
Authorization
```

## Blocking conditions

* Contract contradicts architecture.
* Contract contradicts domain behavior.
* Breaking change is introduced without migration strategy.
* Critical security semantics are undefined.
* Data contract is incompatible with ownership rules.

## Exit

```text
CONTRACTS SUFFICIENT
```

---

# 11. Gate 5 — Architecture Decisions

## Objective

Ensure consequential decisions are explicit, authorized, and traceable.

## Required outcomes

* Significant decisions identified.
* Existing decisions reviewed.
* Conflicts resolved.
* Required ADRs created.
* Decision status established.
* Decision dependencies identified.
* Superseded decisions identified where applicable.

## Blocking conditions

* Significant architecture choice is still implicitly assumed.
* Existing decisions conflict without resolution.
* A consequential recommendation is being treated as a decision without authorization.
* Implementation depends on an unresolved architectural decision.

## Exit

```text
ARCHITECTURAL DECISIONS GOVERNED
```

---

# 12. Gate 6 — Specifications

## Objective

Ensure implementation can proceed without requiring developers or agents to rediscover critical product, domain, or architectural intent.

## Required outcomes

* Implementation scope defined.
* Behavior specified.
* Relevant contracts referenced.
* Acceptance criteria established.
* Error behavior defined.
* Security behavior defined where relevant.
* Important edge cases identified.
* Architectural constraints referenced.

## Blocking conditions

* Specification contradicts approved architecture.
* Specification contradicts contracts.
* Critical behavior is undefined.
* Implementation requires an unresolved architecture decision.

## Exit

```text
IMPLEMENTATION READY
```

---

# 13. Gate 7 — Infrastructure

## Objective

Ensure the system can be built, deployed, operated, and observed according to its intended architecture.

## Required outcomes

Applicable areas are defined:

```text
Development Environment
Runtime Environment
Deployment
Networking
Configuration
Secrets
Persistence
Messaging
CI/CD
Observability
Security
Resilience
Backup / Recovery
```

## Blocking conditions

* Required runtime dependency has no deployment strategy.
* Production architecture cannot support required availability or resilience.
* Security-critical infrastructure is undefined.
* Required observability is absent.
* Deployment cannot reliably reproduce the intended system.

## Exit

```text
OPERATIONALLY PREPARED
```

---

# 14. Gate 8 — Release Readiness

## Objective

Determine whether the system is ready for its intended release.

## Required outcomes

### Functional

* Required scope implemented.
* Critical acceptance criteria satisfied.

### Architecture

* Implementation aligns with approved architecture.
* No critical architecture drift.

### Contracts

* Contracts are compatible.
* Required migrations are prepared.

### Security

* Required controls implemented.
* Critical vulnerabilities addressed.

### Testing

* Appropriate test coverage exists.
* Critical paths validated.

### Operations

* Monitoring available.
* Logging available.
* Alerting available where required.
* Deployment strategy validated.
* Rollback strategy defined.

### Documentation

* Required operational and technical documentation available.

## Blocking conditions

* Critical functionality incomplete.
* Critical security issue unresolved.
* Deployment cannot be reliably executed.
* Rollback or recovery is impossible where required.
* Critical contract incompatibility exists.
* Significant architecture drift remains unexplained.

## Exit

```text
RELEASE READY
```

---

# 15. Gate Evaluation for Existing Systems

Existing systems require an additional principle:

```text id="8y3h7p"
Observed Reality
        >
Historical Documentation
```

when the two conflict.

The agent should distinguish:

```text
Documented State
Actual State
Target State
```

For example:

```text
Documented:
Service A owns Customer.

Actual:
Service B directly modifies Customer data.

Target:
Service A becomes sole owner.
```

This distinction is essential for migration work.

---

# 16. Gate Evaluation for System Evolution

A feature or change does not automatically require the entire lifecycle.

The agent should identify the affected gates.

Example:

```text id="j7c8ce"
Change:
Add payment integration.

Potentially affected:

Product       ✓
Domain        ✓
Architecture  ✓
Contracts     ✓
Decisions     ✓
Specifications ✓
Infrastructure ✓
Release        ✓
```

Another change:

```text id="e3y75d"
Change:
Rename an internal private method.

Potentially affected:

Specifications
Implementation
Testing

Architecture gates:
Not applicable
```

The agent should use the smallest sufficient gate scope.

---

# 17. Gate Waivers

A gate condition may be waived only when authorized.

A waiver should contain:

```text id="10q77h"
Gate
Condition
Reason
Risk
Mitigation
Authority
Date
Expiration / Review Point
```

Example:

```text
Gate:
Infrastructure

Waived condition:
Production autoscaling

Reason:
Initial release has controlled internal traffic.

Risk:
Manual scaling required.

Mitigation:
Operational monitoring and documented scaling procedure.

Review:
Before public launch.
```

A waiver does not mean the condition was satisfied.

It means the risk was consciously accepted.

---

# 18. Gate Overrides

An agent must not override a blocking condition simply because:

* implementation is requested urgently;
* the user wants to "move forward";
* documentation is incomplete;
* the agent believes the issue is probably fine.

If authorized project governance permits an override, it must be explicit and recorded.

---

# 19. Gate Revalidation

A passed gate may need to be re-evaluated when new information materially affects its assumptions.

Example:

```text id="5i4r5q"
Architecture Gate
      ↓
Passed
      ↓
New Contract Constraint
      ↓
Architecture assumption invalidated
      ↓
Gate reopened
```

The gate should then transition:

```text id="1vps7k"
PASSED
   ↓
REVALIDATION_REQUIRED
   ↓
IN_PROGRESS
```

The lifecycle must not preserve a stale `PASSED` status when its underlying assumptions are no longer valid.

---

# 20. Gate Dependencies

Gates are related.

For example:

```text id="y7f1hz"
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
```

However, dependencies are not always strictly sequential.

For example:

```text id="fl8lxi"
Infrastructure constraints
        ↓
Architecture
```

or:

```text id="q2d0yi"
Contract requirement
        ↓
Architecture
```

Therefore, gate dependencies may form a directed graph rather than a simple chain.

---

# 21. Gate Report

A gate evaluation should produce a concise report.

Recommended structure:

```text id="z6ih81"
Architecture Gate Report

Gate:
Architecture

Status:
BLOCKED

Satisfied:
✓ System boundary
✓ Major components
✓ Domain alignment

Warnings:
⚠ Deployment topology still evolving

Blocking:
✗ Data ownership between Service A and Service B unresolved

Required Actions:
1. Define ownership.
2. Update architecture.
3. Revalidate affected contracts.

Next Gate:
Contracts
```

---

# 22. Gate Scoring

A numeric score should not replace gate evaluation.

For example:

```text id="w4p5da"
Architecture completeness: 82%
```

does not mean:

```text id="j7qjtl"
Architecture Gate = PASSED
```

A single critical unresolved issue may block progression despite a high percentage.

Qualitative gate status has priority over superficial completeness metrics.

---

# 23. Gate Evidence

Every gate decision should be explainable through evidence.

Evidence may include:

```text id="9u8b6t"
Documents
Source Code
Tests
Contracts
ADRs
Infrastructure Definitions
User Decisions
Architecture Diagrams
Runtime Observations
```

The agent should be able to answer:

```text
Why did this gate pass?
```

or:

```text
Why is this gate blocked?
```

without relying on undocumented reasoning.

---

# 24. Gate and Traceability

Gate evaluation should verify that important artifacts are connected.

For example:

```text id="7v2d0n"
Requirement
   ↓
Domain Capability
   ↓
Architecture Component
   ↓
Contract
   ↓
Specification
```

An orphaned critical requirement or specification should be reported.

Traceability gaps do not always block progression, but critical gaps should.

---

# 25. Gate Completion Rule

A gate passes when:

```text id="h4d9be"
Required Outcomes
        +
Required Decisions
        +
Relevant Evidence
        +
Acceptable Risk
        +
No Blocking Contradictions
        +
Sufficient Traceability
        ↓
PASS
```

A gate does not pass because:

```text
✓ Documents exist
✓ Diagrams look complete
✓ Agent generated the requested files
✓ User requested to continue
```

---

# 26. Final Gate Governance Rule

The fundamental rule of Spec-Gated Architecture Lifecycle gates is:

```text id="l4z7n4"
The agent must not confuse activity with progress.

Progress means that the project has reduced
the uncertainty required to safely enter the next phase.
```

A gate exists to answer one question:

```text id="x8x1bb"
"Do we know enough, have we decided enough,
and are we consistent enough to proceed safely?"
```

If the answer is no, the gate is blocked.

If the answer is yes, the lifecycle may progress.
