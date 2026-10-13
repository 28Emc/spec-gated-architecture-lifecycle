# Product Actors and Stakeholders

## 1. Document Metadata

| Field                   | Value                           |
| ----------------------- | ------------------------------- |
| Document ID             | `<ACTORS-ID>`                   |
| Title                   | Product Actors and Stakeholders |
| Version                 | `<VERSION>`                     |
| Status                  | `<STATUS>`                      |
| Date                    | `<DATE>`                        |
| Author                  | `<AUTHOR>`                      |
| Project                 | `<PROJECT-NAME>`                |
| Lifecycle Phase         | Product Discovery               |
| Related Product Context | `<PRODUCT-CONTEXT-ID>`          |
| Related Scope           | `<SCOPE-ID>`                    |
| Related Requirements    | `<REQUIREMENTS-REFERENCE>`      |
| Reviewers               | `<REVIEWERS>`                   |

---

## 2. Purpose

This document identifies and formalizes the people, organizations, systems, and other entities that interact with, depend on, influence, or are affected by the product.

It establishes a shared understanding of:

* who interacts with the product;
* who receives value from it;
* who provides information or capabilities to it;
* who owns or governs relevant responsibilities;
* which external systems participate in relevant flows;
* which stakeholders influence product decisions;
* which responsibilities belong inside or outside the product boundary.

The objective is to provide sufficient actor and stakeholder understanding for Product Discovery and subsequent Domain Discovery.

---

## 3. Core Principle

**An actor is an entity that participates in behavior involving the product; a stakeholder is an entity with an interest, responsibility, authority, or impact related to the product.**

These concepts may overlap, but they are not interchangeable.

For example:

* a customer may be both an actor and a stakeholder;
* an administrator may be an actor;
* a regulator may be a stakeholder without directly interacting with the product;
* an external payment system may be an external system actor;
* a business owner may influence decisions without using the system directly.

The agent must preserve these distinctions during analysis.

---

## 4. Actor and Stakeholder Model

The lifecycle recognizes the following primary entity types.

### 4.1 Human Actor

A person or identifiable class of people that directly interacts with the product.

Examples:

* customer;
* operator;
* administrator;
* reviewer;
* support agent.

### 4.2 Organizational Actor

An organization, department, business unit, or institutional entity that participates in product behavior.

### 4.3 External System Actor

A software system or service that exchanges information or triggers behavior with the product.

External systems remain outside the product boundary unless explicitly defined otherwise.

### 4.4 Stakeholder

An entity with an interest, authority, responsibility, dependency, or potential impact related to the product.

A stakeholder does not necessarily interact directly with the product.

### 4.5 Governance or Regulatory Actor

An authority or organization whose rules, obligations, approvals, or controls affect the product.

This entity may be an actor, stakeholder, or both.

---

## 5. Actor Register

Maintain a concise register of identified actors.

| ID        | Name      | Type              | Primary Relationship | Scope      | Status   |
| --------- | --------- | ----------------- | -------------------- | ---------- | -------- |
| `ACT-001` | `<ACTOR>` | `HUMAN`           | `<RELATIONSHIP>`     | `IN_SCOPE` | `ACTIVE` |
| `ACT-002` | `<ACTOR>` | `ORGANIZATIONAL`  | `<RELATIONSHIP>`     | `IN_SCOPE` | `ACTIVE` |
| `ACT-003` | `<ACTOR>` | `EXTERNAL_SYSTEM` | `<RELATIONSHIP>`     | `EXTERNAL` | `ACTIVE` |

---

## 6. Stakeholder Register

| ID        | Stakeholder     | Type     | Interest     | Influence         | Responsibility     | Status   |
| --------- | --------------- | -------- | ------------ | ----------------- | ------------------ | -------- |
| `STK-001` | `<STAKEHOLDER>` | `<TYPE>` | `<INTEREST>` | `LOW/MEDIUM/HIGH` | `<RESPONSIBILITY>` | `ACTIVE` |
| `STK-002` | `<STAKEHOLDER>` | `<TYPE>` | `<INTEREST>` | `LOW/MEDIUM/HIGH` | `<RESPONSIBILITY>` | `ACTIVE` |

Influence should describe the stakeholder's ability to affect relevant product decisions, not their organizational rank.

---

## 7. Actor Record

Each significant actor should have an explicit record.

### Actor

**ID:** `<ACTOR-ID>`

**Name:** `<ACTOR-NAME>`

**Type:** `<HUMAN | ORGANIZATIONAL | EXTERNAL_SYSTEM | OTHER>`

**Description:**

`<Describe the actor and why it is relevant.>`

