# Architecture Review

## 1. Document Metadata

| Field                  | Value                          |
| ---------------------- | ------------------------------ |
| Document Type          | Architecture Review            |
| Lifecycle Phase        | Architecture                   |
| Status                 | `DRAFT`                        |
| Version                | `0.1`                          |
| Owner                  | `<owner>`                      |
| Created                | `<date>`                       |
| Last Updated           | `<date>`                       |
| System                 | `<system>`                     |
| Architecture Context   | `<architecture-context>`       |
| Container Architecture | `<c4-container>`               |
| Component Architecture | `<c4-component-if-applicable>` |
| Architectural Views    | `<architecture-views>`         |
| Previous Phase         | Domain Discovery               |
| Next Phase             | Contracts                      |

---

# 2. Purpose

This document provides the final architectural checkpoint before entering the Contracts phase.

It evaluates whether the architecture is sufficiently understood, coherent, justified, and traceable across:

* Product drivers
* Domain boundaries
* System context
* Containers
* Components, when applicable
* Runtime behavior
* Deployment
* Data
* Security
* Integration
* Operational concerns
* Migration
* Quality attributes
* Architecture decisions
* Risks
* Unknowns
* Constraints

The Architecture Review does not replace the underlying architecture artifacts.

It consolidates their conclusions and determines whether the architecture can safely proceed to contract definition.

---

# 3. Core Principle

> **Architecture is ready for Contracts when its significant boundaries, responsibilities, dependencies, quality concerns, and architectural decisions are sufficiently understood to define contracts without inventing missing architectural assumptions.**

Architecture Review is therefore a **readiness assessment**, not a documentation completeness check.

---

# 4. Review Outcomes

The review must result in one of:

### `READY`

Architecture is sufficiently understood and stable to begin Contracts.

### `READY_WITH_RISKS`

Architecture may proceed, but explicit non-blocking risks or uncertainties must be carried forward.

### `INCOMPLETE`

Important architectural information is missing, but the gaps are not yet necessarily blocking.

### `BLOCKED`

A significant unresolved architectural issue prevents safe progression.

---

# 5. Review Scope

The review covers:

```text id="7m4xqp"
Product Drivers
      ↓
Domain Boundaries
      ↓
System Context
      ↓
Containers
      ↓
Components
      ↓
Architectural Views
      ↓
Architecture Decisions
      ↓
Risks / Unknowns / Constraints
      ↓
Contract Readiness
```

Not every project requires every artifact at every level.

Applicability must be justified.

---

# 6. Review Inputs

Expected inputs may include:

* Product Discovery Summary
* Requirements
* Quality Attributes
* Constraints
* Business Rules
* Use Cases
* Domain Processes
* Bounded Contexts
* Domain Model
* Domain Events
* Context Map
* Domain Boundary Review
* Architecture Context
* Container Architecture
* Component Architecture
* Architectural Views
* Architecture Decisions / ADRs
* Existing-system evidence
* Migration analysis
* Relevant technical or operational evidence

The actual project artifact set may differ.

---

# 7. Architecture Baseline

## 7.1 Current Architecture State

```text id="c5v8nr"
Current State:
<description>

Evidence:
<evidence>

Confidence:
<HIGH | MEDIUM | LOW>
```

## 7.2 Target Architecture State

```text id="x4q7mk"
Target State:
<description>

Evidence:
<evidence>

Confidence:
<HIGH | MEDIUM | LOW>
```

## 7.3 Transitional Architecture

```text id="n8m3vc"
Transition Required:
<YES | NO | UNKNOWN>

Transition State:
<description>

Migration Strategy:
<strategy>

Known Risks:
<risks>
```

---

# 8. Architecture Drivers

Review whether the architecture responds to the relevant drivers.

| Driver      | Source     | Architectural Impact | Addressed  | Status     |
| ----------- | ---------- | -------------------- | ---------- | ---------- |
| Product     | `<source>` | `<impact>`           | `<yes/no>` | `<status>` |
| Domain      | `<source>` | `<impact>`           | `<yes/no>` | `<status>` |
| Quality     | `<source>` | `<impact>`           | `<yes/no>` | `<status>` |
| Security    | `<source>` | `<impact>`           | `<yes/no>` | `<status>` |
| Integration | `<source>` | `<impact>`           | `<yes/no>` | `<status>` |
| Operational | `<source>` | `<impact>`           | `<yes/no>` | `<status>` |
| Regulatory  | `<source>` | `<impact>`           | `<yes/no>` | `<status>` |
| Cost        | `<source>` | `<impact>`           | `<yes/no>` | `<status>` |
| Evolution   | `<source>` | `<impact>`           | `<yes/no>` | `<status>` |

