# Domain Context

## 1. Document Metadata

| Field                     | Description                                                         |
| | Lifecycle Phase | Domain Discovery |
------------------------- | ------------------------------------------------------------------- |
| Document ID               | Unique identifier for the Domain Context                            |
| Version                   | Current document version                                            |
| Status                    | `DRAFT`, `UNDER_REVIEW`, `ACCEPTED`, `SUPERSEDED`                   |
| Created                   | Creation date                                                       |
| Updated                   | Last update date                                                    |
| Project                   | Project or system name                                              |
| Discovery Scope           | Domain, capability, product area, or change boundary under analysis |
| Discovery Mode            | `GREENFIELD`, `EXISTING_SYSTEM`, `SYSTEM_EVOLUTION`                 |
| Owner                     | Responsible role or person                                          |
| Reviewers                 | Relevant domain reviewers                                           |
| Related Product Artifacts | Product Discovery artifacts informing this analysis                 |
| Related Domain Artifacts  | Related domain discovery artifacts                                  |

---

# 2. Purpose

This document establishes the initial domain context required for Domain Discovery and Domain-Driven Design analysis.

Its purpose is to transform validated product understanding into a structured view of the business domain without prematurely defining technical architecture.

It provides the foundation for investigating:

* domain boundaries;
* business capabilities;
* domain concepts;
* responsibilities;
* business rules;
* relationships;
* domain events;
* domain language;
* candidate bounded contexts;
* ownership boundaries.

This document does not define the final domain model.

---

# 3. Core Principle

Domain Discovery should answer:

> **What business concepts, responsibilities, behaviors, rules, and boundaries exist in the problem space?**

It should not begin with:

> Which services, databases, frameworks, APIs, or deployment units should we build?

Technology may eventually implement the domain, but it must not define the domain model prematurely.

---

# 4. Product-to-Domain Transition

Domain Discovery consumes Product Discovery as its primary upstream context.

The transition is:

```text
Product Problem
        ↓
Product Outcomes
        ↓
Actors
        ↓
Requirements
        ↓
Use Cases
        ↓
Business Rules
        ↓
Domain Exploration
        ↓
Capabilities
        ↓
Concepts
        ↓
Responsibilities
        ↓
Boundaries
```

The product context remains authoritative for product intent.

Domain Discovery interprets that intent in terms of business behavior and domain structure.

---

# 5. Domain Discovery Objectives

The objectives of Domain Discovery are to:

1. identify the relevant business domain;
2. establish the domain vocabulary;
3. identify major business capabilities;
4. identify important domain concepts;
5. identify responsibilities and ownership;
6. discover important business rules;
7. identify meaningful relationships;
8. identify domain behaviors and state changes;
9. identify important domain events;
10. identify candidate boundaries;
11. expose conflicting or ambiguous concepts;
12. distinguish core domain from supporting or generic concerns;
13. provide evidence for subsequent architecture decisions.

---

# 6. Domain Scope

Record the domain scope being analyzed.

```text
Domain Scope:
...

Included Capabilities:
...

Excluded Capabilities:
...

Deferred Areas:
...
```

The domain scope should be derived from product scope and current discovery objectives.

It should not automatically equal the entire business organization.

---

# 7. Domain Classification

Classify the domain or domain areas where evidence allows.

Possible classifications include:

```text
CORE
SUPPORTING
GENERIC
UNKNOWN
```

### Core Domain

Business capability providing significant differentiation or strategic value.

### Supporting Domain

Necessary business capability that supports the core domain but is not itself the primary differentiator.

### Generic Domain

Common capability where custom domain modeling provides limited strategic advantage.

### Unknown

Insufficient evidence exists to classify the area safely.

Classification must be evidence-based.

The agent must not classify a capability as Core merely because it appears important.

---

# 8. Domain Statement

Provide a concise description of the domain.

```text
Domain Statement:

The system operates in the domain of ...

The domain exists to ...

The primary business problem addressed by the domain is ...

The domain produces value by ...
```

The statement should describe business reality rather than technical implementation.

---

# 9. Domain Drivers

Identify the forces shaping the domain.

Examples include:

* business outcomes;
* customer needs;
* regulatory requirements;
* operational constraints;
* business policies;
* market differentiation;
* organizational responsibilities;
* risk management;
* financial considerations;
* compliance obligations.

For each driver record:

```text
Driver:
...

Why It Matters:
...

Evidence:
...

Affected Domain Areas:
...
```

---

# 10. Domain Actors

Identify actors participating in domain behavior.

Actors may include:

* customers;
* employees;
* administrators;
* business operators;
* external organizations;
* external systems;
* automated processes;
* regulatory entities.

For each actor distinguish:

```text
Actor
Business Role
Responsibilities
Authority
Interactions
Affected Capabilities
```

Do not infer technical authorization from business responsibility.

---

# 11. Domain Responsibilities

Identify responsibilities performed within the domain.

Examples:

```text
- Manage eligibility
- Determine pricing
- Validate a business condition
- Maintain a business lifecycle
- Calculate an amount
- Coordinate a business process
- Enforce a policy
```

Responsibilities should be expressed as business responsibilities.

Avoid implementation terminology such as:

* controller;
* service class;
* repository;
* endpoint;
* database table.

---

# 12. Business Capabilities

Identify major capabilities required by the domain.

A capability describes:

> **What the business is able to do.**

It does not describe how the system implements it.

Example:

```text
CAP-001
Name: Manage Eligibility
Purpose: Determine whether an actor satisfies the applicable business conditions.
Classification: CORE
```

For each capability record:

| Field          | Description                           |
| -------------- | ------------------------------------- |
| ID             | Unique identifier                     |
| Name           | Business capability                   |
| Purpose        | What it enables                       |
| Business Value | Why it matters                        |
| Actors         | Relevant actors                       |
| Outcomes       | Supported outcomes                    |
| Rules          | Relevant business rules               |
| Inputs         | Important business information        |
| Outputs        | Important business results            |
| Dependencies   | Material dependencies                 |
| Classification | Core / Supporting / Generic / Unknown |
| Confidence     | HIGH / MEDIUM / LOW                   |

---

# 13. Capability Decomposition

Capabilities may be decomposed when necessary.

Example:

```text
Manage Orders
├── Capture Order
├── Validate Order
├── Fulfill Order
└── Track Order
```

Decomposition should stop when additional detail no longer improves understanding.

The agent must avoid turning every operation into a separate capability.

---

# 14. Domain Concepts

Identify concepts that have meaningful business semantics.

Examples may include:

* Customer;
* Order;
* Contract;
* Eligibility;
* Payment;
* Subscription;
* Claim;
* Reservation;
* Product;
* Policy.

A concept should exist because it has domain meaning, not merely because it may eventually become a class or table.

For each concept record:

```text
Concept:
...

Meaning:
...

Purpose:
...

Business Responsibility:
...

Related Rules:
...

Related Capabilities:
...

Related Actors:
...

Evidence:
...

Confidence:
...
```

---

# 15. Concept Classification

Concepts may be classified as:

```text
ENTITY
VALUE_OBJECT
DOMAIN_POLICY
DOMAIN_SERVICE
DOMAIN_EVENT
DOMAIN_ROLE
DOMAIN_STATE
DOMAIN_RELATIONSHIP
DOMAIN_CONCEPT
UNKNOWN
```

Classification should remain provisional until sufficient domain evidence exists.

Do not force a DDD tactical pattern merely because a concept exists.

---

# 16. Domain Language

Establish the language used to describe the domain.

For important terms record:

| Term   | Definition | Synonyms | Conflicts | Status      |
| ------ | ---------- | -------- | --------- | ----------- |
| Term A | —          | —        | —         | ACCEPTED    |
| Term B | —          | —        | —         | CONFLICTING |

Possible statuses:

```text
PROPOSED
ACCEPTED
CONFLICTING
DEPRECATED
UNKNOWN
```

The language should reflect the terminology used by relevant domain participants.

---

# 17. Synonyms and Homonyms

Explicitly identify:

### Synonyms

Different terms referring to the same concept.

```text
"Client"
"Customer"
```

### Homonyms

The same term referring to different concepts.

```text
"Account"
→ Financial account

"Account"
→ User account
```

These distinctions are particularly important when evaluating candidate bounded contexts.

