# Product Scope

## 1. Document Metadata

| Field                   | Value                      |
| ----------------------- | -------------------------- |
| Document ID             | `<SCOPE-ID>`               |
| Title                   | Product Scope              |
| Version                 | `<VERSION>`                |
| Status                  | `<STATUS>`                 |
| Date                    | `<DATE>`                   |
| Author                  | `<AUTHOR>`                 |
| Project                 | `<PROJECT-NAME>`           |
| Lifecycle Phase         | Product Discovery          |
| Related Product Context | `<PRODUCT-CONTEXT-ID>`     |
| Related Requirements    | `<REQUIREMENTS-REFERENCE>` |
| Reviewers               | `<REVIEWERS>`              |

---

## 2. Purpose

This document defines the boundaries of the product or system being analyzed.

It establishes:

* what is explicitly included;
* what is explicitly excluded;
* what is intentionally deferred;
* which capabilities, actors, and business areas are within the current scope;
* which boundaries separate the product from external systems, responsibilities, or future capabilities;
* how scope relates to requirements, domain boundaries, architecture, and future evolution.

The objective is to prevent uncontrolled scope expansion and to provide a stable basis for Product Discovery, Domain Discovery, and subsequent architectural decisions.

---

## 3. Core Principle

**Scope defines the boundary of what is being considered; it does not define how that scope will be implemented.**

Scope must remain independent from specific technologies, frameworks, infrastructure products, databases, deployment models, or architectural patterns unless such elements are themselves part of the explicitly agreed scope.

The following distinctions must remain explicit:

| Concept       | Meaning                                                  |
| ------------- | -------------------------------------------------------- |
| Scope         | What is included, excluded, or deferred                  |
| Requirement   | What must be achieved within the scope                   |
| Constraint    | What limits the available solution space                 |
| Business Rule | What governs domain behavior                             |
| Assumption    | What is temporarily accepted as true for analysis        |
| Decision      | Which option has been explicitly selected                |
| Architecture  | How responsibilities and system structures are organized |

---

## 4. Scope Model

Every relevant capability, responsibility, feature, actor, or concern should be classified using one of the following scope states:

### 4.1 `IN_SCOPE`

The capability or responsibility is explicitly part of the current product scope.

It may be:

* required for the current release;
* necessary to satisfy accepted requirements;
* part of the core product boundary;
* required to support another in-scope capability.

Being in scope does not imply that implementation details have already been decided.

### 4.2 `OUT_OF_SCOPE`

The capability or responsibility is explicitly excluded from the product or system.

An out-of-scope item must not be treated as an implicit requirement or architectural obligation.

Where useful, the reason for exclusion should be documented.

### 4.3 `DEFERRED`

The capability is recognized as potentially relevant but intentionally excluded from the current scope.

Deferred scope should not silently influence current architecture unless there is an explicit reason to preserve future compatibility.

Deferred does not mean rejected.

---

## 5. Scope Definition

### 5.1 Product Scope Statement

Provide a concise statement describing the overall scope:

> `<Describe what the product/system is responsible for and the primary boundary of responsibility.>`

### 5.2 Scope Objectives

The current scope exists to support the following objectives:

1. `<OBJECTIVE-1>`
2. `<OBJECTIVE-2>`
3. `<OBJECTIVE-3>`

### 5.3 Primary Scope Boundary

The product/system is responsible for:

* `<RESPONSIBILITY-1>`
* `<RESPONSIBILITY-2>`
* `<RESPONSIBILITY-3>`

The product/system is not responsible for:

* `<RESPONSIBILITY-OUTSIDE-1>`
* `<RESPONSIBILITY-OUTSIDE-2>`

---

## 6. In-Scope

The following capabilities, responsibilities, or areas are currently included.

| ID        | Scope Item | Description     | Rationale     | Related Requirements | Status     |
| --------- | ---------- | --------------- | ------------- | -------------------- | ---------- |
| `SCP-001` | `<ITEM>`   | `<DESCRIPTION>` | `<RATIONALE>` | `<REQ-IDS>`          | `IN_SCOPE` |
| `SCP-002` | `<ITEM>`   | `<DESCRIPTION>` | `<RATIONALE>` | `<REQ-IDS>`          | `IN_SCOPE` |

### 6.1 In-Scope Capabilities

For each capability, describe:

* capability name;
* business purpose;
* primary actors;
* expected outcome;
* major dependencies;
* related requirements;
* known boundaries.

Avoid describing implementation details unless they are relevant to defining the boundary itself.

---

## 7. Out-of-Scope

The following items are explicitly excluded from the current product scope.

| ID            | Scope Item | Description     | Reason for Exclusion | Potential Future Scope |
| ------------- | ---------- | --------------- | -------------------- | ---------------------- |
| `SCP-OUT-001` | `<ITEM>`   | `<DESCRIPTION>` | `<REASON>`           | `YES/NO`               |
| `SCP-OUT-002` | `<ITEM>`   | `<DESCRIPTION>` | `<REASON>`           | `YES/NO`               |

Out-of-scope items must not be treated as hidden requirements.

If an excluded capability becomes necessary to satisfy an accepted requirement, the scope must be formally reconsidered.

---

## 8. Deferred Scope

The following capabilities are intentionally deferred.

| ID            | Scope Item | Description     | Reason for Deferral | Revisit Condition | Future Impact |
| ------------- | ---------- | --------------- | ------------------- | ----------------- | ------------- |
| `SCP-DEF-001` | `<ITEM>`   | `<DESCRIPTION>` | `<REASON>`          | `<CONDITION>`     | `<IMPACT>`    |
| `SCP-DEF-002` | `<ITEM>`   | `<DESCRIPTION>` | `<REASON>`          | `<CONDITION>`     | `<IMPACT>`    |

Deferred items should only influence current design when there is explicit evidence that future compatibility is necessary and economically justified.

Do not introduce speculative architecture solely because an item may be implemented in the future.

---

## 9. Scope Boundaries

Scope boundaries identify where responsibility begins and ends.

### 9.1 Responsibility Boundary

| Boundary     | Inside Scope       | Outside Scope               |
| ------------ | ------------------ | --------------------------- |
| `<BOUNDARY>` | `<RESPONSIBILITY>` | `<EXTERNAL RESPONSIBILITY>` |

### 9.2 Actor Boundary

Identify actors that interact with the product but are not necessarily part of its internal responsibility.

Examples may include:

* end users;
* administrators;
* external organizations;
* external systems;
* operational personnel;
* third-party providers.

### 9.3 System Boundary

Identify external systems and services that remain outside the product's internal responsibility.

| External Entity | Relationship     | Product Responsibility | External Responsibility |
| --------------- | ---------------- | ---------------------- | ----------------------- |
| `<SYSTEM>`      | `<RELATIONSHIP>` | `<RESPONSIBILITY>`     | `<RESPONSIBILITY>`      |

---

## 10. Scope by Capability or Product Area

Use this section when the product contains multiple functional areas.

| Capability / Area | Scope          | Primary Purpose | Primary Actors | Related Requirements |
| ----------------- | -------------- | --------------- | -------------- | -------------------- |
| `<AREA-1>`        | `IN_SCOPE`     | `<PURPOSE>`     | `<ACTORS>`     | `<REQ-IDS>`          |
| `<AREA-2>`        | `DEFERRED`     | `<PURPOSE>`     | `<ACTORS>`     | `<REQ-IDS>`          |
| `<AREA-3>`        | `OUT_OF_SCOPE` | `<PURPOSE>`     | `<ACTORS>`     | `<REQ-IDS>`          |

This classification should remain aligned with the product context and requirements.

---

## 11. Scope Levels

Scope may be described at different levels when necessary.

### 11.1 Product Level

Defines the overall product responsibility.

### 11.2 System Level

Defines the responsibilities of the system within the product ecosystem.

### 11.3 Capability Level

Defines individual business or functional capabilities.

### 11.4 Component or Service Level

May be used later during architecture work to establish responsibility boundaries.

Component or service scope must not be used prematurely to define the product scope.

Architecture should derive from understood responsibilities rather than the other way around.

---

## 12. Current Scope vs Target Scope

For existing systems and system evolution, distinguish between current and target scope.

| Area     | Current Scope | Target Scope | Change     |
| -------- | ------------- | ------------ | ---------- |
| `<AREA>` | `<CURRENT>`   | `<TARGET>`   | `<CHANGE>` |

This distinction is particularly important when the system is being migrated, extended, consolidated, or replaced.

---

## 13. Release or Increment Scope

