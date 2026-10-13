# Architecture Decision Record

## 1. Document Metadata

| Field              | Value                         |       |             |             |
| ------------------ | ----------------------------- | ----- | ----------- | ----------- |
| Document Type      | Architecture Decision Record  |       |             |             |
| Decision ID        | `ADR-<NNNN>`                  |       |             |             |
| Title              | `<decision title>`            |       |             |             |
| Status             | `PROPOSED`                    |       |             |             |
| Significance       | `<TRIVIAL                     | LOCAL | SIGNIFICANT | STRATEGIC>` |
| Date               | `<date>`                      |       |             |             |
| Decision Authority | `<person / role / authority>` |       |             |             |
| Decision Owner     | `<owner>`                     |       |             |             |
| Lifecycle Phase    | Architecture Decisions        |       |             |             |
| System             | `<system>`                    |       |             |             |
| Scope              | `<scope>`                     |       |             |             |
| Supersedes         | `<ADR-ID or NONE>`            |       |             |             |
| Superseded By      | `<ADR-ID or NONE>`            |       |             |             |
| Related Decisions  | `<ADR IDs>`                   |       |             |             |

---

# 2. Purpose

This document records a consequential architectural decision in an explicit, traceable, and reviewable form.

An Architecture Decision Record captures:

* Why the decision was necessary.
* What problem was being addressed.
* What constraints existed.
* Which alternatives were considered.
* Why one option was selected.
* What consequences follow from the decision.
* What risks are introduced or accepted.
* Which architectural elements and contracts are affected.
* How the decision will be validated.
* What future conditions could cause the decision to be revisited.

An ADR records a **decision**, not merely a recommendation or technical preference.

---

# 3. Core Principle

> **An ADR records why an architectural choice was made and what consequences that choice creates.**

The selected technology is only one possible consequence of an architectural decision.

The architectural decision should remain understandable even if the implementation technology changes.

---

# 4. Decision State

Allowed states:

```text id="m4x8vr"
IDENTIFIED
PROPOSED
UNDER_REVIEW
ACCEPTED
REJECTED
ACTIVE
SUPERSEDED
DEPRECATED
REVOKED
```

### IDENTIFIED

A decision candidate has been discovered.

### PROPOSED

An option is recommended but has not been accepted.

### UNDER_REVIEW

The decision is being evaluated by the appropriate authority.

### ACCEPTED

The decision has been formally accepted.

### REJECTED

The proposed decision was explicitly rejected.

### ACTIVE

The accepted decision currently governs the architecture.

### SUPERSEDED

A later decision replaces this decision.

### DEPRECATED

The decision remains historically relevant but should no longer guide new changes.

### REVOKED

The decision was withdrawn because its authority or basis was invalidated.

---

# 5. Decision Significance

Classify the decision:

```text id="q7m3xc"
TRIVIAL
LOCAL
SIGNIFICANT
STRATEGIC
```

## TRIVIAL

Low consequence, easily reversible, limited scope.

May not require a formal ADR depending on project governance.

## LOCAL

Affects one architectural area or component with limited external impact.

## SIGNIFICANT

Affects multiple components, boundaries, contracts, quality attributes, data ownership, security, or operational behavior.

## STRATEGIC

Creates long-term system constraints, affects major architectural direction, external dependencies, platform strategy, migration strategy, or difficult-to-reverse decisions.

---

# 6. Decision Trigger

Explain why this decision exists now.

```text id="v5x9mr"
Trigger:
<event / requirement / conflict / architectural need>

Why Now:
<reason>

Detected During:
<Product | Domain | Architecture | Contracts | Implementation | Operations>

Related Finding:
<finding ID or NONE>
```

A decision should have a meaningful trigger.

Avoid creating ADRs merely because a technology was introduced.

---

# 7. Context

Describe the architectural situation in which the decision must be made.

```text id="n8q4vc"
System:
<system>

Current State:
<current state>

Target State:
<target state>

Transition State:
<transition state>

Relevant Boundaries:
<boundaries>

Relevant Domain Concepts:
<concepts>

Relevant Contracts:
<contracts>
```

The context must provide enough information for another person to understand the decision without reconstructing the entire project history.

---

# 8. Problem Statement

State the problem explicitly.

```text id="m6x3vr"
Problem:
<problem>

Why It Matters:
<impact>

Who / What Is Affected:
<affected parties>

Consequence of Not Deciding:
<consequence>
```

The problem should describe the architectural need, not simply the desired technology.

---

# 9. Decision Drivers

