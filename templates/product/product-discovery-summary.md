# Product Discovery Summary

## 1. Document Metadata

| Field             | Description                                                 |
| ----------------- | ----------------------------------------------------------- |
| Document ID       | Unique identifier for the Product Discovery summary         |
| Version           | Current document version                                    |
| Status            | `DRAFT`, `UNDER_REVIEW`, `ACCEPTED`, `SUPERSEDED`           |
| Created           | Creation date                                               |
| Updated           | Last update date                                            |
| Project           | Project or system name                                      |
| Discovery Scope   | Product, capability, release, increment, or evolution scope |
| Discovery Mode    | `GREENFIELD`, `EXISTING_SYSTEM`, `SYSTEM_EVOLUTION`         |
| Owner             | Responsible role or person                                  |
| Reviewers         | Relevant reviewers or decision authorities                  |
| Related Artifacts | Product Discovery artifacts and downstream artifacts        |

| Lifecycle Phase | Product Discovery |
---

# 2. Purpose

This document consolidates the results of Product Discovery and determines whether the project has sufficient product-level understanding to safely enter Domain Discovery / DDD.

It is a synthesis artifact, not a replacement for the underlying Product Discovery documents.

Its purpose is to answer:

> Do we understand the product problem, intended outcomes, scope, actors, requirements, business rules, priorities, dependencies, risks, unknowns, and product decisions well enough to begin domain analysis?

---

# 3. Core Principle

Product Discovery should establish enough shared understanding to prevent downstream domain and architecture work from being based on unsupported assumptions.

The goal is not:

> "Everything about the product is known."

The goal is:

> "The remaining uncertainty is understood, appropriately classified, and sufficiently controlled to proceed."

Product Discovery may therefore finish with unresolved items.

Some unresolved items may be:

* non-blocking unknowns;
* deferred decisions;
* accepted risks;
* future scope;
* unresolved implementation questions that do not affect domain understanding.

The summary must distinguish these from blockers.

---

# 4. Discovery Outcome

The overall Product Discovery outcome should be classified as:

```text id="g6p2zm"
READY
READY_WITH_RISKS
BLOCKED
INCOMPLETE
```

### `READY`

Product context is sufficiently understood to begin Domain Discovery.

### `READY_WITH_RISKS`

Product context is sufficient to proceed, but known risks or uncertainties should remain visible and monitored.

### `BLOCKED`

One or more unresolved items materially prevent safe progression.

### `INCOMPLETE`

Important Product Discovery work remains unfinished and the current evidence is insufficient for progression.

---

# 5. Discovery Scope

Record the exact scope evaluated.

Example:

```text id="n4x8cq"
Discovery Scope:
Core planning capability for the first product increment.
```

The scope should identify:

* product boundary;
* capability boundary;
* release boundary;
* change boundary;
* excluded areas.

Do not assume that the entire product has been discovered if only part of it was analyzed.

---

# 6. Product Context Summary

Summarize the product context established during discovery.

Include:

* product vision;
* problem statement;
* target users;
* important actors;
* primary outcomes;
* major product boundaries;
* relevant external systems;
* important constraints.

This section should remain concise.

The detailed evidence belongs in the referenced Product Discovery artifacts.

---

# 7. Problem Understanding

Record the currently accepted understanding of the problem.

Include:

```text id="c8m5vp"
Problem:
...

Evidence:
...

Confidence:
HIGH / MEDIUM / LOW
```

If multiple interpretations remain possible, they must be explicitly identified.

The agent must not collapse unresolved interpretations into a single statement without evidence.

---

# 8. Product Vision Summary

Record the accepted product direction.

Include:

* intended future state;
* primary product purpose;
* major value proposition;
* relevant strategic direction;
* known limitations.

Do not introduce technical implementation details unless they are explicitly part of the product context or a confirmed constraint.

---

# 9. Outcomes Summary

Summarize the accepted product outcomes.

