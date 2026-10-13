# Architecture Decision Review

## 1. Document Metadata

| Field           | Value                                                |
| --------------- | ---------------------------------------------------- |
| Document Type   | Architecture Decision Review                         |
| Lifecycle Phase | Architecture Decisions                               |
| Review Type     | Decision Governance and Architecture Baseline Review |
| Status          | `DRAFT`                                              |
| Version         | `0.1`                                                |
| System          | `<system>`                                           |
| Owner           | `<owner>`                                            |
| Created         | `<date>`                                             |
| Last Updated    | `<date>`                                             |
| Previous Gate   | Contracts Review                                     |
| Next Phase      | Specifications / SDD                                 |

---

# 2. Purpose

This document provides the final review of the Architecture Decisions phase.

It evaluates whether the architecture has a sufficiently explicit, coherent, authorized, traceable, and stable decision baseline to support detailed specifications.

The review determines whether:

* Consequential architectural choices are explicit.
* Appropriate alternatives were considered.
* Decisions have appropriate authority.
* Active decisions are mutually coherent.
* Superseded and historical decisions are traceable.
* Decision conflicts are identified.
* Decision debt is understood.
* Architecture and contract consequences are explicit.
* Current, transition, and target decisions are distinguishable.
* Important decisions have validation strategies.
* Remaining uncertainty is acceptable for the next phase.
* Specifications can proceed without silently inventing architectural behavior.

---

# 3. Core Principle

> **Architecture Decision Review validates whether the architecture is governed by an explicit and coherent decision baseline, not whether a collection of ADR documents exists.**

The objective is not to eliminate every open question.

The objective is to ensure that unresolved questions do not cause Specifications to invent architectural semantics that should have been decided explicitly.

---

# 4. Review Outcome

Allowed outcomes:

```text id="m4x8vr"
READY
READY_WITH_RISKS
INCOMPLETE
BLOCKED
```

### READY

The decision baseline is sufficiently mature for Specifications / SDD.

### READY_WITH_RISKS

The project may proceed while explicitly carrying non-blocking decision risks.

### INCOMPLETE

Important decisions or governance information remain incomplete.

### BLOCKED

A consequential unresolved decision prevents safe progression.

---

# 5. Review Inputs

Expected inputs include:

* Architecture Review.
* Contract Review.
* Architecture Decision Records.
* Architecture Decision Register.
* Product Decisions.
* Domain Decisions.
* Architecture artifacts.
* Contract artifacts.
* Quality Attributes.
* Constraints.
* Requirements.
* Existing-system evidence.
* Migration analysis.
* Decision validation evidence.
* Implementation evidence where applicable.
* Previous review findings.

---

# 6. Review Scope

```text id="q7m3xc"
System:
<system>

Decision Baseline:
<baseline>

Architecture Scope:
<scope>

Contract Scope:
<scope>

Current State:
<state>

Target State:
<state>

Transition State:
<state>

Review Depth:
<LIGHTWEIGHT | STANDARD | FULL>
```

---

# 7. Decision Baseline

Summarize the current architectural decision baseline.

```text id="v5x9mr"
Active Decisions:
<ADR IDs>

Pending Decisions:
<ADR IDs>

Superseded Decisions:
<ADR IDs>

Deprecated Decisions:
<ADR IDs>

Rejected Decisions:
<ADR IDs>

Revoked Decisions:
<ADR IDs>

Decision Conflicts:
<conflicts>

Decision Debt:
<debt>
```

---

# 8. Decision Inventory Review

| ADR     | Status     | Significance | Authority     | Scope     | Validity     | Review     |
| ------- | ---------- | ------------ | ------------- | --------- | ------------ | ---------- |
| `<ADR>` | `<status>` | `<level>`    | `<authority>` | `<scope>` | `<validity>` | `<result>` |

Check:

* [ ] Unique decision identifiers.
* [ ] Correct lifecycle status.
* [ ] Appropriate authority.
* [ ] Clear scope.
* [ ] Clear significance.
* [ ] Current validity.
* [ ] Traceability.