Identify the factors that influence the decision.

Typical drivers include:

* Business requirements.
* Domain integrity.
* Quality attributes.
* Security.
* Privacy.
* Data ownership.
* Integration.
* Reliability.
* Availability.
* Performance.
* Scalability.
* Maintainability.
* Operability.
* Observability.
* Migration.
* Compatibility.
* Cost.
* Organizational constraints.
* Regulatory requirements.
* Existing-system constraints.
* Future evolution.

```text id="x4q8mk"
Driver:
<driver>

Importance:
<CRITICAL | HIGH | MEDIUM | LOW>

Reason:
<reason>
```

---

# 10. Constraints

Separate constraints from decision drivers.

```text id="q5m9vc"
Constraint:
<constraint>

Strength:
<MANDATORY | PREFERRED | INFORMATIONAL>

Source:
<source>

Impact:
<impact>
```

Do not convert preferences into mandatory constraints without explicit authority.

---

# 11. Requirements

Identify requirements relevant to the decision.

```text id="v7x3mr"
Requirement:
<REQ-ID>

Meaning:
<requirement>

Impact on Decision:
<impact>
```

Requirements describe what must be achieved.

The ADR determines how the architecture responds to those requirements.

---

# 12. Assumptions

Record assumptions that influence the analysis.

```text id="n4q8xc"
Assumption:
<assumption>

Confidence:
<HIGH | MEDIUM | LOW>

Evidence:
<evidence>

Impact If False:
<impact>

Validation:
<validation>
```

Critical assumptions should not remain hidden.

---

# 13. Unknowns

```text id="m8x5vr"
Unknown:
<unknown>

Importance:
<LOW | MEDIUM | HIGH | CRITICAL>

Decision Impact:
<impact>

Blocking:
<YES | NO>

Resolution:
<resolution>
```

A decision may be accepted with non-blocking unknowns when the authority explicitly accepts the associated risk.

---

# 14. Architectural Context

Describe the architecture relevant to the decision.

```text id="x6q3mk"
Architecture Element:
<element>

Responsibility:
<responsibility>

Boundary:
<boundary>

Relationship:
<relationship>

Impact:
<impact>
```

Reference existing architecture artifacts rather than duplicating them unnecessarily.

---

# 15. Decision Scope

Define what this ADR governs.

### In Scope

```text id="q9m4vc"
<items>
```

### Out of Scope

```text id="v5x8mr"
<items>
```

### Deferred

```text id="n7q3xc"
<items>
```

A decision must not silently expand its authority beyond its intended scope.

---

# 16. Options Considered

At least the meaningful alternatives should be documented.

| Option | Description | Advantages     | Disadvantages     | Risks     | Reversibility |
| ------ | ----------- | -------------- | ----------------- | --------- | ------------- |
| A      | `<option>`  | `<advantages>` | `<disadvantages>` | `<risks>` | `<level>`     |
| B      | `<option>`  | `<advantages>` | `<disadvantages>` | `<risks>` | `<level>`     |
| C      | `<option>`  | `<advantages>` | `<disadvantages>` | `<risks>` | `<level>`     |

The objective is not to document every imaginable option.

The objective is to show the meaningful alternatives that could reasonably have been selected.

---

# 17. Option Evaluation

Evaluate alternatives against the actual decision drivers.

```text id="m3x7vr"
Option:
<option>

Functional Fit:
<assessment>

Domain Fit:
<assessment>

Quality Attributes:
<assessment>

Security:
<assessment>

Data:
<assessment>

Integration:
<assessment>

Operational Impact:
<assessment>

Migration Impact:
<assessment>

Complexity:
<assessment>

Cost:
<assessment>

Reversibility:
<assessment>

Overall Assessment:
<assessment>
```

Avoid artificial numeric scoring when the available evidence does not justify precise numbers.

---

# 18. Trade-Off Analysis

Document important trade-offs.

```text id="x8q4mk"
Trade-Off:
<trade-off>

Benefit:
<benefit>

Cost:
<cost>

Risk:
<risk>

Accepted:
<YES | NO>

Reason:
<reason>
```

Architecture decisions often represent explicit trade-offs rather than universally superior solutions.

---

# 19. Recommendation

Before recording the final decision, a recommendation may be provided.

```text id="q6m9vc"
Recommended Option:
<option>

Recommendation:
<recommendation>

Reason:
<reason>

Confidence:
<HIGH | MEDIUM | LOW>
```

A recommendation is not a decision.

It becomes a decision only when the appropriate authority accepts it.

