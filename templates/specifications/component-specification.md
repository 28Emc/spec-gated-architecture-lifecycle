# Component Specification

## 1. Document Metadata

| Field                 | Value                   |
| --------------------- | ----------------------- |
| Document Type         | Component Specification |
| Lifecycle Phase       | Specifications / SDD    |
| Specification Type    | `COMPONENT`             |
| Status                | `DRAFT`                 |
| Version               | `0.1`                   |
| System                | `<system>`              |
| Container             | `<container>`           |
| Component             | `<component>`           |
| Owner                 | `<owner>`               |
| Created               | `<date>`                |
| Last Updated          | `<date>`                |
| C4 Component Baseline | `<baseline>`            |
| Architecture Baseline | `<baseline>`            |
| ADR Baseline          | `<baseline>`            |

---

# 2. Purpose

This document specifies the implementation-relevant behavior, responsibilities, boundaries, dependencies, constraints, and verification expectations of an approved architectural component.

It provides sufficient detail for implementation without turning the specification into:

* source-code documentation,
* a class diagram,
* a package structure,
* a framework configuration guide,
* or a new architectural design.

---

# 3. Core Principle

> **A Component Specification defines how an approved architectural component is expected to behave and collaborate within its container; it does not redefine the architecture or prescribe unnecessary source-code structure.**

The component must preserve:

* its architectural responsibility,
* domain responsibilities,
* business rules,
* invariants,
* contracts,
* security boundaries,
* data ownership,
* and relevant quality attributes.

---

# 4. Component Definition

```text id="w8q4nr"
Component ID:
<COMPONENT-ID>

Name:
<name>

Purpose:
<purpose>

Responsibility:
<responsibility>

Container:
<container>

Bounded Context:
<context>

Architectural Role:
<role>

Criticality:
<LOW | MEDIUM | HIGH | CRITICAL>
```

---

# 5. Component Classification

```text id="p3m7vc"
Classification:

DOMAIN_BEHAVIOR
APPLICATION_ORCHESTRATION
INTEGRATION
SECURITY
DATA_ACCESS
OBSERVABILITY
COORDINATION
VALIDATION
TRANSFORMATION
OTHER
```

Classification must describe architectural responsibility rather than framework terminology.

---

# 6. Entry Conditions

Before producing this specification:

* [ ] Component exists in the approved architecture.
* [ ] Component responsibility is defined.
* [ ] Container boundary is understood.
* [ ] Relevant bounded context is understood.
* [ ] Relevant domain model is understood.
* [ ] Relevant contracts are identified.
* [ ] Relevant ADRs are active.
* [ ] Component requires specification-level elaboration.
* [ ] No unresolved blocking architectural decision affects the component.

If the component does not require this level of elaboration, `NOT_REQUIRED` should be recorded instead.

---

# 7. Specification Necessity

```text id="k5x9mr"
Specification Required:
<YES | NO>

Reason:
<reason>

Architectural Driver:
<driver>

Risk:
<risk>

Complexity:
<complexity>

Change Sensitivity:
<change sensitivity>
```

A component specification must have a reason to exist.

---

# 8. Responsibility Boundary

## Owns

```text id="n7q3xc"
<responsibilities>
```

## Does Not Own

```text id="m4x8vr"
<responsibilities>
```

## Shared / Coordinated Responsibilities

```text id="x9q5mk"
<responsibilities>
```

Responsibilities must not overlap ambiguously with neighboring components.

---

# 9. Responsibility Invariants

```text id="q6m3vc"
Invariant:
<invariant>

Meaning:
<meaning>

Protected By:
<component>

Affected By:
<operation>

Verification:
<method>
```

If an invariant cannot be safely protected within the component boundary, escalate the architectural concern.

---

# 10. Domain Alignment

```text id="v8x4mr"
Bounded Context:
<context>

Domain Capability:
<capability>

Domain Concepts:
<concepts>

Aggregates:
<aggregates>

Domain Services:
<services>

Domain Policies:
<policies>

Domain Events:
<events>
```

The component should reinforce the domain model rather than introduce an alternative business model.

---

