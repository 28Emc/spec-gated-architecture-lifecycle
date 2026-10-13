# Domain Processes

## 1. Document Metadata

| Field                     | Description                                         |
| --------------| Lifecycle Phase | Domain Discovery |
----------- | --------------------------------------------------- |
| Document ID               | Unique identifier for the process analysis          |
| Version                   | Current document version                            |
| Status                    | `DRAFT`, `UNDER_REVIEW`, `ACCEPTED`, `SUPERSEDED`   |
| Created                   | Creation date                                       |
| Updated                   | Last update date                                    |
| Project                   | Project or system name                              |
| Domain Scope              | Domain or subdomain covered                         |
| Discovery Mode            | `GREENFIELD`, `EXISTING_SYSTEM`, `SYSTEM_EVOLUTION` |
| Owner                     | Responsible role or person                          |
| Reviewers                 | Relevant domain reviewers                           |
| Related Domain Context    | Domain Context artifact                             |
| Related Glossary          | Domain Glossary artifact                            |
| Related Capabilities      | Domain Capabilities artifact                        |
| Related Product Artifacts | Relevant Product Discovery artifacts                |

---

# 2. Purpose

This document identifies and models significant **business processes** within the domain.

Its purpose is to understand how business activities:

* begin;
* progress;
* make decisions;
* apply rules;
* change domain state;
* involve actors;
* produce business outcomes;
* encounter alternatives;
* handle exceptions;
* complete or fail.

The process model provides behavioral evidence for subsequent domain modeling and boundary discovery.

---

# 3. Core Principle

> **A domain process describes meaningful business behavior over time, not an implementation workflow.**

A process should explain business activity.

It should not primarily describe:

* HTTP requests;
* service calls;
* database operations;
* queue messages;
* controller execution;
* UI navigation;
* framework behavior.

Therefore:

```text id="z6r3p8"
Business Process
        ≠
API Flow
        ≠
Application Workflow
        ≠
Technical Pipeline
```

---

# 4. Capability and Process Distinction

The relationship is:

```text id="y4m8c2"
Capability
"What can the business do?"

        ↓

Process
"How does a significant business activity unfold?"

        ↓

Behavior
"What decisions, rules, transitions and outcomes occur?"
```

A capability may participate in multiple processes.

A process may involve multiple capabilities.

---

# 5. Process Scope

Define the scope of process discovery.

```text id="q7p2n5"
Domain:
...

Subdomain:
...

Capabilities:
...

Actors:
...

Included Processes:
...

Excluded Processes:
...

Deferred Processes:
...
```

Process discovery should focus on behavior relevant to the current domain scope.

---

# 6. Process Definition

A domain process is a sequence or network of meaningful business activities that transforms a business situation toward an intended outcome.

A process may include:

* decisions;
* validations;
* state transitions;
* policies;
* responsibilities;
* human actions;
* automated domain behavior;
* external participation;
* alternative paths;
* exceptional outcomes.

Not every process needs to be strictly sequential.

---

# 7. Process Record

Each significant process should have a structured record.

```text id="c8v4m1"
### PROC-001 — <Process Name>

**Name:**
...

**Purpose:**
...

**Trigger:**
...

**Expected Outcome:**
...

**Primary Actor:**
...

**Supporting Actors:**
...

**Capabilities:**
...

**Key Concepts:**
...

**Business Rules:**
...

**Preconditions:**
...

**Main Flow:**
...

**Alternative Flows:**
...

**Exception Flows:**
...

**Postconditions:**
...

**State Changes:**
...

**Domain Events:**
...

**Dependencies:**
...

**Ownership:**
...

**Evidence:**
...

**Confidence:**
...

**Traceability:**
...
```

---

# 8. Process Classification

Processes may be classified as:

```text id="n5w2r9"
CORE
SUPPORTING
ADMINISTRATIVE
GOVERNANCE
INTEGRATION
RECOVERY
COMPLIANCE
LIFECYCLE
UNKNOWN
```

### CORE

Directly contributes to important business outcomes.

### SUPPORTING

Supports core business activities.

### ADMINISTRATIVE