---

# 20. Decision

Record the actual architectural choice.

```text id="v4x7mr"
Decision:
<selected option / architectural rule>

Status:
<ACCEPTED | ACTIVE>

Authority:
<authority>

Effective Date:
<date>
```

The decision must be explicit.

Avoid wording such as:

```text
"We will probably use..."
"It seems better to..."
"We may consider..."
```

Those statements represent proposals, not accepted decisions.

---

# 21. Decision Rationale

Explain why the selected option was chosen.

```text id="n8q3xc"
Rationale:
<reasoning>

Primary Drivers:
<drivers>

Rejected Alternatives:
<alternatives>

Critical Trade-Offs:
<trade-offs>
```

The rationale should explain the relationship between evidence, constraints, alternatives, and the selected option.

---

# 22. Consequences

Document expected consequences.

## Positive Consequences

```text id="m5x9vr"
<consequences>
```

## Negative Consequences

```text id="x3q7mk"
<consequences>
```

## Neutral / Operational Consequences

```text id="q8m4vc"
<consequences>
```

Consequences are part of the decision, not an afterthought.

---

# 23. Functional Consequences

```text id="v6x3mr"
Functional Impact:
<impact>
```

Consider:

* User behavior.
* Business behavior.
* Domain processes.
* State transitions.
* Business rules.
* Use cases.

---

# 24. Domain Consequences

```text id="n9q5xc"
Domain Impact:
<impact>

Affected Concepts:
<concepts>

Affected Rules:
<rules>

Affected Aggregates:
<aggregates>

Affected Events:
<events>
```

Architecture decisions must not silently change domain semantics.

---

# 25. Architecture Consequences

```text id="m7x4vr"
Architecture Impact:
<impact>

Affected Containers:
<containers>

Affected Components:
<components>

Affected Views:
<views>

Boundary Changes:
<boundaries>
```

---

# 26. Contract Consequences

```text id="x5q8mr"
Contract:
<contract>

Impact:
<impact>

Compatibility:
<impact>

Consumer Impact:
<impact>

Migration:
<migration>
```

A decision affecting contracts should explicitly identify those contracts.

---

# 27. Data Consequences

```text id="q4m9vc"
Data Impact:
<impact>

Ownership:
<ownership>

Authority:
<authority>

Consistency:
<consistency>

Migration:
<migration>

Retention / Lifecycle:
<impact>
```

---

# 28. Security Consequences

```text id="v8x3mk"
Security Impact:
<impact>

Trust Boundaries:
<boundaries>

Authentication:
<impact>

Authorization:
<impact>

Sensitive Data:
<impact>

Audit:
<impact>
```

---

# 29. Operational Consequences

```text id="n5q7vr"
Operational Impact:
<impact>

Deployment:
<impact>

Availability:
<impact>

Resilience:
<impact>

Observability:
<impact>

Recovery:
<impact>

Support:
<impact>
```

---

# 30. Quality Attribute Consequences

Evaluate affected quality attributes.

| Quality Attribute | Impact     | Direction                     | Reason     |
| ----------------- | ---------- | ----------------------------- | ---------- |
| Performance       | `<impact>` | `<positive/negative/neutral>` | `<reason>` |
| Availability      | `<impact>` | `<direction>`                 | `<reason>` |
| Reliability       | `<impact>` | `<direction>`                 | `<reason>` |
| Security          | `<impact>` | `<direction>`                 | `<reason>` |
| Maintainability   | `<impact>` | `<direction>`                 | `<reason>` |
| Scalability       | `<impact>` | `<direction>`                 | `<reason>` |
| Observability     | `<impact>` | `<direction>`                 | `<reason>` |

Only include relevant attributes.

---

# 31. Migration Consequences

For existing systems or evolution:

```text id="m3x8qc"
Current Architecture:
<state>

Target Architecture:
<state>

Migration Requirement:
<requirement>

Migration Strategy:
<strategy>

Compatibility Period:
<period>

Transition State:
<state>

Rollback / Recovery:
<strategy>

Retirement Condition:
<condition>
```

---

# 32. Risks

```text id="x7q4mr"
Risk ID:
ADR-RISK-<NNN>

Risk:
<risk>

Probability:
<LOW | MEDIUM | HIGH | UNKNOWN>

Impact:
<LOW | MEDIUM | HIGH | CRITICAL>

Mitigation:
<mitigation>

Owner:
<owner>
```

---

# 33. Accepted Risks

Some architectural choices intentionally accept risks.