Do not invent drivers.

---

# 9. Architecture Scope

```text id="q6x9wa"
In Scope:
- <area>

Out of Scope:
- <area>

Deferred:
- <area>

Architecture Boundary:
<boundary>
```

Architecture scope must remain aligned with approved product and domain scope.

---

# 10. System Boundary Review

Evaluate whether the system boundary is clear.

```text id="m7r4kc"
System:
<system>

Boundary:
<description>

Inside:
<elements>

Outside:
<elements>

Primary Actors:
<actors>

External Systems:
<systems>

Boundary Confidence:
<HIGH | MEDIUM | LOW>
```

---

# 11. Domain-to-Architecture Alignment

Evaluate whether architectural boundaries preserve domain understanding.

| Domain Element   | Architectural Element       | Relationship     | Confidence     | Conflict          |
| ---------------- | --------------------------- | ---------------- | -------------- | ----------------- |
| `<context>`      | `<container>`               | `<relationship>` | `<confidence>` | `<none/conflict>` |
| `<aggregate>`    | `<component>`               | `<relationship>` | `<confidence>` | `<none/conflict>` |
| `<process>`      | `<component/container>`     | `<relationship>` | `<confidence>` | `<none/conflict>` |
| `<domain event>` | `<architectural mechanism>` | `<relationship>` | `<confidence>` | `<none/conflict>` |

Architecture must represent the domain without redefining it arbitrarily.

---

# 12. Container Architecture Review

Evaluate:

* Responsibility coherence.
* Boundary justification.
* Dependency direction.
* Communication patterns.
* Data ownership.
* Failure boundaries.
* Security boundaries.
* Scaling implications.
* Operational coupling.
* Change coupling.
* Domain alignment.

```text id="v3k8mq"
Container Architecture Status:
<READY | READY_WITH_RISKS | INCOMPLETE | BLOCKED>

Major Findings:
<findings>

Risks:
<risks>

Open Decisions:
<decisions>
```

---

# 13. Component Architecture Review

Component Architecture is optional.

```text id="p9x4cn"
Component Architecture Required:
<YES | NO>

If Required:

Status:
<READY | READY_WITH_RISKS | INCOMPLETE | BLOCKED>

Reason:
<reason>

Major Findings:
<findings>
```

If Component Architecture is not required:

```text
Status: NOT_REQUIRED

Reason:
<why Level 3 does not materially improve current architectural understanding>
```

Do not penalize an architecture for not having unnecessary component diagrams.

---

# 14. Architectural Views Review

Evaluate the selected views.

| View        | Required   | Status     | Main Concern | Findings     |
| ----------- | ---------- | ---------- | ------------ | ------------ |
| Runtime     | `<yes/no>` | `<status>` | `<concern>`  | `<findings>` |
| Deployment  | `<yes/no>` | `<status>` | `<concern>`  | `<findings>` |
| Data        | `<yes/no>` | `<status>` | `<concern>`  | `<findings>` |
| Security    | `<yes/no>` | `<status>` | `<concern>`  | `<findings>` |
| Integration | `<yes/no>` | `<status>` | `<concern>`  | `<findings>` |
| Resilience  | `<yes/no>` | `<status>` | `<concern>`  | `<findings>` |
| Migration   | `<yes/no>` | `<status>` | `<concern>`  | `<findings>` |
| Other       | `<yes/no>` | `<status>` | `<concern>`  | `<findings>` |

---

# 15. Architectural View Consistency

Evaluate whether the views agree.

```text id="w6m2rq"
Structural Architecture:
<status>

Runtime Architecture:
<status>

Deployment Architecture:
<status>

Data Architecture:
<status>

Security Architecture:
<status>

Integration Architecture:
<status>

Migration Architecture:
<status>

Overall Consistency:
<CONSISTENT | PARTIAL | CONFLICTING>
```

---

# 16. Quality Attribute Alignment