| ID      | Outcome | Priority | Status   | Confidence |
| ------- | ------- | -------- | -------- | ---------- |
| OUT-001 | —       | HIGH     | ACCEPTED | HIGH       |
| OUT-002 | —       | MEDIUM   | PROPOSED | MEDIUM     |

The summary should identify:

* primary outcomes;
* supporting outcomes;
* deferred outcomes;
* outcomes with unresolved evidence.

Outcomes should remain distinguishable from features and implementation outputs.

---

# 10. Actor and Stakeholder Summary

Summarize relevant actors and stakeholders.

Include:

* primary actors;
* supporting actors;
* external systems;
* important stakeholders;
* responsibilities;
* authority where established;
* unresolved ownership.

Example:

```text id="w7q2xn"
Primary Actors:
- Actor A
- Actor B

External Actors:
- External System C

Unresolved Ownership:
- Data authority for X remains unknown.
```

The summary must not invent roles or responsibilities.

---

# 11. Scope Summary

Summarize the current product boundary.

### In Scope

* ...

### Out of Scope

* ...

### Deferred

* ...

Important scope decisions should reference their decision records.

---

# 12. Requirements Summary

Summarize the most consequential requirements.

Include:

* critical requirements;
* high-priority requirements;
* security requirements;
* data requirements;
* integration requirements;
* operational requirements;
* compliance requirements;
* relevant constraints.

The summary does not need to reproduce every requirement.

Its purpose is to expose the requirements that materially influence domain understanding.

---

# 13. Quality Attributes Summary

Summarize the quality attributes that may affect domain or subsequent architecture work.

Examples:

* security;
* privacy;
* availability;
* reliability;
* performance;
* scalability;
* maintainability;
* observability;
* accessibility;
* compatibility.

Record only known expectations.

Do not invent numerical targets.

---

# 14. Business Rules Summary

Summarize the business rules that are sufficiently understood to influence domain discovery.

Include:

* invariants;
* eligibility rules;
* validation rules;
* state transitions;
* calculations;
* authorization responsibilities;
* temporal rules;
* limits;
* policies.

Example:

```text id="j6p9wr"
Known Domain-Relevant Rules:
- BR-001
- BR-002
- BR-003

Potentially Ambiguous Rules:
- BR-004
```

Ambiguous rules should remain explicitly identified.

---

# 15. Use Case Summary

Summarize significant actor interactions.

| ID     | Use Case | Primary Actor | Priority | Status   |
| ------ | -------- | ------------- | -------- | -------- |
| UC-001 | —        | —             | HIGH     | ACCEPTED |
| UC-002 | —        | —             | MEDIUM   | PROPOSED |

The summary should emphasize:

* primary goals;
* important success behavior;
* important alternatives;
* important exceptions;
* dependencies between interactions.

It should not reproduce detailed technical flows.

---

# 16. Prioritization Summary

Summarize the current prioritization landscape.

Include:

* critical outcomes;
* critical requirements;
* high-priority use cases;
* critical risks;
* decision-relevant unknowns;
* blocking dependencies;
* deferred scope.

The purpose is to establish what matters most when entering domain discovery.

---

# 17. Dependency Summary

Summarize dependencies that may influence domain discovery.

Examples:

* external actors;
* external systems;
* authoritative data sources;
* business ownership;
* product decisions;
* requirements;
* temporal sequencing;
* migration dependencies.

Particular attention should be given to dependencies that may affect:

* domain boundaries;
* ownership;
* invariants;
* responsibilities;
* state transitions.

---

# 18. Risk Summary

Summarize the most significant risks.

| ID      | Risk | Exposure | Priority | Status     |
| ------- | ---- | -------- | -------- | ---------- |
| RSK-001 | —    | HIGH     | HIGH     | MITIGATING |
| RSK-002 | —    | CRITICAL | CRITICAL | ANALYZING  |

Identify risks that could:

* invalidate product understanding;
* affect domain modeling;
* affect business rules;
* affect ownership;
* affect scope;
* block progression.

---

# 19. Unknowns Summary

Summarize unresolved unknowns.

| ID      | Unknown | Importance | Blocking          | Status |
| ------- | ------- | ---------- | ----------------- | ------ |
| UNK-001 | —       | HIGH       | DECISION_RELEVANT | OPEN   |
| UNK-002 | —       | MEDIUM     | NON_BLOCKING      | OPEN   |

Particular attention should be given to unknowns involving:

* domain concepts;
* business rules;
* actor responsibilities;
* ownership;
* critical state transitions;
* external system responsibilities;
* product boundaries.

---

# 20. Constraints Summary

Summarize constraints that will influence downstream discovery.

Include:

* business constraints;
* regulatory constraints;
* organizational constraints;
* compatibility constraints;
* existing-system constraints;
* mandatory product constraints.

Constraints should remain distinguishable from architecture decisions.

---

# 21. Product Decision Summary

Summarize consequential decisions.

| ID      | Decision | Significance | Status | Authority |
| ------- | -------- | ------------ | ------ | --------- |
| DEC-001 | —        | SIGNIFICANT  | ACTIVE | —         |
| DEC-002 | —        | STRATEGIC    | ACTIVE | —         |

Identify decisions that directly influence:

* domain behavior;
* business rules;
* actor responsibilities;
* scope;
* product boundaries;
* future architecture.

---

# 22. Current State

For existing systems and system evolution, summarize the current state.

Use:

```text id="r8k3mp"
Documented State:
...

Actual State:
...

Confidence:
...
```

Where relevant, identify discrepancies:

```text id="q4n7vc"
Documented behavior:
...

Observed behavior:
...

Discrepancy:
...
```

Actual runtime behavior should take precedence over outdated historical documentation when the two conflict.

---

# 23. Target State

Summarize the intended product state.

Include:

* intended capabilities;
* target outcomes;
* target boundaries;
* important behavioral changes;
* deferred elements.

Do not turn target-state aspirations into confirmed architecture.

---

# 24. Transition Considerations

For existing systems and system evolution, summarize important transition considerations.

Include:

* migration requirements;
* compatibility expectations;
* coexistence;
* rollout constraints;
* transitional behavior;
* legacy dependencies;
* rollback concerns.

Only include transition details supported by evidence.

---

# 25. Domain Discovery Readiness

This section determines whether Product Discovery has produced enough context for Domain Discovery / DDD.

Evaluate:

| Area                  | Status           | Evidence | Blocking? |
| --------------------- | ---------------- | -------- | --------- |
| Problem Understanding | `READY` / `OPEN` | —        | —         |
| Product Outcomes      | —                | —        | —         |
| Actors                | —                | —        | —         |
| Scope                 | —                | —        | —         |
| Requirements          | —                | —        | —         |
| Business Rules        | —                | —        | —         |
| Use Cases             | —                | —        | —         |
| Dependencies          | —                | —        | —         |
| Risks                 | —                | —        | —         |
| Unknowns              | —                | —        | —         |
| Constraints           | —                | —        | —         |
| Product Decisions     | —                | —        | —         |

---

# 26. Minimum Readiness Conditions

Product Discovery should normally be considered ready for Domain Discovery when:

* the primary problem is sufficiently understood;
* primary outcomes are identified;
* product scope is explicit;
* significant actors are known;
* important use cases are understood;
* critical requirements are identified;
* important business rules are visible;
* significant dependencies are identified;
* material risks are visible;
* decision-relevant unknowns are explicitly tracked;
* relevant product decisions are explicit;
* no unresolved blocker prevents domain analysis.

Not every requirement or detail must be complete.

---

# 27. Domain-Relevant Uncertainty

Some uncertainty can safely remain open while entering Domain Discovery.

Examples may include:

* implementation details;
* technology selection;
* infrastructure details;
* detailed API design;
* detailed persistence structure.

However, uncertainty should generally block progression when it concerns:

* core business concepts;
* major domain boundaries;
* ownership;
* critical business rules;
* critical actor responsibilities;
* fundamental product scope;
* mandatory compliance behavior.

The distinction must be based on consequence.

---

# 28. Blocking Conditions

Product Discovery should be marked `BLOCKED` when, for example:

* the primary product problem is materially ambiguous;
* critical outcomes conflict without resolution;
* product scope is fundamentally unclear;
* key actor responsibilities are unknown;
* critical business behavior is unresolved;
* a decision required for domain analysis lacks authority;
* a critical constraint is unknown;
* a high-consequence unknown prevents safe domain modeling;
* product decisions conflict without resolution.

The agent should not mark the phase blocked merely because minor details remain unknown.

---

# 29. Non-Blocking Open Items

Open items may remain when they do not materially affect safe domain discovery.

Examples:

* low-priority product enhancements;
* future release features;
* implementation details;
* low-impact operational preferences;
* non-critical unknowns;
* deferred product decisions.

These items should remain visible and traceable.

---

# 30. Discovery Confidence

Overall discovery confidence may be recorded as:

```text id="m2x8qk"
HIGH
MEDIUM
LOW
```

Confidence should reflect the quality and consistency of the available evidence.

Confidence is not a substitute for gate status.

Example:

```text id="y7p3mc"
Discovery Status: READY_WITH_RISKS
Confidence: MEDIUM
```

This indicates that progression is acceptable despite meaningful uncertainty.

---

# 31. Contradictions

Record unresolved contradictions.

Examples:

```text id="k8n4pz"
Requirement A:
Users must confirm before activation.

Use Case B:
Activation occurs automatically.

Status:
CONFLICTING
```

For each contradiction identify:

* affected artifacts;
* source of each statement;
* evidence;
* impact;
* required decision;
* blocking status.

The agent must not silently choose one interpretation.

---

# 32. Traceability Health

Evaluate whether Product Discovery maintains sufficient traceability.

Check:

```text id="f3m7xq"
Product Problem
   ↓
Outcome
   ↓
Requirement
   ↓
Use Case
   ↓
Business Rule
   ↓
Product Decision
```

Not every artifact requires every relationship.

The goal is to ensure that consequential product reasoning remains explainable.

---

# 33. Open Decisions

List decisions that remain unresolved but may affect Domain Discovery.

| ID      | Decision | Impact | Blocking | Authority | Status       |
| ------- | -------- | ------ | -------- | --------- | ------------ |
| DEC-001 | —        | HIGH   | YES      | —         | UNDER_REVIEW |
| DEC-002 | —        | MEDIUM | NO       | —         | PROPOSED     |

Only decision-relevant unresolved items should be included.

---

# 34. Open Risks

List risks requiring continued attention.

| ID      | Risk | Exposure | Response   | Owner | Review |
| ------- | ---- | -------- | ---------- | ----- | ------ |
| RSK-001 | —    | HIGH     | MITIGATING | —     | —      |

Risks that do not prevent progression should remain visible rather than artificially eliminated.

---

# 35. Open Unknowns

List unresolved unknowns that will continue into Domain Discovery.

| ID      | Unknown | Importance | Resolution Strategy    | Owner |
| ------- | ------- | ---------- | ---------------------- | ----- |
| UNK-001 | —       | HIGH       | Domain Analysis        | —     |
| UNK-002 | —       | MEDIUM     | Stakeholder Validation | —     |

Unknowns should have a reason for remaining open.

---

# 36. Recommended Domain Discovery Focus

Based on Product Discovery findings, identify what Domain Discovery should investigate first.

Examples:

```text id="p5x8mn"
1. Clarify ownership of concept X.
2. Validate lifecycle of concept Y.
3. Model business rules BR-001 through BR-004.
4. Identify domain capabilities supporting Outcome A.
5. Investigate boundary between Capability B and Capability C.
```

This section is a transition guide.

It should not prematurely define the final domain model.

---

# 37. Handoff to Domain Discovery

The handoff should identify:

### Established

What is sufficiently understood and may be treated as current product context.

### Open

What remains unresolved but does not block progression.

### Blocking

What must be resolved before domain work can safely proceed.

### Domain Questions

What Domain Discovery / DDD should investigate.

### Constraints

What domain analysis must respect.

### Decisions

What product decisions already constrain domain exploration.

---

# 38. Handoff Contract

The handoff from Product Discovery to Domain Discovery should preserve:

```text id="s2m9vx"
Product Problem
        ↓
Product Outcomes
        ↓
Actors
        ↓
Scope
        ↓
Requirements
        ↓
Business Rules
        ↓
Use Cases
        ↓
Dependencies
        ↓
Risks
        ↓
Unknowns
        ↓
Product Decisions
```

Domain Discovery should consume this context rather than restart discovery without reason.

However, Domain Discovery may challenge Product Discovery when domain analysis exposes contradictions or unsupported assumptions.

---

# 39. Feedback to Product Discovery

Domain Discovery may invalidate or refine Product Discovery assumptions.

Possible feedback includes:

* ambiguous business concept;
* incorrect actor responsibility;
* missing business rule;
* incorrect scope boundary;
* conflicting requirement;
* invalid assumption;
* new dependency;
* previously unknown domain constraint.

When this occurs, the agent should return to the affected Product Discovery artifact rather than silently overriding it.

---

# 40. Gate Result

Record the final gate result:

```text id="b4n7qc"
Gate:
Product Discovery

Result:
READY
```

Possible results:

```text id="w8m2pk"
READY
READY_WITH_RISKS
BLOCKED
INCOMPLETE
WAIVED
```

If `READY_WITH_RISKS`, record the accepted risks.

If `BLOCKED`, record the blocking conditions.

If `WAIVED`, record the authority, rationale, risk, and review point.

---

# 41. Gate Decision

The gate decision should contain:

```text id="c6q9xm"
Decision:
...

Rationale:
...

Evidence:
...

Authority:
...

Date:
...
```

The agent must not claim approval without evidence of authority.

---

# 42. Product Discovery Completion Checklist

### Product Understanding

* [ ] Product problem is sufficiently understood.
* [ ] Product vision is explicit.
* [ ] Primary outcomes are identified.
* [ ] Target actors are identified.
* [ ] Product scope is explicit.

### Requirements

* [ ] Critical requirements are identified.
* [ ] Important quality attributes are known.
* [ ] Relevant constraints are explicit.
* [ ] Business rules are identified.

### Behavior

* [ ] Significant use cases are understood.
* [ ] Important alternatives and exceptions are identified.
* [ ] Actor responsibilities are sufficiently understood.

### Dependencies and Risks

* [ ] Significant dependencies are identified.
* [ ] Critical risks are visible.
* [ ] Important unknowns are explicit.
* [ ] Blocking conditions are known.

### Decisions

* [ ] Consequential product decisions are explicit.
* [ ] Decision authority is known where required.
* [ ] Conflicts are addressed.
* [ ] Historical decisions are preserved.

### Traceability

* [ ] Major outcomes trace to relevant requirements.
* [ ] Requirements trace to relevant use cases or product behavior.
* [ ] Important decisions are traceable.
* [ ] Significant risks and unknowns are connected to affected artifacts.

### Transition

* [ ] Domain-relevant uncertainty is identified.
* [ ] Domain Discovery focus is defined.
* [ ] Product Discovery gate result is explicit.

---

# 43. Gate Contribution

This artifact serves as the primary consolidation point for the Product Discovery gate.

It demonstrates whether the project has:

* sufficient product understanding;
* explicit scope;
* meaningful outcomes;
* understood actors;
* relevant requirements;
* visible business rules;
* significant use cases;
* known dependencies;
* visible risks;
* explicit unknowns;
* governed product decisions;
* sufficient traceability;
* a controlled handoff to Domain Discovery.

The summary must not be used to hide unresolved problems.

Its purpose is to make the state of knowledge explicit.

---

# 44. Agent Instructions

When creating or reviewing this artifact, the agent must:

1. Read the underlying Product Discovery artifacts.
2. Consolidate rather than duplicate them.
3. Preserve references to source artifacts.
4. Identify contradictions.
5. Distinguish established facts from assumptions.
6. Identify unresolved unknowns.
7. Identify blocking conditions.
8. Identify accepted risks.
9. Verify product decisions and their authority.
10. Evaluate domain relevance of remaining uncertainty.
11. Identify the appropriate Domain Discovery focus.
12. Preserve current, documented, and target states when relevant.
13. Avoid introducing domain or architecture decisions prematurely.
14. Use evidence from source artifacts.
15. Never mark the phase ready merely because documents exist.
16. Determine readiness based on reduced uncertainty and sufficient product understanding.
17. Preserve feedback paths to Product Discovery.
18. Scale the summary according to project complexity and scope.

The agent should prefer:

```text id="m8q4vz"
Product Discovery Artifacts
        ↓
Consolidation
        ↓
Readiness Assessment
        ↓
Handoff
```

over:

```text id="t6x2pn"
Document Completion
        ↓
Automatic Progression
```

---

# 45. Anti-Patterns

## 45.1 Documentation Completion Equals Readiness

Having every document populated does not mean Product Discovery is complete.

---

## 45.2 Summary as a Replacement

The summary must not become the only source of product truth.

Detailed artifacts remain authoritative for their respective subjects.

---

## 45.3 Hiding Unknowns

Removing unresolved items from the summary to make the project appear ready destroys transparency.

---

## 45.4 False Completeness

A filled template is not evidence that the underlying product question has been resolved.

---

## 45.5 Premature Domain Modeling

The Product Discovery summary must not silently define bounded contexts, aggregates, entities, or technical boundaries.

Those belong to subsequent discovery unless already established by evidence.

---

## 45.6 Automatic Gate Approval

The agent must not mark Product Discovery as ready solely because the checklist is complete.

---

## 45.7 Ignoring Contradictions

Conflicting requirements, outcomes, rules, or decisions must remain visible until resolved.

---

## 45.8 Restarting Discovery Unnecessarily

Domain Discovery should consume established product context rather than repeatedly rediscovering already validated information.

---

## 45.9 Freezing Product Understanding

Product Discovery remains revisable.

Domain analysis, architecture, implementation, and validation may expose information requiring Product Discovery updates.

---

## 45.10 Summary Drift

The summary must remain synchronized with material changes in the underlying Product Discovery artifacts.

---

# 46. Safe Progression Question

Before entering Domain Discovery / DDD, the agent should be able to answer:

> **Do we have enough evidence-based understanding of the product problem, outcomes, actors, scope, requirements, business rules, significant interactions, dependencies, risks, unknowns, and product decisions to begin domain analysis without introducing unsupported assumptions?**

If yes, Product Discovery may pass its gate.

If no, the agent should identify the specific missing context or unresolved decision rather than progressing by assumption.

---

# 47. Final Principle

> **Product Discovery is complete when the project has enough shared, evidence-based understanding of product intent and behavior to begin domain analysis safely—not when every possible question has been answered.**

The Product Discovery Summary provides the controlled transition:

```text id="x7m3qp"
Product Discovery
        ↓
Readiness Assessment
        ↓
Domain Discovery / DDD
```

The transition must preserve uncertainty, decisions, risks, constraints, and traceability so that later domain analysis can refine the product understanding without losing the reasoning that produced it.

