# Product Outcomes

## 1. Document Metadata

| Field                   | Value                      |
| ----------------------- | -------------------------- |
| Document ID             | `<OUTCOMES-ID>`            |
| Title                   | Product Outcomes           |
| Version                 | `<VERSION>`                |
| Status                  | `<STATUS>`                 |
| Date                    | `<DATE>`                   |
| Author                  | `<AUTHOR>`                 |
| Project                 | `<PROJECT-NAME>`           |
| Lifecycle Phase         | Product Discovery          |
| Related Product Context | `<PRODUCT-CONTEXT-ID>`     |
| Related Scope           | `<SCOPE-ID>`               |
| Related Requirements    | `<REQUIREMENTS-REFERENCE>` |
| Reviewers               | `<REVIEWERS>`              |

---

## 2. Purpose

This document defines the outcomes that the product or system is expected to produce for its users, stakeholders, organization, or surrounding ecosystem.

It establishes the difference between:

* what the product does;
* what the product delivers;
* what users or stakeholders achieve;
* what business or operational change is expected;
* how successful outcomes can be evaluated.

The objective is to ensure that product requirements and later architectural decisions remain connected to meaningful outcomes rather than becoming feature- or technology-driven.

---

## 3. Core Principle

**A product outcome describes a meaningful change or result that should occur because the product exists or performs its intended responsibilities.**

An outcome is not the same as:

* a feature;
* a requirement;
* a business rule;
* an implementation task;
* an API;
* a database operation;
* a technology choice;
* a metric by itself.

For example:

> "Provide a weekly planning capability."

describes functionality.

Whereas:

> "Reduce the effort required for users to plan their weekly activities."

describes an outcome.

The product may use multiple capabilities to achieve one outcome, and one capability may contribute to multiple outcomes.

---

## 4. Outcome Model

Each significant outcome should answer:

1. **Who** is expected to benefit?
2. **What changes** as a result of the product?
3. **Why does the change matter?**
4. **How can the outcome be evaluated?**
5. **Which product capabilities contribute to it?**

An outcome should remain meaningful even if the implementation technology changes.

---

## 5. Outcome Categories

Outcomes may be classified using one or more of the following categories.

### 5.1 USER

An improvement experienced directly by a user.

Examples:

* reduced effort;
* faster completion;
* improved clarity;
* increased confidence;
* easier access to information.

### 5.2 BUSINESS

An outcome related to business value or organizational objectives.

Examples:

* reduced operational cost;
* increased conversion;
* improved retention;
* reduced manual processing;
* increased revenue.

### 5.3 OPERATIONAL

An improvement in operational processes or execution.

Examples:

* fewer manual interventions;
* improved process visibility;
* reduced processing time;
* improved incident handling.

### 5.4 DOMAIN

An outcome related to the effectiveness or correctness of a business/domain process.

### 5.5 COMPLIANCE

An outcome associated with meeting regulatory, contractual, or organizational obligations.

### 5.6 SECURITY

An outcome related to protection of assets, users, data, or operations.

### 5.7 TECHNICAL / SYSTEM

An outcome related to system capabilities or system-level properties.

Technical outcomes should still be connected to a meaningful product or operational objective when possible.

---

## 6. Outcome Register

| ID        | Outcome     | Category   | Beneficiary     | Priority | Status     |
| --------- | ----------- | ---------- | --------------- | -------- | ---------- |
| `OUT-001` | `<OUTCOME>` | `USER`     | `<ACTOR>`       | `HIGH`   | `PROPOSED` |
| `OUT-002` | `<OUTCOME>` | `BUSINESS` | `<STAKEHOLDER>` | `MEDIUM` | `ACCEPTED` |

---

## 7. Outcome Record

Each significant outcome should have an explicit record.

### Outcome

**ID:** `<OUTCOME-ID>`

**Name:** `<OUTCOME-NAME>`

**Category:** `<CATEGORY>`

**Status:** `<STATUS>`

**Priority:** `<PRIORITY>`

**Beneficiary:**

`<ACTOR OR STAKEHOLDER>`

**Outcome Statement:**

> `<Describe the meaningful change expected as a result of the product.>`

**Problem Addressed:**

`<Describe the problem or undesirable state being addressed.>`

**Expected Change:**

`<Describe the desired change from current state to target state.>`

**Why It Matters:**

`<Describe the value or consequence.>`

**Success Evidence:**

`<Describe how the outcome could be evaluated.>`

**Contributing Capabilities:**

* `<CAPABILITY-1>`
* `<CAPABILITY-2>`

