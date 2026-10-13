# Product Decisions

## 1. Document Metadata

| Field             | Description                                                                                                  |
| ----------------- | ------------------------------------------------------------------------------------------------------------ |
| Document ID       | Unique identifier for the product decision artifact                                                          |
| Version           | Current document version                                                                                     |
| Status            | `DRAFT`, `UNDER_REVIEW`, `ACCEPTED`, `SUPERSEDED`                                                            |
| Created           | Creation date                                                                                                |
| Updated           | Last update date                                                                                             |
| Scope             | Product, capability, release, increment, or change scope                                                     |
| Owner             | Responsible role or decision authority                                                                       |
| Reviewers         | Relevant reviewers or stakeholders                                                                           |
| Related Artifacts | Outcomes, requirements, scope, use cases, risks, unknowns, constraints, dependencies, architecture decisions |

| Lifecycle Phase | Product Discovery |
---

# 2. Purpose

This document records consequential decisions made during Product Discovery.

Its purpose is to make product-level choices explicit, traceable, reviewable, and distinguishable from recommendations, assumptions, requirements, and architecture decisions.

Product decisions establish direction for the product or its behavior without prematurely determining technical implementation.

The decision model should answer:

> What was decided, why was it decided, what alternatives were considered, what evidence supported the decision, and what consequences does it create?

---

# 3. Core Principle

A decision is an explicit selection among available alternatives, or an explicit determination that a particular direction will be followed.

A decision is not:

* a recommendation;
* an assumption;
* a requirement;
* a constraint;
* a priority;
* a risk;
* a dependency;
* an implementation detail.

The agent must never silently convert a recommendation into a decision.

---

# 4. Product Decision vs Architecture Decision

Product decisions determine product direction, behavior, scope, outcomes, or policy.

Architecture decisions determine significant technical structure or architectural constraints.

Example:

```text id="7x3m2q"
Product Decision:
Users may modify a generated weekly menu before confirming it.

Architecture Decision:
The menu-generation workflow will use asynchronous processing.
```

The first belongs to Product Discovery.

The second belongs to Architecture Decision Governance.

A product decision may create an architectural consequence without itself becoming an architecture decision.

---

# 5. Product Decision vs Requirement

A requirement describes what the product must achieve.

A decision selects a direction for achieving or defining that behavior.

Example:

```text id="q8v4nz"
Requirement:
Users must be able to review a generated menu before confirmation.

Decision:
The generated menu will remain editable until the user confirms it.
```

The requirement and decision should remain separately traceable.

---

# 6. Product Decision vs Constraint

A constraint limits the available solution space.

A decision selects an option within that space.

Example:

```text id="p6m2xw"
Constraint:
The product must comply with an existing regulatory policy.

Decision:
The product will require explicit user consent before processing the affected information.
```

A decision must not be used to disguise an externally imposed constraint.

---

# 7. Product Decision vs Assumption

An assumption is temporarily accepted for analysis.

A decision is intentionally selected.

Example:

```text id="r4k8cy"
Assumption:
Users are expected to review generated content before confirmation.

Decision:
The product will require user confirmation before a generated plan becomes active.
```

If an assumption becomes sufficiently validated and materially affects product direction, it may lead to a formal decision.

---

# 8. Product Decision vs Recommendation

A recommendation proposes an option.

A decision selects an option.

```text id="m7f3qa"
Recommendation:
Allow users to modify generated results before confirmation.

Decision:
Users will be able to modify generated results before confirmation.
```

The agent must preserve this distinction.

---

# 9. Decision Categories

Recommended product decision categories:

| Category         | Description                                              |
| ---------------- | -------------------------------------------------------- |
| `VISION`         | Product direction or intended future state               |
| `OUTCOME`        | Selection or prioritization of intended outcomes         |
| `SCOPE`          | Inclusion, exclusion, or deferral of product scope       |
| `USER_BEHAVIOR`  | Product behavior from the actor perspective              |
| `ACTOR`          | Responsibilities, participation, or product-facing roles |
| `DOMAIN_POLICY`  | Product-level policy or business direction               |
| `BUSINESS_RULE`  | Selection or clarification of business behavior          |
| `REQUIREMENT`    | Resolution of meaningful requirement alternatives        |
| `PRIORITIZATION` | Consequential ordering or sequencing                     |
| `RELEASE`        | Release or increment direction                           |
| `COMPLIANCE`     | Product-level compliance direction                       |
| `DATA_POLICY`    | Product-level data usage or ownership policy             |
| `INTEGRATION`    | Product-level integration direction                      |
| `MIGRATION`      | Product transition direction                             |
| `EXPERIMENT`     | Controlled temporary product direction                   |
| `OTHER`          | Other consequential product decision                     |

Multiple categories may apply.

---

# 10. Decision Significance

Product decisions should be classified by consequence:

| Significance  | Meaning                                                                                |
| ------------- | -------------------------------------------------------------------------------------- |
| `TRIVIAL`     | Minimal consequence and easily reversible                                              |
| `LOCAL`       | Limited impact within a product area                                                   |
| `SIGNIFICANT` | Material effect on users, scope, requirements, domain behavior, or delivery            |
| `STRATEGIC`   | Broad or long-term effect on product direction, business behavior, or system evolution |

Formal decision governance is particularly important for `SIGNIFICANT` and `STRATEGIC` decisions.

---

# 11. Decision Status

Recommended states:

```text id="x5q8km"
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

Meaning:

* `IDENTIFIED` — decision need has been recognized.
* `PROPOSED` — an option has been recommended.
* `UNDER_REVIEW` — decision is being evaluated.
* `ACCEPTED` — decision has been explicitly approved.
* `REJECTED` — proposed direction was explicitly rejected.
* `ACTIVE` — accepted decision currently governs product direction.
* `SUPERSEDED` — replaced by a newer decision.
* `DEPRECATED` — no longer recommended but retained for historical context.
* `REVOKED` — previously accepted decision was explicitly withdrawn.

---

# 12. Decision Lifecycle

The typical lifecycle is:

```text id="d2n7pv"
IDENTIFIED
    ↓
PROPOSED
    ↓
UNDER_REVIEW
    ↓
ACCEPTED / REJECTED
    ↓
ACTIVE
    ↓
SUPERSEDED / DEPRECATED / REVOKED
```

Not every decision requires every state.

A simple decision may move directly from `IDENTIFIED` to `ACCEPTED` when no meaningful alternatives or uncertainty exist.

---

# 13. Decision Record

Each significant product decision should contain:

| Field               | Description                            |
| ------------------- | -------------------------------------- |
| ID                  | Unique decision identifier             |
| Title               | Concise decision name                  |
| Category            | Decision category                      |
| Status              | Current lifecycle status               |
| Significance        | Decision consequence level             |
| Date                | Decision date                          |
| Decision Authority  | Person or role authorized to decide    |
| Context             | Relevant product context               |
| Problem             | Problem requiring a decision           |
| Desired Outcome     | Outcome the decision supports          |
| Constraints         | Relevant limitations                   |
| Requirements        | Relevant requirements                  |
| Risks               | Relevant risks                         |
| Unknowns            | Relevant unresolved questions          |
| Dependencies        | Relevant dependencies                  |
| Options             | Alternatives considered                |
| Decision            | Selected direction                     |
| Rationale           | Why the option was selected            |
| Consequences        | Expected positive and negative effects |
| Reversibility       | Ease of changing the decision          |
| Evidence            | Supporting evidence                    |
| Affected Scope      | Scope affected                         |
| Affected Actors     | Actors affected                        |
| Affected Use Cases  | Use cases affected                     |
| Affected Domain     | Domain concepts or rules affected      |
| Architecture Impact | Potential architectural consequences   |
| Contract Impact     | Potential contract consequences        |
| Related Decisions   | Related decisions                      |
| Supersedes          | Previous decision replaced             |
| Superseded By       | Later decision replacing this one      |
| Traceability        | Related artifacts                      |
| Review Date         | When reconsideration may be required   |

---

# 14. Decision Context

A decision must contain enough context for a future reader to understand why it existed.

The context should explain:

* what changed;
* what problem exists;
* why a decision is necessary;
* what constraints apply;
* what outcomes matter;
* what uncertainty exists.

Avoid recording decisions without context.

Bad:

```text id="f7w2xm"
Decision:
Use Option A.
```

Better:

```text id="c9m5pq"
Decision:
Use Option A because it satisfies the accepted product outcome,
fits the current scope, and avoids the known constraint identified
during Product Discovery.
```

---

# 15. Problem Statement

The problem should describe what requires resolution.

A good problem statement avoids embedding the solution.

Prefer:

> The product must determine how users review generated results before confirmation.

Avoid:

> The product needs a review screen.

The second already assumes a specific implementation or UX solution.

---

# 16. Decision Alternatives

Significant decisions should identify meaningful alternatives when they exist.

Example:

```text id="k4x8ns"
Option A:
User confirmation is mandatory.