# 11. Application Responsibilities

For application-oriented components:

```text id="n5q9xc"
Application Responsibility:
<responsibility>

Input:
<input>

Coordination:
<coordination>

Domain Invocation:
<behavior>

Output:
<output>

Transaction Scope:
<scope>

Failure:
<behavior>
```

Application coordination must not silently absorb domain rules that belong in the domain model.

---

# 12. Component Behavior

```text id="m7x3vr"
Trigger:
<trigger>

Preconditions:
<conditions>

Main Behavior:
<behavior>

Alternative Behavior:
<behavior>

Failure Behavior:
<behavior>

Postconditions:
<conditions>

Side Effects:
<effects>
```

Behavior should be described independently of source-code structure.

---

# 13. Behavioral Scenarios

Each significant behavior should have a scenario.

```text id="x4q8mk"
Scenario ID:
<scenario>

Given:
<initial state>

When:
<trigger>

Then:
<expected result>

And:
<additional result>
```

---

# 14. Component Operations

| Operation     | Purpose     | Input     | Output     | State Change | Criticality |
| ------------- | ----------- | --------- | ---------- | ------------ | ----------- |
| `<operation>` | `<purpose>` | `<input>` | `<output>` | `<yes/no>`   | `<level>`   |

Operations describe meaningful component behavior, not every method that may exist in source code.

---

# 15. Input Specification

```text id="q9m5vc"
Input:
<name>

Meaning:
<meaning>

Source:
<source>

Required:
<YES | NO>

Validation:
<validation>

Sensitive:
<YES | NO>

Constraints:
<constraints>
```

---

# 16. Output Specification

```text id="v6x3mr"
Output:
<name>

Meaning:
<meaning>

Consumer:
<consumer>

Required:
<YES | NO>

Transformation:
<transformation>

Sensitive:
<YES | NO>
```

---

# 17. Internal State

When the component maintains meaningful state:

```text id="n8q4xc"
State:
<state>

Meaning:
<meaning>

Owner:
<component>

Entry:
<condition>

Transition:
<condition>

Exit:
<condition>
```

Do not create component state merely because implementation variables exist.

---

# 18. State Transitions

| Current State | Trigger     | Guard     | Next State | Failure      |
| ------------- | ----------- | --------- | ---------- | ------------ |
| `<state>`     | `<trigger>` | `<guard>` | `<state>`  | `<behavior>` |

State semantics must remain consistent with the domain model where the state is domain-relevant.

---

# 19. Component Dependencies

```text id="m5x8vr"
Dependency:
<component/system>

Purpose:
<purpose>

Direction:
<direction>

Required:
<YES | NO>

Failure Impact:
<impact>

Failure Behavior:
<behavior>
```

---

# 20. Dependency Matrix

| Component     | Direction  | Purpose     | Coupling            | Failure Impact |
| ------------- | ---------- | ----------- | ------------------- | -------------- |
| `<component>` | `<in/out>` | `<purpose>` | `<LOW/MEDIUM/HIGH>` | `<impact>`     |

---

# 21. Dependency Direction

```text id="x7q3mk"
Component:
<component>

Allowed Dependencies:
<dependencies>

Forbidden Dependencies:
<dependencies>

Reason:
<reason>
```

Dependency restrictions must originate from architecture, domain boundaries, or explicit decisions.

---

# 22. Internal Communication

```text id="q4m9vc"
Interaction:
<interaction>

Source:
<component>

Target:
<component>

Purpose:
<purpose>

Interaction Type:
<DIRECT | EVENT | CALLBACK | OTHER>

Semantics:
<semantics>

Failure:
<behavior>
```

Do not introduce asynchronous communication simply because it appears technically attractive.

---

# 23. External Communication

```text id="v9x5mr"
External Dependency:
<dependency>

Purpose:
<purpose>

Contract:
<contract>

Provider:
<provider>

Consumer:
<consumer>

Failure:
<behavior>
```

External communication must respect the relevant API, Event, Data, Security, and Observability Contracts.

---

# 24. Domain Interaction