**Related Requirements:**

* `<REQ-ID>`

**Related Business Rules:**

* `<RULE-ID>`

**Related Actors:**

* `<ACTOR-ID>`

**Related Constraints:**

* `<CONSTRAINT-ID>`

**Dependencies:**

* `<DEPENDENCY-ID>`

**Assumptions:**

* `<ASSUMPTION-ID>`

**Evidence:**

* `<SOURCE>`

---

## 8. Current State and Target State

Outcomes should describe a meaningful transition between states.

| Area     | Current State | Target State | Desired Change |
| -------- | ------------- | ------------ | -------------- |
| `<AREA>` | `<CURRENT>`   | `<TARGET>`   | `<CHANGE>`     |

### Current State

Describe the relevant existing condition.

Do not assume that the current state is undesirable unless evidence supports that interpretation.

### Target State

Describe the intended condition after the product or change has achieved its objective.

The target state should remain independent from implementation details where possible.

---

## 9. Outcome vs Output

A product may produce outputs without achieving the desired outcome.

For example:

| Output                | Possible Outcome             |
| --------------------- | ---------------------------- |
| `<FEATURE>`           | `<USER/BUSINESS CHANGE>`     |
| `<REPORT>`            | `<IMPROVED DECISION MAKING>` |
| `<AUTOMATED PROCESS>` | `<REDUCED MANUAL EFFORT>`    |

The presence of an output does not prove that the outcome was achieved.

Verification should therefore distinguish:

* capability delivered;
* behavior implemented;
* outcome achieved.

---

## 10. Outcome Hierarchy

Outcomes may exist at multiple levels.

### 10.1 Strategic Outcome

A high-level organizational or product objective.

### 10.2 Product Outcome

A meaningful result produced by the product.

### 10.3 Capability Outcome

A result associated with a specific product capability.

### 10.4 Operational Outcome

A measurable improvement in execution or operation.

These levels may be related, but they should not be collapsed into a single statement.

Example:

```text
Strategic Outcome
        ↓
Product Outcome
        ↓
Capability Outcome
        ↓
Operational Result
```

Use only the level of detail necessary for the project.

---

## 11. Outcome Prioritization

Outcomes should be prioritized according to their importance to the product.

Recommended priority levels:

* `CRITICAL`
* `HIGH`
* `MEDIUM`
* `LOW`

Priority should be based on evidence such as:

* product strategy;
* stakeholder decisions;
* business impact;
* user impact;
* risk;
* compliance;
* dependencies;
* time sensitivity.

Priority must not be inferred solely from implementation difficulty.

---

## 12. Outcome Status

Recommended lifecycle states:

* `IDENTIFIED`
* `PROPOSED`
* `UNDER_REVIEW`
* `ACCEPTED`
* `IN_PROGRESS`
* `ACHIEVED`
* `PARTIALLY_ACHIEVED`
* `NOT_ACHIEVED`
* `DEFERRED`
* `SUPERSEDED`
* `REJECTED`

### Status Semantics

`IDENTIFIED`
The potential outcome has been recognized but not yet evaluated.

`PROPOSED`
The outcome has been formulated and is awaiting review.

`UNDER_REVIEW`
Its relevance, feasibility, or interpretation is being evaluated.

`ACCEPTED`
The outcome has been explicitly accepted as a product objective.

`IN_PROGRESS`
Relevant product capabilities or changes are being implemented or delivered.

`ACHIEVED`
Evidence indicates that the intended outcome has been reached.

`PARTIALLY_ACHIEVED`
Evidence indicates that only part of the expected outcome has been reached.

`NOT_ACHIEVED`
Available evidence indicates that the intended outcome was not reached.

`DEFERRED`
The outcome remains relevant but is intentionally postponed.

`SUPERSEDED`
The outcome has been replaced by another outcome.

`REJECTED`
The outcome has been explicitly rejected.

---

## 13. Success Criteria

Where possible, each important outcome should define how success will be evaluated.

Success criteria may include:

* observable behavior;
* user feedback;
* business indicators;
* operational measurements;
* quality attribute measurements;
* acceptance criteria;
* domain validation;
* compliance evidence.

Avoid inventing numerical targets.

If a target value has not been defined, record the success criterion qualitatively and identify the missing decision or unknown.

---

## 14. Outcome Measures

An outcome may have one or more associated measures.

| Outcome    | Measure     | Current Value | Target     | Measurement Method | Status     |
| ---------- | ----------- | ------------- | ---------- | ------------------ | ---------- |
| `<OUT-ID>` | `<MEASURE>` | `<VALUE>`     | `<TARGET>` | `<METHOD>`         | `<STATUS>` |

