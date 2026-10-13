# Prioritization

## 1. Document Metadata

| Field             | Description                                                          |
| ----------------- | -------------------------------------------------------------------- |
| Document ID       | Unique identifier for the prioritization artifact                    |
| Version           | Current document version                                             |
| Status            | `DRAFT`, `UNDER_REVIEW`, `ACCEPTED`, `SUPERSEDED`                    |
| Created           | Creation date                                                        |
| Updated           | Last update date                                                     |
| Scope             | Product, capability, release, increment, or change scope             |
| Owner             | Responsible role or person                                           |
| Reviewers         | Relevant reviewers or decision authorities                           |
| Related Artifacts | Requirements, outcomes, use cases, scope, risks, unknowns, decisions |
| Lifecycle Phase | Product Discovery |
---

## 2. Purpose

This document defines how the project prioritizes product outcomes, requirements, scope items, use cases, risks, unknowns, and other decision-relevant work.

The purpose is to establish an explicit, evidence-based prioritization mechanism that supports sequencing and trade-off decisions without allowing priority to become an implicit requirement, scope decision, or architectural decision.

Prioritization exists to answer:

> What matters more, why, for whom, under which constraints, and at what point in time?

---

## 3. Core Principle

Priority expresses relative importance or sequencing.

Priority does **not** by itself mean:

* approved scope;
* accepted requirement;
* architectural authorization;
* implementation commitment;
* technical feasibility;
* contractual obligation;
* business approval;
* release commitment.

A high-priority item may still be:

* unresolved;
* under review;
* dependent on another item;
* technically infeasible;
* outside the current scope;
* blocked by an unknown;
* awaiting an explicit decision.

The agent must preserve these distinctions.

---

# 4. Prioritization Model

Prioritization should consider multiple dimensions rather than relying on a single ranking.

Recommended dimensions:

| Dimension           | Purpose                                                        |
| ------------------- | -------------------------------------------------------------- |
| Value               | Expected contribution to intended outcomes                     |
| Impact              | Consequence for users, business, domain, system, or operations |
| Urgency             | Time sensitivity or consequence of delay                       |
| Risk                | Potential loss, failure, exposure, or uncertainty              |
| Dependency          | Effect on or from other work                                   |
| Blocking Effect     | Whether the item prevents meaningful progression               |
| Confidence          | Strength of evidence supporting the prioritization             |
| Effort              | Expected implementation or resolution cost when known          |
| Reversibility       | Cost of changing the decision later                            |
| Strategic Alignment | Relationship to accepted product direction                     |

These dimensions should not be treated as universally equivalent.

For example:

* High value does not automatically mean immediate implementation.
* High urgency does not automatically mean high strategic importance.
* High effort does not automatically justify deprioritization.
* High technical complexity does not automatically increase product priority.
* A low-value item may still be blocking.
* A high-risk unknown may deserve priority because it prevents safe decisions.

---

# 5. Priority Levels

The default priority scale is:

| Priority   | Meaning                                                                                                                             |
| ---------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| `CRITICAL` | Delay materially threatens a required outcome, safety, compliance, core operation, contractual obligation, or lifecycle progression |
| `HIGH`     | Significant contribution or consequence; should be addressed within the relevant planning horizon                                   |
| `MEDIUM`   | Meaningful but not immediately consequential; can normally be sequenced behind higher-priority work                                 |
| `LOW`      | Limited immediate consequence; may be deferred without materially affecting the current objective                                   |

Priority must always be interpreted within scope and time.

`CRITICAL` does not mean universally important.

An item may be:

```text
CRITICAL for Release A
but
LOW for Release B
```

when the release objectives differ.

---

# 6. Priority Is Not Status

Priority and lifecycle status must remain independent.

Example:

```text
Priority: CRITICAL
Status: OPEN
```

means that the item is extremely important but has not yet been resolved or accepted.

Another example:

```text
Priority: LOW
Status: ACCEPTED
```