When the product is developed incrementally, scope may be associated with a release or delivery increment.

| Increment     | Included Scope | Excluded Scope | Deferred Scope | Status     |
| ------------- | -------------- | -------------- | -------------- | ---------- |
| `<RELEASE-1>` | `<ITEMS>`      | `<ITEMS>`      | `<ITEMS>`      | `<STATUS>` |
| `<RELEASE-2>` | `<ITEMS>`      | `<ITEMS>`      | `<ITEMS>`      | `<STATUS>` |

Release scope must not redefine the overall product boundary unless explicitly approved.

---

## 14. Scope Exclusions and Rationale

Important exclusions should include a rationale.

Possible reasons include:

* outside the product's responsibility;
* insufficient business value;
* dependency on another product;
* excessive complexity;
* regulatory or organizational boundary;
* intentionally postponed capability;
* separate product responsibility;
* unresolved uncertainty;
* unavailable dependency;
* explicit stakeholder decision.

Avoid documenting exclusions merely to make the scope appear complete.

---

## 15. Scope Dependencies

Identify external or internal dependencies that materially affect the scope.

| Dependency     | Type     | Affected Scope | Description     | Status     |
| -------------- | -------- | -------------- | --------------- | ---------- |
| `<DEPENDENCY>` | `<TYPE>` | `<SCOPE-ID>`   | `<DESCRIPTION>` | `<STATUS>` |

Dependencies may include:

* external systems;
* organizations;
* business capabilities;
* data sources;
* regulatory obligations;
* contractual dependencies;
* other products;
* required decisions.

A dependency does not automatically become part of the product scope.

---

## 16. Scope Assumptions

Scope may temporarily depend on assumptions.

| Assumption     | Affected Scope | Confidence        | Validation Required |
| -------------- | -------------- | ----------------- | ------------------- |
| `<ASSUMPTION>` | `<SCOPE-ID>`   | `HIGH/MEDIUM/LOW` | `<METHOD>`          |

Important scope assumptions should reference the corresponding assumption record.

If a consequential assumption is invalidated, scope must be reassessed.

---

## 17. Scope Constraints

Identify constraints that restrict scope definition or evolution.

Examples include:

* organizational responsibility;
* regulatory boundaries;
* contractual boundaries;
* mandatory delivery boundaries;
* existing-system responsibilities;
* platform limitations;
* explicit stakeholder constraints.

Scope constraints must remain distinct from architecture decisions.

---

## 18. Scope Unknowns

Record unresolved information that could change the scope.

| Unknown     | Affected Scope | Importance                 | Blocking Level | Resolution Method |
| ----------- | -------------- | -------------------------- | -------------- | ----------------- |
| `<UNKNOWN>` | `<SCOPE-ID>`   | `LOW/MEDIUM/HIGH/CRITICAL` | `<LEVEL>`      | `<METHOD>`        |

A scope decision should not be presented as final when it depends on an unresolved blocking unknown.

---

## 19. Scope Change Management

Scope changes must be explicit.

A scope change may be triggered by:

* new product requirements;
* changed business priorities;
* newly discovered domain behavior;
* regulatory changes;
* external dependency changes;
* architecture discoveries;
* implementation constraints;
* stakeholder decisions;
* invalidated assumptions;
* previously unknown information.

### 19.1 Scope Change Procedure

1. Identify the proposed change.
2. Determine the affected scope items.
3. Identify affected requirements.
4. Analyze domain impact.
5. Analyze architecture impact when applicable.
6. Analyze contract and data impact when applicable.
7. Identify affected decisions and specifications.
8. Evaluate delivery and operational consequences.
9. Obtain required authorization.
10. Update the affected artifacts.
11. Update traceability.
12. Re-evaluate affected lifecycle gates.

A scope change must not be silently incorporated into existing artifacts.

---

## 20. Scope Impact Analysis

For consequential changes, evaluate at least:

* product outcomes;
* requirements;
* business rules;
* domain boundaries;
* actors;
* external systems;
* architecture;
* contracts;
* data ownership;
* security;
* operational responsibilities;
* infrastructure;
* verification;
* release readiness.

The depth of analysis must be proportional to the change impact.

---

## 21. Scope Conflicts

Identify conflicts between scope items or between scope and other project artifacts.