A measure is evidence used to evaluate an outcome.

A measure does not automatically become a product requirement.

---

## 15. Outcome Evidence

Evidence may include:

* stakeholder confirmation;
* user research;
* product analytics;
* operational data;
* domain expert validation;
* acceptance testing;
* production measurements;
* compliance evidence;
* controlled experiments.

| Outcome    | Evidence     | Source     | Confidence        |
| ---------- | ------------ | ---------- | ----------------- |
| `<OUT-ID>` | `<EVIDENCE>` | `<SOURCE>` | `HIGH/MEDIUM/LOW` |

The agent must distinguish expected outcomes from demonstrated outcomes.

---

## 16. Outcome Dependencies

Outcomes may depend on other outcomes, capabilities, or external conditions.

| Outcome     | Dependency     | Dependency Type | Impact     |
| ----------- | -------------- | --------------- | ---------- |
| `<OUT-001>` | `<DEPENDENCY>` | `<TYPE>`        | `<IMPACT>` |

Examples:

* another product;
* external system;
* business process;
* regulatory approval;
* user adoption;
* data availability;
* domain capability.

An outcome dependency must not automatically expand product scope.

---

## 17. Outcome Risks

Identify factors that may prevent achievement.

| Outcome    | Risk     | Likelihood        | Impact                     | Mitigation     |
| ---------- | -------- | ----------------- | -------------------------- | -------------- |
| `<OUT-ID>` | `<RISK>` | `LOW/MEDIUM/HIGH` | `LOW/MEDIUM/HIGH/CRITICAL` | `<MITIGATION>` |

Risks should remain separate from assumptions and unknowns.

An unresolved assumption may create an outcome risk, but the two concepts should not be merged.

---

## 18. Outcome Assumptions

Outcomes may depend on assumptions about:

* user behavior;
* adoption;
* business processes;
* available data;
* external dependencies;
* organizational behavior;
* domain conditions.

| Assumption     | Affected Outcome | Confidence        | Validation |
| -------------- | ---------------- | ----------------- | ---------- |
| `<ASSUMPTION>` | `<OUT-ID>`       | `HIGH/MEDIUM/LOW` | `<METHOD>` |

Consequential assumptions should be validated before making expensive or difficult-to-reverse commitments.

---

## 19. Outcome Unknowns

Identify unresolved information that could materially change the expected outcome.

| Unknown     | Affected Outcome | Importance                 | Blocking Level | Resolution Method |
| ----------- | ---------------- | -------------------------- | -------------- | ----------------- |
| `<UNKNOWN>` | `<OUT-ID>`       | `LOW/MEDIUM/HIGH/CRITICAL` | `<LEVEL>`      | `<METHOD>`        |

Examples:

* whether users actually experience the stated problem;
* whether the desired behavior produces the expected benefit;
* whether another dependency is sufficient;
* whether an outcome conflicts with another stakeholder objective.

---

## 20. Outcome Conflicts

Outcomes may conflict.

Examples:

* faster processing vs stronger manual review;
* lower cost vs higher service quality;
* broader access vs stricter controls;
* shorter delivery time vs greater flexibility;
* simplicity vs advanced functionality.

| Outcome A   | Outcome B   | Conflict     | Severity                            | Resolution     |
| ----------- | ----------- | ------------ | ----------------------------------- | -------------- |
| `<OUT-001>` | `<OUT-002>` | `<CONFLICT>` | `INFO/WARNING/SIGNIFICANT/BLOCKING` | `<RESOLUTION>` |

Conflicting outcomes must not be silently optimized toward one side.

Where a trade-off is consequential, it should result in an explicit product or architecture decision as appropriate.

---

## 21. Outcome Relationships

Useful relationships include:

* `DERIVES_FROM`
* `SUPPORTS`
* `CONTRIBUTES_TO`
* `DEPENDS_ON`
* `CONFLICTS_WITH`
* `REFINES`
* `MEASURES`
* `VERIFIES`
* `SUPERSEDES`
* `INVALIDATES`

Use relationships only when supported by evidence.

---

## 22. Outcome to Requirement Traceability

Requirements should explain what must be true or what capability must exist to support an accepted outcome.

| Outcome    | Requirement | Relationship | Rationale     |
| ---------- | ----------- | ------------ | ------------- |
| `<OUT-ID>` | `<REQ-ID>`  | `SUPPORTS`   | `<RATIONALE>` |