means that the item is accepted but currently has limited prioritization.

The agent must never infer lifecycle status from priority.

---

# 7. Priority Is Not Urgency

Urgency describes how strongly timing affects the item.

Priority describes relative importance or sequencing.

An item may have:

```text
High priority + low urgency
```

when it is strategically important but not time-sensitive.

Another item may have:

```text
Medium priority + high urgency
```

when a temporary deadline or external event makes delay costly.

Both dimensions should remain explicit when timing materially affects planning.

---

# 8. Priority Is Not Severity

Severity describes the consequence of a problem, defect, risk, or failure.

Priority describes what should receive attention relative to other items.

For example:

```text
Severity: CRITICAL
Priority: HIGH
```

may occur when a serious issue exists but cannot immediately be addressed because a prerequisite or external dependency must be resolved first.

Severity must not automatically determine priority.

---

# 9. Priority Is Not Effort

Implementation effort must not be used as a proxy for value.

A small item may be low value.

A large item may be strategically essential.

A high-effort item may deserve priority when it enables critical outcomes.

A low-effort item may still be deferred when it contributes little meaningful value.

When effort is considered, it should be treated as one factor among several.

---

# 10. Priority Is Not Architecture Significance

Architectural significance and product priority are different dimensions.

An item may be:

```text
Low product priority
High architectural significance
```

because resolving it may prevent an expensive architectural commitment later.

Likewise:

```text
High product priority
Low architectural significance
```

may describe an important user-facing improvement that does not materially affect system architecture.

The agent must preserve both perspectives.

---

# 11. What Can Be Prioritized

Prioritization may apply to:

* Product outcomes
* Requirements
* Use cases
* Scope items
* Business rules
* Risks
* Unknowns
* Constraints requiring resolution
* Architecture decisions
* Technical enablers
* Dependencies
* Migration activities
* Verification activities
* Release items
* System changes

The prioritization mechanism should be adapted to the artifact type.

Not every artifact requires the same prioritization dimensions.

---

# 12. Outcome-Driven Prioritization

Product outcomes should generally provide the highest-level prioritization context.

The agent should ask:

1. Which intended outcome does this item support?
2. How strongly does it contribute?
3. What happens if the item is delayed?
4. Is the outcome itself currently prioritized?
5. Does the item enable another higher-value outcome?
6. Is the contribution supported by evidence?

A feature or requirement should not receive high priority merely because it is frequently requested if its relationship to intended outcomes is unclear.

---

# 13. Requirement Prioritization

Requirements should be prioritized according to:

* contribution to accepted outcomes;
* business or domain importance;
* risk;
* compliance or contractual implications;
* user impact;
* dependency;
* timing;
* consequences of omission;
* confidence in the requirement.

A requirement should not be prioritized solely because:

* it is technically interesting;
* it is easy to implement;
* it already exists in legacy code;
* a developer prefers it;
* it appears early in a document;
* it has a large estimated effort.

Requirement priority must remain traceable to product intent, constraints, risks, and decisions.

---

# 14. Use Case Prioritization

Use cases may be prioritized using:

* actor importance;
* outcome contribution;
* frequency or expected usage when evidence exists;
* business/domain criticality;
* operational importance;
* dependency;
* risk;
* release objectives.

The agent must not assume that a frequently executed use case is necessarily more valuable than an infrequent but critical use case.

For example:

```text
High frequency
≠
High criticality
```

---

# 15. Scope Prioritization

Scope items should be prioritized before sequencing them into releases or increments.

A scope item may be:

```text
IN_SCOPE + HIGH priority
IN_SCOPE + LOW priority
DEFERRED + HIGH priority
OUT_OF_SCOPE + no current priority
```

A deferred item may still have high future priority.

An out-of-scope item should not silently enter the current plan because its priority increases.

Changing scope requires an explicit scope decision.

---

# 16. Risk Prioritization

Risks should be prioritized according to their potential consequence and likelihood when sufficient evidence exists.