| Quality Attribute | Driver     | Architectural Response | Evidence     | Verification Path | Status     |
| ----------------- | ---------- | ---------------------- | ------------ | ----------------- | ---------- |
| `<attribute>`     | `<driver>` | `<response>`           | `<evidence>` | `<verification>`  | `<status>` |

Examples may include:

* Performance
* Availability
* Reliability
* Resilience
* Security
* Privacy
* Scalability
* Maintainability
* Observability
* Operability
* Accessibility
* Compatibility
* Recoverability
* Portability

Do not invent quantitative targets.

---

# 17. Quality Attribute Trade-offs

```text id="r8v3kx"
Attribute A:
<attribute>

Attribute B:
<attribute>

Conflict:
<conflict>

Architectural Options:
<options>

Selected Direction:
<direction>

Rationale:
<rationale>

Decision:
<ADR-ID>
```

Unresolved significant quality-attribute conflicts may block progression.

---

# 18. Data Ownership Review

Evaluate whether important data has a clear semantic owner.

| Data     | Owner     | Authoritative Source | Consumers     | Shared?    | Status     |
| -------- | --------- | -------------------- | ------------- | ---------- | ---------- |
| `<data>` | `<owner>` | `<source>`           | `<consumers>` | `<yes/no>` | `<status>` |

Questions:

* Is ownership clear?
* Are multiple writers justified?
* Are replicas distinguished from sources of truth?
* Are shared data stores creating hidden coupling?
* Are important data flows visible?
* Are data boundaries aligned with domain meaning?

---

# 19. Security Boundary Review

Evaluate:

* Trust boundaries.
* Protected assets.
* Actor/system trust relationships.
* Authentication responsibilities.
* Authorization responsibilities.
* Sensitive data.
* External boundaries.
* Privileged operations.
* Security-sensitive integrations.

```text id="c4m7xn"
Security Architecture:
<status>

Critical Trust Boundaries:
<boundaries>

Protected Assets:
<assets>

Open Security Questions:
<questions>

Blocking Security Findings:
<findings>
```

---

# 20. Integration Boundary Review

Evaluate significant external relationships.

| External System | Purpose     | Direction     | Criticality     | Failure Impact | Contract Need |
| --------------- | ----------- | ------------- | --------------- | -------------- | ------------- |
| `<system>`      | `<purpose>` | `<direction>` | `<criticality>` | `<impact>`     | `<yes/no>`    |

The review must distinguish:

* Internal architectural relationships.
* External system integrations.
* Domain relationships.
* Future contract relationships.

---

# 21. Runtime Behavior Review

Evaluate whether important scenarios are architecturally understandable.

```text id="x8q5vr"
Critical Scenario:
<scenario>

Architecturally Understood:
<YES | PARTIAL | NO>

Participating Boundaries:
<boundaries>

Important Dependencies:
<dependencies>

Failure Behavior:
<behavior>

Open Questions:
<questions>
```

---

# 22. Failure and Resilience Review

Evaluate significant failure modes.

| Failure     | Boundary     | Business Impact | Recovery     | Mitigation     | Status     |
| ----------- | ------------ | --------------- | ------------ | -------------- | ---------- |
| `<failure>` | `<boundary>` | `<impact>`      | `<recovery>` | `<mitigation>` | `<status>` |

Important unresolved failure behavior may block progression if contracts depend on it.

---

# 23. Deployment Review

Evaluate only where deployment materially affects architecture.

Questions:

* Are major runtime boundaries understood?
* Are deployment dependencies known?
* Are availability implications understood?
* Are network boundaries relevant?
* Are infrastructure constraints explicit?
* Are environment differences architecturally relevant?

```text id="n5x9mc"
Deployment Understanding:
<HIGH | MEDIUM | LOW | NOT_REQUIRED>

Critical Deployment Dependencies:
<dependencies>

Open Deployment Questions:
<questions>
```

---

# 24. Architecture Decision Review

Every significant architectural choice should have appropriate governance.

| Decision     | Significance | Status     | Evidence     | Consequences Known | ADR    |
| ------------ | ------------ | ---------- | ------------ | ------------------ | ------ |
| `<decision>` | `<level>`    | `<status>` | `<evidence>` | `<yes/no>`         | `<id>` |

Review:

* Are significant decisions explicit?
* Are alternatives understood?
* Are consequences documented?
* Are irreversible decisions appropriately authorized?
* Are recommendations distinguished from decisions?
* Are superseded decisions handled correctly?

