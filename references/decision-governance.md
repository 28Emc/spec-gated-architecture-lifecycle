# Spec-Gated Architecture Lifecycle — Decision Governance

## 1. Purpose

This document defines how decisions are proposed, evaluated, approved, recorded, modified, superseded, and rejected within Spec-Gated Architecture Lifecycle.

Its primary purpose is to establish a clear distinction between:

```text
Observation
    ↓
Analysis
    ↓
Recommendation
    ↓
Decision
    ↓
Recorded Decision
```

An AI agent may perform analysis and provide recommendations, but it must not silently convert recommendations into project decisions.

Decision governance applies to product, domain, architecture, contracts, security, infrastructure, and operational decisions when their consequences are significant enough to require explicit governance.

---

# 2. Decision Principles

## 2.1 Decisions must be explicit

A significant decision must be identifiable as a decision.

The agent should not infer that something is decided merely because:

* it appears in source code;
* it appears in a draft document;
* it was previously proposed;
* the agent recommended it;
* an implementation already exists.

Implementation may be evidence of a decision, but it does not automatically establish architectural intent.

---

## 2.2 Decisions require context

A decision should not be recorded without sufficient context.

At minimum:

```text
Problem
Context
Constraints
Options
Decision
Rationale
Consequences
```

The required level of detail depends on decision significance.

---

## 2.3 Decisions have scope

Every decision should have an identifiable scope.

Scope may be:

```text
Project-wide
System-wide
Domain-wide
Bounded Context
Service
Component
Integration
Environment
Feature
```

A local decision must not automatically become a global architectural rule.

---

## 2.4 Decisions are temporal

A decision describes the accepted direction at a particular point in time.

It may later become:

```text
Superseded
Modified
Rejected
Deprecated
```

The history should be preserved.

The lifecycle should prefer decision history over silently rewriting the past.

---

# 3. Decision Categories

Decisions should be classified to determine the appropriate governance level.

## 3.1 Product Decision

Affects product scope, behavior, users, goals, or priorities.

Examples:

```text
Define the primary user segment.
Exclude a capability from MVP.
```

---

## 3.2 Domain Decision

Affects business semantics or domain behavior.

Examples:

```text
A restriction belongs to a menu rather than a user profile.
A recipe may contain multiple preparation steps.
```

---

## 3.3 Architecture Decision

Affects structural organization or major technical boundaries.

Examples:

```text
Use asynchronous communication between two bounded contexts.
Split a capability into an independently deployable service.
```

---

## 3.4 Contract Decision

Affects externally observable agreements.

Examples:

```text
API versioning strategy.
Event schema compatibility policy.
Error response format.
```

---

## 3.5 Data Decision

Affects data ownership, persistence, consistency, lifecycle, or migration.

Examples:

```text
Service A owns customer data.
Historical data uses a document-oriented model.
```

---

## 3.6 Security Decision

Affects authentication, authorization, trust boundaries, secrets, identity, or security controls.

Examples:

```text
Use OAuth2 for external identity.
Authorization is enforced at the application boundary.
```

---

## 3.7 Infrastructure Decision

Affects deployment, runtime, networking, observability, resilience, or operational architecture.

Examples:

```text
Use Kubernetes for production orchestration.
Use managed PostgreSQL.
```

---

# 4. Decision Significance

Not every decision requires an ADR.

The agent should classify decisions according to their significance.

## 4.1 Trivial

Low impact and easily reversible.

Examples:

```text
Local variable naming.
Private helper organization.
Formatting convention.
```

No formal decision record is required.

---

## 4.2 Local

Limited scope and limited consequences.

Examples:

```text
Internal component implementation choice.
Local caching strategy.
Internal helper abstraction.
```

A lightweight record may be appropriate when useful.

---

## 4.3 Significant

Affects multiple components, contracts, domain behavior, data, security, or operations.

Examples:

```text
Communication pattern between services.
Persistence strategy.
Authentication mechanism.
Data ownership.
```

A decision record should normally be created.

---

## 4.4 Strategic

High impact, difficult to reverse, or foundational.

Examples:

```text
Architectural style.
Major technology platform.
Bounded context restructuring.
Cloud platform.
Primary persistence strategy.
Distributed consistency model.
```

An ADR is strongly recommended and human approval should normally be explicit.

---

# 5. Decision Threshold

A decision should normally receive formal governance when one or more of the following conditions apply:

```text
Multiple viable alternatives exist
        OR
Significant trade-offs exist
        OR
Multiple components are affected
        OR
External contracts are affected
        OR
Data ownership changes
        OR
Security boundaries change
        OR
Operational complexity changes
        OR
Decision is difficult to reverse
        OR
Decision creates long-term constraints
```

The agent should avoid turning every implementation detail into an ADR.

---

# 6. Decision Lifecycle

A decision follows this conceptual lifecycle:

```text
IDENTIFIED
    ↓
ANALYZED
    ↓
PROPOSED
    ↓
REVIEWED
    ↓
ACCEPTED / REJECTED
    ↓
RECORDED
    ↓
IMPLEMENTED
    ↓
VALIDATED
    ↓
ACTIVE
```

