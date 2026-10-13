# Domain Events

## 1. Document Metadata

| Field                   | Value                    |
| ----------------------- | ------------------------ |
| Document Type           | Domain Events            |
| Lifecycle Phase         | Domain Discovery / DDD   |
| Scope                   | Domain / Bounded Context |
| Status                  | `DRAFT`                  |
| Version                 | `0.1`                    |
| Owner                   | `<owner>`                |
| Created                 | `<date>`                 |
| Last Updated            | `<date>`                 |
| Related Bounded Context | `<bounded-context>`      |
| Related Domain Model    | `<domain-model>`         |

---

## 2. Purpose

This document identifies and defines meaningful events that occur within the domain.

A Domain Event represents a business-significant fact that has already occurred.

It captures:

* What happened
* Why it matters to the domain
* Which domain behavior caused it
* Which domain concepts were affected
* Which facts are relevant
* What state changed
* Which domain rules were involved
* Which other domain behavior may react to the occurrence

This document is intentionally independent from:

* Message brokers
* Event buses
* Queues
* Topics
* HTTP
* Serialization formats
* Cloud infrastructure
* Framework-specific event mechanisms

Those concerns belong to later architecture and contract decisions.

---

# 3. Core Principle

> **A Domain Event represents a meaningful business occurrence, not a technical message.**

The following concepts must remain distinct:

```text
Domain Event
     ↓
Business occurrence
     ↓
May influence other domain behavior
     ↓
May later become an integration event
     ↓
May later be transported as a message
```

Therefore:

```text
Domain Event ≠ Integration Event
Domain Event ≠ Message
Domain Event ≠ API Request
Domain Event ≠ Database Event
Domain Event ≠ Notification
```

Whether a Domain Event crosses a bounded-context or system boundary is an architectural decision that must be made later.

---

# 4. Entry Conditions

Domain Event discovery should use evidence from:

* Domain processes
* Domain model
* Aggregates
* Aggregate operations
* Business rules
* State transitions
* Use cases
* Outcomes
* Bounded contexts
* Actor interactions
* Existing system behavior
* Relevant domain decisions

Domain Events should not be invented simply because an asynchronous architecture is being considered.

---

# 5. Event Discovery Objectives

The event model should identify meaningful occurrences that:

1. Represent a change or fact relevant to the domain.
2. Have clear semantic meaning.
3. Can be associated with domain behavior.
4. Have identifiable ownership or origin.
5. Can be connected to an aggregate or domain concept when appropriate.
6. Explain relevant state transitions.
7. Help understand consequential domain behavior.
8. Provide evidence for later integration decisions when applicable.

The objective is not to maximize event count.

---

# 6. Event Catalog

Maintain a compact catalog of identified Domain Events.

| ID      | Name      | Meaning     | Origin       | Aggregate     | Status     | Confidence     |
| ------- | --------- | ----------- | ------------ | ------------- | ---------- | -------------- |
| EVT-001 | `<event>` | `<meaning>` | `<behavior>` | `<aggregate>` | `<status>` | `<confidence>` |

Possible statuses:

* `IDENTIFIED`
* `PROPOSED`
* `UNDER_REVIEW`
* `ACCEPTED`
* `ACTIVE`
* `SUPERSEDED`
* `DEPRECATED`
* `REJECTED`
* `UNKNOWN`

---

# 7. Domain Event Definition

Each significant Domain Event should have an explicit definition.

```text id="p0z1c4"
ID:
Name:

Meaning:
<what happened?>

Business Significance:
<why does it matter?>

Origin:
<domain behavior that caused it>

Aggregate:
<originating aggregate>

Domain Concept:
<relevant concept>

Trigger:
<what caused the occurrence>

Preconditions:
<conditions before occurrence>

Result:
<domain result>

State Changes:
<changes>

Rules Applied:
<rules>

Invariants:
<invariants>

Relevant Facts:
<facts carried by the event>

Consumers:
<domain consumers, if known>

Evidence:
<evidence>

Confidence:
<HIGH | MEDIUM | LOW>

Status:
<status>
```

---

# 8. Event Naming

Domain Events should normally be expressed as facts that already happened.

Preferred conceptual form:

```text
<Concept><PastTense>
```