```text id="n6q8xc"
Domain Operation:
<operation>

Component Responsibility:
<responsibility>

Domain Behavior Invoked:
<behavior>

Business Rules:
<rules>

Invariant:
<invariant>

Result:
<result>
```

The component must not duplicate domain rules merely for convenience.

---

# 25. Aggregate Interaction

When relevant:

```text id="m3x7vr"
Aggregate:
<aggregate>

Interaction:
<interaction>

Purpose:
<purpose>

Invariant Protected:
<invariant>

Consistency Boundary:
<boundary>

Cross-Aggregate:
<YES | NO>
```

Do not treat aggregates as technical repositories or persistence records.

---

# 26. Domain Event Interaction

```text id="x8q4mk"
Domain Event:
<event>

Role:
<PRODUCER | CONSUMER | REACTOR | NONE>

Trigger:
<condition>

Business Meaning:
<meaning>

Reaction:
<behavior>
```

A domain event remains a domain concept unless architecture explicitly represents it across a boundary.

---

# 27. Integration Event Interaction

When relevant:

```text id="q5m9vc"
Integration Event:
<event>

Role:
<PUBLISHER | CONSUMER>

Event Contract:
<contract>

Trigger:
<trigger>

Consumer Expectation:
<expectation>

Failure:
<behavior>
```

The component must not redefine event semantics already governed by the Event Contract.

---

# 28. API Interaction

```text id="v7x3mr"
API:
<API>

Role:
<PROVIDER | CONSUMER>

API Contract:
<contract>

Operation:
<operation>

Purpose:
<purpose>

Failure:
<behavior>
```

---

# 29. Data Responsibility

```text id="n9q4xc"
Data:
<data>

Responsibility:
<READ | WRITE | TRANSFORM | VALIDATE | CACHE | OTHER>

Authority:
<authority>

Ownership:
<owner>

Source of Truth:
<source>

Consistency:
<requirement>
```

The component must not assume ownership of data simply because it accesses it.

---

# 30. Persistence Interaction

When persistence is relevant:

```text id="m6x8vr"
Persistence Responsibility:
<responsibility>

Data:
<data>

Persistence Operation:
<operation>

Consistency:
<requirement>

Failure:
<behavior>

Transaction:
<scope>
```

Persistence implementation details belong in the Data/Persistence Specification where appropriate.

---

# 31. Data Transformation

```text id="x4q7mk"
Source:
<source>

Target:
<target>

Transformation:
<transformation>

Semantic Change:
<YES | NO>

Lossy:
<YES | NO>

Validation:
<validation>
```

Transformations that alter domain meaning must be explicitly reviewed.

---

# 32. Security Responsibility

```text id="q8m3vc"
Security Responsibility:
<responsibility>

Principal:
<principal>

Protected Resource:
<resource>

Authorization:
<requirement>

Sensitive Data:
<data>

Security Failure:
<behavior>
```

The component must not invent a new authorization model independently of the Security Contract.

---

# 33. Trust Boundary

```text id="v5x9mr"
Trust Boundary:
<boundary>

Trusted Inputs:
<inputs>

Untrusted Inputs:
<inputs>

Validation:
<validation>

Trust Assumptions:
<assumptions>
```

Never assume that an internal caller is automatically trustworthy unless the architecture/security model establishes that assumption.

---

# 34. Error Handling

```text id="n7q3xc"
Error:
<error>

Trigger:
<trigger>

Meaning:
<meaning>

Handled:
<YES | NO | DELEGATED>

Propagation:
<behavior>

Recovery:
<behavior>

Observability:
<signal>
```

Internal errors must not automatically become external contract errors.

---

# 35. Failure Boundaries

```text id="m4x8vr"
Failure Boundary:
<boundary>

Failure:
<failure>

Containment:
<behavior>

Propagation:
<behavior>

Recovery:
<behavior>

Impact:
<impact>
```

---

# 36. Retry Behavior

When relevant:

```text id="x9q5mk"
Retryable:
<YES | NO | CONDITIONAL>

Reason:
<reason>

Retry Conditions:
<conditions>

Maximum:
<value or unspecified>

Backoff:
<strategy or unspecified>

Idempotency:
<requirement>
```