Option B:
Confirmation is optional.

Option C:
Confirmation is required only for selected scenarios.
```

The agent should not manufacture alternatives merely to satisfy a template.

If only one viable option exists, record why alternatives were unavailable or invalid.

---

# 17. Option Evaluation

Options may be evaluated against:

* product outcomes;
* user impact;
* business value;
* domain correctness;
* requirements;
* constraints;
* risks;
* dependencies;
* reversibility;
* operational implications;
* future evolution;
* cost or complexity when evidence exists.

Evaluation should remain proportional to decision significance.

---

# 18. Decision Rationale

The rationale should explain why the selected option was preferred.

A strong rationale identifies:

1. What objective matters.
2. What constraints apply.
3. What evidence exists.
4. What trade-offs were considered.
5. Why the selected option is preferable.

Rationale should not simply repeat the decision.

---

# 19. Consequences

Every significant decision should identify consequences.

Consider:

* positive consequences;
* negative consequences;
* new dependencies;
* new risks;
* affected scope;
* affected requirements;
* domain implications;
* architecture implications;
* contract implications;
* operational implications;
* migration implications;
* future change implications.

Consequences are part of the decision, not optional commentary.

---

# 20. Reversibility

Decision reversibility should be classified as:

```text id="p6x3mb"
REVERSIBLE
PARTIALLY_REVERSIBLE
DIFFICULT_TO_REVERSE
IRREVERSIBLE
```

The more difficult a decision is to reverse, the stronger the evidence and review should generally be.

The agent should not treat reversibility as an absolute measure.

A technically reversible decision may still be expensive to reverse operationally or organizationally.

---

# 21. Decision Evidence

Evidence may include:

* explicit stakeholder direction;
* accepted product requirements;
* user research;
* domain analysis;
* current system behavior;
* business policy;
* regulatory requirements;
* operational data;
* experiments;
* prototypes;
* existing contracts;
* previous decisions.

Evidence must be distinguishable from assumptions.

The agent must not present inference as explicit stakeholder intent.

---

# 22. Decision Authority

Every consequential decision should identify who or what has authority to accept it.

Possible authorities include:

* product owner;
* business owner;
* domain authority;
* system owner;
* governance body;
* designated project authority.

The agent must not invent authority.

If authority is unknown:

```text id="w8q4zc"
Decision Authority: UNKNOWN
```

and the missing authority may become a blocking unknown.

---

# 23. Decision Boundary for AI Agents

An AI agent may:

* identify decision needs;
* analyze alternatives;
* identify consequences;
* recommend an option;
* draft a decision record;
* identify conflicts;
* identify missing authority;
* detect potential impact.

The agent must not silently:

* claim stakeholder approval;
* mark a consequential decision as accepted without authority;
* convert a recommendation into a decision;
* invent organizational policy;
* invent business intent.

Unless project governance explicitly grants such authority, consequential decisions require appropriate human confirmation.

---

# 24. Scope Decisions

Scope decisions determine whether something is:

```text id="n2c8vq"
IN_SCOPE
OUT_OF_SCOPE
DEFERRED
```

A scope decision should explain:

* why the boundary exists;
* what outcome it supports;
* what consequence it creates;
* what dependencies are affected;
* whether the item may be reconsidered later.

Scope changes should update the relevant scope artifact rather than remaining only in a decision log.

---

# 25. User Behavior Decisions

Product behavior decisions should describe the intended actor experience without prematurely defining implementation.

Example:

```text id="m7p4xd"
Decision:
Users may modify generated content before confirming it.
```

Avoid:

```text id="v8q2ka"
Decision:
Create an Angular modal with a specific component hierarchy.
```

The latter belongs to implementation or architecture unless explicitly required by context.

---

# 26. Domain Policy Decisions

Some product decisions define policies that later influence domain modeling.

Examples:

* eligibility policy;
* approval policy;
* modification policy;
* cancellation policy;
* retention policy;
* participation policy.

Such decisions should be traceable to business rules once the domain is formally analyzed.

---

# 27. Prioritization Decisions

Prioritization may become a decision when competing priorities require an explicit choice.

Example:

```text id="b4m9ws"
Decision:
The core planning workflow takes precedence over secondary customization
for the first release.
```

The decision should remain linked to:

* outcomes;
* scope;
* requirements;
* release objectives;
* rejected or deferred alternatives.

---

# 28. Release Decisions

Release decisions may establish:

* release scope;
* required outcomes;
* deferred capabilities;
* readiness criteria;
* migration sequencing;
* risk acceptance.

A release decision must not override unresolved safety, security, compliance, or architectural blockers without explicit authority.

---

# 29. Experiment Decisions

Experiments may intentionally introduce temporary decisions.

A temporary decision should specify:

* experiment objective;
* scope;
* duration;
* success evidence;
* conditions for continuation;
* conditions for reversal;
* decision date;
* owner.

Temporary decisions should not silently become permanent product behavior.

---

# 30. Existing Systems

For existing systems, decisions should distinguish:

```text id="z5n8mq"
Historical Decision
Current Decision
Target-State Decision
```

A historical decision should not automatically govern the target system.

If the current system behavior contradicts historical documentation, the discrepancy should be recorded and investigated.

The agent must preserve historical decisions when they explain current behavior.

---

# 31. System Evolution

For system evolution, decisions should focus on the change boundary.

The decision record should identify:

* current behavior;
* desired change;
* alternatives;
* affected scope;
* affected actors;
* affected requirements;
* affected domain behavior;
* affected dependencies;
* migration consequences;
* architecture implications.

Only decisions materially relevant to the change should be included.

---

# 32. Decision Conflicts

A new decision may conflict with an existing decision.

The agent should identify:

1. Which decisions conflict.
2. Whether the conflict is real or contextual.
3. Which decision has higher authority.
4. Whether one decision supersedes another.
5. What artifacts are affected.
6. Whether implementation or contracts must change.

A conflict must not be silently resolved by rewriting historical decisions.

---

# 33. Supersession

When a decision replaces another:

```text id="q3f7vx"
Decision A
    ↓ superseded by
