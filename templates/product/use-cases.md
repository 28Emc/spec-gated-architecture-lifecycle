# Product Use Cases

## 1. Document Metadata

| Field                   | Value                      |
| ----------------------- | -------------------------- |
| Document ID             | `<USE-CASES-ID>`           |
| Title                   | Product Use Cases          |
| Version                 | `<VERSION>`                |
| Status                  | `<STATUS>`                 |
| Date                    | `<DATE>`                   |
| Author                  | `<AUTHOR>`                 |
| Project                 | `<PROJECT-NAME>`           |
| Lifecycle Phase         | Product Discovery          |
| Related Product Context | `<PRODUCT-CONTEXT-ID>`     |
| Related Scope           | `<SCOPE-ID>`               |
| Related Actors          | `<ACTORS-ID>`              |
| Related Outcomes        | `<OUTCOMES-ID>`            |
| Related Requirements    | `<REQUIREMENTS-REFERENCE>` |
| Reviewers               | `<REVIEWERS>`              |

---

## 2. Purpose

This document defines the significant interactions between actors and the product that contribute to accepted product outcomes.

A product use case describes:

* who initiates or participates in an interaction;
* what the actor is trying to accomplish;
* what the product is expected to do;
* what conditions must hold;
* what successful completion means;
* what relevant alternative or exceptional outcomes may occur.

The objective is to provide a behavior-oriented view of the product before domain and architecture design begin.

---

## 3. Core Principle

**A product use case describes a meaningful interaction between an actor and the product from the perspective of an intended outcome, not from the perspective of implementation.**

A use case should remain meaningful if:

* the frontend technology changes;
* the backend framework changes;
* the API protocol changes;
* the database changes;
* the deployment model changes;
* the internal architecture changes.

Use cases should therefore avoid prematurely specifying:

* endpoints;
* classes;
* services;
* database tables;
* message brokers;
* framework components;
* infrastructure;
* implementation algorithms.

Those concerns belong to later lifecycle phases.

---

## 4. Use Case Model

A use case connects several product concepts:

```text
Actor
  ↓
Goal / Intent
  ↓
Use Case
  ↓
Product Behavior
  ↓
Expected Outcome
  ↓
Requirements / Business Rules
```

A use case may contribute to one or more product outcomes.

A product capability may support multiple use cases.

A requirement may constrain one or more use cases.

---

## 5. Use Case Categories

Use cases may be classified using the following categories.

### 5.1 CORE

Directly supports a primary product capability or product outcome.

### 5.2 SUPPORTING

Supports a core interaction but is not itself the primary value-generating interaction.

### 5.3 ADMINISTRATIVE

Supports administrative or operational responsibilities.

### 5.4 GOVERNANCE

Supports compliance, review, authorization, audit, or governance responsibilities.

### 5.5 INTEGRATION

Represents a meaningful interaction with an external system or organization.

### 5.6 RECOVERY

Represents a meaningful recovery or corrective interaction.

Use only categories that provide analytical value.

---

## 6. Use Case Register

| ID       | Name         | Primary Actor | Category     | Outcome    | Priority | Status     |
| -------- | ------------ | ------------- | ------------ | ---------- | -------- | ---------- |
| `UC-001` | `<USE CASE>` | `<ACTOR>`     | `CORE`       | `<OUT-ID>` | `HIGH`   | `PROPOSED` |
| `UC-002` | `<USE CASE>` | `<ACTOR>`     | `SUPPORTING` | `<OUT-ID>` | `MEDIUM` | `PROPOSED` |

---

## 7. Use Case Record

Each significant use case should have an explicit record.

### Use Case

**ID:** `<UC-ID>`

**Name:** `<USE-CASE-NAME>`

**Category:** `<CATEGORY>`

**Status:** `<STATUS>`

**Priority:** `<PRIORITY>`

**Primary Actor:**

`<ACTOR-ID>`

**Supporting Actors:**

* `<ACTOR-ID>`

**Goal:**

`<What the primary actor is trying to accomplish.>`

**Intent:**

`<Why the actor initiates the interaction.>`

**Expected Outcome:**

`<What meaningful result should occur if the use case succeeds.>`