A single outcome may have multiple requirements.

A requirement may support multiple outcomes.

The relationship should be explicit when it materially affects prioritization or impact analysis.

---

## 23. Outcome to Capability Traceability

| Outcome    | Capability     | Contribution     |
| ---------- | -------------- | ---------------- |
| `<OUT-ID>` | `<CAPABILITY>` | `<CONTRIBUTION>` |

This relationship helps prevent feature-driven design.

The question should be:

> "Which capabilities contribute to the outcome?"

rather than:

> "Which features can we build?"

---

## 24. Outcome to Domain Traceability

Later in Domain Discovery, outcomes may be connected to domain capabilities.

| Outcome    | Domain Capability     | Contribution     |
| ---------- | --------------------- | ---------------- |
| `<OUT-ID>` | `<DOMAIN-CAPABILITY>` | `<CONTRIBUTION>` |

This relationship should be established only when domain analysis provides sufficient evidence.

Do not force product outcomes into domain concepts prematurely.

---

## 25. Outcome to Architecture Traceability

During Architecture, relevant outcomes may be traced to architecture elements when architectural characteristics materially influence their achievement.

| Outcome    | Architecture Element | Influence     |
| ---------- | -------------------- | ------------- |
| `<OUT-ID>` | `<ARCH-ELEMENT>`     | `<INFLUENCE>` |

Architecture should support product outcomes rather than becoming an independent objective.

---

## 26. Existing System Outcomes

For existing systems, distinguish between:

### Documented Outcomes

What historical documentation claims the system was intended to achieve.

### Observed Outcomes

What current evidence suggests the system actually achieves.

### Target Outcomes

What the evolution or replacement effort intends to achieve.

| Outcome     | Documented | Observed  | Target    | Gap     |
| ----------- | ---------- | --------- | --------- | ------- |
| `<OUTCOME>` | `<STATE>`  | `<STATE>` | `<STATE>` | `<GAP>` |

Observed behavior should not automatically be interpreted as intended product value.

---

## 27. System Evolution Outcomes

For system evolution, identify:

* outcomes preserved;
* outcomes improved;
* outcomes newly introduced;
* outcomes intentionally removed;
* outcomes potentially degraded;
* outcomes requiring migration.

| Outcome     | Current State | Target State | Change Type                        |
| ----------- | ------------- | ------------ | ---------------------------------- |
| `<OUTCOME>` | `<CURRENT>`   | `<TARGET>`   | `<PRESERVED/IMPROVED/NEW/REMOVED>` |

This helps prevent modernization efforts from accidentally removing valuable existing behavior.

---

## 28. Outcome Change Management

Outcome changes may be triggered by:

* changed product strategy;
* stakeholder decisions;
* new evidence;
* user research;
* changed business conditions;
* regulatory changes;
* invalidated assumptions;
* architecture discoveries;
* changed scope.

### Change Procedure

1. Identify the proposed outcome change.
2. Determine affected stakeholders and actors.
3. Analyze affected requirements.
4. Analyze affected scope.
5. Identify domain consequences.
6. Identify architecture consequences where applicable.
7. Identify affected decisions and specifications.
8. Update traceability.
9. Obtain required authorization.
10. Re-evaluate affected lifecycle gates.

Outcome changes must not be silently propagated.

---

## 29. Outcome Impact Analysis

For consequential outcome changes, evaluate:

* product strategy;
* product scope;
* requirements;
* business rules;
* actors;
* domain capabilities;
* architecture;
* contracts;
* data;
* security;
* quality attributes;
* infrastructure;
* verification;
* release readiness.

The depth of analysis must be proportional to the consequence of the change.

---

## 30. Outcome Review Checklist

### Outcome Quality

* [ ] The outcome describes a meaningful result or change.
* [ ] The beneficiary is identified.
* [ ] The problem or opportunity is understood.
* [ ] The expected change is clear.
* [ ] The outcome is independent of implementation technology.

### Evidence

* [ ] The outcome has an identified source or rationale.
* [ ] Assumptions are explicit.
* [ ] Important unknowns are identified.
* [ ] Expected outcomes are distinguished from demonstrated outcomes.

### Alignment

* [ ] Important outcomes align with product vision.
* [ ] Requirements supporting important outcomes are traceable.
* [ ] Capabilities contributing to outcomes are identifiable.
* [ ] Scope supports the accepted outcomes.
* [ ] No significant conflict remains hidden.

### Evaluation