Maintains or manages operational business information.

### GOVERNANCE

Applies organizational decisions, policies, or controls.

### INTEGRATION

Represents meaningful interaction with another business domain or organization.

### RECOVERY

Handles significant business recovery or remediation behavior.

### COMPLIANCE

Exists primarily to satisfy regulatory or compliance obligations.

### LIFECYCLE

Manages significant domain lifecycle behavior.

### UNKNOWN

Insufficient evidence exists for classification.

---

# 9. Process Status

Possible statuses:

```text id="w3k7q1"
IDENTIFIED
PROPOSED
UNDER_REVIEW
ACCEPTED
ACTIVE
DEPRECATED
SUPERSEDED
REJECTED
UNKNOWN
```

Status indicates discovery or governance state, not runtime execution state.

---

# 10. Process Trigger

Identify what starts the process.

Possible triggers include:

* actor action;
* business event;
* scheduled business condition;
* external business event;
* domain state transition;
* regulatory requirement;
* operational condition.

Record:

```text id="r6m9p4"
Trigger:
...

Trigger Type:
...

Source:
...

Why It Starts the Process:
...
```

Do not describe the trigger as an HTTP request unless that request itself is the meaningful business event.

---

# 11. Preconditions

Identify conditions required before the process can begin.

```text id="t8c3v5"
Precondition:
...

Source:
...

Business Meaning:
...

Rule:
...
```

Examples may include:

* required business state;
* eligibility;
* authorization;
* availability;
* completed prerequisite activity.

---

# 12. Main Business Flow

Describe the primary business path.

Example structure:

```text id="x2p7m4"
1. Actor initiates the business activity.
2. Domain validates the relevant conditions.
3. Applicable business policy is evaluated.
4. The business state changes.
5. The resulting business outcome is produced.
```

Each step should describe business behavior.

Avoid implementation details.

---

# 13. Alternative Flows

Identify valid alternative business paths.

Examples:

```text id="k5n8q2"
Alternative A:
Condition:
...

Behavior:
...

Outcome:
...
```

Alternative flows are important because they may reveal:

* different business rules;
* policy variations;
* distinct responsibilities;
* different lifecycle paths;
* potential domain boundaries.

---

# 14. Exception Flows

Identify meaningful business exceptions.

Examples:

* eligibility failure;
* insufficient availability;
* rejected approval;
* expired condition;
* conflicting state;
* policy violation;
* external business failure.

Record:

```text id="m4r8c6"
Exception:
...

Condition:
...

Business Response:
...

Resulting State:
...

Business Consequence:
...
```

Do not confuse business exceptions with technical exceptions.

---

# 15. Postconditions

Identify the business state after process completion.

```text id="v7q2s5"
Postcondition:
...

State:
...

Business Meaning:
...

Evidence:
...
```

A process may have multiple valid postconditions.

---

# 16. Process Outcomes

Distinguish:

```text id="f8m3k7"
Successful Outcome
Alternative Outcome
Rejected Outcome
Failed Business Outcome
Cancelled Outcome
Unknown Outcome
```

Each outcome should be expressed in domain terms.

---

# 17. Process State

Some processes have meaningful business state.

Example:

```text id="p5c9n2"
Initiated
   ↓
Validated
   ↓
Approved
   ↓
Executed
   ↓
Completed
```

For each state:

```text id="d4w7x1"
State:
...

Meaning:
...

Entry Conditions:
...

Exit Conditions:
...

Allowed Transitions:
...

Invalid Transitions:
...
```

Not every process requires explicit states.

---

# 18. State Transition Rules

For important transitions record:

```text id="u8m5q3"
From:
...

To:
...

Trigger:
...

Condition:
...

Business Rule:
...

Responsible Actor:
...

Outcome:
...
```

State transitions are particularly important when they represent domain invariants.

---

# 19. Process Decisions

Identify meaningful business decisions within the process.

A decision should answer:

> Given these business conditions, what business outcome or path should be selected?

Example:

```text id="s6p2v9"
Decision:
Determine Eligibility

Inputs:
...

Rules:
...

Possible Outcomes:
...

Responsible Authority:
...
```