**Scope:**

`<SCOPE-ID>`

**Preconditions:**

* `<PRECONDITION-1>`
* `<PRECONDITION-2>`

**Trigger:**

`<Event or condition that initiates the use case.>`

**Main Success Scenario:**

1. `<ACTOR ACTION>`
2. `<PRODUCT RESPONSE>`
3. `<ACTOR ACTION>`
4. `<PRODUCT RESPONSE>`
5. `<EXPECTED SUCCESS RESULT>`

**Alternative Flows:**

* `<ALTERNATIVE-1>`
* `<ALTERNATIVE-2>`

**Exception Flows:**

* `<EXCEPTION-1>`
* `<EXCEPTION-2>`

**Postconditions:**

* `<POSTCONDITION-1>`
* `<POSTCONDITION-2>`

**Business Rules:**

* `<RULE-ID>`

**Requirements:**

* `<REQ-ID>`

**Quality Attributes:**

* `<QA-ID>`

**Related Outcomes:**

* `<OUT-ID>`

**Related Actors:**

* `<ACTOR-ID>`

**Dependencies:**

* `<DEPENDENCY-ID>`

**Evidence:**

* `<SOURCE>`

---

## 8. Primary Actor

Every significant use case should identify the actor that initiates or primarily benefits from the interaction.

The primary actor may be:

* a human user;
* an organization;
* an external system;
* an operational actor;
* another recognized entity.

The primary actor should be identified based on the actual responsibility or goal involved.

Do not assume that the entity technically triggering a request is always the primary business actor.

---

## 9. Supporting Actors

Supporting actors participate in a use case without necessarily initiating it.

They may:

* provide information;
* provide a capability;
* authorize an action;
* validate information;
* receive information;
* perform an external operation.

| Actor     | Role in Use Case | Responsibility     |
| --------- | ---------------- | ------------------ |
| `<ACTOR>` | `<ROLE>`         | `<RESPONSIBILITY>` |

Supporting actors should only be included when their participation materially affects the use case.

---

## 10. Use Case Goal

The goal should describe what the primary actor wants to achieve.

Good goals describe intent:

> "Submit a request for review."

> "Obtain the current status of a request."

Avoid implementation-oriented goals:

> "Call the request endpoint."

> "Execute the service."

> "Insert a record."

The goal should remain valid regardless of implementation technology.

---

## 11. Trigger

The trigger identifies what causes the use case to begin.

Possible trigger types include:

* actor action;
* business event;
* scheduled condition;
* external system event;
* state transition;
* operational condition.

| Trigger     | Type     | Source           | Condition     |
| ----------- | -------- | ---------------- | ------------- |
| `<TRIGGER>` | `<TYPE>` | `<ACTOR/SYSTEM>` | `<CONDITION>` |

Do not define technical scheduling or messaging mechanisms unless they are already established project constraints.

---

## 12. Preconditions

A precondition describes what must already be true before the use case begins.

Examples:

* the actor is authorized to perform the action;
* required information is available;
* a relevant business state exists;
* an external dependency is available.

Preconditions should represent meaningful conditions, not implementation details.

Avoid:

> "The controller must be initialized."

Prefer:

> "The actor must have the authority required to initiate the action."

---

## 13. Main Success Scenario

The main success scenario describes the expected interaction when all relevant conditions are satisfied.

Each step should identify meaningful behavior.

Example structure:

```text
1. Actor initiates the intended action.
2. Product validates the required conditions.
3. Product performs the relevant business behavior.
4. Product provides the expected result.
5. Actor receives the expected outcome.
```

The exact number of steps should depend on the complexity of the use case.

Do not create artificial steps merely to make the scenario appear detailed.

---

## 14. Alternative Flows

Alternative flows describe valid variations of the normal interaction.

Examples:

* optional information is provided;
* the actor chooses a different valid path;
* multiple valid outcomes are possible;
* a conditional business rule changes the flow.

| ID        | Condition     | Alternative Behavior | Result     |
| --------- | ------------- | -------------------- | ---------- |
| `ALT-001` | `<CONDITION>` | `<BEHAVIOR>`         | `<RESULT>` |