---

# 9. Decision Authority Review

For each consequential decision:

```text id="n8q4vc"
ADR:
<ADR-ID>

Decision:
<decision>

Required Authority:
<authority>

Recorded Authority:
<authority>

Authorized:
<YES | NO | UNKNOWN>

Finding:
<finding>
```

An architecture decision must not be considered accepted merely because an agent, developer, or reviewer recommends it.

---

# 10. Decision Completeness

Evaluate whether each significant ADR contains sufficient reasoning.

```text id="m6x3vr"
ADR:
<ADR-ID>

Problem:
<COMPLETE | PARTIAL | MISSING>

Context:
<COMPLETE | PARTIAL | MISSING>

Constraints:
<COMPLETE | PARTIAL | MISSING>

Alternatives:
<COMPLETE | PARTIAL | MISSING>

Trade-Offs:
<COMPLETE | PARTIAL | MISSING>

Decision:
<COMPLETE | PARTIAL | MISSING>

Consequences:
<COMPLETE | PARTIAL | MISSING>

Risks:
<COMPLETE | PARTIAL | MISSING>

Validation:
<COMPLETE | PARTIAL | MISSING>

Overall:
<READY | INCOMPLETE | BLOCKED>
```

---

# 11. Decision Evidence Review

Evaluate whether important decisions are supported by appropriate evidence.

```text id="x4q8mk"
ADR:
<ADR-ID>

Evidence:
<evidence>

Evidence Quality:
<STRONG | ADEQUATE | WEAK | MISSING>

Confidence:
<HIGH | MEDIUM | LOW>

Unsupported Assumptions:
<assumptions>

Finding:
<finding>
```

The existence of a rationale does not guarantee that the rationale is evidence-based.

---

# 12. Alternative Analysis Review

Determine whether meaningful alternatives were considered.

```text id="q5m9vc"
ADR:
<ADR-ID>

Alternatives:
<alternatives>

Meaningful Alternatives Missing:
<alternatives>

Evaluation:
<ADEQUATE | PARTIAL | INSUFFICIENT>

Finding:
<finding>
```

Do not require artificial alternatives when the architecture has only one credible option.

---

# 13. Trade-Off Review

```text id="v7x3mr"
ADR:
<ADR-ID>

Trade-Off:
<trade-off>

Benefit:
<benefit>

Cost:
<cost>

Risk:
<risk>

Accepted:
<YES | NO | UNKNOWN>

Explicit:
<YES | NO>
```

Important trade-offs must not remain implicit.

---

# 14. Reversibility Review

```text id="n4q8xc"
ADR:
<ADR-ID>

Reversibility:
<REVERSIBLE | PARTIALLY_REVERSIBLE | DIFFICULT_TO_REVERSE | IRREVERSIBLE>

Analysis Adequate:
<YES | NO>

Validation Depth:
<adequate level>

Finding:
<finding>
```

Difficult-to-reverse decisions should receive greater scrutiny.

---

# 15. Active Decision Coherence

Evaluate active decisions as a collective system.

```text id="m8x5vr"
Decision Set:
<ADR IDs>

Coherence:
<COHERENT | PARTIAL | CONFLICTING>

Conflicts:
<conflicts>

Contradictions:
<contradictions>

Resolution:
<resolution>
```

An architecture can contain individually reasonable decisions that become contradictory when combined.

---

# 16. Decision Conflict Review

| Conflict     | ADRs     | Severity     | Resolution     | Status     |
| ------------ | -------- | ------------ | -------------- | ---------- |
| `<conflict>` | `<ADRs>` | `<severity>` | `<resolution>` | `<status>` |

Blocking conflicts must be resolved or explicitly waived by authorized governance.

---

# 17. Decision Dependency Review

```text id="x6q3mk"
ADR:
<ADR-ID>

Dependencies:
<ADR IDs>

Dependency Direction:
<direction>

Dependency Valid:
<YES | NO | UNKNOWN>

Impact:
<impact>
```