Retries must not be added by default.

---

# 37. Timeout Behavior

```text id="q6m3vc"
Dependency:
<dependency>

Timeout:
<value or inherited/unknown>

Meaning:
<meaning>

Failure:
<behavior>

Recovery:
<behavior>
```

Exact values require evidence or explicit decisions.

---

# 38. Concurrency

When relevant:

```text id="v8x4mr"
Concurrent Scenario:
<scenario>

Shared Resource:
<resource>

Conflict:
<conflict>

Consistency:
<requirement>

Resolution:
<behavior>

Verification:
<method>
```

---

# 39. Transaction Scope

```text id="n5q9xc"
Transaction:
<transaction>

Scope:
<scope>

Operations:
<operations>

Atomicity:
<requirement>

Consistency:
<requirement>

Failure:
<behavior>
```

If transaction boundaries cross architectural containers, the issue must be reviewed architecturally.

---

# 40. Performance Behavior

When relevant:

```text id="m7x3vr"
Scenario:
<scenario>

Expected Behavior:
<behavior>

Quality Attribute:
<attribute>

Target:
<target or UNKNOWN>

Measurement:
<measurement>

Verification:
<verification>
```

Do not invent performance targets.

---

# 41. Resource Usage

When relevant:

```text id="x4q8mk"
Resource:
<resource>

Usage:
<usage>

Constraint:
<constraint>

Failure:
<behavior>

Monitoring:
<observability>
```

Resource details should only be specified when architecturally or operationally relevant.

---

# 42. Observability

```text id="q9m5vc"
Operational Question:
<question>

Signal:
<LOG | METRIC | TRACE | AUDIT | EVENT | HEALTH | OTHER>

Meaning:
<meaning>

Required Fields:
<fields>

Correlation:
<behavior>

Sensitive Data:
<handling>
```

Observability must describe what needs to be known, not merely which tool produces telemetry.

---

# 43. Audit Behavior

When auditability is required:

```text id="v6x3mr"
Audited Action:
<action>

Reason:
<reason>

Actor:
<actor>

Evidence:
<evidence>

Integrity:
<requirement>

Retention:
<requirement>

Access:
<requirement>
```

Operational logging and audit evidence must not be conflated.

---

# 44. Configuration

```text id="n8q4xc"
Configuration:
<configuration>

Purpose:
<purpose>

Required:
<YES | NO>

Default:
<value or unspecified>

Allowed Values:
<values>

Environment Specific:
<YES | NO>

Sensitive:
<YES | NO>
```

Do not invent configuration defaults.

---

# 45. Feature Flags

If relevant:

```text id="m5x8vr"
Flag:
<flag>

Purpose:
<purpose>

Scope:
<scope>

Default:
<value>

Activation:
<condition>

Deactivation:
<condition>

Removal Condition:
<condition>
```

Feature flags must not become permanent undocumented architecture.

---

# 46. Component Contract

Internal component contracts should be defined when another architectural unit relies materially on the component.

```text id="x7q3mk"
Component Contract:
<contract>

Provider:
<component>

Consumer:
<consumer>

Behavior:
<behavior>

Inputs:
<inputs>

Outputs:
<outputs>

Failure:
<failure>

Compatibility:
<compatibility>
```

Internal implementation details that have no architectural significance do not require formal contracts.

---

# 47. Implementation Freedom

Explicitly identify:

```text id="q4m9vc"
Must Be Specified:
<items>

Architecturally Constrained:
<items>

Implementation Choice:
<items>

Not Relevant:
<items>
```

Examples of implementation freedom may include:

* internal class organization,
* internal naming,
* private helper structure,
* framework-specific abstractions,
* algorithm selection where behavior remains equivalent.

---

# 48. Implementation Mapping

```text id="v9x5mr"
Component:
<component>

Implementation Unit:
<unit>

Responsibility:
<responsibility>

Specification Sections:
<sections>

Verification:
<tests>
```

Do not automatically map one architectural component to one class, package, or module.

---

# 49. Test Specification

Each significant behavior should be verifiable.