Decision B
```

The new decision should identify:

* previous decision;
* reason for change;
* new evidence;
* affected consequences;
* migration implications;
* affected artifacts.

The old decision should remain historically available.

---

# 34. Decision Reversal

A previously accepted decision may be reversed.

A reversal should identify:

* original decision;
* reason for reversal;
* new evidence;
* consequences of reversal;
* affected artifacts;
* migration or rollback requirements;
* authority approving the reversal.

Reversal should not be represented as if the original decision never existed.

---

# 35. Decision Dependencies

Some decisions depend on others.

Example:

```text id="h5k2mn"
Product Scope Decision
        ↓
Domain Modeling Decision
        ↓
Architecture Decision
```

The dependency should be explicit.

An unresolved upstream decision may block downstream design.

The agent should avoid making downstream decisions that depend on unresolved product choices unless the decision is explicitly provisional.

---

# 36. Decision Impact

A consequential product decision should be evaluated for impact on:

```text id="s9q4cx"
Outcomes
Requirements
Scope
Actors
Use Cases
Business Rules
Dependencies
Risks
Domain Model
Architecture
Contracts
Data
Security
Infrastructure
Verification
```

Not every decision affects every dimension.

Only material impacts should be recorded.

---

# 37. Decision Traceability

Product decisions should participate in the lifecycle traceability graph.

Common relationships include:

```text id="c8m3vp"
DERIVES_FROM
RESPONDS_TO
SUPPORTS
SELECTS
CONSTRAINS
INFLUENCES
AFFECTS
JUSTIFIES
DEPENDS_ON
SUPERSEDES
INVALIDATES
MITIGATES
```

Example:

```text id="f6x2qa"
Product Outcome
      ↓