A decision should not depend on another decision that has been superseded without an explicit transition.

---

# 18. Decision Graph Health

Evaluate the architecture decision graph.

```text id="q9m4vc"
Graph Status:
<HEALTHY | DEGRADED | CONFLICTING | UNKNOWN>

Cycles:
<cycles>

Broken References:
<references>

Orphan Decisions:
<decisions>

Missing Relationships:
<relationships>
```

Cycles are not automatically invalid, but circular decision dependencies require explanation.

---

# 19. Supersession Review

```text id="v5x8mr"
Original ADR:
<ADR-ID>

Replacement ADR:
<ADR-ID>

Supersession Reason:
<reason>

Affected Contracts:
<contracts>

Affected Architecture:
<architecture>

Migration:
<required migration>

Complete:
<YES | NO | PARTIAL>
```

Supersession must preserve historical traceability.

---

# 20. Historical Decision Review

Determine whether historical decisions remain correctly classified.

```text id="n7q3xc"
ADR:
<ADR-ID>

Historical Status:
<SUPERSEDED | DEPRECATED | REVOKED | REJECTED>

Still Influences Current Architecture:
<YES | NO | UNKNOWN>

If Yes:
<relationship>

Finding:
<finding>
```

A superseded decision may still explain why current architecture looks the way it does.

---

# 21. Decision Drift Review

Compare accepted decisions with actual architecture.

```text id="m4x9vr"
ADR:
<ADR-ID>

Accepted Decision:
<decision>

Observed Architecture:
<architecture>

Alignment:
<ALIGNED | PARTIAL | DRIFT | UNKNOWN>

Impact:
<impact>

Action:
<action>
```

Possible outcomes:

* Architecture remains aligned.
* Implementation drift exists.
* Architecture evolved without ADR update.
* ADR became obsolete.
* Exception exists without governance.

---

# 22. Decision Debt Review

Evaluate:

```text id="x8q3mk"
Implicit Decisions:
<count / list>

Missing Decisions:
<count / list>

Stale Decisions:
<count / list>

Conflicting Decisions:
<count / list>

Unvalidated Decisions:
<count / list>

Unauthorized Decisions:
<count / list>

Undocumented Decisions:
<count / list>
```

Decision debt must be evaluated by consequence, not by raw count.

---

# 23. Critical Decision Review

Identify decisions with high architectural consequence.

```text id="q6m5vc"
ADR:
<ADR-ID>

Why Critical:
<reason>

Affected Areas:
<areas>

Evidence:
<evidence>

Authority:
<authority>

Validation:
<validation>

Current Status:
<status>
```

Typical critical decisions may involve:

* Data ownership.
* Security boundaries.
* External contracts.
* Major integration strategy.
* Consistency model.
* Migration architecture.
* High-impact availability/resilience behavior.
* Difficult-to-reverse platform decisions.

---

# 24. Product Alignment

Verify that architecture decisions remain aligned with product intent.

```text id="v7x4mr"
ADR:
<ADR-ID>

Product Artifact:
<artifact>

Expected Product Behavior:
<behavior>

Architectural Consequence:
<consequence>

Aligned:
<YES | NO | PARTIAL>
```

Architecture must not silently redefine product scope or behavior.

---

# 25. Domain Alignment

```text id="n3q8xc"
ADR:
<ADR-ID>

Domain Artifact:
<artifact>

Domain Semantics:
<semantics>

Architectural Choice:
<choice>

Aligned:
<YES | NO | PARTIAL>

Finding:
<finding>
```

An architectural decision may constrain implementation without changing domain meaning.

---

# 26. Contract Alignment

```text id="m5x9vr"
ADR:
<ADR-ID>

Contract:
<contract>

Decision Impact:
<impact>

Contract Status:
<status>

Compatibility:
<COMPATIBLE | CONDITIONAL | BREAKING | UNKNOWN>
```

A decision affecting a contract must make that consequence explicit.

---