---

# 25. Architecture Decision Gaps

```text id="v7m4qx"
Decision Candidate:
<decision>

Why It Matters:
<reason>

Affected Architecture:
<architecture>

Reversibility:
<reversibility>

Blocking:
<YES | NO>

Required Action:
<action>
```

---

# 26. Constraints Review

Evaluate whether architectural constraints are understood.

| Constraint     | Source     | Strength     | Architectural Impact | Validated  | Status     |
| -------------- | ---------- | ------------ | -------------------- | ---------- | ---------- |
| `<constraint>` | `<source>` | `<strength>` | `<impact>`           | `<yes/no>` | `<status>` |

Do not turn preferences into mandatory constraints without evidence.

---

# 27. Assumptions Review

Critical assumptions must be evaluated before progression.

```text id="k3x8np"
Assumption:
<assumption>

Evidence:
<evidence>

Confidence:
<HIGH | MEDIUM | LOW>

Architectural Consequence:
<consequence>

If False:
<impact>

Validation Required:
<YES | NO>

Status:
<status>
```

---

# 28. Unknowns Review

| Unknown     | Architectural Area | Impact     | Blocking   | Resolution |
| ----------- | ------------------ | ---------- | ---------- | ---------- |
| `<unknown>` | `<area>`           | `<impact>` | `<yes/no>` | `<method>` |

Unknowns are acceptable when their impact is controlled.

Unknowns that affect contract semantics, security, ownership, consistency, or major boundaries may be blocking.

---

# 29. Architecture Risks

| ID            | Risk     | Area     | Impact     | Likelihood     | Severity     | Mitigation     | Owner     |
| ------------- | -------- | -------- | ---------- | -------------- | ------------ | -------------- | --------- |
| RISK-ARCH-001 | `<risk>` | `<area>` | `<impact>` | `<likelihood>` | `<severity>` | `<mitigation>` | `<owner>` |

Severity:

* `INFO`
* `WARNING`
* `SIGNIFICANT`
* `BLOCKING`

---

# 30. Architecture Contradictions

The review must actively search for contradictions.

Potential contradiction sources:

* Product vs domain.
* Domain vs architecture.
* Container vs component.
* Architecture vs deployment.
* Architecture vs data ownership.
* Architecture vs security.
* Architecture vs integration.
* Current state vs target state.
* ADR vs implementation.
* Architecture artifact vs existing behavior.

```text id="q9m5xc"
Contradiction:
<description>

Sources:
<artifacts>

Affected Area:
<area>

Severity:
<severity>

Resolution:
<resolution>

Status:
<status>
```

---

# 31. Architecture Debt

Architecture debt may include:

* Temporary boundaries.
* Transitional components.
* Known coupling.
* Deferred decisions.
* Temporary infrastructure.
* Legacy dependencies.
* Compatibility mechanisms.
* Unresolved architectural compromises.

```text id="m6x3vk"
Debt:
<description>

Reason:
<reason>

Current Benefit:
<benefit>

Future Cost:
<cost>

Removal Trigger:
<trigger>

Owner:
<owner>

Status:
<status>
```

---

# 32. Existing-System Architecture Review

For existing systems, explicitly compare:

```text id="c8q4rn"
Documented Architecture:
<state>

Actual Architecture:
<state>

Target Architecture:
<state>

Differences:
<differences>

Evidence:
<evidence>

Impact:
<impact>
```

Actual behavior must not be silently replaced with the desired architecture.

---

# 33. System Evolution Review

For system evolution, verify:

* Existing responsibilities are understood.
* Change boundaries are explicit.
* Compatibility requirements are known.
* Transitional architecture is understood.
* Migration dependencies are identified.
* Rollback concerns are considered where relevant.
* Target architecture does not assume instant migration.

---

# 34. Architecture Alternatives

Significant unresolved alternatives should be recorded.

```text id="r4x8mq"
Decision Area:
<area>

Option A:
<option>

Option B:
<option>

Option C:
<option>

Evaluation:
<trade-offs>

Current Recommendation:
<recommendation>

Decision Required:
<YES | NO>

Authority:
<authority>
```

The agent must not silently convert a recommendation into a decision.

---

# 35. Architecture Fitness

Evaluate whether the architecture adequately addresses the identified drivers.