**Primary Goal:**

`<What the actor is trying to accomplish.>`

**Relationship to Product:**

`<How the actor interacts with or depends on the product.>`

**Responsibilities:**

* `<RESPONSIBILITY-1>`
* `<RESPONSIBILITY-2>`

**Capabilities Used:**

* `<CAPABILITY-1>`
* `<CAPABILITY-2>`

**Information Provided:**

* `<INPUT-1>`
* `<INPUT-2>`

**Information Received:**

* `<OUTPUT-1>`
* `<OUTPUT-2>`

**Permissions or Authority:**

`<Describe only when supported by evidence.>`

**Frequency or Interaction Pattern:**

`<OPTIONAL DESCRIPTION>`

**Dependencies:**

* `<DEPENDENCY-1>`
* `<DEPENDENCY-2>`

**Related Requirements:**

* `<REQ-ID>`

**Related Business Rules:**

* `<RULE-ID>`

**Related Scope Items:**

* `<SCOPE-ID>`

**Evidence:**

* `<SOURCE-1>`

---

## 8. Stakeholder Record

Each significant stakeholder should have an explicit record.

### Stakeholder

**ID:** `<STAKEHOLDER-ID>`

**Name:** `<STAKEHOLDER-NAME>`

**Type:** `<TYPE>`

**Interest:**

`<What the stakeholder cares about.>`

**Expected Outcome:**

`<What successful product behavior means for this stakeholder.>`

**Influence:**

`<LOW | MEDIUM | HIGH>`

**Authority:**

`<Describe decision or governance authority when applicable.>`

**Responsibilities:**

* `<RESPONSIBILITY-1>`
* `<RESPONSIBILITY-2>`

**Risks or Concerns:**

* `<RISK-1>`
* `<RISK-2>`

**Affected Product Areas:**

* `<AREA-1>`
* `<AREA-2>`

**Related Requirements:**

* `<REQ-ID>`

**Related Decisions:**

* `<DECISION-ID>`

**Evidence:**

* `<SOURCE-1>`

---

## 9. Primary Users and Actors

Identify the actors that are directly relevant to the core product outcomes.

| Actor     | Primary Goal | Main Interaction | Expected Outcome |
| --------- | ------------ | ---------------- | ---------------- |
| `<ACTOR>` | `<GOAL>`     | `<INTERACTION>`  | `<OUTCOME>`      |

The agent should distinguish primary actors from secondary actors.

Primary actors directly participate in the product's core value-generating behavior.

Secondary actors may support, administer, govern, observe, or interact with less frequent capabilities.

---

## 10. Secondary and Supporting Actors

Identify actors that support the product without necessarily representing its primary use case.

Examples may include:

* administrators;
* support personnel;
* operational personnel;
* auditors;
* reviewers;
* integration systems;
* notification systems;
* identity providers;
* external data providers.

| Actor     | Supporting Responsibility | Related Capability | Interaction     |
| --------- | ------------------------- | ------------------ | --------------- |
| `<ACTOR>` | `<RESPONSIBILITY>`        | `<CAPABILITY>`     | `<INTERACTION>` |

Do not promote a supporting actor into a product capability merely because it participates in a technical flow.

---

## 11. External System Actors

External systems should be explicitly identified when they affect product behavior.

| ID        | System     | Purpose     | Direction                        | Data / Capability Exchanged | Ownership |
| --------- | ---------- | ----------- | -------------------------------- | --------------------------- | --------- |
| `EXT-001` | `<SYSTEM>` | `<PURPOSE>` | `INBOUND/OUTBOUND/BIDIRECTIONAL` | `<DATA>`                    | `<OWNER>` |

### External System Record

**ID:** `<EXT-ID>`

**Name:** `<SYSTEM-NAME>`

**Owner:** `<OWNER>`

**Purpose:**

`<Why this external system participates.>`

**Product Interaction:**

`<Describe the interaction.>`

**Data Exchanged:**

* `<DATA-1>`
* `<DATA-2>`

**Trigger:**

`<What initiates the interaction.>`

**Dependency Type:**

`<OPTIONAL | REQUIRED | CONDITIONAL>`

**Availability Dependency:**

`<Describe only if known.>`

**Contract Dependency:**

`<Describe only if known.>`

**Security Considerations:**

`<Describe known concerns.>`

**Related Scope:**

* `<SCOPE-ID>`

**Related Requirements:**

* `<REQ-ID>`

---

## 12. Stakeholder Interests

Stakeholders may have different or competing interests.