---

# 18. Domain Rules

Map known business rules into domain areas.

For each relevant rule identify:

```text
Rule:
...

Applies To:
...

Enforced By:
...

Affected Capability:
...

Affected Concept:
...

Source:
...
```

The domain context should reference the authoritative business-rule artifact rather than duplicate all rules.

---

# 19. Invariants

Identify business conditions that must remain true.

Examples:

```text
- A confirmed transaction cannot return to an editable state.
- A resource cannot be allocated twice simultaneously.
- A settlement cannot exceed the authorized amount.
```

Only identify invariants supported by domain evidence.

Invariants are particularly important because they may later influence:

* aggregate boundaries;
* transactional consistency;
* ownership;
* state transitions.

---

# 20. Domain Behavior

Describe important business behaviors.

Focus on:

* decisions;
* validations;
* calculations;
* state transitions;
* eligibility;
* coordination;
* policy enforcement.

Avoid describing:

* HTTP flows;
* database operations;
* framework behavior;
* infrastructure orchestration.

---

# 21. Domain Lifecycles

Identify concepts with meaningful business lifecycles.

Example:

```text
Requested
    ↓
Validated
    ↓
Approved
    ↓
Activated
    ↓
Completed
```

For each lifecycle record:

```text
Concept:
...

States:
...

Transitions:
...

Transition Conditions:
...

Responsible Actor:
...

Business Rules:
...

Invalid Transitions:
...
```

Do not assume that every status field represents a meaningful domain lifecycle.

---

# 22. Domain Events

Identify meaningful business events.

A domain event represents something significant that has happened in the domain.

Examples:

```text
OrderPlaced
PaymentAuthorized
SubscriptionActivated
ClaimApproved
ReservationCancelled
```

For each event record:

```text
Event:
...

Meaning:
...

Trigger:
...

Source Concept:
...

Affected Capabilities:
...

Interested Participants:
...

Business Consequence:
...

Evidence:
...
```

Do not confuse domain events with technical messaging events.

---

# 23. Policies and Decisions

Identify policies governing domain behavior.

Examples:

* eligibility policy;
* pricing policy;
* approval policy;
* allocation policy;
* cancellation policy;
* compliance policy.

For each policy record:

```text
Policy:
...

Purpose:
...

Applies To:
...

Conditions:
...

Outcome:
...

Authority:
...

Source:
...
```

Policies may later influence domain services, aggregates, processes, or bounded contexts, but no implementation decision should be assumed here.

---

# 24. Domain Relationships

Identify meaningful business relationships.

Examples:

```text
Customer → places → Order
Order → contains → Order Item
Policy → governs → Eligibility
Payment → settles → Obligation
```

Relationships should represent business semantics rather than database relationships.

---

# 25. Responsibility and Ownership

For each important concept or capability identify the current understanding of ownership.

Possible ownership states:

```text
CLEAR
SHARED
CONTESTED
UNKNOWN
EXTERNAL
```

Record:

```text
Concept / Capability:
...

Responsible Actor:
...

Business Authority:
...

Owning Domain Area:
...

Confidence:
...
```

Ownership ambiguity is especially important because it may affect future domain boundaries.

---

# 26. Candidate Domain Boundaries

Identify potential boundaries where business meaning, responsibility, language, rules, or ownership differ.

A candidate boundary may emerge from:

* distinct business responsibilities;
* different terminology;
* different policies;
* different invariants;
* different ownership;
* different change patterns;
* different actors;
* different business lifecycles.

Example:

```text
Candidate Boundary:
Eligibility Management

Evidence:
- Different business rules
- Separate responsibility
- Independent policy ownership

Confidence:
MEDIUM

Status:
PROPOSED
```

Candidate boundaries are hypotheses until validated.

---

# 27. Bounded Context Candidates

A bounded context candidate should describe a coherent model boundary.

For each candidate record:

```text
Candidate:
...

Purpose:
...

Core Responsibility:
...

Ubiquitous Language:
...

Key Concepts:
...

Key Rules:
...

Actors:
...

Capabilities:
...

Boundary Evidence:
...

Relationships:
...

Confidence:
...

Status:
PROPOSED / ACCEPTED / REJECTED / UNKNOWN
```