| Concern     | Expected        | Current Architecture | Evidence     | Gap     |
| ----------- | --------------- | -------------------- | ------------ | ------- |
| `<concern>` | `<expectation>` | `<architecture>`     | `<evidence>` | `<gap>` |

Architecture fitness does not mean that implementation has already been verified.

It means the architectural direction is sufficiently justified against known concerns.

---

# 36. Contract Readiness

The Architecture Review must explicitly assess readiness for Contracts.

## API Contract Readiness

```text
<READY | READY_WITH_RISKS | NOT_READY | NOT_APPLICABLE>
```

## Event Contract Readiness

```text
<READY | READY_WITH_RISKS | NOT_READY | NOT_APPLICABLE>
```

## Data Contract Readiness

```text
<READY | READY_WITH_RISKS | NOT_READY | NOT_APPLICABLE>
```

## Security Contract Readiness

```text
<READY | READY_WITH_RISKS | NOT_READY | NOT_APPLICABLE>
```

## Observability Contract Readiness

```text
<READY | READY_WITH_RISKS | NOT_READY | NOT_APPLICABLE>
```

---

# 37. Contract Readiness Conditions

Before entering Contracts, the following should be sufficiently understood:

### Boundaries

* System boundary is clear.
* Important architectural boundaries are established.
* External systems are identified.

### Ownership

* Domain responsibility is sufficiently understood.
* Important data ownership is established.
* Integration ownership is known.

### Behavior

* Significant runtime scenarios are understood.
* Important state transitions are known.
* Important failure behavior is visible.

### Security

* Relevant trust boundaries are known.
* Security-sensitive interactions are identified.

### Decisions

* Significant architectural decisions are explicit.
* Unresolved decisions are visible.
* Decision authority is known.

### Uncertainty

* Blocking unknowns are resolved or explicitly accepted.
* Significant assumptions are visible.
* Risks have owners or mitigation strategies.

---

# 38. Architecture Handoff to Contracts

## Contracts May Assume

* `<architectural fact>`
* `<boundary>`
* `<ownership>`
* `<decision>`

## Contracts Must Preserve

* `<domain invariant>`
* `<ownership>`
* `<security boundary>`
* `<quality attribute>`

## Contracts Must Not Assume

* `<undecided technology>`
* `<undefined behavior>`
* `<unapproved infrastructure>`
* `<unsupported data ownership>`

## Contract Questions

* `<question>`

## Open Decisions

* `<decision>`

## Risks

* `<risk>`

---

# 39. Feedback to Previous Phases

Architecture may reveal problems in earlier lifecycle phases.

### Feedback to Product Discovery

```text
<finding>
```

### Feedback to Domain Discovery

```text
<finding>
```

### Feedback to Architecture

```text
<finding>
```

No phase is immutable.

A significant architectural discovery may invalidate earlier assumptions.

---

# 40. Traceability Review

Evaluate the architectural chain:

```text id="w3x7mk"
Product Need
    ↓
Requirement
    ↓
Domain Capability
    ↓
Domain Boundary
    ↓
Architecture Element
    ↓
Architectural View
    ↓
Architecture Decision
    ↓
Contract Candidate
```

| Traceability Area       | Status     | Findings     |
| ----------------------- | ---------- | ------------ |
| Product → Architecture  | `<status>` | `<findings>` |
| Domain → Architecture   | `<status>` | `<findings>` |
| Quality → Architecture  | `<status>` | `<findings>` |
| Architecture → Decision | `<status>` | `<findings>` |
| Architecture → Contract | `<status>` | `<findings>` |

---

# 41. Evidence Quality

| Area            | Evidence     | Confidence     | Notes     |
| --------------- | ------------ | -------------- | --------- |
| Product         | `<evidence>` | `<confidence>` | `<notes>` |
| Domain          | `<evidence>` | `<confidence>` | `<notes>` |
| Architecture    | `<evidence>` | `<confidence>` | `<notes>` |
| Existing System | `<evidence>` | `<confidence>` | `<notes>` |
| Infrastructure  | `<evidence>` | `<confidence>` | `<notes>` |
| Security        | `<evidence>` | `<confidence>` | `<notes>` |

Confidence:

* `HIGH`
* `MEDIUM`
* `LOW`

Low-confidence areas do not automatically block progression; their consequence determines whether they matter.

---

# 42. Review Findings