Do not confuse domain decisions with software `if/else` statements.

---

# 20. Decision Points

A process may contain multiple decision points.

```text id="h3r8m5"
Process
  │
  ├── Condition A → Path A
  │
  ├── Condition B → Path B
  │
  └── Otherwise → Path C
```

Each meaningful decision point should be traceable to its governing rule or policy.

---

# 21. Business Rules in Processes

Map relevant rules to process steps.

```text id="q9c4n7"
Process:
...

Step:
...

Rule:
...

Effect:
...
```

The process artifact should reference authoritative business-rule artifacts rather than duplicating their complete definitions.

---

# 22. Process Invariants

Identify conditions that must remain true throughout the process.

Examples:

```text id="e6w2p8"
- A confirmed allocation cannot exceed available capacity.
- A completed business transaction cannot return to an editable state.
```

Record:

```text id="m5v8r3"
Invariant:
...

Scope:
...

Affected States:
...

Affected Concepts:
...

Reason:
...
```

Invariants may later influence aggregate and bounded context discovery.

---

# 23. Process Actors

For each significant process identify:

### Primary Actor

Initiates or directly depends on the process.

### Supporting Actor

Participates in the process.

### Responsible Authority

Owns or authorizes a business decision.

### External Participant

Participates from outside the domain boundary.

Record:

```text id="b7q3n9"
Actor:
...

Role:
...

Responsibility:
...

Interaction:
...
```

Do not assume that technical authentication roles represent business actors.

---

# 24. Process Responsibilities

Identify which domain responsibility is performed at each significant step.

```text id="j4m8c2"
Step:
...

Responsibility:
...

Owner:
...

Related Capability:
...
```

This allows process behavior to be connected to the capability model.

---

# 25. Process Concepts

Identify concepts involved in the process.

```text id="v6p3r8"
Concept:
...

Role in Process:
...

State Before:
...

State After:
...

Rules:
...
```

The same concept may participate in multiple processes.

Its meaning must remain consistent within the relevant domain boundary.

---

# 26. Process Events

Identify meaningful events produced by process behavior.

```text id="w2n7m5"
Event:
...

When It Occurs:
...

Business Meaning:
...

Affected Concepts:
...

Interested Participants:
...
```

Only events with business meaning should be modeled here.

Technical messaging mechanisms belong to later contract analysis.

---

# 27. Process Dependencies

Identify material dependencies.

Possible types:

```text id="x8c4q1"
PRECONDITION
CAPABILITY
DOMAIN_POLICY
ACTOR
EXTERNAL_DOMAIN
BUSINESS_INFORMATION
PREVIOUS_PROCESS
CONCURRENT_PROCESS
UNKNOWN
```

Record:

```text id="n5v9p3"
Source:
...

Dependency:
...

Reason:
...

Impact:
...
```

---

# 28. Process Relationships

Supported relationships include:

```text id="r3k7m2"
PRECEDES
FOLLOWS
TRIGGERS
DEPENDS_ON
SUPPORTS
INCLUDES
EXTENDS
ALTERNATIVE_TO
RECOVERS_FROM
COMPENSATES_FOR
CONFLICTS_WITH
SUPERSEDES
```

Relationships should describe meaningful business behavior.

---

# 29. Process Decomposition

A complex process may be decomposed:

```text id="p8m4c6"
Business Process
├── Validate Request
├── Evaluate Eligibility
├── Approve Request
├── Execute Business Action
└── Complete Transaction
```

Decomposition should stop when the resulting steps become implementation procedures rather than meaningful business behavior.

---

# 30. Process Composition

Multiple processes may participate in a larger business process.

```text id="k6q2v8"
Business Lifecycle
    │
    ├── Process A
    ├── Process B
    ├── Process C
    └── Process D
```

The relationship between processes should be explained through business dependencies.

---

# 31. Process Concurrency

Some business processes may occur concurrently.

Record when:

* two independent activities may proceed simultaneously;
* multiple actors participate in parallel;
* separate business responsibilities operate concurrently;
* concurrent activity affects invariants.