| Stakeholder     | Interest     | Priority          | Potential Conflict |
| --------------- | ------------ | ----------------- | ------------------ |
| `<STAKEHOLDER>` | `<INTEREST>` | `LOW/MEDIUM/HIGH` | `<CONFLICT>`       |

Typical interests may include:

* product value;
* operational efficiency;
* security;
* privacy;
* compliance;
* reliability;
* cost;
* delivery speed;
* maintainability;
* customer experience;
* business continuity.

Interests must not automatically become requirements.

They should be analyzed and converted into explicit requirements, constraints, or decisions only when appropriate.

---

## 13. Actor Goals

Actors should be associated with outcomes they are attempting to achieve.

| Actor     | Goal     | Expected Outcome | Related Product Outcome |
| --------- | -------- | ---------------- | ----------------------- |
| `<ACTOR>` | `<GOAL>` | `<OUTCOME>`      | `<PRODUCT-OUTCOME>`     |

Goals should describe intent rather than implementation.

Avoid goals such as:

> "Use the REST API."

Prefer:

> "Submit the required information successfully."

The implementation mechanism may be defined later.

---

## 14. Actor Responsibilities

Responsibilities should be explicit when they influence domain or product behavior.

| Actor     | Responsibility     | Boundary     | Evidence   |
| --------- | ------------------ | ------------ | ---------- |
| `<ACTOR>` | `<RESPONSIBILITY>` | `<BOUNDARY>` | `<SOURCE>` |

Responsibility is especially important when multiple actors or systems participate in the same business process.

---

## 15. Authority and Permissions

When actor authority affects product behavior, document it separately from authentication or technical implementation.

| Actor     | Business Authority | Allowed Responsibility | Source     |
| --------- | ------------------ | ---------------------- | ---------- |
| `<ACTOR>` | `<AUTHORITY>`      | `<RESPONSIBILITY>`     | `<SOURCE>` |

Examples may include:

* approving an action;
* reviewing information;
* managing a business process;
* changing a business rule;
* initiating a transaction.

Do not infer technical roles, permissions, or access-control mechanisms unless supported by evidence.

Business authority should later inform domain rules and security analysis.

---

## 16. Actor Interactions

Describe significant interactions at a business level.

| Interaction ID | Actor     | Product Capability | Intent     | Outcome     |
| -------------- | --------- | ------------------ | ---------- | ----------- |
| `INT-001`      | `<ACTOR>` | `<CAPABILITY>`     | `<INTENT>` | `<OUTCOME>` |

At this stage, interactions should remain technology-agnostic.

Do not prematurely define:

* HTTP endpoints;
* message brokers;
* database operations;
* framework-specific handlers;
* infrastructure components.

Those concerns belong to later lifecycle phases.

---

## 17. Actor Relationships

Relevant relationships may include:

* `USES`
* `PROVIDES`
* `CONSUMES`
* `TRIGGERS`
* `AUTHORIZES`
* `APPROVES`
* `DEPENDS_ON`
* `GOVERNS`
* `SUPPORTS`
* `AFFECTS`
* `REPORTS_TO`
* `INTEGRATES_WITH`

Use only relationships supported by evidence.

Do not create relationships merely because they are common in similar systems.

---

## 18. Actor and Scope Alignment

Every significant actor should have a clear relationship to product scope.

| Actor     | Scope Relationship | Relevant Scope Item | Explanation     |
| --------- | ------------------ | ------------------- | --------------- |
| `<ACTOR>` | `INTERNAL`         | `<SCOPE-ID>`        | `<EXPLANATION>` |
| `<ACTOR>` | `EXTERNAL`         | `<SCOPE-ID>`        | `<EXPLANATION>` |

An external actor may participate in an in-scope capability without becoming part of the product boundary.

---

## 19. Actor and Requirement Alignment

Significant requirements should identify affected actors where relevant.

| Requirement | Actor     | Expected Behavior | Verification     |
| ----------- | --------- | ----------------- | ---------------- |
| `<REQ-ID>`  | `<ACTOR>` | `<BEHAVIOR>`      | `<VERIFICATION>` |

Actor relationships should help answer:

> Who requires this behavior, performs it, receives its result, or is affected by it?

---

## 20. Actor and Business Rule Alignment

Business rules may apply to specific actors or classes of actors.

| Rule        | Actor     | Applicability     | Evidence   |
| ----------- | --------- | ----------------- | ---------- |
| `<RULE-ID>` | `<ACTOR>` | `<APPLICABILITY>` | `<SOURCE>` |

Actor applicability must not be confused with technical authorization mechanisms.

---

## 21. Actor Conflicts

Identify conflicts involving actors or stakeholders.

Examples:

* two stakeholders require incompatible outcomes;
* an actor's responsibility conflicts with another actor's responsibility;
* an external system is assumed to provide a capability it does not own;
* a stakeholder expects behavior that is outside product scope;
* business authority is unclear;
* multiple actors appear to own the same decision.

| Conflict     | Participants | Impact     | Severity                            | Resolution     |
| ------------ | ------------ | ---------- | ----------------------------------- | -------------- |
| `<CONFLICT>` | `<ACTORS>`   | `<IMPACT>` | `INFO/WARNING/SIGNIFICANT/BLOCKING` | `<RESOLUTION>` |

Unresolved responsibility conflicts may block Domain Discovery.

---

## 22. Actor Unknowns

Record unresolved questions about actors and stakeholders.

Examples:

* Who owns this responsibility?
* Is this actor internal or external?
* Who is authorized to perform this action?
* Is this external system mandatory?
* Which stakeholder has decision authority?
* Are two identified actors actually the same responsibility group?

| Unknown     | Affected Actor | Importance                 | Blocking Level | Resolution Method |
| ----------- | -------------- | -------------------------- | -------------- | ----------------- |
| `<UNKNOWN>` | `<ACTOR-ID>`   | `LOW/MEDIUM/HIGH/CRITICAL` | `<LEVEL>`      | `<METHOD>`        |

Do not invent actor identities, responsibilities, or authority.

---

## 23. Existing System Actor Analysis

For existing systems, distinguish:

### Documented Actors

Actors identified by existing documentation.

### Actual Actors

Actors observed through current behavior, runtime usage, contracts, operational processes, or other evidence.

### Target Actors

Actors expected to participate after the planned change.

| Actor     | Documented | Actual    | Target    | Conflict   |
| --------- | ---------- | --------- | --------- | ---------- |
| `<ACTOR>` | `<STATE>`  | `<STATE>` | `<STATE>` | `<YES/NO>` |

Actual behavior may reveal actors that are absent from historical documentation.

Such discrepancies must be explicitly recorded.

---

## 24. System Evolution Actor Analysis

When modifying an existing system, identify:

* actors affected by the change;
* actors newly introduced;
* actors removed;
* actors whose responsibilities change;
* actors whose authority changes;
* external systems whose interactions change.

| Actor     | Current Relationship | Target Relationship | Change     |
| --------- | -------------------- | ------------------- | ---------- |
| `<ACTOR>` | `<CURRENT>`          | `<TARGET>`          | `<CHANGE>` |

Actor analysis should remain focused on the change boundary rather than unnecessarily redefining the entire ecosystem.

---

## 25. Actor Impact Analysis

Changes affecting actors should consider:

* user experience;
* responsibilities;
* business authority;
* permissions;
* business rules;
* product outcomes;
* external dependencies;
* security;
* privacy;
* contracts;
* operational processes;
* training or organizational impact when relevant.

The analysis depth must be proportional to the consequences of the change.

---

## 26. Actor Traceability

Typical relationships include:

| Relationship      | Target                  |
| ----------------- | ----------------------- |
| `DERIVES_FROM`    | Product Context         |
| `PARTICIPATES_IN` | Product Capability      |
| `USES`            | Product Capability      |
| `INFLUENCES`      | Requirement             |
| `AFFECTS`         | Requirement             |
| `GOVERNS`         | Business Rule           |
| `AUTHORIZES`      | Business Responsibility |
| `DEPENDS_ON`      | External System         |
| `INFLUENCES`      | Domain Boundary         |
| `INFLUENCES`      | Architecture Boundary   |
| `VERIFIES`        | Acceptance Criterion    |

Traceability should be used where it provides meaningful evidence, not as a requirement to connect every artifact to every actor.

---

## 27. Actor Review Checklist

### Identification

* [ ] Primary actors are identified.
* [ ] Secondary actors are identified where relevant.
* [ ] Relevant stakeholders are identified.
* [ ] External system actors are identified.
* [ ] Governance or regulatory actors are identified where applicable.

### Responsibilities

* [ ] Significant responsibilities are explicit.
* [ ] Responsibility boundaries are understood.
* [ ] Business authority is distinguished from technical authorization.
* [ ] Ownership conflicts are identified.

### Product Alignment

* [ ] Actors are aligned with product scope.
* [ ] Significant actor goals are aligned with product outcomes.
* [ ] Significant requirements have relevant actor relationships.
* [ ] Relevant business rules identify their applicability.

### External Dependencies

* [ ] External systems are distinguished from internal product responsibilities.
* [ ] Important data or capability exchanges are understood.
* [ ] External dependencies are documented where consequential.

### Uncertainty