| ID            | Finding     | Area     | Severity     | Evidence     | Action     | Status     |
| ------------- | ----------- | -------- | ------------ | ------------ | ---------- | ---------- |
| FIND-ARCH-001 | `<finding>` | `<area>` | `<severity>` | `<evidence>` | `<action>` | `<status>` |

---

# 43. Blocking Conditions

The Architecture phase should normally be considered blocked when:

* A major system boundary is unresolved.
* A critical domain responsibility has no valid architectural representation.
* A significant security boundary is unknown.
* Critical data ownership is unresolved.
* A critical external dependency is architecturally undefined.
* A significant quality attribute has no credible architectural response.
* A major architectural decision remains unresolved and blocks contracts.
* Architecture artifacts contradict each other in a decision-relevant way.
* The target architecture depends on unsupported assumptions.
* A migration boundary is unsafe or undefined when migration is required.
* The agent would need to invent contract semantics to continue.

---

# 44. Non-Blocking Conditions

The Architecture phase may proceed with:

* Minor documentation gaps.
* Low-impact unknowns.
* Optional views marked `NOT_REQUIRED`.
* Future optimization decisions.
* Implementation-level details intentionally deferred.
* Low-risk technical choices.
* Non-critical migration improvements.

Non-blocking items must still be recorded when they may matter later.

---

# 45. Review Outcome

```text id="n8q4vx"
Architecture Review Outcome:

<READY | READY_WITH_RISKS | INCOMPLETE | BLOCKED>
```

## Rationale

```text
<rationale>
```

## Major Strengths

* <strength>

## Major Risks

* <risk>

## Remaining Unknowns

* <unknown>

## Required Follow-up

* <action>

---

# 46. Gate Decision

```text id="m5x9cr"
Gate:
Architecture → Contracts

Decision:
<PASSED | PASSED_WITH_RISKS | BLOCKED | WAIVED>

Reason:
<reason>

Blocking Findings:
<findings>

Non-Blocking Risks:
<risks>

Conditions:
<conditions>

Authority:
<authority>

Date:
<date>

Review Point:
<future review point>
```

A waiver must be explicit and must never silently override a blocking condition.

---

# 47. Architecture Review Checklist

### Context

* [ ] System boundary is clear.
* [ ] Actors and external systems are understood.
* [ ] Architectural drivers are identified.
* [ ] Scope is aligned with Product and Domain Discovery.

### Domain Alignment

* [ ] Bounded contexts are sufficiently understood.
* [ ] Domain responsibilities are preserved.
* [ ] Important invariants are represented.
* [ ] Domain ownership is not distorted by technical boundaries.

### C4

* [ ] System Context is coherent.
* [ ] Container boundaries are justified.
* [ ] Component Architecture is either sufficiently defined or explicitly `NOT_REQUIRED`.
* [ ] No unnecessary decomposition exists.

### Architectural Views

* [ ] Required views are identified.
* [ ] Unnecessary views are explicitly rejected.
* [ ] Important runtime behavior is understood.
* [ ] Important data ownership is understood.
* [ ] Security boundaries are understood.
* [ ] Important integrations are understood.
* [ ] Deployment concerns are understood where relevant.
* [ ] Migration concerns are understood where relevant.

### Quality

* [ ] Significant quality attributes have architectural responses.
* [ ] Major trade-offs are explicit.
* [ ] Unsupported targets have not been invented.

### Decisions

* [ ] Significant architectural decisions are explicit.
* [ ] Recommendations are distinguished from decisions.
* [ ] Consequences are known.
* [ ] Reversibility is understood.
* [ ] Decision authority is appropriate.

### Risk

* [ ] Critical risks are identified.
* [ ] Blocking unknowns are resolved or explicitly handled.
* [ ] Contradictions are identified.
* [ ] Architecture debt is recorded.

### Traceability

* [ ] Product-to-architecture relationships are traceable.
* [ ] Domain-to-architecture relationships are traceable.
* [ ] Quality attributes are traceable.
* [ ] Decisions are traceable.
* [ ] Contract implications are visible.

### Contracts

* [ ] API contract candidates are sufficiently understood.
* [ ] Event contract candidates are sufficiently understood.
* [ ] Data contract candidates are sufficiently understood.
* [ ] Security contract concerns are identified.
* [ ] Observability contract concerns are identified.

---

# 48. Compact Architecture Baseline