Requirement
      ↓
Product Decision
      ↓
Business Rule
      ↓
Domain Capability
```

When architecture consequences emerge:

```text id="w7p4kn"
Product Decision
      ↓
Influences
Architecture Decision
```

The product decision does not automatically become the architecture decision.

---

# 38. Decision Register

A compact register may use:

| ID      | Category      | Decision | Significance | Status       | Authority | Reversibility        | Scope        |
| ------- | ------------- | -------- | ------------ | ------------ | --------- | -------------------- | ------------ |
| DEC-001 | SCOPE         | —        | SIGNIFICANT  | ACTIVE       | —         | PARTIALLY_REVERSIBLE | Release A    |
| DEC-002 | USER_BEHAVIOR | —        | LOCAL        | ACCEPTED     | —         | REVERSIBLE           | Capability B |
| DEC-003 | DOMAIN_POLICY | —        | STRATEGIC    | UNDER_REVIEW | —         | DIFFICULT_TO_REVERSE | Product      |

The register is a navigation and governance aid.

The complete decision rationale belongs in the detailed record.

---

# 39. Decision Review Procedure

When reviewing a product decision, the agent should:

1. Verify the decision is still active.
2. Verify its authority.
3. Review new evidence.
4. Review affected outcomes.
5. Review requirements and scope.
6. Review related risks and unknowns.
7. Review dependencies.
8. Review downstream architecture consequences.
9. Detect conflicting decisions.
10. Determine whether the decision remains valid.
11. Supersede or revoke it when necessary.
12. Update traceability.

Decisions should be revisited when their assumptions or context materially change.

---

# 40. Decision Change Impact

A decision change may require updates to:

* product context;
* outcomes;
* requirements;
* scope;
* actors;
* use cases;
* business rules;
* dependencies;
* risks;
* domain model;
* architecture;
* contracts;
* specifications;
* implementation;
* verification.

The agent should follow traceability relationships rather than relying on document-name guessing.

---

# 41. Review Checklist

Before accepting a significant product decision, verify:

### Context

* [ ] The problem is clearly described.
* [ ] Relevant product context is available.
* [ ] Desired outcome is explicit.
* [ ] Relevant constraints are identified.

### Alternatives

* [ ] Meaningful alternatives were considered where applicable.
* [ ] Alternatives were not artificially invented.
* [ ] Trade-offs are understood.

### Evidence

* [ ] Supporting evidence is identified.
* [ ] Assumptions are distinguished from facts.
* [ ] Unknowns affecting the decision are explicit.

### Governance

* [ ] Decision authority is identified.
* [ ] Decision status is explicit.
* [ ] Consequential decisions have appropriate approval.
* [ ] Conflicts with existing decisions are addressed.

### Consequences

* [ ] Positive consequences are understood.
* [ ] Negative consequences are understood.
* [ ] Risks are updated.
* [ ] Dependencies are updated.
* [ ] Scope impact is identified.
* [ ] Architecture impact is identified when relevant.

### Traceability

* [ ] The decision traces to its originating problem or outcome.
* [ ] Affected artifacts are identified.
* [ ] Supersession relationships are explicit.
* [ ] Historical decisions are preserved.

---

# 42. Gate Contribution

Product decisions contribute to lifecycle gates by demonstrating that:

* consequential product choices are explicit;
* product direction is not being inferred from implementation;
* significant trade-offs have been considered;
* scope decisions are explicit;
* unresolved decision authority is visible;
* downstream consequences are understood;
* decisions are traceable to outcomes and requirements;
* decisions that influence architecture can be handed off explicitly.

A decision artifact is not complete merely because decisions have been listed.

The relevant question is:

> Are the product choices that materially constrain or guide subsequent domain and architecture work explicit, justified, authorized, and traceable?

---

# 43. Agent Instructions

When applying this artifact, the agent must:

1. Determine whether a situation actually requires a decision.
2. Identify the problem without embedding the solution.
3. Identify the desired outcome.
4. Identify constraints and relevant requirements.
5. Identify meaningful alternatives.
6. Gather supporting evidence.
7. Separate facts, assumptions, recommendations, and decisions.
8. Evaluate consequences.
9. Evaluate reversibility.
10. Identify decision authority.
11. Avoid claiming approval without evidence.
12. Record conflicts with existing decisions.
13. Preserve historical decisions.
14. Identify downstream product and architectural consequences.
15. Create or update traceability relationships.
16. Escalate decisions outside the agent's authority.
17. Mark provisional directions as provisional.
18. Revisit decisions when material assumptions or context change.
19. Scale decision governance according to significance and consequence.
20. Avoid introducing technical implementation choices during Product Discovery unless explicitly required by a known constraint.

The agent should prefer:

```text id="y8n4vc"
Problem
   ↓