| Conflict     | Scope Items   | Related Artifact | Severity                            | Resolution     |
| ------------ | ------------- | ---------------- | ----------------------------------- | -------------- |
| `<CONFLICT>` | `<SCOPE-IDS>` | `<ARTIFACT>`     | `INFO/WARNING/SIGNIFICANT/BLOCKING` | `<RESOLUTION>` |

Typical conflicts include:

* an in-scope capability depending on an explicitly out-of-scope capability;
* an accepted requirement requiring excluded functionality;
* conflicting responsibilities between systems;
* deferred functionality being treated as current scope;
* architecture assuming responsibility that product scope does not authorize;
* current behavior contradicting documented scope.

Blocking conflicts must be resolved or explicitly governed before the affected lifecycle gate can pass.

---

## 22. Existing System Scope

For existing systems, maintain three perspectives where relevant:

### 22.1 Documented Scope

What existing documentation claims is within the system boundary.

### 22.2 Actual Scope

What the system actually does or is responsible for based on observable evidence.

### 22.3 Target Scope

What the system is intended to be responsible for after the planned change.

| Area     | Documented | Actual    | Target    | Conflict   |
| -------- | ---------- | --------- | --------- | ---------- |
| `<AREA>` | `<STATE>`  | `<STATE>` | `<STATE>` | `<YES/NO>` |

When documented scope conflicts with actual behavior, the conflict must be explicitly identified.

Historical documentation must not silently override current evidence.

---

## 23. System Evolution Scope

For system evolution, define the smallest meaningful change boundary.

Document:

* current responsibility;
* requested change;
* affected scope;
* explicitly unaffected scope;
* newly introduced responsibility;
* removed responsibility;
* dependencies;
* migration boundary.

Avoid redefining the entire system scope when the change only affects a limited area.

---

## 24. Scope Traceability

Scope should maintain explicit relationships with relevant lifecycle artifacts.

Typical relationships include:

| Scope Relationship | Target                           |
| ------------------ | -------------------------------- |
| `DERIVES_FROM`     | Product Vision / Product Context |
| `CONTAINS`         | Capability / Product Area        |
| `EXCLUDES`         | Out-of-Scope Area                |
| `DEFERS`           | Future Capability                |
| `REALIZES`         | Product Outcome                  |
| `CONSTRAINS`       | Requirement                      |
| `REFINES`          | Requirement                      |
| `INFLUENCES`       | Domain Boundary                  |
| `INFLUENCES`       | Architecture Element             |
| `SUPERSEDES`       | Previous Scope                   |
| `INVALIDATES`      | Previous Scope Assumption        |

### 24.1 Minimum Traceability

Every significant in-scope capability should be traceable to at least one of:

* product outcome;
* accepted requirement;
* business need;
* explicit stakeholder decision.

Every significant exclusion or deferral should have a documented rationale when its absence could otherwise create ambiguity.

---

## 25. Scope Review Checklist

Before considering Product Scope sufficiently defined, verify:

### Scope Definition

* [ ] The overall product/system boundary is clear.
* [ ] In-scope areas are explicitly identified.
* [ ] Out-of-scope areas are explicitly identified where necessary.
* [ ] Deferred capabilities are distinguished from exclusions.
* [ ] Scope does not depend on undocumented assumptions.

### Responsibility Boundaries

* [ ] Internal responsibilities are distinguishable from external responsibilities.
* [ ] Relevant actors are identified.
* [ ] External systems are identified where they affect the boundary.
* [ ] No responsibility is implicitly assigned without evidence.

### Requirements Alignment

* [ ] Significant in-scope capabilities have requirement traceability.
* [ ] No accepted requirement depends on unexplained out-of-scope functionality.
* [ ] Scope and requirements do not contradict each other.

### Existing Systems

* [ ] Documented, actual, and target scope are distinguished when applicable.
* [ ] Known discrepancies are explicit.
* [ ] Historical documentation is not treated as current truth without validation.

### Change Readiness

* [ ] Scope changes can be identified and analyzed.
* [ ] Scope dependencies are visible.
* [ ] Important assumptions and unknowns are tracked.
* [ ] Consequential changes trigger appropriate impact analysis.

---

## 26. Gate Contribution

Product Scope contributes to the **Product Discovery Gate**.

The scope is sufficiently defined when:

1. the primary product boundary is understood;
2. major in-scope responsibilities are identified;
3. important exclusions are explicit;
4. deferred capabilities are distinguishable from exclusions;
5. major external responsibility boundaries are understood;
6. consequential scope dependencies are identified;
7. blocking scope unknowns are resolved or explicitly governed;
8. scope is consistent with accepted product requirements;
9. important scope relationships are traceable;
10. no unresolved blocking contradiction prevents safe progression.

A complete scope document is not itself evidence that the gate should pass.

The gate evaluates whether the scope provides sufficient certainty for subsequent domain discovery and architectural analysis.

---

## 27. Compact Scope Register

For projects requiring a compact overview:

| ID        | Scope Item | State          | Rationale     | Requirements | Dependencies | Impact     |
| --------- | ---------- | -------------- | ------------- | ------------ | ------------ | ---------- |
| `SCP-001` | `<ITEM>`   | `IN_SCOPE`     | `<RATIONALE>` | `<REQ-IDS>`  | `<DEPS>`     | `<IMPACT>` |
| `SCP-002` | `<ITEM>`   | `OUT_OF_SCOPE` | `<RATIONALE>` | `-`          | `<DEPS>`     | `<IMPACT>` |
| `SCP-003` | `<ITEM>`   | `DEFERRED`     | `<RATIONALE>` | `<REQ-IDS>`  | `<DEPS>`     | `<IMPACT>` |

---

## 28. Agent Instructions

When working with product scope, the agent must:

1. Treat scope as a boundary, not an implementation plan.
2. Never infer in-scope functionality solely from technology choices.
3. Distinguish `IN_SCOPE`, `OUT_OF_SCOPE`, and `DEFERRED`.
4. Never convert a deferred capability into a current requirement without explicit evidence.
5. Never silently expand scope because implementation reveals additional functionality.
6. Identify responsibility boundaries explicitly.
7. Trace significant scope items to product outcomes, requirements, or decisions.
8. Identify scope conflicts with requirements, domain boundaries, or architecture.
9. Distinguish documented, actual, and target scope for existing systems.
10. Treat legacy behavior as evidence, not automatically as authorized scope.
11. Reassess scope when assumptions or unknowns materially change.
12. Perform impact analysis for consequential scope changes.
13. Avoid speculative architecture for future scope unless future compatibility is explicitly justified.
14. Preserve historical scope information when changes occur.
15. Never fabricate scope based on typical industry behavior or presumed stakeholder intent.
16. Ask for clarification when a scope ambiguity can materially change domain, architecture, contracts, security, data, or delivery consequences.

### Safe Progression Rule

Before progressing from Product Discovery, the agent should be able to answer:

> **"Do I understand what the product is responsible for, what it is not responsible for, and what has intentionally been deferred well enough to continue without introducing unsupported assumptions?"**

If the answer is no, the agent should continue discovery or identify the blocking unknown rather than proceeding as if scope were settled.

---

## 29. Anti-Patterns

Avoid:

### Scope by Technology

Defining scope as a collection of technologies, services, databases, or frameworks.

### Everything Is In Scope

Treating every potentially useful capability as part of the current product.

### Hidden Scope

Allowing implementation tasks to introduce undocumented product responsibilities.

### Deferred = Required

Treating future capabilities as current obligations.

### Out-of-Scope Without Rationale

Excluding consequential capabilities without explaining the boundary.

### Architecture-Driven Scope

Defining product responsibilities from an assumed architecture.

### Scope Creep by Discovery

Automatically expanding scope because implementation or domain analysis reveals additional possibilities.

### Legacy Scope Assumption

Assuming that everything an existing system currently does is still authorized product scope.

### Future-Proofing by Default

Introducing complexity solely to support hypothetical future scope.

### Scope Documentation Theater

Creating exhaustive scope tables without resolving the actual responsibility boundaries.

---

## 30. Final Principle

**A well-defined scope establishes the boundary within which product, domain, and architecture decisions can be made safely.**

Scope should be explicit enough to prevent ambiguity, flexible enough to evolve, and disciplined enough to prevent uncontrolled expansion.

The objective is not to document everything that could ever exist.

The objective is to establish a sufficiently clear boundary of responsibility so that requirements, domain analysis, architecture, contracts, specifications, and implementation can evolve from a shared and traceable understanding of what the system is actually intended to accomplish.