Relevant considerations include:

* impact;
* likelihood;
* detectability;
* exposure;
* reversibility;
* affected boundaries;
* dependency;
* time sensitivity;
* mitigation cost.

The agent must distinguish:

```text
Risk priority
```

from:

```text
Risk severity
```

and:

```text
Risk likelihood
```

A high-impact risk with low likelihood may still deserve attention when the consequence is difficult to recover from.

---

# 17. Unknown Prioritization

Unknowns should be prioritized according to their ability to affect future decisions.

A useful heuristic is:

```text
Priority of Unknown
≈
Decision Impact
×
Consequence
×
Irreversibility
```

This is a reasoning heuristic, not a mandatory numerical calculation.

Unknowns should receive higher priority when resolving them may:

* invalidate an architecture direction;
* change product scope;
* alter domain boundaries;
* affect security;
* affect external contracts;
* affect data ownership;
* create migration risk;
* invalidate significant assumptions;
* block a lifecycle gate.

The agent should resolve decision-critical unknowns before low-consequence unknowns.

---

# 18. Dependency-Aware Prioritization

Priority must account for dependencies.

An item with moderate intrinsic value may become high priority because it enables several critical items.

Example:

```text
Outcome A
   ↓
Requirement B
   ↓
Decision C
   ↓
Implementation D
```

If `Decision C` blocks the progression of the entire chain, its prioritization may increase even if the decision itself does not directly produce user-visible value.

The agent should identify:

* prerequisites;
* dependents;
* blocking dependencies;
* external dependencies;
* sequencing constraints;
* dependency risks.

Priority must not be evaluated in isolation when dependency relationships materially affect progression.

---

# 19. Blocking Priority

Some items deserve prioritization because they block safe progression rather than because they directly produce value.

Examples:

* unresolved security boundary;
* unknown data ownership;
* unresolved external contract;
* missing compliance requirement;
* architectural contradiction;
* critical migration dependency;
* unresolved domain rule.

Such items should be explicitly marked as blocking.

Recommended field:

```text
Blocking Effect:
- NONE
- LOCAL
- PHASE
- SYSTEM
- EXTERNAL
```

Blocking effect does not automatically determine priority, but it must be considered in prioritization.

---

# 20. Confidence in Prioritization

Prioritization should include confidence when evidence is incomplete.

Recommended values:

```text
HIGH
MEDIUM
LOW
```

Example:

```text
Priority: HIGH
Confidence: LOW
```

means that the item currently appears highly important, but the evidence supporting that judgment is weak.

The agent should not present low-confidence prioritization as established fact.

Low-confidence high-priority items may become candidates for validation before significant commitment.

---

# 21. Optional Scoring

Projects may use a scoring model when explicit comparison is useful.

A scoring model may consider:

```text
Value
Impact
Urgency
Risk
Dependency
Confidence
Effort
```

However:

> A numerical score is a decision-support mechanism, not the decision itself.

The agent must not:

* invent scores without evidence;
* imply mathematical precision that does not exist;
* hide qualitative trade-offs behind a number;
* treat the highest score as automatically correct.

When scoring is used, the model and interpretation should be documented.

---

# 22. Weighted Scoring

A weighted model may be appropriate when many comparable items must be evaluated.

Conceptually:

```text
Priority Score
=
weighted combination of relevant dimensions
```

The exact weights must be explicitly defined by the project or decision authority.

The agent must not invent organizational weights and present them as authoritative.

If no approved weighting model exists, qualitative prioritization is preferable to fabricated precision.

---

# 23. Trade-Offs

Prioritization often creates conflicts.

Examples:

```text
User value vs delivery timing
Security vs convenience
Short-term value vs long-term maintainability
Migration safety vs feature velocity
Operational reliability vs implementation speed
Product scope vs available capacity
```

Trade-offs should be made explicit.

When the trade-off materially affects architecture, contracts, data, security, or long-term system behavior, it may require an architecture or product decision.