```text id="q5m8vc"
Risk:
<risk>

Why Accepted:
<reason>

Authority:
<authority>

Mitigation:
<mitigation>

Review Trigger:
<trigger>
```

Accepted risk must not be confused with unresolved risk.

---

# 34. Dependencies

```text id="v9x3mr"
Dependency:
<dependency>

Type:
<ARCHITECTURE | DOMAIN | CONTRACT | DATA | SECURITY | INFRASTRUCTURE | EXTERNAL>

Impact:
<impact>

Status:
<status>
```

---

# 35. Affected Architecture Elements

| Element     | Impact     | Change Required |
| ----------- | ---------- | --------------- |
| `<element>` | `<impact>` | `<change>`      |

---

# 36. Affected Contracts

| Contract     | Impact     | Compatibility     | Consumer Impact |
| ------------ | ---------- | ----------------- | --------------- |
| `<contract>` | `<impact>` | `<compatibility>` | `<impact>`      |

---

# 37. Affected Product Artifacts

| Artifact      | Relationship     | Impact     |
| ------------- | ---------------- | ---------- |
| Requirement   | `<relationship>` | `<impact>` |
| Outcome       | `<relationship>` | `<impact>` |
| Use Case      | `<relationship>` | `<impact>` |
| Business Rule | `<relationship>` | `<impact>` |

---

# 38. Affected Domain Artifacts

| Artifact        | Relationship     | Impact     |
| --------------- | ---------------- | ---------- |
| Bounded Context | `<relationship>` | `<impact>` |
| Domain Model    | `<relationship>` | `<impact>` |
| Aggregate       | `<relationship>` | `<impact>` |
| Domain Event    | `<relationship>` | `<impact>` |
| Context Map     | `<relationship>` | `<impact>` |

---

# 39. Verification Strategy

The decision must be verifiable.

```text id="n6q4xc"
Decision:
<decision>

Verification Method:
<method>

Expected Evidence:
<evidence>

Success Condition:
<condition>

Responsible Party:
<owner>

Verification Point:
<release / milestone / condition>
```

Possible methods:

* Architecture review.
* Proof of concept.
* Automated test.
* Contract test.
* Integration test.
* Performance test.
* Security validation.
* Operational validation.
* Production observation.
* Migration rehearsal.
* Data validation.

---

# 40. Decision Validation

```text id="m8x5vr"
Validation Status:
<NOT_VALIDATED | PARTIALLY_VALIDATED | VALIDATED | INVALIDATED>

Evidence:
<evidence>

Date:
<date>

Result:
<result>

Follow-Up:
<follow-up>
```

An accepted decision may later be invalidated by new evidence.

---

# 41. Decision Revisit Conditions

Define what could cause this ADR to be reconsidered.

```text id="x4q7mk"
Trigger:
<trigger>

Reason:
<reason>

Expected Action:
<action>
```

Examples:

* A quality attribute target changes.
* A critical dependency becomes unavailable.
* A regulatory requirement changes.
* Contract consumers change.
* Domain boundaries are revised.
* Migration constraints change.
* Operational evidence contradicts assumptions.
* A new architecture constraint appears.

---

# 42. Decision Reversibility

Classify:

```text id="q9m3vc"
REVERSIBLE
PARTIALLY_REVERSIBLE
DIFFICULT_TO_REVERSE
IRREVERSIBLE
```

Explain:

```text id="v5x8mr"
Reversibility:
<classification>

Reason:
<reason>

Cost of Reversal:
<impact>

Required Migration:
<migration>
```

The more difficult a decision is to reverse, the stronger its analysis and governance should be.

---

# 43. Decision Dependencies

Record decisions that influence or are influenced by this decision.

```text id="n7q4xc"
Related ADR:
<ADR-ID>

Relationship:
<DEPENDS_ON | INFLUENCES | CONSTRAINS | SUPERSEDES | CONFLICTS_WITH>

Reason:
<reason>
```

---

# 44. Supersession

If this ADR replaces another:

```text id="m4x9vr"
Supersedes:
<ADR-ID>

Reason:
<reason>

Changed Context:
<context>

New Evidence:
<evidence>

Migration Required:
<YES | NO>

Migration Status:
<status>
```

If this ADR is later superseded, the newer ADR must reference it.

Historical decisions must remain traceable.

---

# 45. Conflicting Decisions

```text id="x8q3mk"
ADR:
<ADR-ID>

Conflict:
<description>

Conflict Type:
<SEMANTIC | TECHNICAL | CONTRACT | DOMAIN | SECURITY | DATA | OPERATIONAL>

Severity:
<severity>

Resolution:
<resolution>
```