A decision may later transition to:

```text
SUPERSEDED
DEPRECATED
REVOKED
```

---

# 7. Decision States

## 7.1 IDENTIFIED

A decision point has been detected but has not yet been analyzed.

---

## 7.2 PROPOSED

An option has been recommended but not approved.

---

## 7.3 UNDER_REVIEW

The decision is being evaluated by authorized project participants.

---

## 7.4 ACCEPTED

The decision has been explicitly approved.

---

## 7.5 REJECTED

The proposal was evaluated and intentionally rejected.

The reason should be preserved when relevant.

---

## 7.6 ACTIVE

The accepted decision is currently applicable.

---

## 7.7 SUPERSEDED

A newer decision replaces the previous one.

The old decision remains historically valid for the period in which it was active.

---

## 7.8 DEPRECATED

The decision is no longer recommended but has not necessarily been completely replaced.

---

# 8. Recommendation vs Decision

The distinction must remain explicit.

Example:

```text
Agent Analysis

Option A:
Synchronous REST

Option B:
Asynchronous messaging

Recommendation:
Option B due to processing characteristics.
```

At this point:

```text
Decision Status = PROPOSED
```

Only after explicit authorization:

```text
Decision Status = ACCEPTED
```

Then:

```text
Decision Status = ACTIVE
```

The agent should not write:

```text
"We decided to use Kafka."
```

when the user only asked:

```text
"Would Kafka be appropriate?"
```

---

# 9. Decision Authority

Decision authority depends on the project.

The project should define who or what may approve decisions.

Possible authorities include:

```text
Product Owner
Technical Lead
Architect
Engineering Team
Project Owner
Security Owner
Operations Owner
Authorized User
```

The agent should not assume that every user request automatically authorizes every architectural decision.

When authority is unclear and the decision is consequential, the agent should request confirmation.

---

# 10. AI Decision Boundary

The agent may automatically make or apply a decision when all of the following are true:

```text
Decision is low-risk
AND
Decision is reversible
AND
Decision is local
AND
No existing decision is contradicted
AND
No external contract is affected
AND
No significant security/data impact exists
```

Otherwise, the agent should distinguish recommendation from approval.

---

# 11. Existing Decision Conflict

Before creating a new decision, the agent must check whether an existing decision addresses the same subject.

If one exists:

```text
Existing Decision
       ↓
Compare Scope
       ↓
Compare Context
       ↓
Compare Constraints
       ↓
Determine Relationship
```

Possible outcomes:

```text
Compatible
Refinement
Conflict
Supersession
Unrelated
```

The agent should not create duplicate decisions when an existing decision can be extended or refined.

---

# 12. Decision Supersession

A decision should be superseded rather than silently rewritten when the underlying direction changes.

Example:

```text
ADR-004
Use synchronous REST between A and B.

        ↓

New requirement discovered.

        ↓

ADR-012
Replace synchronous communication with asynchronous events.

        ↓

ADR-004 = SUPERSEDED
ADR-012 = ACTIVE
```

The original decision remains part of the architecture history.

---

# 13. Decision Modification

Minor refinements may update a decision when the fundamental intent remains unchanged.

Example:

```text
Decision:
Use PostgreSQL.

Refinement:
Use managed PostgreSQL in production.
```

However, if the modification changes the fundamental rationale or consequences, a new decision should normally be created.

---

# 14. Decision Reversal

A decision can be reversed when new evidence invalidates its original rationale.

The agent should record:

```text
Original Decision
New Evidence
Impact
New Options
New Decision
Reason for Reversal
```

Decision reversal should not be treated as an architectural failure.

It is a normal consequence of learning.

---

# 15. ADR Requirement

An ADR should normally be created when a decision:

* changes architectural boundaries;
* introduces a major technology;
* affects multiple services or components;
* changes data ownership;
* changes consistency strategy;
* changes communication patterns;
* affects security boundaries;
* creates significant operational consequences;
* has substantial migration cost;
* is difficult to reverse;
* establishes a reusable architectural principle.

The project may define stricter requirements.

---

# 16. ADR Minimum Structure

A formal ADR should normally contain:

```text
ID
Title
Status
Date
Context
Problem
Constraints
Options Considered
Decision
Rationale
Consequences
Risks
Affected Components
Affected Contracts
Related Decisions
Supersedes
Superseded By
```

Not every field must be populated for every decision, but significant omissions should be intentional.

---

# 17. Decision Evaluation

Before accepting a significant decision, the agent should evaluate:

```text
Correctness
Consistency
Feasibility
Complexity
Security
Performance
Scalability
Operability
Maintainability
Cost
Reversibility
Future Evolution
```

Only relevant dimensions need to be analyzed.

---

# 18. Decision Dependencies

Decisions may depend on other decisions.

Example:

```text
ADR-001
Bounded Context boundaries
       ↓
ADR-004
Service decomposition
       ↓
ADR-006
Communication strategy
       ↓
ADR-009
Event infrastructure
```