# 27. Data Decision Review

Evaluate important data-related decisions.

```text id="x4q7mk"
Data Concern:
<concern>

ADR:
<ADR-ID>

Authority:
<authority>

Ownership:
<ownership>

Consistency:
<consistency>

Lifecycle:
<lifecycle>

Migration:
<migration>

Readiness:
<READY | INCOMPLETE | BLOCKED>
```

---

# 28. Security Decision Review

```text id="q8m3vc"
Security Concern:
<concern>

ADR:
<ADR-ID>

Trust Boundary:
<boundary>

Authentication:
<impact>

Authorization:
<impact>

Sensitive Data:
<impact>

Security Validation:
<validation>

Readiness:
<READY | INCOMPLETE | BLOCKED>
```

---

# 29. Operational Decision Review

```text id="v6x9mr"
Operational Concern:
<concern>

ADR:
<ADR-ID>

Availability:
<impact>

Resilience:
<impact>

Observability:
<impact>

Deployment:
<impact>

Recovery:
<impact>

Readiness:
<READY | INCOMPLETE | BLOCKED>
```

---

# 30. Quality Attribute Decision Review

| Quality Attribute | Relevant ADRs | Decision Coverage | Remaining Risk |
| ----------------- | ------------- | ----------------- | -------------- |
| Performance       | `<ADRs>`      | `<coverage>`      | `<risk>`       |
| Availability      | `<ADRs>`      | `<coverage>`      | `<risk>`       |
| Reliability       | `<ADRs>`      | `<coverage>`      | `<risk>`       |
| Security          | `<ADRs>`      | `<coverage>`      | `<risk>`       |
| Scalability       | `<ADRs>`      | `<coverage>`      | `<risk>`       |
| Maintainability   | `<ADRs>`      | `<coverage>`      | `<risk>`       |
| Observability     | `<ADRs>`      | `<coverage>`      | `<risk>`       |

Only relevant attributes need to be included.

---

# 31. Current / Transition / Target Review

For evolving systems:

```text id="n9q5xc"
Concern:
<concern>

Current Decision:
<decision>

Transition Decision:
<decision>

Target Decision:
<decision>

Transition Conditions:
<conditions>

Completion Criteria:
<criteria>
```

Do not confuse a temporary migration decision with the target architecture.

---

# 32. Migration Decision Review

```text id="m7x4vr"
Migration Decision:
<ADR-ID>

Current State:
<state>

Target State:
<state>

Migration Strategy:
<strategy>

Compatibility:
<compatibility>

Rollback / Recovery:
<strategy>

Retirement:
<condition>

Risk:
<risk>
```

---

# 33. Implementation Alignment

For existing or partially implemented systems:

```text id="x5q8mr"
ADR:
<ADR-ID>

Decision:
<decision>

Implementation:
<implementation>

Alignment:
<ALIGNED | PARTIAL | DRIFT | UNKNOWN>

Reason:
<reason>

Required Action:
<action>
```

Implementation should not silently redefine accepted architecture.

---

# 34. Verification Readiness

For significant decisions:

```text id="q4m9vc"
ADR:
<ADR-ID>

Verification Method:
<method>

Expected Evidence:
<evidence>

Success Condition:
<condition>

Verification Owner:
<owner>

Ready:
<YES | NO>
```

---

# 35. Revalidation Readiness

```text id="v8x3mk"
ADR:
<ADR-ID>

Revisit Conditions:
<triggers>

Observable:
<YES | NO | PARTIAL>

Review Owner:
<owner>

Review Point:
<date / milestone / condition>
```

Important decisions should have observable conditions that can trigger revalidation.

---

# 36. Open Decision Review

```text id="n5q7vr"
Decision Candidate:
<decision>

Impact:
<impact>

Blocking:
<YES | NO>

Affected Scope:
<scope>

Required Authority:
<authority>

Next Action:
<action>
```

Open decisions must not be treated as implicit architecture.

---

# 37. Decision Risks