Examples:

```text
OrderPlaced
PaymentAuthorized
ReservationConfirmed
ApplicationRejected
AccountActivated
SubscriptionCancelled
```

These are illustrative only.

The actual event vocabulary must come from the domain.

Avoid names based primarily on technical operations:

```text
CreateOrderEvent
UpdateOrderMessage
SendPaymentRequest
DatabaseRecordUpdated
HTTPRequestReceived
```

The event should communicate **business meaning**, not implementation mechanics.

---

# 9. Event Semantics

Every event must answer:

> What became true because this event occurred?

Example structure:

```text id="q8x9p2"
Before:
<relevant domain state>

Domain Behavior:
<behavior>

Event:
<business fact>

After:
<relevant domain state>

Business Consequence:
<meaning>
```

If the answer cannot be expressed in domain language, the candidate may not be a Domain Event.

---

# 10. Event Origin

Identify the behavior that produces the event.

```text id="4h1m9n"
Domain Behavior:
<operation>

Initiating Actor:
<actor>

Aggregate:
<aggregate>

Preconditions:
<conditions>

Behavior:
<description>

Event Produced:
<event>

Result:
<result>
```

The event should normally be a consequence of successful domain behavior rather than an arbitrary technical signal.

---

# 11. Event Ownership

Identify which bounded context owns the meaning of the event.

```text id="v6k2ra"
Event:
<event>

Owning Bounded Context:
<context>

Owning Domain Concept:
<concept>

Originating Aggregate:
<aggregate>

Business Authority:
<who defines its meaning>

External Interpretation:
<if applicable>
```

Ownership means semantic authority.

It does not automatically mean:

* Technical ownership
* Database ownership
* Message-broker ownership
* Infrastructure ownership

---

# 12. Aggregate-Originated Events

When an event originates from an Aggregate, document the relationship.

```text id="7e6w3d"
Aggregate:
<aggregate>

Domain Operation:
<operation>

Invariant Evaluation:
<invariant>

State Change:
<change>

Domain Event:
<event>

Business Meaning:
<meaning>
```

An aggregate should produce events when an important business occurrence results from its behavior.

Not every state mutation requires an event.

---

# 13. Event Facts

Document the minimum domain facts required to understand the occurrence.

| Fact     | Meaning     | Source             | Required   | Sensitive  |
| -------- | ----------- | ------------------ | ---------- | ---------- |
| `<fact>` | `<meaning>` | `<domain concept>` | `<yes/no>` | `<yes/no>` |

Facts should be:

* Relevant
* Stable enough for their purpose
* Domain meaningful
* Evidence-based

Do not add technical metadata merely because an eventual messaging platform may require it.

---

# 14. Event State Transition

Where applicable, associate events with lifecycle transitions.

```text id="8a2v6q"
Concept:
<concept>

Previous State:
<state>

Trigger:
<domain behavior>

Domain Event:
<event>

New State:
<state>

Transition Rules:
<rules>

Invariant:
<invariant>
```

Events and states must remain conceptually distinct.

An event describes **what happened**.

A state describes **what is true now**.

---

# 15. Event and Business Rules

Document relevant business rules.

| Event     | Rule     | Relationship                       | Evidence     |
| --------- | -------- | ---------------------------------- | ------------ |
| `<event>` | `<rule>` | `TRIGGERS / REALIZES / CONSTRAINS` | `<evidence>` |

Possible relationships:

* `TRIGGERS`
* `REALIZES`
* `SATISFIES`
* `CONSTRAINS`
* `REFINES`
* `RESULTS_FROM`
* `VERIFIES`

An event should not be used as a replacement for the business rule that caused it.

---

# 16. Event and Outcomes

Identify product or domain outcomes influenced by the event.

```text id="3f7vpa"
Event:
<event>

Outcome:
<outcome>

Contribution:
<how the event contributes>

Evidence:
<evidence>
```

This provides traceability from business intent to domain occurrence.

---

# 17. Event and Domain Processes

Map events to significant domain processes.

| Process     | Event     | Position                                        | Meaning     |
| ----------- | --------- | ----------------------------------------------- | ----------- |
| `<process>` | `<event>` | `START / INTERMEDIATE / COMPLETION / EXCEPTION` | `<meaning>` |