The agent should identify dependencies when they materially affect validity.

A decision should not be evaluated in isolation when its assumptions depend on another decision.

---

# 19. Decision Impact

A significant decision should identify its affected areas.

```text
Decision
 ├── Domain
 ├── Architecture
 ├── Contracts
 ├── Data
 ├── Security
 ├── Infrastructure
 ├── Specifications
 └── Operations
```

The agent should use this impact map when updating related artifacts.

---

# 20. Decision Validation

Acceptance of a decision does not guarantee that it was correctly implemented.

After implementation, the agent should validate:

```text
Decision
   ↓
Specification
   ↓
Implementation
   ↓
Tests / Verification
   ↓
Actual Behavior
```

If implementation contradicts the decision, the agent should identify the discrepancy.

Possible outcomes:

```text
Implementation corrected
OR
Decision revisited
```

The agent must not silently modify the decision merely to match the implementation.

---

# 21. Decision Drift

Decision drift occurs when implementation gradually diverges from recorded architectural intent.

Examples:

```text
ADR:
Service owns its database.

Implementation:
Another service directly accesses the database.
```

```text
ADR:
API must remain backward compatible.

Implementation:
Existing fields are removed.
```

The agent should detect and report decision drift during audits and relevant changes.

---

# 22. Decision Debt

Decision debt occurs when significant architectural choices remain unresolved for too long.

Examples:

```text
Authentication strategy = OPEN
Data ownership = UNKNOWN
Consistency model = UNKNOWN
```

The agent should distinguish:

```text
Intentional Deferred Decision
```

from:

```text
Unmanaged Decision Debt
```

Deferred decisions should have:

* owner;
* reason;
* expected resolution point;
* impact if unresolved.

---

# 23. Decision Log

Projects should maintain a discoverable decision index.

Conceptually:

```text
Decision Register

ADR-001  Domain boundary          ACTIVE
ADR-002  Authentication           ACTIVE
ADR-003  Database strategy        SUPERSEDED
ADR-004  Event communication     ACTIVE
ADR-005  API versioning           PROPOSED
```

The register allows the agent to quickly determine the current architectural direction.

---

# 24. Decision Governance During Implementation

Before introducing implementation that could alter architecture, the agent should check:

```text
Existing Decisions
      ↓
Applicable Constraints
      ↓
Potential Conflicts
      ↓
Impact
```

If implementation requires a new significant decision, the agent should stop before silently introducing it.

---

# 25. Decision Governance During Audits

During an architecture audit, the agent should compare:

```text
Recorded Decisions
        vs
Current Architecture
        vs
Current Implementation
```

The audit should identify:

```text
Aligned
Drift
Conflict
Obsolete
Missing Decision
```

This creates a practical mechanism for detecting architecture erosion.

---

# 26. Decision Governance During Evolution

When modifying an existing system:

```text
Current Decision
      ↓
New Requirement
      ↓
Impact Analysis
      ↓
Decision Still Valid?
      │
 ┌────┴─────┐
 │          │
 YES        NO
 │          │
Continue   New Decision
            ↓
        Supersede Old
```

The agent should preserve the history of the transition.

---

# 27. Human Confirmation Rules

Human confirmation should normally be required when a decision:

* is difficult to reverse;
* significantly changes architecture;
* affects external consumers;
* changes security posture;
* changes data ownership;
* introduces significant infrastructure cost;
* introduces substantial operational complexity;
* conflicts with an existing approved decision;
* affects a critical business invariant.

The agent may recommend a decision, but authorization belongs to the project's designated authority.

---

# 28. Decision Output

When presenting a significant decision for approval, the agent should use a concise structure:

```text
Decision Required

Problem:
...

Context:
...

Options:
A. ...
B. ...

Recommendation:
...

Key Trade-offs:
...

Impact:
...

Reversibility:
...

Decision:
[Pending]
```

After approval:

```text
Decision:
[Accepted]

Status:
ACTIVE

Recorded As:
ADR-XXX
```

---

# 29. Governance Principle

The fundamental governance rule is:

```text
The agent may reason autonomously,
but consequential project decisions must remain explicit,
traceable, and appropriately authorized.
```

The objective is not bureaucratic approval of every technical detail.

The objective is to prevent hidden architectural decisions.

---

# 30. Final Decision Flow

The complete decision flow is:

```text
Decision Point
      ↓
Identify Context
      ↓
Collect Evidence
      ↓
Identify Constraints
      ↓
Check Existing Decisions
      ↓
Evaluate Impact
      ↓
Determine Significance
      ↓
Generate Alternatives
      ↓
Evaluate Trade-offs
      ↓
Make Recommendation
      ↓
Obtain Authorization if Required
      ↓
Record Decision
      ↓
Update Related Artifacts
      ↓
Implement
      ↓
Validate
      ↓
Monitor for Drift
```

This flow should be treated as the standard governance mechanism for consequential decisions within Spec-Gated Architecture Lifecycle.