The existence of a bounded context candidate does not automatically imply a microservice.

---

# 28. Context Boundary Evidence

Evaluate each candidate boundary using evidence.

Relevant dimensions include:

| Dimension                | Observation |
| ------------------------ | ----------- |
| Language                 | —           |
| Business Responsibility  | —           |
| Ownership                | —           |
| Rules                    | —           |
| Invariants               | —           |
| Lifecycle                | —           |
| Actors                   | —           |
| Change Pattern           | —           |
| Data Responsibility      | —           |
| Dependencies             | —           |
| Operational Independence | —           |

Operational independence should not dominate the analysis.

The primary concern is business model coherence.

---

# 29. Context Relationships

Identify relationships between candidate contexts.

Possible relationships may include:

```text
UPSTREAM
DOWNSTREAM
CUSTOMER_SUPPLIER
CONFORMIST
ANTI_CORRUPTION_LAYER
SHARED_KERNEL
OPEN_HOST_SERVICE
PUBLISHED_LANGUAGE
PARTNERSHIP
SEPARATE_WAYS
UNKNOWN
```

These classifications should be used only when the relationship is sufficiently understood.

Do not force DDD relationship patterns prematurely.

---

# 30. Domain-to-Product Alignment

Validate the relationship between domain findings and Product Discovery.

Check:

```text
Product Outcome
        ↓
Capability
        ↓
Domain Responsibility
        ↓
Domain Behavior
```

Identify:

* supported outcomes;
* unsupported outcomes;
* newly discovered capabilities;
* missing business rules;
* conflicting product assumptions.

Domain Discovery may reveal that Product Discovery needs revision.

---

# 31. Domain Gaps

Record important missing domain understanding.

Examples:

* unknown business owner;
* unclear lifecycle;
* ambiguous terminology;
* missing rule;
* unclear responsibility;
* unresolved concept;
* uncertain context boundary;
* unknown external responsibility.

Each gap should include:

```text
Gap:
...

Impact:
...

Blocking:
YES / NO

Resolution:
...

Owner:
...
```

---

# 32. Domain Conflicts

Record contradictions.

Examples:

```text
Two stakeholders use the same term differently.

Two capabilities appear to own the same rule.

A business rule conflicts with a product requirement.

Two candidate contexts claim the same invariant.
```

Do not resolve these silently.

---

# 33. Domain Unknowns

Maintain explicit uncertainty.

Classify each unknown as:

```text
NON_BLOCKING
DECISION_RELEVANT
GATE_BLOCKING
```

Examples:

```text
- Ownership of concept X is unknown.
- Lifecycle of concept Y is partially understood.
- Responsibility for rule Z is contested.
```

Unknowns should be reduced according to consequence, not eliminated mechanically.

---

# 34. Domain Assumptions

Record assumptions introduced during domain analysis.

For each assumption:

```text
Assumption:
...

Why Needed:
...

Evidence:
...

Confidence:
...

Impact If False:
...

Validation Method:
...
```

An inferred domain structure must never silently become an accepted fact.

---

# 35. Existing System Domain Analysis

For existing systems distinguish:

```text
Documented Domain:
...

Observed Domain:
...

Target Domain:
...
```

The observed behavior should be treated as evidence of the current system, not automatically as the desired domain model.

Legacy implementation structures must not automatically become domain boundaries.

---

# 36. System Evolution Domain Analysis

For system evolution identify:

```text
Current Domain Boundary:
...

Change Intent:
...

Affected Capabilities:
...

Affected Concepts:
...

Affected Rules:
...

Affected Contexts:
...

New Domain Requirements:
...

Migration Considerations:
...
```

Focus analysis on the change boundary while preserving relevant existing context.

---

# 37. Domain Decisions

Record consequential domain decisions.

Examples:

* accepted domain definition;
* accepted terminology;
* accepted capability ownership;
* accepted domain boundary;
* accepted context boundary;
* accepted business responsibility.

Technical architecture decisions do not belong here unless they are already established external constraints.

---

# 38. Domain Decision Boundary

The agent should distinguish:

```text
Domain Finding
        ↓
Domain Hypothesis
        ↓
Domain Recommendation
        ↓
Domain Decision
```