```text id="n6q8xc"
Scenario ID:
<scenario>

Behavior:
<behavior>

Verification Type:
<UNIT | COMPONENT | CONTRACT | INTEGRATION | END_TO_END | SECURITY | PERFORMANCE | OTHER>

Given:
<condition>

When:
<action>

Then:
<expected>

Evidence:
<evidence>
```

---

# 50. Component Fitness

Evaluate whether the component structure remains useful.

```text id="m3x7vr"
Responsibility Cohesion:
<HIGH | MEDIUM | LOW>

Dependency Coupling:
<LOW | MEDIUM | HIGH>

Change Coupling:
<LOW | MEDIUM | HIGH>

Testability:
<HIGH | MEDIUM | LOW>

Domain Alignment:
<HIGH | MEDIUM | LOW>

Architectural Clarity:
<HIGH | MEDIUM | LOW>
```

This is an assessment, not a numeric architecture score.

---

# 51. Component Risks

| ID                 | Risk     | Severity     | Impact     | Mitigation     |
| ------------------ | -------- | ------------ | ---------- | -------------- |
| COMPONENT-RISK-001 | `<risk>` | `<severity>` | `<impact>` | `<mitigation>` |

---

# 52. Component Unknowns

| ID                    | Unknown     | Impact     | Blocking   | Resolution |
| --------------------- | ----------- | ---------- | ---------- | ---------- |
| COMPONENT-UNKNOWN-001 | `<unknown>` | `<impact>` | `<yes/no>` | `<method>` |

---

# 53. Component Assumptions

| ID                       | Assumption     | Evidence     | Confidence     | Validation |
| ------------------------ | -------------- | ------------ | -------------- | ---------- |
| COMPONENT-ASSUMPTION-001 | `<assumption>` | `<evidence>` | `<confidence>` | `<method>` |

---

# 54. Architecture Conflicts

```text id="x8q4mk"
Conflict:
<description>

Architecture Artifact:
<artifact>

Component Specification:
<section>

Severity:
<INFO | WARNING | SIGNIFICANT | BLOCKING>

Required Action:
<action>

Escalation:
<ADR / Architecture Review / None>
```

A component specification must never silently resolve an architecture conflict.

---

# 55. Existing System Analysis

For existing systems:

```text id="q5m9vc"
Documented Responsibility:
<responsibility>

Observed Responsibility:
<responsibility>

Target Responsibility:
<responsibility>

Differences:
<differences>
```

Observed implementation behavior is evidence, not automatically the desired target architecture.

---

# 56. System Evolution

For changes to an existing architecture:

```text id="v7x3mr"
Current:
<current>

Target:
<target>

Transition:
<transition>

Compatibility:
<requirements>

Migration:
<migration>

Completion:
<condition>
```

---

# 57. Change Impact

Before changing the component specification, evaluate:

* [ ] Domain model impact.
* [ ] Aggregate impact.
* [ ] Business-rule impact.
* [ ] API impact.
* [ ] Event impact.
* [ ] Data impact.
* [ ] Security impact.
* [ ] Observability impact.
* [ ] Other component impact.
* [ ] Container impact.
* [ ] ADR impact.
* [ ] Testing impact.
* [ ] Migration impact.

---

# 58. Traceability

| Component Specification Element | Upstream Artifact | Relationship | Verification     |
| ------------------------------- | ----------------- | ------------ | ---------------- |
| `<element>`                     | `<artifact>`      | `REFINES`    | `<verification>` |

Typical chain:

```text id="n9q4xc"
Domain Responsibility
       ↓
Architecture Component
       ↓
Component Specification
       ↓
Implementation
       ↓
Verification
```

---

# 59. Specification Review

```text id="m6x8vr"
Reviewer:
<reviewer>

Date:
<date>

Result:
<APPROVED | CHANGES_REQUESTED | REJECTED | DEFERRED>

Comments:
<comments>
```

---

# 60. Specification Outcome

```text id="x4q7mk"
Outcome:

READY
READY_WITH_RISKS
INCOMPLETE
BLOCKED
NOT_REQUIRED
```

## READY

The component is sufficiently specified for implementation and verification.