```text id="c4n7s2"
Concurrent Activity:
...

Independent From:
...

Shared State:
...

Potential Conflict:
...

Required Business Coordination:
...
```

Do not assume technical parallelism merely because two application operations execute asynchronously.

---

# 32. Process Timing

Identify meaningful temporal constraints.

Examples:

* expiration;
* deadlines;
* waiting periods;
* recurring activities;
* validity windows;
* sequencing constraints.

Record:

```text id="m9p5r3"
Temporal Rule:
...

Process:
...

Condition:
...

Business Effect:
...
```

Avoid inventing numerical timing requirements.

---

# 33. Process Compensation

Some processes require compensating behavior when a later step invalidates an earlier business action.

Record:

```text id="u3w8q6"
Original Business Action:
...

Compensating Action:
...

Trigger:
...

Business Reason:
...

State Effect:
...
```

Compensation is a business concept only when the domain itself defines the corrective behavior.

Do not automatically interpret technical rollback as business compensation.

---

# 34. Process Cancellation

Identify meaningful cancellation behavior.

```text id="v5c2m7"
Process:
...

Cancellation Condition:
...

Authorized Actor:
...

Business Effect:
...

Resulting State:
...

Restrictions:
...
```

Cancellation rules may expose important ownership and invariant boundaries.

---

# 35. Process Recovery

Identify business recovery behavior.

Examples:

* retrying a business operation under a policy;
* reopening a business case;
* correcting an invalid state;
* manually resolving an exception.

Record:

```text id="x7n4q8"
Recovery Scenario:
...

Trigger:
...

Authorized Actor:
...

Business Action:
...

Result:
...
```

Do not confuse business recovery with infrastructure recovery.

---

# 36. Process Variants

Identify meaningful variants.

```text id="j8p3m5"
Variant:
...

Condition:
...

Difference:
...

Affected Rules:
...

Affected Actors:
...

Affected Outcome:
...
```

Variants may indicate:

* policy differences;
* customer segments;
* regulatory differences;
* geographic differences;
* product differences;
* context-specific behavior.

---

# 37. Process Ownership

Determine who owns the business process.

Ownership may be:

```text id="q2v6c9"
CLEAR
SHARED
CONTESTED
EXTERNAL
UNKNOWN
```

Record:

```text id="e5m8r2"
Process:
...

Owner:
...

Authority:
...

Operational Responsibility:
...

Evidence:
...
```

Shared ownership should be treated as a domain discovery signal.

---

# 38. Process Boundary Signals

A process may reveal potential domain boundaries when:

* responsibility changes;
* ownership changes;
* language changes;
* policies change;
* invariants differ;
* lifecycle changes;
* actors change;
* business authority changes;
* external domain responsibility begins.

These are signals only.

They must be evaluated together with capability and vocabulary evidence.

---

# 39. Process-to-Bounded-Context Evidence

Use process analysis to evaluate candidate contexts.

```text id="f7k3n5"
Process
   ↓
Capabilities
   ↓
Concepts
   ↓
Rules
   ↓
Ownership
   ↓
Potential Context Boundary
```

A process crossing multiple candidate contexts does not necessarily mean the contexts are incorrect.

It may indicate:

* context interaction;
* orchestration;
* domain event flow;
* policy separation;
* external dependency.

Architecture should be considered only after domain relationships are sufficiently understood.

---

# 40. Existing System Process Analysis

For existing systems distinguish:

```text id="r4m7x2"
Documented Process:
...

Observed Process:
...

Implemented Workflow:
...

Actual Business Behavior:
...

Target Process:
...
```

The implementation workflow may differ from the actual business process.

When differences exist, record them explicitly.

---

# 41. Process Debt

Process debt exists when:

* business behavior is undocumented;
* important exceptions are unknown;
* state transitions are ambiguous;
* responsibilities are unclear;
* processes are represented only through technical workflows;
* legacy workflows obscure business behavior.

Record:

```text id="s8c3n6"
Debt:
...

Impact:
...

Affected Process:
...

Priority:
...

Resolution:
...
```

---

# 42. Process Gaps

Identify missing business behavior.