A proposed bounded context is not automatically an accepted bounded context.

A candidate domain concept is not automatically a finalized domain model.

---

# 39. Domain Traceability

Maintain relationships such as:

```text
Product Outcome
    ↓
Capability
    ↓
Domain Concept
    ↓
Business Rule
    ↓
Domain Behavior
    ↓
Domain Boundary
```

Useful relationships include:

```text
DERIVES_FROM
REALIZES
SUPPORTS
GOVERNS
CONSTRAINS
OWNS
PARTICIPATES_IN
RELATES_TO
TRIGGERS
PRODUCES
CONSUMES
INFLUENCES
CONFLICTS_WITH
SUPERSEDES
```

Traceability should remain proportional to domain complexity.

---

# 40. Domain Discovery Readiness

Domain Discovery should not be considered complete merely because concepts have been listed.

The agent should evaluate whether the following are sufficiently understood:

* domain scope;
* major capabilities;
* important business concepts;
* domain language;
* responsibilities;
* business rules;
* important invariants;
* relevant lifecycles;
* meaningful domain behavior;
* important domain events;
* ownership;
* candidate boundaries;
* significant context relationships;
* major domain conflicts;
* important unknowns.

---

# 41. Domain Discovery Gate

Possible outcomes:

```text
READY
READY_WITH_RISKS
BLOCKED
INCOMPLETE
WAIVED
```

### READY

The domain structure is sufficiently understood for architecture analysis.

### READY_WITH_RISKS

Architecture can proceed while explicit domain uncertainties remain.

### BLOCKED

Important unresolved domain questions prevent safe architecture decisions.

### INCOMPLETE

Domain analysis is not yet sufficiently developed.

### WAIVED

A required domain analysis item has been explicitly waived by authorized decision.

---

# 42. Architecture Readiness Boundary

Before entering Architecture / C4, the agent should be able to answer:

> Do we understand the major domain responsibilities, capabilities, concepts, business rules, ownership boundaries, candidate contexts, and domain relationships well enough to make architecture decisions without inventing the business model?

If not, Architecture should not silently compensate for missing domain understanding.

---

# 43. Handoff to Architecture

The handoff should identify:

### Established Domain Understanding

* accepted capabilities;
* accepted concepts;
* accepted rules;
* accepted responsibilities;
* accepted boundaries.

### Proposed Domain Understanding

* candidate contexts;
* provisional concepts;
* proposed relationships.

### Open Domain Questions

* unresolved concepts;
* ownership questions;
* unresolved boundaries;
* unknown relationships.

### Architectural Implications

Only implications supported by domain evidence.

### Domain Constraints

Rules or boundaries architecture must respect.

---

# 44. Feedback to Product Discovery

Domain Discovery may identify information requiring Product Discovery revision.

Examples:

* previously unknown actor;
* conflicting business rule;
* incorrect product assumption;
* missing outcome;
* incorrect scope;
* newly identified dependency;
* domain responsibility not represented in product context.

These findings should be propagated upstream through controlled change rather than silently modifying product artifacts.

---

# 45. Review Checklist

### Context

* [ ] Domain scope is explicit.
* [ ] Domain statement is understandable.
* [ ] Domain drivers are identified.
* [ ] Product context has been reviewed.

### Capabilities

* [ ] Major business capabilities are identified.
* [ ] Capability responsibilities are clear.
* [ ] Core/supporting/generic classification is evidence-based.

### Concepts

* [ ] Important domain concepts are identified.
* [ ] Domain language is explicit.
* [ ] Synonyms and homonyms are identified.
* [ ] Concept classifications are appropriately provisional.

### Behavior

* [ ] Important business rules are identified.
* [ ] Invariants are identified where relevant.
* [ ] Important lifecycles are understood.
* [ ] Important domain events are identified.
* [ ] Policies are identified.

### Boundaries

* [ ] Ownership is sufficiently understood.
* [ ] Candidate boundaries are evidence-based.
* [ ] Candidate bounded contexts are explicit.
* [ ] Context relationships are not assumed without evidence.

### Uncertainty