## READY_WITH_RISKS

Implementation may proceed with explicit non-blocking risks.

## INCOMPLETE

Important behavior or constraints remain unspecified.

## BLOCKED

An upstream issue prevents safe specification.

## NOT_REQUIRED

The component does not justify independent specification-level elaboration.

---

# 61. Handoff

### Implementation Must Preserve

* Component responsibility.
* Domain semantics.
* Business rules.
* Invariants.
* Architectural boundaries.
* Contracts.
* Security requirements.
* Data ownership.
* Required observability.

### Implementation May Choose

* Internal classes.
* Internal packages.
* Private abstractions.
* Framework-specific mechanisms.
* Internal algorithms.

Provided those choices preserve the approved architecture and specification.

### Implementation Must Not Introduce

* New architectural boundaries.
* New domain ownership.
* New contracts.
* New security assumptions.
* New consistency guarantees.
* New cross-container transactions.

Without appropriate governance.

---

# 62. Agent Instructions

When producing a Component Specification:

1. Start from the approved C4 Component Architecture.
2. Verify why the component requires specification-level detail.
3. Preserve the component's architectural responsibility.
4. Identify the bounded context.
5. Identify relevant domain concepts and invariants.
6. Define meaningful component behavior.
7. Define important inputs and outputs.
8. Define meaningful state only when required.
9. Define component dependencies.
10. Define dependency failure behavior.
11. Preserve API/Event/Data/Security/Observability Contracts.
12. Define transaction boundaries where relevant.
13. Define concurrency behavior where relevant.
14. Define verification scenarios.
15. Keep implementation freedom explicit.
16. Avoid mapping components directly to classes or packages.
17. Do not introduce architectural boundaries through component specification.
18. Do not duplicate domain rules unnecessarily.
19. Do not invent performance targets.
20. Do not invent retry or timeout guarantees.
21. Do not assume internal callers are automatically trusted.
22. For existing systems, distinguish documented, observed, and target behavior.
23. Maintain traceability.
24. Escalate architectural conflicts.
25. Keep the specification proportional to component complexity and risk.

---

# 63. Anti-Patterns

## Class = Component

Treating every class as an architectural component.

## Package = Component

Treating package structure as architecture.

## Framework = Architecture

Using framework modules as the component model.

## Controller-Service-Repository Diagram

Replacing architectural reasoning with a conventional source-code structure.

## Component Explosion

Creating components for every small implementation detail.

## Generic Service Component

Creating a component called `Service`, `Utils`, or similar without meaningful responsibility.

## Domain Leakage

Moving business responsibility into technical components without justification.

## Invariant Splitting

Dividing invariant protection across components without architectural justification.

## Data-First Componentization

Creating components around tables rather than responsibility.

## Endpoint-First Componentization

Creating components around API endpoints.

## False Independence

Calling a component independent while it remains tightly coupled to another component.

## Hidden Shared State

Allowing multiple components to modify the same state without explicit ownership.

## Unspecified Failure

Defining the happy path while ignoring dependency or operational failure.

## Framework-Driven Specification

Describing framework constructs instead of meaningful architecture.

## Source-Code Transcription

Turning the specification into a copy of the implementation.

## Architecture Theater

Creating component documentation without a meaningful architectural reason.

---

# 64. Safe Progression Question

Before accepting this specification:

> **Does this specification make the component's meaningful responsibilities, behavior, dependencies, boundaries, failure semantics, security expectations, and verification requirements sufficiently precise without turning the architectural component into a source-code map?**

If not, determine whether the missing information belongs to:

```text id="v5x9mr"
Domain
Architecture
Contract
ADR
Specification
Implementation
```

---

# 65. Final Principle

> **A Component Specification explains how an architecturally meaningful component behaves and collaborates; it does not prescribe the source tree.**

The intended relationship is:

```text id="n7q3xc"
Domain Model
      ↓
C4 Component Architecture
      ↓
Component Specification
      ↓
Implementation
      ↓
Verification
```

The specification is successful when an engineer can implement the component confidently while preserving its architectural responsibility and still having reasonable freedom over internal code organization.