```text id="p5v9k2"
Gap:
...

Process:
...

Missing Behavior:
...

Business Impact:
...

Affected Outcome:
...

Priority:
...
```

A process gap may indicate:

* missing requirement;
* missing business rule;
* missing capability;
* missing actor;
* missing domain concept.

---

# 43. Process Conflicts

Identify contradictory process definitions.

Examples:

```text id="w6m2q8"
Two sources define different approval sequences.

A rule permits a transition that another rule prohibits.

Two actors claim responsibility for the same business decision.

The target process conflicts with an accepted product requirement.
```

Conflicts must not be silently reconciled.

---

# 44. Process Unknowns

Record unresolved questions.

Examples:

```text id="n3r7c5"
- Who can initiate this process?
- Is approval mandatory?
- Can this state transition be reversed?
- What happens when the external participant rejects the request?
- Is this process part of the same domain boundary?
```

Classify:

```text id="q8v4m1"
NON_BLOCKING
DECISION_RELEVANT
GATE_BLOCKING
```

---

# 45. Process Assumptions

Record inferred process behavior.

```text id="b5m9p2"
Assumption:
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

Do not present inferred process flows as established domain behavior.

---

# 46. Process Traceability

Recommended relationships:

```text id="t6k3v8"
Product Outcome
    ↓
Use Case
    ↓
Capability
    ↓
Domain Process
    ↓
Business Rule
    ↓
State Transition
    ↓