---

# 24. Conflicting Priorities

Conflicting priorities must not be silently resolved.

Example:

```text
Product stakeholder:
Outcome A = CRITICAL

Operations:
Reliability improvement B = CRITICAL
```

The agent should identify the conflict and determine:

1. Whether both priorities refer to the same planning scope;
2. Whether one is time-sensitive;
3. Whether one blocks the other;
4. Whether a dependency resolves the conflict;
5. Whether an explicit decision is required.

The final resolution must remain traceable.

---

# 25. Temporal Prioritization

Priority may change over time.

A priority record should distinguish:

```text
Current Priority
Target Priority
Previous Priority
Effective Date
Reason for Change
```

Priority changes may result from:

* new evidence;
* changed product goals;
* changed constraints;
* discovered risks;
* user feedback;
* regulatory changes;
* dependency changes;
* architecture decisions;
* implementation discoveries;
* changes in release scope.

Historical prioritization should not be silently rewritten when it materially affected previous decisions.

---

# 26. Release and Increment Prioritization

For release planning, prioritization should consider:

1. Required outcomes;
2. Critical requirements;
3. Mandatory constraints;
4. Blocking dependencies;
5. Risk reduction;
6. User/business value;
7. Verification readiness;
8. Operational readiness;
9. Remaining uncertainty.

A release should not be prioritized solely around feature count.

A smaller increment that significantly reduces uncertainty or enables a critical outcome may be preferable to a larger increment containing more features.

---

# 27. Existing Systems

For existing systems, prioritization must distinguish:

```text
Documented State
Actual State
Target State
```

Legacy behavior must not automatically receive high priority merely because it already exists.

Prioritization should consider:

* actual usage;
* contractual obligations;
* business value;
* operational risk;
* migration requirements;
* technical debt;
* compatibility requirements;
* target-state objectives.

When documented and actual behavior differ, the discrepancy may itself become a prioritized investigation item.

---

# 28. System Evolution

For system evolution, prioritization should focus on the change boundary.

The agent should evaluate:

* changed outcome;
* affected requirements;
* affected use cases;
* impacted domain behavior;
* affected contracts;
* dependencies;
* migration implications;
* compatibility;
* regression risk;
* architectural consequences.

The smallest sufficient prioritization scope should be used.

A localized change should not trigger a complete reprioritization of the system unless its impact requires it.

---

# 29. Prioritization Record

Each significant prioritized item should contain:

| Field             | Description                                         |
| ----------------- | --------------------------------------------------- |
| ID                | Unique identifier                                   |
| Item Type         | Outcome, requirement, use case, risk, unknown, etc. |
| Item Reference    | Related artifact identifier                         |
| Priority          | `CRITICAL`, `HIGH`, `MEDIUM`, `LOW`                 |
| Rationale         | Why the item has this priority                      |
| Value             | Expected contribution                               |
| Impact            | Consequence                                         |
| Urgency           | Time sensitivity                                    |
| Risk              | Relevant risk                                       |
| Dependency        | Relevant dependencies                               |
| Blocking Effect   | Blocking classification                             |
| Confidence        | `HIGH`, `MEDIUM`, `LOW`                             |
| Effort            | Known effort information                            |
| Scope             | Applicable scope/release                            |
| Decision Required | Whether explicit authorization is needed            |
| Evidence          | Supporting evidence                                 |
| Owner             | Responsible party                                   |
| Status            | Lifecycle status                                    |
| Effective Date    | When priority applies                               |
| Review Date       | When it should be reconsidered                      |
| Traceability      | Related artifacts                                   |
| Change History    | Material prioritization changes                     |

---

# 30. Prioritization Register

A compact register may use:

| ID      | Type        | Item | Priority | Urgency | Impact   | Risk   | Blocking | Confidence | Scope        | Status   |
| ------- | ----------- | ---- | -------- | ------- | -------- | ------ | -------- | ---------- | ------------ | -------- |
| PRI-001 | Outcome     | —    | HIGH     | MEDIUM  | HIGH     | MEDIUM | PHASE    | HIGH       | Release A    | ACCEPTED |
| PRI-002 | Requirement | —    | CRITICAL | HIGH    | HIGH     | HIGH   | SYSTEM   | MEDIUM     | Release A    | OPEN     |
| PRI-003 | Unknown     | —    | HIGH     | MEDIUM  | CRITICAL | HIGH   | PHASE    | LOW        | Architecture | OPEN     |

The register is a summary.

The rationale and evidence for consequential items should remain available in their source artifacts.

---

# 31. Priority Change Procedure

When a priority changes materially:

1. Identify the affected item.
2. Record the previous priority.
3. Record the new priority.
4. Identify the reason for change.
5. Identify new evidence.
6. Evaluate downstream effects.
7. Review affected dependencies.
8. Review scope or release consequences.
9. Review architectural or contractual consequences.
10. Update traceability.
11. Obtain explicit approval when required.
12. Record the change history.

A priority change must not silently invalidate accepted scope or decisions.

---

# 32. Impact of Reprioritization

Reprioritization should trigger impact analysis when it affects:

* accepted scope;
* release objectives;
* critical requirements;
* business rules;
* architecture decisions;
* external contracts;
* data ownership;
* security;
* migration;
* infrastructure;
* verification;
* operational readiness.

The agent should follow traceability relationships to identify affected artifacts.

---

# 33. Prioritization and Decision Governance

Priority does not authorize implementation.

When prioritization results in a consequential choice between alternatives, the agent should determine whether a formal decision is required.

Example:

```text
"Feature A is higher priority than Feature B"
```

is a prioritization statement.

But:

```text
"We will postpone B and allocate the available capacity to A"
```

may become a product or delivery decision.

Similarly:

```text
"This architecture option must be implemented first because it enables the critical requirement"
```

may require architecture decision governance.

The agent must distinguish prioritization from decision-making.

---

# 34. Traceability

Prioritization should remain traceable to its supporting context.

Typical relationships include:

```text
Priority
   ↓
Outcome
   ↓
Requirement
   ↓
Use Case
   ↓
Domain Capability
```

and:

```text
Priority
   ↓
Risk / Unknown
   ↓
Decision
   ↓
Architecture Consequence
```

Relevant relationship types include:

```text
PRIORITIZES
SUPPORTS
DEPENDS_ON
BLOCKS
ENABLES
DERIVES_FROM
JUSTIFIES
AFFECTS
CONSTRAINS
INFLUENCES
SUPERSEDES
```

Prioritization without traceable rationale should be treated as weak evidence.

---

# 35. Review Checklist

Before accepting a prioritization artifact, verify:

### Context

* [ ] Scope is explicit.
* [ ] Planning horizon is clear when relevant.
* [ ] Related outcomes are identified.
* [ ] Current and target state are distinguished when necessary.

### Reasoning

* [ ] Priority has an explicit rationale.
* [ ] Evidence supports consequential priorities.
* [ ] Priority is not confused with status.
* [ ] Priority is not confused with urgency.
* [ ] Priority is not confused with severity.
* [ ] Priority is not derived solely from effort.
* [ ] Confidence is explicit when uncertainty exists.

### Dependencies

* [ ] Blocking dependencies are identified.
* [ ] External dependencies are identified.
* [ ] Sequencing constraints are understood.
* [ ] High-impact unknowns are considered.

### Governance

* [ ] Conflicting priorities are explicit.
* [ ] Decisions requiring authority are identified.
* [ ] Priority changes are traceable.
* [ ] Scope changes are not silently introduced.
* [ ] Architectural consequences are reviewed when relevant.

### Traceability

* [ ] Priorities trace to relevant outcomes, requirements, risks, or decisions.
* [ ] Significant downstream impacts are identified.
* [ ] Superseded priorities remain historically understandable.