Do not silently rewrite an existing ADR to hide a conflict.

---

# 46. Decision Drift

Evaluate whether implementation or architecture has diverged from the accepted decision.

```text id="q6m5vc"
ADR:
<ADR-ID>

Accepted Decision:
<decision>

Observed State:
<state>

Drift:
<NO | PARTIAL | SIGNIFICANT | UNKNOWN>

Impact:
<impact>

Action:
<action>
```

Decision drift may indicate:

* Implementation divergence.
* Architecture evolution.
* Obsolete decision.
* Missing ADR.
* Uncontrolled exception.

---

# 47. Existing-System Analysis

For existing systems:

```text id="v7x4mr"
Documented Decision:
<decision>

Observed Decision:
<behavior>

Current Actual State:
<state>

Target State:
<state>

Conflict:
<conflict>

Action:
<action>
```

Historical documentation must not automatically override observed behavior.

---

# 48. System Evolution Analysis

For incremental changes:

```text id="n3q8xc"
Change:
<change>

Existing Decision:
<ADR-ID>

Affected Area:
<area>

Can Existing Decision Remain Valid:
<YES | NO | PARTIAL>

Required Change:
<change>

Migration Decision:
<decision>
```

Use the smallest sufficient decision scope.

---

# 49. Traceability

Canonical ADR traceability:

```text id="m5x9vr"
Product Need
      ↓
Requirement / Outcome
      ↓
Domain / Architecture Concern
      ↓
Decision Trigger
      ↓
Options
      ↓
ADR
      ↓
Contract / Specification
      ↓
Implementation
      ↓
Verification
```

---

# 50. Traceability Relationships

Relevant relationships include:

```text id="x4q7mk"
DERIVES_FROM
CONSTRAINS
INFLUENCES
JUSTIFIES
DECIDES
AFFECTS
SPECIFIES
REALIZES
VERIFIES
DEPENDS_ON
SUPERSEDES
INVALIDATES
MITIGATES
```

---

# 51. Evidence

Record evidence supporting the decision.

```text id="q8m3vc"
Evidence:
<evidence>

Type:
<USER_DECISION | REQUIREMENT | DOMAIN_ANALYSIS | ARCHITECTURE_ANALYSIS | CONTRACT | TEST | RUNTIME | POC | MEASUREMENT | OTHER>

Source:
<source>

Confidence:
<HIGH | MEDIUM | LOW>
```

Do not present inference as evidence.

---

# 52. Decision Confidence

```text id="v6x9mr"
Confidence:
<HIGH | MEDIUM | LOW>

Reason:
<reason>
```

Confidence describes the strength of the evidence supporting the decision.

It does not determine whether the decision is valid.

---

# 53. Review Record

```text id="n4q8xc"
Reviewer:
<reviewer>

Review Date:
<date>

Review Result:
<APPROVED | CHANGES_REQUESTED | REJECTED | DEFERRED>

Comments:
<comments>
```

---

# 54. Approval

```text id="m7x3vr"
Decision Authority:
<authority>

Decision:
<ACCEPTED | REJECTED>

Date:
<date>

Conditions:
<conditions>
```

An ADR must not be marked `ACCEPTED` merely because the agent recommends it.

---

# 55. Lifecycle

The recommended lifecycle is:

```text id="x5q9mk"
IDENTIFIED
    ↓
PROPOSED
    ↓
UNDER_REVIEW
    ↓
ACCEPTED
    ↓
ACTIVE
    ↓
SUPERSEDED / DEPRECATED / REVOKED
```

Possible rejection:

```text id="q4m8vc"
PROPOSED
    ↓
UNDER_REVIEW
    ↓
REJECTED
```

Not every ADR requires every state.

---

# 56. Status Transition Rules

### IDENTIFIED → PROPOSED

The decision candidate has sufficient context for analysis.

### PROPOSED → UNDER_REVIEW

Meaningful alternatives and consequences have been documented.

### UNDER_REVIEW → ACCEPTED

The appropriate authority accepts the decision.

### ACCEPTED → ACTIVE

The decision becomes applicable to the architecture.

### ACTIVE → SUPERSEDED

A newer decision replaces it.

### ACTIVE → DEPRECATED

The decision remains historically valid but should no longer guide new work.

### ACTIVE → REVOKED

The decision's authority is invalidated.

---

# 57. Compact ADR Summary