| Risk     | ADR     | Impact     | Severity     | Mitigation     | Status     |
| -------- | ------- | ---------- | ------------ | -------------- | ---------- |
| `<risk>` | `<ADR>` | `<impact>` | `<severity>` | `<mitigation>` | `<status>` |

---

# 38. Decision Unknowns

| Unknown     | ADR     | Importance     | Blocking   | Resolution     |
| ----------- | ------- | -------------- | ---------- | -------------- |
| `<unknown>` | `<ADR>` | `<importance>` | `<YES/NO>` | `<resolution>` |

---

# 39. Findings

| ID           | Finding     | Category     | Severity     | ADR     | Evidence     | Status     |
| ------------ | ----------- | ------------ | ------------ | ------- | ------------ | ---------- |
| FIND-ADR-001 | `<finding>` | `<category>` | `<severity>` | `<ADR>` | `<evidence>` | `<status>` |

Categories may include:

```text id="m3x8qc"
GOVERNANCE
AUTHORITY
EVIDENCE
CONFLICT
TRACEABILITY
DRIFT
DATA
SECURITY
CONTRACT
DOMAIN
MIGRATION
VALIDATION
QUALITY
SCOPE
```

---

# 40. Finding Resolution

```text id="x7q4mr"
Finding:
<FIND-ADR-ID>

Resolution:
<resolution>

Owner:
<owner>

Evidence:
<evidence>

Status:
<OPEN | RESOLVED | ACCEPTED_RISK | DEFERRED>

Related ADR:
<ADR-ID>
```

---

# 41. Blocking Conditions

Architecture Decisions should be considered blocked when:

* A critical architectural decision remains unresolved.
* Active ADRs materially contradict each other.
* Decision authority is missing for a consequential choice.
* A critical decision is based on unsupported assumptions.
* A decision materially contradicts approved domain semantics.
* A critical contract depends on an unresolved architectural decision.
* Migration cannot proceed safely without an unresolved decision.
* A significant security boundary is undecided.
* Data ownership or authority is unresolved where specifications depend on it.
* Specifications would have to invent architectural behavior to proceed.

These conditions are contextual rather than exhaustive.

---

# 42. Non-Blocking Risks

Examples:

* Minor local decisions remain open.
* Low-impact optimization decisions are deferred.
* Detailed implementation choices remain intentionally outside ADR scope.
* A future migration optimization is not yet decided.
* Non-critical validation evidence is pending.

Every accepted risk should remain visible and traceable.

---

# 43. Waivers

```text id="q5m8vc"
Waiver ID:
<WAIVER-ID>

Condition:
<condition>

Reason:
<reason>

Risk:
<risk>

Mitigation:
<mitigation>

Authority:
<authority>

Review Date / Trigger:
<date / condition>
```

Waivers must never silently convert a blocked decision into a ready state.

---

# 44. Specification Handoff

The Architecture Decision Review must provide a precise handoff to Specifications / SDD.

```text id="v9x3mr"
Specifications May Assume:
<stable decisions>

Specifications Must Preserve:
<architectural constraints>

Specifications Must Not Assume:
<open decisions / unknowns>

Implementation Details Still Open:
<details>

Required Contract Behavior:
<contracts>

Required Verification:
<verification>

Known Risks:
<risks>

Known Decision Debt:
<debt>
```

---

# 45. Specification Boundary

Clearly separate what has already been decided from what Specifications may still define.

```text id="n6q4xc"
Architecturally Decided:
<items>

Specification-Level Decisions:
<items>

Implementation-Level Decisions:
<items>

Still Unknown:
<items>
```

The objective is to prevent Specifications from reopening settled architecture without justification while also preventing ADRs from prematurely defining implementation details.

---

# 46. Feedback to Earlier Phases

```text id="m8x5vr"
Finding:
<finding>

Affected Phase:
<PRODUCT | DOMAIN | ARCHITECTURE | CONTRACTS>

Reason:
<reason>

Required Revisit:
<artifact>

Impact:
<impact>
```