Alternative flows should represent meaningful product behavior, not implementation branches.

---

## 15. Exception Flows

Exception flows describe situations where the intended interaction cannot proceed normally.

Examples:

* required information is invalid;
* an authorization condition fails;
* a business rule prevents the action;
* a required external dependency is unavailable;
* the requested state does not exist.

| ID        | Condition     | Expected Response | Result     |
| --------- | ------------- | ----------------- | ---------- |
| `EXC-001` | `<CONDITION>` | `<RESPONSE>`      | `<RESULT>` |

Exceptions should describe the expected product behavior rather than implementation mechanics.

---

## 16. Postconditions

Postconditions describe what should be true after the use case completes.

They may include:

* a business state has changed;
* a business result has been produced;
* information has been made available;
* an external responsibility has been triggered;
* an expected outcome has been achieved or partially achieved.

Postconditions should be stated in business or product terms whenever possible.

---

## 17. Use Case Preconditions, Postconditions, and State

Where relevant, use cases may describe state transitions.

```text
Precondition
    ↓
Use Case
    ↓
Business Behavior
    ↓
Postcondition
```

A use case should not define a state transition that contradicts an accepted business rule or domain model.

Detailed domain state modeling belongs to Domain Discovery.

---

## 18. Use Case Relationships

Useful relationships include:

* `SUPPORTS`
* `REALIZES`
* `CONTRIBUTES_TO`
* `DEPENDS_ON`
* `INCLUDES`
* `EXTENDS`
* `TRIGGERS`
* `PRECEDES`
* `FOLLOWS`
* `CONFLICTS_WITH`
* `SUPERSEDES`

Use `INCLUDES` and `EXTENDS` only when the relationship materially improves understanding.

Avoid decomposing every interaction into small technical fragments.

---

## 19. Use Case Dependencies

Some use cases depend on:

* another product capability;
* another use case;
* an external system;
* a business rule;
* an organizational responsibility;
* an external condition.

| Use Case  | Dependency     | Type     | Consequence     |
| --------- | -------------- | -------- | --------------- |
| `<UC-ID>` | `<DEPENDENCY>` | `<TYPE>` | `<CONSEQUENCE>` |

Dependencies should be explicit when they can materially affect scope, domain, architecture, or delivery.

---

## 20. Business Rules

Use cases should reference business rules that govern their behavior.

| Use Case  | Rule        | Effect     |
| --------- | ----------- | ---------- |
| `<UC-ID>` | `<RULE-ID>` | `<EFFECT>` |

A use case should not duplicate the full definition of a business rule.

Instead, it should identify the rule that governs the relevant behavior.

---

## 21. Requirements

Each significant use case should be traceable to relevant requirements.

| Use Case  | Requirement | Relationship                    |
| --------- | ----------- | ------------------------------- |
| `<UC-ID>` | `<REQ-ID>`  | `REALIZES / REFINES / SUPPORTS` |

Requirements remain authoritative for what must be achieved.

Use cases provide behavioral context for those requirements.

---

## 22. Quality Attributes

Quality attributes may constrain the behavior of a use case.

Examples include:

* performance;
* availability;
* security;
* reliability;
* accessibility;
* observability;
* recoverability.

| Use Case  | Quality Attribute | Expected Behavior |
| --------- | ----------------- | ----------------- |
| `<UC-ID>` | `<QA-ID>`         | `<EXPECTATION>`   |

Do not invent quantitative targets.

If a measurable target is required but unknown, record the uncertainty separately.

---

## 23. Use Case Outcomes

Each important use case should identify the outcome it contributes to.

| Use Case  | Outcome    | Contribution     |
| --------- | ---------- | ---------------- |
| `<UC-ID>` | `<OUT-ID>` | `<CONTRIBUTION>` |

A use case may:

* directly achieve an outcome;
* partially contribute to an outcome;
* enable another use case that contributes to the outcome.

---

## 24. Use Case Priority

Recommended priority levels:

* `CRITICAL`
* `HIGH`
* `MEDIUM`
* `LOW`

Priority should reflect product importance, not implementation complexity.

Consider:

* product outcomes;
* business impact;
* user impact;
* risk;
* compliance;
* dependency;
* operational importance.

---

## 25. Use Case Status

Recommended lifecycle states:

* `IDENTIFIED`
* `PROPOSED`
* `UNDER_REVIEW`
* `ACCEPTED`
* `IN_PROGRESS`
* `VERIFIED`
* `DEFERRED`
* `SUPERSEDED`
* `REJECTED`

### Status Semantics

`IDENTIFIED`
The interaction has been recognized but not yet sufficiently analyzed.

`PROPOSED`
The use case has been formulated and is awaiting review.

`UNDER_REVIEW`
The behavior, scope, or importance is being evaluated.

`ACCEPTED`
The use case has been explicitly accepted.

`IN_PROGRESS`
Relevant implementation or delivery work is underway.

`VERIFIED`
The expected behavior has been verified through appropriate evidence.

`DEFERRED`
The use case remains relevant but is intentionally postponed.

`SUPERSEDED`
The use case has been replaced or materially redefined.

`REJECTED`
The use case has been explicitly rejected.

---

## 26. Use Case Variants

A use case may contain meaningful variants when the same goal is achieved under different conditions.

Variants may differ because of:

* actor type;
* business context;
* authorization level;
* optional information;
* domain state;
* external dependency;
* product mode.

Do not create separate use cases for every minor variation.

Create a separate use case when the goal, responsibility, outcome, or business behavior becomes materially different.

---

## 27. Use Case Boundaries

A use case should normally remain within a coherent product-level interaction.

The following may indicate an inappropriate boundary:

* the use case describes an entire technical workflow;
* the use case is merely a database transaction;
* the use case is merely an API operation;
* the use case contains unrelated business goals;
* the use case is so broad that its behavior cannot be meaningfully understood.

The correct level of granularity depends on the project's complexity and discovery needs.

---

## 28. Actor-to-Use-Case Matrix

For larger systems, maintain a compact matrix.

| Actor       | UC-001 | UC-002 | UC-003 | UC-004 |
| ----------- | -----: | -----: | -----: | -----: |
| `<ACTOR-1>` |      ✓ |        |      ✓ |        |
| `<ACTOR-2>` |        |      ✓ |        |      ✓ |
| `<ACTOR-3>` |      ✓ |        |        |        |

The matrix is a navigation aid, not a substitute for individual use-case analysis.

---

## 29. Use Case Coverage

Evaluate whether significant product behavior is represented.

| Requirement | Related Use Cases | Coverage                  |
| ----------- | ----------------- | ------------------------- |
| `<REQ-ID>`  | `<UC-IDS>`        | `COVERED/PARTIAL/MISSING` |

A missing use case does not necessarily indicate a missing requirement.

Some requirements, particularly quality attributes or constraints, may not map naturally to a single use case.

---

## 30. Use Case Gaps

Identify meaningful behavioral gaps.

Examples:

* accepted requirement without a corresponding behavioral scenario;
* actor goal without a supported interaction;
* business rule without an affected use case;
* important exception without defined product behavior;
* external dependency without a defined interaction;
* outcome without a contributing capability or interaction.

| Gap     | Affected Artifact | Severity                            | Resolution     |
| ------- | ----------------- | ----------------------------------- | -------------- |
| `<GAP>` | `<ARTIFACT>`      | `INFO/WARNING/SIGNIFICANT/BLOCKING` | `<RESOLUTION>` |

---

## 31. Use Case Conflicts

Identify contradictions such as:

* two use cases require incompatible states;
* a use case contradicts a business rule;
* actor authority differs between use cases;
* a use case violates product scope;
* an exception flow contradicts an accepted requirement.

| Conflict     | Use Cases  | Related Artifact | Severity                            | Resolution     |
| ------------ | ---------- | ---------------- | ----------------------------------- | -------------- |
| `<CONFLICT>` | `<UC-IDS>` | `<ARTIFACT>`     | `INFO/WARNING/SIGNIFICANT/BLOCKING` | `<RESOLUTION>` |

Blocking conflicts should be resolved before the affected domain or architecture work progresses.

---

## 32. Existing System Use Cases

For existing systems, distinguish:

### Documented Use Cases

Interactions described in historical or current documentation.

### Observed Use Cases

Interactions supported by current system behavior, operational evidence, contracts, or actual usage.

### Target Use Cases

Interactions expected after the planned evolution.

| Use Case     | Documented | Observed  | Target    | Gap     |
| ------------ | ---------- | --------- | --------- | ------- |
| `<USE CASE>` | `<STATE>`  | `<STATE>` | `<STATE>` | `<GAP>` |

Observed behavior should be treated as evidence, not automatically as the desired future behavior.

---

## 33. System Evolution Use Cases

For system evolution, identify:

* preserved use cases;
* modified use cases;
* newly introduced use cases;
* removed use cases;
* use cases whose actors change;
* use cases whose business rules change;
* use cases whose outcomes change.

| Use Case  | Current Behavior | Target Behavior | Change Type |
| --------- | ---------------- | --------------- | ----------- |
| `<UC-ID>` | `<CURRENT>`      | `<TARGET>`      | `<TYPE>`    |

Focus analysis on the actual change boundary.

---

## 34. Use Case Change Management

Use cases may change because of:

* new product outcomes;
* changed requirements;
* changed scope;
* newly discovered business rules;
* actor changes;
* domain discoveries;
* external dependency changes;
* architecture constraints;
* regulatory changes.

### Change Procedure

1. Identify the proposed change.
2. Identify affected actors.
3. Identify affected outcomes.
4. Analyze affected requirements.
5. Analyze affected business rules.
6. Analyze scope impact.
7. Identify domain consequences.
8. Identify architecture consequences where applicable.
9. Update traceability.
10. Obtain required authorization.
11. Re-evaluate affected gates.

Changes must not be silently introduced into accepted use cases.

---

## 35. Use Case Impact Analysis

For consequential changes, evaluate:

* actors;
* product outcomes;
* requirements;
* business rules;
* scope;
* domain behavior;
* contracts;
* data;
* security;
* quality attributes;
* architecture;
* infrastructure;
* verification.

The depth of analysis should be proportional to the impact of the change.

---

## 36. Use Case Traceability

Typical relationships include:

| Relationship     | Target                |
| ---------------- | --------------------- |
| `DERIVES_FROM`   | Product Outcome       |
| `REALIZES`       | Requirement           |
| `INVOLVES`       | Actor                 |
| `GOVERNS`        | Business Rule         |
| `SUPPORTS`       | Product Capability    |
| `CONTRIBUTES_TO` | Product Outcome       |
| `DEPENDS_ON`     | External System       |
| `REFINES`        | Product Requirement   |
| `INFLUENCES`     | Domain Capability     |
| `INFLUENCES`     | Architecture Element  |
| `VERIFIES`       | Verification Artifact |
| `SUPERSEDES`     | Previous Use Case     |

Traceability should remain proportional to project complexity.

---

## 37. Use Case Review Checklist

### Behavioral Clarity

* [ ] The actor is identified.
* [ ] The actor's goal is clear.
* [ ] The intended outcome is clear.
* [ ] The trigger is understood.
* [ ] Preconditions are meaningful.
* [ ] The main success scenario is understandable.
* [ ] Important alternatives are identified.
* [ ] Important exceptions are identified.
* [ ] Postconditions are clear.

### Product Alignment

* [ ] The use case belongs to product scope.
* [ ] The use case supports an accepted outcome or requirement.
* [ ] Relevant actors are aligned with the actor model.
* [ ] Relevant business rules are identified.
* [ ] Important dependencies are visible.

### Abstraction

* [ ] The use case is technology-agnostic.
* [ ] It does not prescribe an API design.
* [ ] It does not prescribe database operations.
* [ ] It does not prescribe architecture.
* [ ] It does not describe implementation internals.

### Existing Systems

* [ ] Documented and observed behavior are distinguished when necessary.
* [ ] Target behavior is explicit for evolution work.
* [ ] Legacy behavior is not automatically treated as intended future behavior.

### Traceability

* [ ] Important requirements are traceable.
* [ ] Important outcomes are traceable.
* [ ] Significant business rules are traceable.
* [ ] Verification can eventually be associated with the expected behavior.