```text id="v8x3mr"
ADR:
<ADR-ID>

Title:
<title>

Status:
<status>

Significance:
<significance>

Problem:
<problem>

Decision:
<decision>

Rationale:
<rationale>

Primary Drivers:
<drivers>

Major Consequences:
<consequences>

Affected Architecture:
<architecture>

Affected Contracts:
<contracts>

Affected Data:
<data>

Security Impact:
<security>

Risks:
<risks>

Verification:
<verification>

Revisit Conditions:
<triggers>

Supersedes:
<ADR-ID or NONE>
```

---

# 58. Agent Instructions

When creating or reviewing an ADR:

1. Determine whether a formal architectural decision is actually required.
2. Identify the decision trigger.
3. Establish sufficient context before proposing a solution.
4. Separate requirements from constraints.
5. Separate constraints from preferences.
6. Separate assumptions from facts.
7. Identify meaningful alternatives.
8. Evaluate alternatives against actual decision drivers.
9. Record trade-offs explicitly.
10. Make reversibility visible.
11. Record the recommendation separately from the decision.
12. Never turn a recommendation into an accepted decision without authority.
13. Record consequences across domain, architecture, contracts, data, security, and operations where relevant.
14. Identify affected consumers and boundaries.
15. Identify migration implications.
16. Record risks and accepted risks separately.
17. Identify decisions that this ADR depends on.
18. Detect conflicts with existing ADRs.
19. Never silently modify another decision to resolve a conflict.
20. Preserve historical decisions.
21. Record supersession explicitly.
22. Use evidence rather than unsupported assumptions.
23. Distinguish current state from target state.
24. For existing systems, compare documented and observed behavior.
25. Validate difficult-to-reverse decisions more rigorously.
26. Keep the decision technology-agnostic where possible.
27. Do not use ADRs as implementation specifications.
28. Do not create ADRs for every trivial coding choice.
29. Revisit earlier lifecycle phases when the decision exposes unresolved product or domain semantics.
30. Maintain bidirectional traceability.
31. Define how the decision will be verified.
32. Define conditions under which the decision should be revisited.

---

# 59. Anti-Patterns

## Technology-First ADR

Starting with a technology and inventing architectural justification afterward.

## Single-Option ADR

Recording a preferred solution without considering meaningful alternatives.

## Recommendation as Decision

Treating an agent recommendation as an accepted architectural decision.

## ADR for Every Detail

Using ADRs for trivial implementation choices.

## ADR as Specification

Using the ADR to describe classes, methods, configuration, or implementation procedures.

## Hidden Decision

Allowing an important architectural choice to exist only in chat, code, or informal discussion.

## Historical Rewriting

Changing an old ADR instead of recording a new decision that supersedes it.

## False Precision

Using unsupported numerical scoring or fabricated measurements.

## Technology Permanence

Writing the ADR so tightly around a technology that the architectural reasoning becomes impossible to understand independently.

## Consequence Blindness

Recording only the benefit of the selected option.

## Risk Suppression

Hiding known risks because they make the decision appear weaker.

## Legacy Worship

Assuming current behavior is automatically the correct target architecture.

## Decision by Consensus Without Authority

Assuming that discussion or agreement automatically constitutes architectural approval.

## Circular Justification

Using the selected option itself as evidence for why the option was selected.

## Post-Hoc Justification

Creating an ADR after implementation and presenting the implementation as if it were the original decision.

## Architecture Theater

Creating ADRs merely to increase documentation volume.

---

# 60. Safe Progression Question

Before accepting an ADR, ask:

> **Is the architectural problem sufficiently understood, are the meaningful alternatives and trade-offs explicit, is the selected option justified by evidence and constraints, are its consequences and risks understood, is the decision appropriately authorized, and can its validity be verified and revisited if its assumptions change?**

If **yes**, the ADR can proceed through the appropriate decision state.

If **no**, continue analysis or return to the lifecycle phase that contains the unresolved uncertainty.

---

# 61. Final Principle

> **An Architecture Decision Record preserves the reasoning behind consequential architectural choices so that the architecture remains understandable, governable, traceable, and evolvable over time.**

A good ADR does not merely answer:

> “What did we choose?”

It also preserves:

```text
Why the decision existed
What alternatives were considered
What constraints mattered
What evidence supported it
What trade-offs were accepted
What consequences followed
What risks remain
Who authorized it
How it will be verified
When it should be reconsidered
```

The purpose of ADRs is not to freeze architecture.

The purpose is to make architectural change **explicit, informed, and traceable**.