* [ ] Unknown actor responsibilities are explicit.
* [ ] Unsupported assumptions are not presented as facts.
* [ ] Blocking actor uncertainties are identified.

### Existing Systems

* [ ] Documented, actual, and target actor relationships are distinguished when necessary.
* [ ] Legacy behavior has been treated as evidence rather than automatic authority.

---

## 28. Gate Contribution

Actor and stakeholder analysis contributes to the **Product Discovery Gate** and provides input to the **Domain Discovery Gate**.

The analysis is sufficiently mature when:

1. primary actors are understood;
2. significant stakeholders are identified;
3. major external system actors are known;
4. relevant responsibilities are distinguishable;
5. significant authority relationships are understood;
6. important actor-to-capability relationships are traceable;
7. material conflicts are identified;
8. blocking unknowns are resolved or explicitly governed;
9. actor boundaries do not contradict product scope;
10. the available information is sufficient to begin domain analysis without unsupported assumptions.

---

## 29. Compact Actor Register

| ID        | Entity     | Type              | Goal / Interest | Relationship     | Scope      | Status   |
| --------- | ---------- | ----------------- | --------------- | ---------------- | ---------- | -------- |
| `ACT-001` | `<ENTITY>` | `HUMAN`           | `<GOAL>`        | `<RELATIONSHIP>` | `IN_SCOPE` | `ACTIVE` |
| `ACT-002` | `<ENTITY>` | `EXTERNAL_SYSTEM` | `<PURPOSE>`     | `<RELATIONSHIP>` | `EXTERNAL` | `ACTIVE` |
| `STK-001` | `<ENTITY>` | `STAKEHOLDER`     | `<INTEREST>`    | `<INFLUENCE>`    | `<SCOPE>`  | `ACTIVE` |

---

## 30. Agent Instructions

When analyzing actors and stakeholders, the agent must:

1. Distinguish actors from stakeholders.
2. Distinguish human, organizational, external-system, and governance actors where relevant.
3. Identify responsibilities rather than inventing technical roles.
4. Treat external systems as external unless explicitly included in the product boundary.
5. Never infer authority or permissions without evidence.
6. Distinguish business authority from technical access control.
7. Trace significant actors to capabilities, requirements, and business rules.
8. Identify conflicting responsibilities and ownership.
9. Distinguish documented, actual, and target actors in existing systems.
10. Treat observed legacy behavior as evidence, not automatically as intended future behavior.
11. Avoid technology-specific interaction descriptions during Product Discovery.
12. Record important unknowns rather than inventing actor identities or responsibilities.
13. Reassess actor relationships when scope, requirements, or business rules change.
14. Preserve historical relationships when actors or responsibilities evolve.
15. Avoid creating unnecessary actor categories when a simpler responsibility boundary is sufficient.

### Safe Progression Rule

Before progressing into Domain Discovery, the agent should be able to answer:

> **"Do I understand who participates in the product's relevant behavior, who owns or influences important responsibilities, and where the significant internal and external responsibility boundaries lie?"**

If not, the agent should continue discovery or identify the blocking uncertainty.

---

## 31. Anti-Patterns

### Actor = User

Assuming every relevant actor must be a human user.

### Stakeholder = Actor

Assuming every stakeholder directly interacts with the product.

### Technical Role Projection

Creating technical roles such as `ADMIN`, `USER`, or `SERVICE` without evidence of the underlying business responsibility.

### External System as Internal Capability

Treating an external provider as if it were part of the product boundary.

### Permission Guessing

Inferring authorization rules from common application patterns.

### Organizational Assumption

Assuming ownership or authority based solely on organizational titles.

### Actor Explosion

Creating excessive actor categories that do not represent meaningful behavioral or responsibility differences.

### Actor Omission

Ignoring support, operations, governance, or external-system participants because they are not primary users.

### Legacy Actor Assumption

Treating every actor that interacts with an existing system as an intended future actor.

### Technology-Driven Interaction

Defining actors around APIs, queues, databases, frameworks, or infrastructure before understanding the underlying business interaction.

### Documentation Theater

Creating actor catalogs without clarifying actual responsibilities, goals, or boundaries.

---

## 32. Final Principle

**Actors and stakeholders provide the human, organizational, and systemic perspective required to understand product responsibility.**

The objective is not to create an exhaustive list of every entity that could interact with the system.

The objective is to establish enough clarity about participants, interests, responsibilities, authority, and boundaries to support reliable product decisions and subsequent domain analysis.

A strong actor model answers:

> **Who participates, who benefits, who provides, who governs, who is affected, and where does each responsibility begin and end?**