An event may:

* Start a process
* Represent a meaningful intermediate occurrence
* Complete a process
* Signal a domain exception
* Trigger subsequent domain behavior

Do not model every internal process step as an event.

---

# 18. Event Relationships

Events may have meaningful relationships.

| ID          | Source Event | Relationship     | Target    | Meaning     |
| ----------- | ------------ | ---------------- | --------- | ----------- |
| REL-EVT-001 | `<event>`    | `<relationship>` | `<event>` | `<meaning>` |

Possible relationships:

* `PRECEDES`
* `FOLLOWS`
* `CAUSES`
* `ENABLES`
* `INVALIDATES`
* `CONTRIBUTES_TO`
* `TRIGGERS`
* `CORRELATES_WITH`
* `SUPERSEDES`

Causal relationships should only be recorded when supported by domain evidence.

---

# 19. Event Ordering

When event ordering has domain significance, document it explicitly.

```text id="g5z4um"
Events:
<events>

Required Ordering:
<ordering>

Why Ordering Matters:
<business reason>

Ordering Scope:
<aggregate/context/process>

Evidence:
<evidence>
```

Do not confuse domain ordering requirements with technical message-delivery ordering.

For example:

```text
Business requirement:
Payment must be authorized before fulfillment begins.
```

is different from:

```text
Kafka partition must preserve message ordering.
```

The first is domain behavior.

The second is an architectural/infrastructure concern.

---

# 20. Event Causality

Document causal chains where they materially improve domain understanding.

```text id="1l9s8c"
Cause:
<domain occurrence>

Behavior:
<domain behavior>

Resulting Event:
<event>

Subsequent Domain Behavior:
<behavior>

Resulting Event:
<event>
```

Causality should not be inferred merely from technical message flow.

---

# 21. Event Consumers

Identify known domain consumers.

```text id="0w6p2s"
Event:
<event>

Consumer:
<domain concept/process>

Purpose:
<why it reacts>

Expected Behavior:
<behavior>

Dependency:
<dependency>

Evidence:
<evidence>
```

At this stage, consumers should preferably be expressed in domain terms.

Example:

```text
ReservationConfirmed
        ↓
Billing Process
```

rather than:

```text
Kafka topic
        ↓
billing-service consumer
```

The latter belongs to architecture and infrastructure.

---

# 22. Domain Reaction

When a domain event causes another domain behavior, document the reaction.

```text id="n3y4cx"
Event:
<event>

Reaction:
<domain behavior>

Actor:
<actor, if applicable>

Conditions:
<conditions>

Rules:
<rules>

Result:
<result>

New Events:
<events>
```

Do not assume that every event must have a consumer.

Some events exist because the occurrence itself has domain significance.

---

# 23. Event Granularity

Choose event granularity based on business meaning.

Avoid:

### Too Fine-Grained

Representing every internal field change as an event.

### Too Coarse-Grained

Using vague events that hide meaningful business facts.

Example of weak event:

```textSomethingChanged
```

Prefer a domain-specific fact when supported:

```textApplicationApproved
```

Granularity should be driven by:

* Business significance
* Domain behavior
* Rules
* State transitions
* Consumer needs
* Traceability
* Evolution requirements

---

# 24. Event vs State

Maintain the distinction:

| Concept          | Question                            |
| ---------------- | ----------------------------------- |
| Event            | What happened?                      |
| State            | What is true now?                   |
| Command / Intent | What does someone want to happen?   |
| Rule             | What must or must not happen?       |
| Outcome          | What meaningful result is achieved? |

Example:

```text
Command:
Approve Application

Rule:
Only eligible applications may be approved

Event:
ApplicationApproved

State:
Approved
```

These concepts must not be collapsed into one artifact.

---

# 25. Event vs Command

A command expresses intent.

An event expresses an accomplished fact.

```text
Command:
ApproveApplication

Event:
ApplicationApproved
```

The command may fail.

The event represents that the relevant domain occurrence actually happened.

Do not name events as commands.

---

# 26. Event vs Integration Event

A Domain Event belongs to the domain model.

An Integration Event exists to communicate a fact across a boundary.

The relationship may be:

```text
Domain Behavior
      ↓
Domain Event
      ↓
Architecture Decision
      ↓
Integration Event
      ↓
Transport
```

Not every Domain Event needs to become an Integration Event.

The transformation must be justified by an architectural need.

---

# 27. Event Publication Decision

Do not decide automatically that every Domain Event must be externally published.

For each candidate:

```text id="3m8v2k"
Domain Event:
<event>

External Publication Required:
<YES | NO | UNKNOWN>

Reason:
<reason>

Consumers Outside Context:
<consumers>

Boundary:
<boundary>

Decision:
<decision>

Related Architecture Decision:
<ADR>
```

This section may remain `UNKNOWN` during Domain Discovery.

---

# 28. Sensitive or Restricted Event Data

Identify whether an event contains sensitive information.

```text id="r2c9h7"
Event:
<event>

Sensitive Data:
<data>

Sensitivity:
<level>

Reason:
<reason>

Allowed Consumers:
<consumers>

Retention Consideration:
<consideration>

Evidence:
<evidence>
```

Do not invent compliance requirements.

If sensitivity is unknown and materially affects architecture or security, record it as an unknown and escalate appropriately.

---

# 29. Event Versioning Considerations

Versioning should not be defined technically during domain discovery.

However, identify events whose meaning is likely to be long-lived or externally significant.

```text id="x4n6ba"
Event:
<event>

Semantic Stability:
<HIGH | MEDIUM | LOW | UNKNOWN>

External Significance:
<HIGH | MEDIUM | LOW | UNKNOWN>

Likely Evolution Pressure:
<description>

Reason:
<reason>
```

Actual event contract versioning belongs to the Contracts phase.

---

# 30. Historical Events

Some domains require historical occurrences to remain meaningful.

Document when historical facts are domain-significant.

```text id="w7p5ke"
Concept:
<concept>

Historical Event:
<event>

Why History Matters:
<reason>

Required Historical Meaning:
<meaning>

Retention Requirement:
<known requirement or UNKNOWN>

Evidence:
<evidence>
```

Do not assume event sourcing merely because historical events are useful.

Event history and event sourcing are different concepts.

---

# 31. Existing System Analysis

For existing systems, distinguish:

### Documented Events

Events described in existing documentation.

### Actual Events

Business occurrences demonstrably produced by current behavior.

### Technical Events

Technical notifications that may or may not represent domain events.

### Target Events

Events the evolved system should recognize.

Example:

```text id="j3q8fd"
Documented:
<description>

Actual:
<description>

Technical:
<description>

Target:
<description>

Differences:
<differences>

Migration Implications:
<implications>
```

Existing technical messaging does not automatically represent the correct domain event model.

---

# 32. Event Conflicts

Record conflicting interpretations.

| ID          | Event     | Conflict     | Evidence A   | Evidence B   | Severity     | Resolution     |
| ----------- | --------- | ------------ | ------------ | ------------ | ------------ | -------------- |
| CON-EVT-001 | `<event>` | `<conflict>` | `<evidence>` | `<evidence>` | `<severity>` | `<resolution>` |

Examples:

* Same name with different meanings.
* Different names for the same domain occurrence.
* Event exists technically but has no business meaning.
* Business occurrence exists but has no explicit representation.
* Different bounded contexts interpret the same term differently.

Never silently merge conflicting event meanings.

---

# 33. Event Unknowns

| ID          | Unknown      | Event     | Why It Matters | Impact     | Blocking   | Resolution |
| ----------- | ------------ | --------- | -------------- | ---------- | ---------- | ---------- |
| UNK-EVT-001 | `<question>` | `<event>` | `<reason>`     | `<impact>` | `<yes/no>` | `<method>` |

Examples:

* Is the event actually business-significant?
* Which aggregate owns the occurrence?
* Is the event local to the context?
* Does the occurrence need external propagation?
* Is historical retention required?

---

# 34. Event Assumptions

```text id="c8v3la"
ID:
Event:
Assumption:
Reason:
Evidence:
Confidence:
Impact If False:
Validation Method:
Status:
```

Assumptions must remain distinguishable from accepted event definitions.

---

# 35. Event Decisions

Record consequential decisions separately from event definitions.

Possible decisions include:

* Event naming
* Event ownership
* Event semantic boundaries
* Event granularity
* Whether an occurrence is domain-significant
* Whether two occurrences are distinct events
* Whether historical significance exists
* Whether an event requires cross-context representation

Use an appropriate decision artifact when the decision has broader architectural consequences.

---

# 36. Event Traceability

Domain Events should be traceable through the lifecycle.

Recommended chain:

```text
Product Outcome
      ↓
Requirement / Business Rule
      ↓
Domain Capability
      ↓
Domain Process
      ↓
Domain Behavior
      ↓
Domain Event
      ↓
Scenario / Verification
```

Possible relationships:

* `DERIVES_FROM`
* `RESULTS_FROM`
* `REALIZES`
* `TRIGGERS`
* `GOVERNS`
* `VERIFIES`
* `DEPENDS_ON`
* `SUPERSEDES`

When an event later becomes an integration contract, the architecture and contract artifacts should preserve this traceability.

---

# 37. Event Validation Scenarios

Each important event should be validated through realistic scenarios.

```text id="5d4h7s"
Scenario:
<scenario>

Initial State:
<state>

Domain Behavior:
<behavior>

Expected Event:
<event>

Expected Facts:
<facts>

Expected State:
<state>

Rules:
<rules>

Invariant:
<invariant>

Validation Result:
<PASSED | FAILED | PARTIAL | UNKNOWN>

Evidence:
<evidence>
```

Validation should cover relevant:

* Normal behavior
* Alternative behavior
* Rejection
* Cancellation
* Expiration
* Completion
* Recovery
* Boundary conditions

Only include scenarios relevant to the actual domain.

---

# 38. Event Model Health

Evaluate:

### Semantic Clarity

Does every event have a clear business meaning?

### Ownership

Is the origin and semantic authority clear?

### Causality

Is the relationship between behavior and event understood?

### Granularity

Are events neither excessively technical nor excessively vague?

### State Alignment

Do events correctly represent meaningful occurrences and transitions?

### Rule Alignment

Can relevant events be traced to domain rules?

### Process Alignment

Can events be located within meaningful domain processes?

### Boundary Awareness

Is it clear whether events are local or cross-context?

### Evidence Quality

Are event definitions supported by evidence?

### Uncertainty

Are unresolved interpretations explicit?

---

# 39. Domain Event Debt

Record known weaknesses.

Examples:

* Ambiguous event semantics
* Technical events mixed with domain events
* Missing business occurrence
* Excessive event granularity
* Event naming inconsistency
* Unclear ownership
* Missing causal relationship
* Unknown consumer
* Unclear historical significance
* Conflicting context interpretations

Event debt should remain visible.

---

# 40. Review Checklist

### Semantics

* [ ] Every event represents a meaningful domain occurrence.
* [ ] Event names describe facts rather than commands.
* [ ] Technical operations are not presented as domain events.
* [ ] Event meaning is explicitly documented.

### Origin

* [ ] Event origin is understood.
* [ ] Relevant aggregate or domain concept is identified.
* [ ] Triggering behavior is known.
* [ ] Relevant rules are traceable.

### State

* [ ] Relevant state transitions are understood.
* [ ] Event and state are not conflated.
* [ ] Event consequences are clear.

### Boundaries

* [ ] Owning bounded context is known.
* [ ] Cross-context implications are identified.
* [ ] External publication has not been assumed automatically.

### Data

* [ ] Event facts are domain-relevant.
* [ ] Sensitive data is identified where known.
* [ ] Unsupported technical metadata has not been added.

### Validation

* [ ] Important events are validated against scenarios.
* [ ] Conflicting interpretations are documented.
* [ ] Unknowns are explicit.
* [ ] Assumptions are explicit.

### Architecture Independence

* [ ] No message broker is assumed.
* [ ] No transport is assumed.
* [ ] No serialization format is assumed.
* [ ] No integration contract is prematurely defined.

---

# 41. Gate Contribution

This artifact contributes evidence to the Domain Discovery Gate.