Context
   ↓
Evidence
   ↓
Alternatives
   ↓
Trade-offs
   ↓
Decision
   ↓
Consequences
   ↓
Traceability
```

over:

```text id="k2q7ms"
Request
   ↓
Immediate solution
```

---

# 44. Anti-Patterns

## 44.1 Recommendation Presented as Decision

> "We recommend X, therefore X is decided."

A recommendation is not authorization.

---

## 44.2 Hidden Decision

Allowing implementation details or documentation defaults to silently establish product direction.

---

## 44.3 Solution-First Problem Statement

Defining the solution before defining the problem restricts meaningful alternatives prematurely.

---

## 44.4 Architecture Leakage

Making technical decisions during Product Discovery without a product, domain, or explicit constraint requiring them.

---

## 44.5 Invented Authority

The agent must not invent the person or role authorized to approve a decision.

---

## 44.6 Decision Without Alternatives

For consequential choices, selecting an option without considering meaningful alternatives can hide important trade-offs.

This does not mean every trivial decision requires a formal alternatives analysis.

---

## 44.7 Decision Without Consequences

Recording only the selected option hides the impact of the decision.

---

## 44.8 Silent Decision Reversal

Changing a previous decision without preserving the original decision history destroys traceability.

---

## 44.9 Historical Decision Rewriting

Old decisions should not be rewritten to match the current state.

They should be superseded or revoked explicitly.

---

## 44.10 Decision by Popularity

The most frequently requested option is not automatically the correct decision.

---

## 44.11 Decision by Technical Preference

A developer's preferred technology or implementation approach does not automatically constitute product direction.

---

## 44.12 Decision Register Theater

Recording trivial choices as formal strategic decisions creates unnecessary ceremony.

---

# 45. Safe Progression Question

Before progressing beyond Product Decision analysis, the agent should be able to answer:

> **Are the product-level choices that materially affect scope, outcomes, requirements, actors, business behavior, domain understanding, or subsequent architecture explicit, justified, appropriately authorized, and traceable?**

If the answer is no, the agent should identify the missing decision, evidence, authority, or context rather than silently selecting an option.

---

# 46. Final Principle

> **Product decisions make consequential product choices explicit without prematurely collapsing them into technical implementation.**

A strong product decision model preserves the distinction between:

```text id="v4m8qx"
What the product should achieve
        ↓
What product direction is selected
        ↓
What domain behavior follows
        ↓
What architecture may be required
```

This separation allows Product Discovery to guide architecture without silently becoming architecture.