```text id="q7m3vk"
System:
<system>

Architecture Status:
<READY | READY_WITH_RISKS | INCOMPLETE | BLOCKED>

System Boundary:
<boundary>

Containers:
<containers>

Components:
<components or NOT_REQUIRED>

Required Views:
<views>

Critical Architectural Decisions:
<decisions>

Critical Risks:
<risks>

Critical Unknowns:
<unknowns>

Architecture Debt:
<debt>

Contract Readiness:
<status>

Gate:
<PASSED | PASSED_WITH_RISKS | BLOCKED | WAIVED>
```

---

# 49. Agent Instructions

When performing an Architecture Review:

1. Review the actual architecture artifacts rather than assuming they are correct.
2. Compare architecture against Product and Domain Discovery outputs.
3. Verify that architectural boundaries preserve domain meaning.
4. Verify that container responsibilities are coherent.
5. Verify Component Architecture only when it is justified.
6. Verify that selected architectural views are sufficient.
7. Check for contradictions across all architectural representations.
8. Verify significant quality attributes have architectural responses.
9. Verify important data ownership.
10. Verify relevant security boundaries.
11. Verify significant external integrations.
12. Verify important runtime scenarios.
13. Verify migration concerns for existing-system evolution.
14. Review significant architecture decisions.
15. Review assumptions and unknowns.
16. Review architectural risks and debt.
17. Evaluate evidence and confidence.
18. Determine whether Contracts can begin safely.
19. Never mark the phase ready merely because documents exist.
20. Do not invent missing architecture information.
21. If architecture is insufficient, identify the smallest feedback loop required.
22. Preserve traceability.
23. Carry non-blocking risks explicitly into the next phase.
24. Treat `NOT_REQUIRED` as a valid outcome when justified.
25. Ask:

> Can Contracts now be defined without inventing architectural boundaries, ownership, behavior, security semantics, or data relationships?

If not, Architecture is not ready.

---

# 50. Anti-Patterns

## Documentation Completion

Marking Architecture complete because all files exist.

## Diagram Completion

Treating diagrams as evidence of architectural quality.

## C4 Absolutism

Assuming C4 alone represents every architectural concern.

## View Explosion

Creating every possible architectural view.

## Architecture by Diagram

Optimizing architecture to make diagrams look clean.

## Domain Distortion

Changing domain boundaries merely to simplify technical architecture.

## Decision Hiding

Allowing recommendations to become implicit architecture decisions.

## Contract Prematurity

Defining detailed contracts before ownership and behavior are sufficiently understood.

## Risk Suppression

Hiding unresolved architectural risks to obtain a `READY` result.

## Unknown Suppression

Replacing unknowns with unsupported assumptions.

## Existing-System Replacement

Treating desired architecture as current reality.

## Migration Blindness

Ignoring transitional architecture.

## Security Afterthought

Deferring architecture-level security boundaries until implementation.

## Data Ambiguity

Allowing unclear data ownership to proceed into contract definition.

## False Confidence

Treating documentation volume as evidence of architectural certainty.

## Technical Leakage

Introducing frameworks, vendors, databases, or infrastructure without evidence or decision.

---

# 51. Safe Progression Question

Before entering Contracts:

> **Is the architecture sufficiently coherent, evidence-based, traceable, and stable that API, event, data, security, and observability contracts can be defined without inventing unresolved architectural semantics?**

If **yes**, proceed to Contracts.

If **yes, with non-blocking risks**, proceed while carrying those risks explicitly.

If **no**, identify the smallest required feedback loop:

```text
Architecture Review
       ↓
┌──────────────────────────────┐
│ Product Discovery            │
│ Domain Discovery             │
│ Architecture / C4            │
│ Architectural Views          │
│ Architecture Decisions      │
└──────────────────────────────┘
       ↓
Architecture Review
```

---

# 52. Final Principle

> **Architecture Review is the point where architectural understanding becomes sufficiently trustworthy to define contracts.**

It does not require perfect architecture.

It requires:

* sufficient boundaries,
* sufficient ownership,
* sufficient behavioral understanding,
* sufficient quality-attribute alignment,
* sufficient security understanding,
* sufficient data understanding,
* explicit consequential decisions,
* controlled uncertainty,
* traceability,
* and a clear path into Contracts.

The objective is not:

```text
"Everything is known."
```

The objective is:

```text
"Everything necessary to define the next layer safely is sufficiently understood."
```