```text id="y2c6qa"
Event Model Status:
<READY | READY_WITH_RISKS | INCOMPLETE | BLOCKED>

Semantic Coverage:
<HIGH | MEDIUM | LOW>

Process Alignment:
<HIGH | MEDIUM | LOW>

State Alignment:
<HIGH | MEDIUM | LOW>

Ownership Clarity:
<HIGH | MEDIUM | LOW>

Boundary Clarity:
<HIGH | MEDIUM | LOW>

Traceability:
<HEALTHY | DEGRADED | BROKEN>

Blocking Issues:
<issues>

Gate Recommendation:
<recommendation>
```

The event model itself does not determine whether the Domain Discovery Gate passes.

---

# 42. Compact Event Register

| ID      | Event     | Origin       | Aggregate     | Meaning     | External Significance       | Status     |
| ------- | --------- | ------------ | ------------- | ----------- | --------------------------- | ---------- |
| EVT-001 | `<event>` | `<behavior>` | `<aggregate>` | `<meaning>` | `<HIGH/MEDIUM/LOW/UNKNOWN>` | `<status>` |

---

# 43. Agent Instructions

When identifying Domain Events:

1. Start from domain behavior, not infrastructure.
2. Ask what meaningful business fact occurred.
3. Use established domain language.
4. Name events as facts that already happened.
5. Distinguish commands from events.
6. Distinguish state from events.
7. Distinguish domain events from integration events.
8. Identify the event's semantic owner.
9. Associate events with aggregates or domain concepts when justified.
10. Record the business behavior that caused the event.
11. Record meaningful facts without inventing technical metadata.
12. Do not create events for every field mutation.
13. Do not create events solely because asynchronous processing is desired.
14. Do not assume every event must cross a bounded-context boundary.
15. Do not assume every event must be persisted.
16. Do not assume event sourcing.
17. Validate important events against real scenarios.
18. Preserve current/actual/target distinctions in existing systems.
19. Record uncertainty explicitly.
20. Escalate event definitions that materially affect architecture or external contracts.
21. Preserve traceability to rules, processes, capabilities, outcomes, and verification.
22. Revisit the domain model when event analysis exposes missing concepts, invariants, or boundaries.

Before finalizing, ask:

> **Do these events represent the meaningful facts that occur in the domain, with clear semantics, ownership, causality, and consequences, without prematurely turning them into technical messages?**

---

# 44. Anti-Patterns

Avoid:

### Event Everything

Creating an event for every technical state change.

### Event-Driven by Default

Introducing events because the architecture is expected to be asynchronous.

### Command-Shaped Events

Naming events as requested actions.

### Technical Events

Treating database, HTTP, queue, or framework notifications as domain events.

### Event = Integration Contract

Assuming the internal domain event is automatically the external contract.

### Event Sourcing by Implication

Assuming that identifying domain events requires event sourcing.

### Infrastructure Leakage

Adding broker, topic, partition, serialization, or transport concerns to domain definitions.

### Vague Events

Using events such as:

```text
SomethingChanged
DataUpdated
ProcessCompleted
```

without sufficient domain meaning.

### Event Explosion

Creating large numbers of events that provide no meaningful domain value.

### False Causality

Assuming causal relationships without evidence.

### Consumer-Driven Semantics

Defining domain events solely around the needs of technical consumers.

### Legacy Technical Event Worship

Treating an existing message as a correct domain event simply because it already exists.

---

# 45. Safe Progression Question

Before progressing toward architecture and contracts, ask:

> **Do we understand the meaningful domain occurrences, their origins, semantics, ownership, state consequences, business rules, and relevant scenarios well enough to determine which events are purely internal domain concepts and which may require architectural or integration representation?**

If:

* **Yes** → continue toward Domain Boundary Review / Architecture.
* **Yes, with risks** → continue while carrying the explicit risks.
* **No, but non-blocking** → record the uncertainty.
* **No, because event semantics affect domain boundaries** → revisit Domain Discovery.
* **No, because external publication is being assumed without evidence** → defer the integration decision to Architecture/Contracts.

---

# 46. Final Principle

> **Domain Events make meaningful business occurrences explicit without prematurely deciding how those occurrences are transported, persisted, published, or integrated.**

Their primary purpose is to improve domain understanding and preserve the distinction between business facts and technical messaging.

A well-defined Domain Event should remain meaningful even if the system later changes its framework, database, messaging technology, deployment model, or integration mechanism.