---

## 38. Gate Contribution

Product Use Cases contribute to the **Product Discovery Gate** and provide input to the **Domain Discovery Gate**.

Use-case analysis is sufficiently mature when:

1. significant actor goals are understood;
2. important product interactions are identified;
3. primary and supporting actors are distinguishable;
4. important success and exception behavior is understood;
5. relevant business rules are identified;
6. use cases align with accepted scope;
7. important requirements and outcomes are traceable;
8. significant behavioral conflicts are identified;
9. blocking behavioral unknowns are resolved or explicitly governed;
10. the behavior can be analyzed further without introducing unsupported implementation assumptions.

The existence of a complete use-case catalog is not itself evidence that the gate should pass.

---

## 39. Compact Use Case Register

| ID       | Name     | Actor     | Goal     | Outcome    | Priority | Status     |
| -------- | -------- | --------- | -------- | ---------- | -------- | ---------- |
| `UC-001` | `<NAME>` | `<ACTOR>` | `<GOAL>` | `<OUT-ID>` | `HIGH`   | `ACCEPTED` |
| `UC-002` | `<NAME>` | `<ACTOR>` | `<GOAL>` | `<OUT-ID>` | `MEDIUM` | `PROPOSED` |

---

## 40. Agent Instructions

When defining product use cases, the agent must:

1. Describe actor goals and product behavior, not implementation details.
2. Keep use cases technology-agnostic.
3. Identify the primary actor based on responsibility and intent.
4. Distinguish primary actors from supporting actors.
5. Connect significant use cases to product outcomes and requirements.
6. Reference business rules rather than duplicating them.
7. Identify meaningful alternative and exception behavior.
8. Avoid creating a separate use case for every technical operation.
9. Avoid turning API endpoints into use cases automatically.
10. Avoid turning database transactions into use cases.
11. Preserve the distinction between use cases and domain models.
12. Treat external systems as participants where their behavior materially affects the interaction.
13. Distinguish documented, observed, and target use cases for existing systems.
14. Record behavioral uncertainty instead of inventing missing flows.
15. Analyze consequential changes before updating accepted use cases.
16. Maintain traceability to actors, outcomes, requirements, business rules, and verification.
17. Avoid excessive decomposition when it does not improve understanding.

### Safe Progression Rule

Before progressing into Domain Discovery, the agent should be able to answer:

> **"Do I understand the significant interactions through which actors pursue meaningful goals and the product produces its intended outcomes, including the important success, alternative, and exception behaviors?"**

If not, the agent should continue discovery or explicitly record the unresolved uncertainty.

---

## 41. Anti-Patterns

### Endpoint = Use Case

Assuming every API endpoint represents an independent product use case.

### CRUD Use Case Explosion

Creating separate product use cases for every create, read, update, and delete operation.

### Technical Flow

Describing controllers, services, database calls, queues, or framework behavior instead of product behavior.

### Actor Confusion

Using the technical caller as the business actor without analyzing the underlying responsibility.

### Happy Path Only

Ignoring meaningful alternative and exception behavior.

### Over-Decomposition

Breaking one coherent actor goal into dozens of artificial use cases.

### Under-Decomposition

Combining unrelated goals into one use case because they happen to use the same technical component.

### Requirement Duplication

Copying requirements and business rules into every use case instead of maintaining explicit references.

### Architecture Leakage

Using use cases to justify a predetermined architecture.

### Legacy Behavior = Future Requirement

Assuming every existing interaction must remain unchanged during system evolution.

### Unsupported Behavior

Inventing flows because they are common in similar products.

### Documentation Theater

Creating detailed use-case narratives that do not improve product or domain understanding.

---

## 42. Final Principle

**Product use cases provide a behavioral bridge between product intent and domain understanding.**

They explain how actors pursue meaningful goals and how the product is expected to respond, without prematurely deciding how that behavior will be implemented.

A strong use-case model answers:

> **Who is trying to accomplish what, why does it matter, what should happen, what can prevent success, and what meaningful result should exist afterward?**

That understanding should be sufficient to enter Domain Discovery without prematurely imposing technical structure on the product.