* [ ] Unknowns are explicit.
* [ ] Assumptions are explicit.
* [ ] Conflicts are explicit.
* [ ] Blocking uncertainty is identified.

### Existing / Evolution

* [ ] Documented, observed, and target states are distinguished where relevant.
* [ ] Legacy structures have not automatically become domain boundaries.
* [ ] Change boundaries are explicit for evolution work.

### Transition

* [ ] Domain decisions are explicit.
* [ ] Traceability is sufficient.
* [ ] Architecture-relevant implications are identified.
* [ ] Domain gate result is explicit.

---

# 46. Agent Instructions

When creating or reviewing this artifact, the agent must:

1. Consume the Product Discovery Summary and relevant Product Discovery artifacts.
2. Establish domain understanding before proposing architecture.
3. Use business language rather than implementation terminology.
4. Identify capabilities before decomposing technical components.
5. Distinguish domain concepts from technical entities.
6. Identify ownership explicitly.
7. Treat bounded contexts as evidence-based hypotheses until accepted.
8. Preserve alternative interpretations where uncertainty remains.
9. Never infer a microservice from a bounded context automatically.
10. Never derive domain boundaries solely from database tables, code modules, APIs, or deployment units.
11. Record business rules and invariants explicitly.
12. Identify important lifecycles and state transitions.
13. Distinguish domain events from technical messaging events.
14. Preserve contradictions instead of silently resolving them.
15. Track assumptions and confidence.
16. Validate domain findings against product intent.
17. Propagate material domain findings back to Product Discovery when necessary.
18. Avoid tactical DDD modeling when strategic domain understanding is insufficient.
19. Scale analysis according to project complexity and risk.
20. Use evidence before inference.

---

# 47. Anti-Patterns

## 47.1 Database-Driven Domain Modeling

Using existing tables as the domain model without validating their business meaning.

---

## 47.2 Service-First Modeling

Creating domain boundaries from anticipated services.

---

## 47.3 Microservice-Driven DDD

Assuming every bounded context must become a microservice.

---

## 47.4 CRUD Capability Inflation

Treating every CRUD operation as a business capability.

---

## 47.5 Technical Concepts as Domain Concepts

Using terms such as controller, repository, endpoint, DTO, or database table as domain concepts.

---

## 47.6 Forced Tactical Patterns

Creating aggregates, value objects, domain services, or entities before their domain responsibility is understood.

---

## 47.7 False Ubiquitous Language

Declaring terminology without validating how domain participants actually use the terms.

---

## 47.8 Ignoring Ownership

Defining boundaries without understanding who owns the business responsibility.

---

## 47.9 Legacy Equals Domain Truth

Assuming that current implementation boundaries represent the correct domain boundaries.

---

## 47.10 Premature Bounded Contexts

Treating candidate boundaries as finalized architecture.

---

## 47.11 Event Technology Leakage

Treating Kafka topics, queues, webhooks, or messages as domain events merely because they carry business-looking data.

---

## 47.12 Architecture Leakage

Allowing infrastructure or technology preferences to determine the domain model.

---

# 48. Compact Domain Register

For quick inspection, maintain a compact register:

| ID      | Type       | Name | Status   | Confidence | Blocking |
| ------- | ---------- | ---- | -------- | ---------- | -------- |
| CAP-001 | Capability | —    | ACCEPTED | HIGH       | NO       |
| CON-001 | Concept    | —    | PROPOSED | MEDIUM     | NO       |
| BND-001 | Boundary   | —    | PROPOSED | MEDIUM     | YES      |
| EVT-001 | Event      | —    | ACCEPTED | HIGH       | NO       |
| UNK-001 | Unknown    | —    | OPEN     | LOW        | YES      |

This register is a navigation aid, not a replacement for the detailed analysis.

---

# 49. Final Principle

> **Domain Discovery establishes the business structure that architecture must serve.**

The objective is not to produce a technically elegant model.

The objective is to make the business domain sufficiently explicit that subsequent architecture decisions can be made without silently inventing responsibilities, concepts, rules, or boundaries.

The transition is therefore:

```text
Product Understanding
        ↓
Domain Understanding
        ↓
Domain Boundaries
        ↓
Architecture
```

with controlled feedback whenever new evidence invalidates an earlier understanding.