Architecture Decision Review may reveal that an earlier assumption was invalid.

The lifecycle must permit controlled feedback.

---

# 47. Traceability Health

Evaluate:

```text id="x4q7mk"
Product → Decision:
<VALID | PARTIAL | MISSING | STALE | CONFLICTING>

Domain → Decision:
<VALID | PARTIAL | MISSING | STALE | CONFLICTING>

Architecture → Decision:
<VALID | PARTIAL | MISSING | STALE | CONFLICTING>

Contract → Decision:
<VALID | PARTIAL | MISSING | STALE | CONFLICTING>

Decision → Specification:
<READY | PARTIAL | MISSING>

Decision → Verification:
<READY | PARTIAL | MISSING>
```

---

# 48. Architecture Decision Health

```text id="q8m3vc"
Decision Coherence:
<HEALTHY | DEGRADED | CONFLICTING>

Decision Authority:
<HEALTHY | DEGRADED | BLOCKED>

Decision Evidence:
<STRONG | ADEQUATE | WEAK | INSUFFICIENT>

Decision Debt:
<LOW | MEDIUM | HIGH | CRITICAL>

Decision Drift:
<LOW | MEDIUM | HIGH | UNKNOWN>

Traceability:
<HEALTHY | DEGRADED | BROKEN>

Overall:
<HEALTHY | DEGRADED | BLOCKED>
```

---

# 49. Review Summary

```text id="v7x9mr"
Review Outcome:
<READY | READY_WITH_RISKS | INCOMPLETE | BLOCKED>

Decision Baseline:
<summary>

Major Decisions:
<summary>

Open Decisions:
<summary>

Conflicts:
<summary>

Decision Debt:
<summary>

Major Risks:
<summary>

Required Actions:
<summary>
```

---

# 50. Gate Recommendation

```text id="n4q8xc"
Gate:
Architecture Decisions Gate

Recommendation:
<PASS | PASS_WITH_RISKS | BLOCK | WAIVE>

Reason:
<reason>

Evidence:
<evidence>

Conditions:
<conditions>

Authority:
<authority>
```

---

# 51. Architecture Decisions Completion Checklist

### Decision Governance

* [ ] Consequential architectural choices are explicit.
* [ ] Significant decisions have appropriate authority.
* [ ] Recommendations are distinct from decisions.
* [ ] Rejected decisions are traceable.
* [ ] Superseded decisions are traceable.
* [ ] Deprecated decisions are classified correctly.

### Decision Quality

* [ ] Problems are clearly defined.
* [ ] Context is sufficient.
* [ ] Meaningful alternatives were considered.
* [ ] Trade-offs are explicit.
* [ ] Consequences are understood.
* [ ] Risks are visible.
* [ ] Reversibility is understood.
* [ ] Evidence supports important decisions.

### Decision Coherence

* [ ] Active ADRs are mutually coherent.
* [ ] Decision dependencies are valid.
* [ ] No unresolved blocking conflicts exist.
* [ ] Current/transition/target decisions are distinguishable.
* [ ] Decision drift is understood.

### Architecture Alignment

* [ ] Product intent is preserved.
* [ ] Domain semantics are preserved.
* [ ] Architecture is coherent.
* [ ] Contracts remain coherent.
* [ ] Data ownership is understood.
* [ ] Security implications are understood.
* [ ] Operational consequences are understood.

### Governance Health

* [ ] Decision debt is visible.
* [ ] Implicit decisions are identified.
* [ ] Stale decisions are identified.
* [ ] Unvalidated decisions are identified.
* [ ] Revalidation conditions exist for important decisions.

### Specification Handoff

* [ ] Specifications can identify the active architecture baseline.
* [ ] Stable architectural constraints are explicit.
* [ ] Open decisions are explicit.
* [ ] Specifications will not need to invent unresolved architecture.
* [ ] Feedback paths remain available.

---

# 52. Compact Architecture Decision Baseline