---

# 36. Gate Contribution

Prioritization contributes to lifecycle gates by demonstrating that:

* important outcomes are understood;
* consequential requirements are appropriately ranked;
* critical risks and unknowns receive sufficient attention;
* dependencies are recognized;
* release or increment sequencing has a rationale;
* conflicts are explicit;
* priority is not being used as a substitute for authorization;
* consequential trade-offs are escalated to appropriate decision governance.

Prioritization is not considered complete merely because every item has a priority label.

The relevant question is whether the project has enough prioritization clarity to make the next lifecycle decisions safely.

---

# 37. Agent Instructions

When applying this artifact, the agent must:

1. Identify what is being prioritized.
2. Establish the relevant scope and planning horizon.
3. Identify the outcomes or objectives involved.
4. Gather available evidence.
5. Separate priority from status, urgency, severity, effort, and architecture significance.
6. Identify dependencies and blocking effects.
7. Identify important unknowns affecting prioritization.
8. Record confidence when evidence is incomplete.
9. Avoid fabricated numerical scores or organizational weights.
10. Use qualitative reasoning when quantitative data is unavailable.
11. Detect conflicting priorities.
12. Escalate consequential trade-offs requiring explicit decisions.
13. Preserve previous prioritization when historically relevant.
14. Analyze downstream impact when priorities change.
15. Update traceability.
16. Avoid turning priority into implicit scope or implementation authorization.
17. Scale prioritization depth according to project size, risk, and consequence.
18. Ask targeted questions when priority materially depends on unavailable context.

The agent should prefer:

```text
Evidence → Rationale → Priority
```

over:

```text
Assumption → Score → Priority
```

---

# 38. Anti-Patterns

## 38.1 Priority by Implementation Ease

> "This is easy, so it should be first."

Ease is not value.

---

## 38.2 Priority by Stakeholder Volume

> "More people requested it, therefore it is critical."

Frequency of requests is evidence, not automatic priority.

---

## 38.3 Priority by Technical Interest

> "This technology is interesting, so we should prioritize it."

Technology interest is not product value.

---

## 38.4 Priority as Hidden Scope

> "It is high priority, therefore it is in scope."

Priority does not change scope.

---

## 38.5 Priority as Hidden Decision

> "It has the highest score, therefore the architecture is decided."

A ranking does not replace decision governance.

---

## 38.6 False Numerical Precision

> "The item has 87.4 points, therefore it is objectively more important."

Scores do not create evidence that does not exist.

---

## 38.7 Legacy Priority Bias

> "The old system already does this, so it must be high priority."

Existing behavior is evidence, not automatic future priority.

---

## 38.8 Everything Is Critical

If everything is critical, prioritization has failed to provide meaningful differentiation.

---

## 38.9 Ignoring Dependencies

Ranking items independently can produce an impossible execution sequence.

---

## 38.10 Ignoring Unknowns

A seemingly low-priority unknown may invalidate a high-priority decision.

---

## 38.11 Silent Reprioritization

Changing priority without recording the reason destroys decision history and traceability.

---

## 38.12 Documentation Theater

Creating elaborate priority matrices without improving sequencing or decision quality adds ceremony without value.

---

# 39. Safe Progression Question

Before progressing beyond prioritization, the agent should be able to answer:

> **Do I understand which outcomes, requirements, scope items, risks, and unknowns matter most within the current context, why they matter, what dependencies affect their ordering, and which prioritization choices require explicit decisions?**

If the answer is no, the agent should not fabricate a ranking.

It should identify the missing evidence or ask the smallest set of decision-relevant questions.

---

# 40. Final Principle

> **Prioritization is the explicit ordering of attention and sequencing based on value, consequence, urgency, risk, dependency, and evidence. It must guide decisions without becoming a substitute for scope, authorization, or architecture governance.**

A strong prioritization model does not attempt to eliminate trade-offs.

It makes them visible, reasoned, traceable, and revisable.