* [ ] Success criteria exist where meaningful.
* [ ] Measurement methods are identified when applicable.
* [ ] Numerical targets are not invented.
* [ ] Outcome achievement can be evaluated with available or planned evidence.

### Existing Systems

* [ ] Documented, observed, and target outcomes are distinguished when relevant.
* [ ] Evolution work preserves valuable existing outcomes unless intentionally changed.

---

## 31. Gate Contribution

Product Outcomes contribute to the **Product Discovery Gate**.

The outcome model is sufficiently mature when:

1. major intended outcomes are identified;
2. outcomes are distinguishable from features and outputs;
3. significant beneficiaries are understood;
4. important outcomes have evidence or explicit rationale;
5. major supporting requirements are traceable;
6. material outcome conflicts are identified;
7. important assumptions and unknowns are visible;
8. success can be evaluated at an appropriate level;
9. outcomes are consistent with product scope;
10. sufficient understanding exists to continue into Domain Discovery.

A completed outcome document does not imply that all outcomes have been achieved.

The gate evaluates whether product intent is sufficiently clear to guide subsequent analysis.

---

## 32. Compact Outcome Register

| ID        | Outcome     | Beneficiary     | Category   | Priority | Status     | Evidence   |
| --------- | ----------- | --------------- | ---------- | -------- | ---------- | ---------- |
| `OUT-001` | `<OUTCOME>` | `<ACTOR>`       | `USER`     | `HIGH`   | `ACCEPTED` | `<SOURCE>` |
| `OUT-002` | `<OUTCOME>` | `<STAKEHOLDER>` | `BUSINESS` | `MEDIUM` | `PROPOSED` | `<SOURCE>` |

---

## 33. Agent Instructions

When working with product outcomes, the agent must:

1. Distinguish outcomes from features and outputs.
2. Describe meaningful changes rather than implementation mechanisms.
3. Identify the beneficiary of significant outcomes.
4. Connect outcomes to the underlying problem or opportunity.
5. Avoid inventing quantitative targets.
6. Distinguish expected outcomes from measured outcomes.
7. Trace significant outcomes to requirements and capabilities.
8. Identify conflicting outcomes explicitly.
9. Treat stakeholder interests as evidence for outcomes, not automatically as accepted outcomes.
10. Preserve the distinction between outcome, requirement, business rule, constraint, and decision.
11. Distinguish documented, observed, and target outcomes in existing systems.
12. Analyze outcome changes before propagating them to downstream artifacts.
13. Avoid optimizing technical architecture for outcomes that have not been validated or accepted.
14. Preserve historical outcomes during system evolution unless their removal is intentional.
15. Record uncertainty rather than fabricating evidence.
16. Ask for clarification when an outcome ambiguity could materially affect scope, domain, architecture, security, data, or delivery.

### Safe Progression Rule

Before progressing from Product Discovery, the agent should be able to answer:

> **"Do I understand what meaningful results the product is expected to achieve, for whom, why they matter, and how those results can eventually be evaluated?"**

If not, the agent should continue discovery or explicitly record the unresolved uncertainty.

---

## 34. Anti-Patterns

### Feature as Outcome

Treating the existence of a feature as proof of product success.

### Technology as Outcome

Defining outcomes such as "use a modern architecture" without connecting them to a meaningful product or operational objective.

### Metric as Outcome

Treating a number as the outcome without describing the underlying change it represents.

### Unmeasured Claim

Presenting an expected benefit as an achieved result without evidence.

### Outcome Inflation

Defining dozens of outcomes that do not materially influence product decisions.

### Stakeholder Wish = Outcome

Treating every stakeholder preference as an accepted product outcome.

### Outcome Without Beneficiary

Defining a result without identifying who benefits or is affected.

### Outcome Without Problem

Defining an outcome without understanding the condition it is intended to change.

### Implementation-Driven Outcome

Changing product outcomes merely because a particular implementation is convenient.

### Historical Outcome Assumption

Assuming that the original intended outcome remains valid without considering current evidence and product context.

### Future Outcome Overengineering

Introducing current complexity solely to support hypothetical future outcomes.

### Documentation Theater

Creating elaborate outcome catalogs without using them to guide prioritization or decisions.

---

## 35. Final Principle

**Product outcomes describe why the product matters and what meaningful change it is expected to create.**

They provide the bridge between product intent and the requirements, domain capabilities, architecture, and implementation that follow.

The objective is not to guarantee that every outcome will be achieved before implementation.

The objective is to ensure that the system is being designed and evolved toward explicit, meaningful, and traceable results rather than toward an arbitrary collection of features or technologies.