```text id="m5x8vr"
System:
<system>

Active ADRs:
<ADR IDs>

Pending ADRs:
<ADR IDs>

Critical Decisions:
<ADR IDs>

Decision Conflicts:
<conflicts>

Decision Debt:
<debt>

Decision Drift:
<drift>

Major Constraints:
<constraints>

Affected Contracts:
<contracts>

Migration Decisions:
<decisions>

Open Questions:
<questions>

Specification Readiness:
<READY | READY_WITH_RISKS | INCOMPLETE | BLOCKED>
```

---

# 53. Agent Instructions

When performing Architecture Decision Review:

1. Review the active decision baseline as a system.
2. Do not evaluate ADRs only in isolation.
3. Verify decision authority.
4. Verify meaningful alternatives.
5. Verify evidence quality.
6. Verify trade-offs.
7. Verify consequences.
8. Verify reversibility.
9. Detect conflicts among active decisions.
10. Detect stale decisions.
11. Detect decision drift.
12. Detect implicit architectural decisions.
13. Detect decision debt.
14. Verify alignment with Product, Domain, Architecture, and Contracts.
15. Verify data and security consequences.
16. Verify migration consequences.
17. Verify validation strategies.
18. Distinguish current, transition, and target decisions.
19. Preserve historical decisions.
20. Never silently rewrite an existing ADR.
21. Never treat a proposal as an accepted decision.
22. Never invent missing authority.
23. Do not create an ADR solely to satisfy documentation completeness.
24. Do not use ADRs to define implementation details.
25. Identify decisions that block Specifications.
26. Keep non-blocking uncertainty explicit.
27. Return to earlier lifecycle phases when evidence reveals unresolved upstream semantics.
28. Produce an explicit Specification handoff.
29. Base the gate decision on architectural readiness rather than document count.

---

# 54. Anti-Patterns

## ADR Count as Maturity

Assuming many ADRs mean mature architecture.

## Formality Without Governance

Creating ADRs without clear authority or consequences.

## Decision Rubber-Stamping

Automatically accepting agent recommendations.

## Hidden Decision Debt

Ignoring architectural choices that exist only in implementation.

## Silent Conflict Resolution

Choosing between contradictory ADRs without recording the decision.

## Historical Erasure

Deleting old decisions instead of superseding them.

## Specification Leakage

Using ADRs to define implementation details.

## Premature Closure

Marking decisions final while critical evidence is still missing.

## False Certainty

Presenting low-confidence assumptions as architectural facts.

## Decision Drift Blindness

Ignoring divergence between accepted architecture and actual implementation.

## Legacy Authority

Treating historical decisions as automatically valid for the target system.

## Technology Lock-In by Wording

Making the reasoning impossible to understand without a specific framework or vendor.

## Governance by Checklist

Passing the phase because checkboxes are complete without evaluating actual architectural coherence.

## Decision Theater

Producing formal ADRs without improving architectural clarity.

---

# 55. Safe Progression Question

Before entering Specifications / SDD:

> **Is the architecture governed by a coherent and authoritative decision baseline, are consequential decisions explicit and sufficiently justified, are conflicts and decision debt visible, are current and target decisions distinguishable, and can Specifications proceed without inventing unresolved architectural semantics?**

If **yes**, proceed to Specifications / SDD.

If **no**, continue decision analysis or return to the lifecycle phase responsible for the unresolved uncertainty.

---

# 56. Final Principle

> **Architecture Decision Review establishes whether architectural reasoning has become sufficiently explicit and governed to serve as a trustworthy foundation for detailed specifications.**

The phase is successful when the project can clearly distinguish:

```text id="q4m8vr"
What architecture has decided
What architecture has rejected
What architecture has superseded
What architecture still needs to decide
What decisions are conditional
What risks are accepted
What evidence supports the baseline
What Specifications may define
What Specifications must not invent
```

The purpose is not to freeze architecture.

The purpose is to ensure that when implementation-level specifications are created, they are derived from **explicit architectural intent rather than undocumented assumptions**.