Domain Event
```

Additional relationships:

```text id="y2p7m4"
DERIVES_FROM
REALIZES
SUPPORTS
INVOLVES
GOVERNS
TRIGGERS
PRODUCES
CHANGES
DEPENDS_ON
CONSTRAINS
VERIFIES
CONFLICTS_WITH
SUPERSEDES
```

---

# 47. Process Validation

For each important process validate:

### Purpose

Is the business purpose clear?

### Trigger

Is the business trigger understood?

### Actors

Are relevant actors and authorities identified?

### Behavior

Is the main business flow understood?

### Alternatives

Are important alternative paths known?

### Exceptions

Are meaningful business exceptions represented?

### Rules

Are governing rules identified?

### State

Are important state transitions understood?

### Outcomes

Are resulting business outcomes explicit?

### Ownership

Is responsibility sufficiently understood?

### Evidence

Are important process assumptions supported?

---

# 48. Process Discovery Gate Contribution

Process analysis contributes to Domain Discovery readiness.

Minimum expectations:

* significant business processes identified;
* major business flows understood;
* important alternative and exception paths known;
* significant state transitions identified;
* important business decisions visible;
* relevant rules mapped;
* ownership understood sufficiently;
* process conflicts and unknowns explicit;
* potential boundary signals identified.

The objective is not to document every operational procedure.

---

# 49. Review Checklist

### Process Identification

* [ ] Significant processes are identified.
* [ ] Processes are business-oriented.
* [ ] Process scope is explicit.
* [ ] Capability relationships are defined.

### Behavior

* [ ] Triggers are clear.
* [ ] Preconditions are identified.
* [ ] Main flow is understood.
* [ ] Alternative flows are identified.
* [ ] Important exceptions are identified.
* [ ] Postconditions are clear.

### Domain Semantics

* [ ] Business rules are mapped.
* [ ] Important decisions are identified.
* [ ] Important invariants are identified.
* [ ] Significant state transitions are modeled.
* [ ] Domain events are identified where relevant.

### Ownership

* [ ] Actors are identified.
* [ ] Business authority is distinguished from technical authorization.
* [ ] Process ownership is understood.
* [ ] External participants are identified.

### Boundaries

* [ ] Process boundary signals are documented.
* [ ] Cross-context behavior is not prematurely treated as technical orchestration.
* [ ] Potential context interactions are visible.

### Uncertainty

* [ ] Assumptions are explicit.
* [ ] Unknowns are explicit.
* [ ] Conflicts are explicit.
* [ ] Confidence is recorded.

### Existing Systems

* [ ] Documented behavior is distinguished from observed behavior.
* [ ] Implementation workflow is not automatically treated as business process.
* [ ] Target behavior is explicit.

### Transition

* [ ] Process findings are traceable.
* [ ] Important boundary evidence is available.
* [ ] Domain modeling can proceed safely.

---

# 50. Agent Instructions

When creating or reviewing this artifact, the agent must:

1. Start from the accepted Domain Context, Glossary, and Capability model.
2. Describe business behavior rather than technical workflows.
3. Identify significant processes, not every application operation.
4. Distinguish capability from process.
5. Identify triggers, decisions, rules, states, outcomes, alternatives, and exceptions.
6. Preserve meaningful process variants.
7. Identify actors and business authority.
8. Identify process ownership.
9. Identify meaningful temporal behavior.
10. Identify invariants where supported by evidence.
11. Distinguish business compensation from technical rollback.
12. Distinguish business recovery from infrastructure recovery.
13. Treat domain events as business occurrences, not messaging mechanisms.
14. Use process behavior as evidence for domain boundaries.
15. Never derive bounded contexts solely from process diagrams.
16. Preserve uncertainty when behavior is not sufficiently understood.
17. Distinguish documented, observed, implemented, and target behavior in existing systems.
18. Propagate material findings to Product Discovery when required.
19. Keep process modeling proportional to project complexity.
20. Avoid documenting operational procedures that have no impact on domain understanding.

---

# 51. Anti-Patterns

## 51.1 API Workflow Modeling

Representing a sequence of HTTP calls instead of business behavior.

---

## 51.2 Technical Sequence Diagrams

Treating service-to-service calls as domain processes.

---

## 51.3 CRUD Processes

Creating processes such as:

```text id="m8c2v5"
Create Customer
Update Customer
Delete Customer
```

without identifying meaningful business behavior.

---

## 51.4 Happy-Path Only

Ignoring alternatives, exceptions, rejection, cancellation, and recovery.

---

## 51.5 Process = Capability

Treating every process as a capability.

---

## 51.6 Process = Use Case

Assuming every product-level use case must map one-to-one to a domain process.

---

## 51.7 Technical Exception Leakage

Modeling database errors, HTTP status codes, timeouts, or framework exceptions as business exceptions.

---

## 51.8 Infrastructure Recovery as Domain Recovery

Treating retries, failover, or service restarts as business recovery without domain evidence.

---

## 51.9 False State Modeling

Turning every database status field into a domain lifecycle.

---

## 51.10 Process Explosion

Documenting every operational step until the model becomes an implementation manual.

---

## 51.11 Premature Orchestration

Assuming that a process crossing capabilities or contexts requires a centralized technical orchestrator.

---

## 51.12 Legacy Workflow Equals Target Process

Assuming the current application workflow represents the desired business behavior.

---

# 52. Compact Process Register

Maintain a compact index:

| ID       | Process | Classification | Status   | Owner | Complexity | Risk | Confidence |
| -------- | ------- | -------------- | -------- | ----- | ---------- | ---- | ---------- |
| PROC-001 | —       | CORE           | ACCEPTED | —     | HIGH       | HIGH | HIGH       |
| PROC-002 | —       | SUPPORTING     | PROPOSED | —     | MEDIUM     | LOW  | MEDIUM     |

The register is a navigation aid and does not replace detailed process analysis.

---

# 53. Safe Progression Question

Before progressing to deeper domain modeling and bounded context discovery, ask:

> **Do we understand the significant business processes, decisions, rules, state transitions, exceptions, ownership, and outcomes well enough to identify domain boundaries without confusing business behavior with technical workflow?**

If not, continue process discovery or explicitly record the remaining uncertainty.

---

# 54. Final Principle

> **Processes reveal how domain responsibilities behave over time.**

The process model should therefore connect:

```text id="x3m7q9"
Capabilities
      ↓
Processes
      ↓
Decisions
      ↓
Rules
      ↓
State Transitions
      ↓
Events
      ↓
Business Outcomes
```

These behavioral relationships provide evidence for the next stage of Domain Discovery: identifying **bounded contexts and their semantic boundaries** without prematurely converting domain structure into technical architecture.

