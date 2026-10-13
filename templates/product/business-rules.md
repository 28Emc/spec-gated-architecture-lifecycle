# Business Rules

## 1. Document Metadata

* **Document Type:** Product Discovery — Business Rules
* **Lifecycle Phase:** Product Discovery
* **Status:** `DRAFT`
* **Version:** `1.0`
* **Owner:** `<owner>`
* **Created:** `<date>`
* **Updated:** `<date>`
* **Related Product Context:** `<document>`
* **Related Requirements:** `<references>`
* **Related Domain Model:** `<references>`
* **Related Constraints:** `<references>`
* **Related Decisions:** `<references>`
* **Related Architecture:** `<references>`

---

## 2. Purpose

This document defines and manages the business rules that govern how the product or business domain must behave.

Business rules express policies, conditions, invariants, calculations, permissions, validations, or behavioral constraints derived from the business domain.

They describe **what must be true or how the business operates**, independently of the technical mechanism used to implement them.

Business rules should remain understandable by both domain experts and technical teams.

---

## 3. Core Principle

A business rule is a domain-level statement that governs behavior, validity, eligibility, calculation, or state.

A business rule is not:

* a user interface behavior,
* an implementation detail,
* a database constraint,
* an API design choice,
* an architecture decision,
* or a technology preference.

The reasoning model is:

```text id="c9j4m7"
Business Intent
      ↓
Business Rule
      ↓
Domain Behavior
      ↓
Implementation
```

The implementation may change while the underlying business rule remains stable.

---

## 4. Business Rule Characteristics

A well-defined business rule should be:

* explicit,
* domain-relevant,
* understandable,
* testable,
* independently stated,
* traceable to its source,
* sufficiently precise,
* independent of implementation technology.

A business rule should answer:

* What business condition applies?
* When does it apply?
* To whom or to what does it apply?
* What must happen?
* What must not happen?
* What makes the rule valid?
* What happens when the rule is violated?

---

## 5. Business Rule Categories

Business rules MAY belong to one or more of the following categories.

### 5.1 Eligibility

Defines whether an actor, entity, transaction, or operation qualifies for something.

Example:

```text id="f2m8k4"
A customer is eligible for benefit X only when condition Y is satisfied.
```

---

### 5.2 Validation

Defines conditions that must be satisfied for an operation or state to be valid.

Example:

```text id="r5n7q2"
An operation cannot be confirmed unless all required conditions are satisfied.
```

---

### 5.3 Invariant

Defines a condition that must always remain true within a relevant domain boundary.

Example:

```text id="v8c1p6"
A finalized business transaction cannot return to a draft state.
```

Invariants are particularly important for domain modeling.

---

### 5.4 Calculation

Defines how a business value is calculated.

Example:

```text id="m3q9w1"
The final amount is calculated from the base amount plus applicable adjustments.
```

The rule should describe the business calculation, not the programming implementation.

---

### 5.5 Authorization / Responsibility

Defines who is allowed or responsible for performing a business operation.

Example:

```text id="j7d4k9"
Only an authorized actor may approve the operation.
```

Business authorization rules should remain distinct from technical authentication mechanisms.

---

### 5.6 State Transition

Defines valid transitions between business states.

Example:

```text id="p6s2x8"
A submitted request may transition to approved, rejected, or cancelled.
```

A state transition rule should identify:

* current state,
* triggering condition,
* permitted transition,
* resulting state,
* prohibited transitions when relevant.

---

### 5.7 Temporal

Defines rules involving time, dates, periods, deadlines, or expiration.

Example:

```text id="n4b8t3"
An operation may be performed only within the defined business period.
```

---

### 5.8 Frequency / Limits

Defines business limits on frequency, quantity, capacity, or repetition.

Example:

```text id="q1r6m9"
An actor may perform the operation no more than the allowed number of times within the applicable period.
```

The business limit should remain separate from infrastructure rate limiting.

---

### 5.9 Relationship

Defines valid relationships between domain entities or concepts.

Example:

```text id="h5v7c2"
An active account must belong to an authorized customer.
```

---

### 5.10 Policy

Defines an explicit business policy governing behavior.

Example:

```text id="k3p8z6"
Requests above the defined business threshold require additional approval.
```

---

### 5.11 Compliance

Defines domain behavior required by an applicable regulatory or contractual obligation.

Example:

```text id="w9s4d1"
A qualifying record must remain available for the required retention period.
```

Compliance rules should have explicit sources.

The agent MUST NOT invent regulatory rules.

---

## 6. Business Rule Model

The minimum conceptual model is:

```text id="m4v8x2"
Business Rule
├── Identity
├── Statement
├── Category
├── Source
├── Scope
├── Applicability
├── Conditions
├── Outcome
├── Exceptions
├── Priority
├── Status
├── Effective Period
├── Evidence
└── Traceability
```

---

## 7. Business Rule Record

Each significant business rule should contain:

```text id="b6n3r7"
Rule ID:
Title:
Statement:
Category:
Source:
Scope:
Applicability:
Conditions:
Outcome:
Exceptions:
Priority:
Status:
Effective From:
Effective Until:
Rationale:
Evidence:
Related Requirements:
Related Domain Concepts:
Related Constraints:
Related Decisions:
Related Specifications:
Verification:
Traceability:
```

Example:

```text id="a2f7m5"
Rule ID: BR-001

Title:
Approval Threshold

Statement:
Transactions above the defined business threshold
require additional approval.

Category:
POLICY

Source:
Business policy `<reference>`.

Scope:
Transaction approval

Applicability:
Transactions exceeding the threshold.

Conditions:
Transaction amount > approved threshold.

Outcome:
Additional approval is required.

Exceptions:
<documented exceptions>

Status:
ACTIVE

Verification:
Business rule tests.
```

---

## 8. Business Rule Statement Quality

Business rules should avoid implementation-specific language.

Weak:

```text id="g7p2k4"
The frontend must disable the button when the amount is greater than X.
```

This describes UI behavior.

Better:

```text id="z8m5q1"
Transactions above X require additional approval.
```

The UI may disable a button, the API may reject an operation, or the domain model may prevent a transition.

Those are implementation consequences of the rule.

---

## 9. Business Rule Register

Projects should maintain a consolidated register.

| ID     | Rule          | Category  | Priority | Status | Scope     |
| ------ | ------------- | --------- | -------- | ------ | --------- |
| BR-001 | `<statement>` | POLICY    | HIGH     | ACTIVE | `<scope>` |
| BR-002 | `<statement>` | INVARIANT | CRITICAL | ACTIVE | `<scope>` |

The register provides overview and traceability.

---

## 10. Rule Priority

Recommended priority levels:

```text id="e4q9c7"
CRITICAL
HIGH
MEDIUM
LOW
```

Priority reflects the consequence of violating the rule.

### `CRITICAL`

Violation may invalidate core business behavior, compliance, financial integrity, security, or critical domain invariants.

### `HIGH`

Violation materially affects business correctness.

### `MEDIUM`

Violation affects a meaningful but non-critical behavior.

### `LOW`

Violation has limited business impact.

Priority does not determine technical implementation priority automatically.

---

## 11. Rule Status

Recommended lifecycle states:

```text id="x5k8r3"
PROPOSED
UNDER_REVIEW
ACCEPTED
ACTIVE
SUSPENDED
SUPERSEDED
RETIRED
REJECTED
```

### `PROPOSED`

The rule has been identified but not confirmed.

### `UNDER_REVIEW`

The rule is being validated with domain stakeholders or evidence.

### `ACCEPTED`

The rule has been explicitly accepted.

### `ACTIVE`

The rule currently applies.

### `SUSPENDED`

The rule temporarily does not apply.

### `SUPERSEDED`

A newer rule replaces it.

### `RETIRED`

The rule no longer applies.

### `REJECTED`

The proposed rule was determined not to represent valid domain behavior.

---

## 12. Rule Source

A business rule should identify its origin when known.

Possible sources include:

* domain expert,
* business policy,
* product requirement,
* regulatory source,
* contractual obligation,
* existing system behavior,
* documented process,
* approved decision,
* validated domain analysis.

The agent MUST NOT fabricate a source.

If the source is unknown:

```text id="x1k6z9"
Source:
UNKNOWN
```

The rule should then be treated as requiring validation.

---

## 13. Business Rule Applicability

A rule should define when it applies.

Possible dimensions include:

* actor,
* entity,
* transaction type,
* state,
* location,
* time period,
* amount,
* category,
* business context,
* product variant.

Example:

```text id="n8r3v5"
Rule:
Additional approval is required.

Applicability:
Transactions exceeding the approval threshold
created during the active policy period.
```

Ambiguous applicability should be recorded as an unknown rather than guessed.

---

## 14. Conditions and Outcomes

A business rule should distinguish:

```text id="p4m7c1"
Conditions
    ↓
Business Rule
    ↓
Outcome
```

Example:

```text id="s6q2v8"
Conditions:
- Transaction is active.
- Amount exceeds threshold.
- No approved exception applies.

Outcome:
Additional approval is required.
```

This structure improves testability and domain modeling.

---

## 15. Exceptions

Business rules may contain exceptions.

Exceptions should be explicit.

Example:

```text id="w3h9k5"
Rule:
Transactions above the threshold require approval.

Exception:
Transactions belonging to the authorized internal category
do not require additional approval.
```

Exceptions should not be hidden inside implementation logic.

---

## 16. Business Rule Conflicts

Business rules may conflict.

Example:

```text id="d8m4p2"
BR-001:
An operation may be completed within the defined period.

BR-002:
The operation must be blocked after the closing event.
```

The agent MUST NOT silently select one rule.

It should identify:

* conflicting rules,
* sources,
* authority,
* scope,
* effective period,
* consequences,
* required resolution.

Possible outcomes:

* one rule supersedes another,
* rules apply to different scopes,
* an exception resolves the conflict,
* a new policy resolves the conflict,
* the conflict remains blocking.

---

## 17. Temporal Rules

Business rules may change over time.

A rule should support:

```text id="m7q1v4"
Effective From:
Effective Until:
```

Example:

```text id="c5n8r2"
Rule A:
Applies until the end of the current policy period.

Rule B:
Replaces Rule A beginning with the next policy period.
```

Historical rules should remain traceable when they affected historical behavior or records.

---

## 18. Business Rule Invariants

Invariants are conditions that must remain true within their domain boundary.

Examples:

```text id="u6p3y9"
An approved transaction cannot return to an unapproved state.

A finalized record cannot be modified through normal business operations.

An entity cannot exist without its required business relationship.
```

Invariants should be identified explicitly because they may influence:

* aggregate boundaries,
* domain services,
* transaction boundaries,
* consistency requirements,
* commands,
* state transitions.

---

## 19. Business Rule State Transitions

State-based rules should be represented explicitly.

Example:

```text id="z4r8k1"
Current State → Trigger → Resulting State

DRAFT → submit → SUBMITTED
SUBMITTED → approve → APPROVED
SUBMITTED → reject → REJECTED
SUBMITTED → cancel → CANCELLED
```

Invalid transitions should be documented when they are business-significant.

Example:

```text id="f2m6q9"
APPROVED → DRAFT
Not permitted.
```

The state machine is a domain model artifact, not merely a UI implementation.

---

## 20. Business Rules and Requirements

Requirements and business rules are related but different.

A requirement describes what the product must provide.

A business rule defines domain behavior or policy.

Example:

```text id="a9c5v7"
Requirement:
The system must allow authorized users to approve transactions.

Business Rule:
Transactions above the defined threshold require additional approval.
```

The requirement may be satisfied by implementing behavior governed by the business rule.

Traceability should connect them when appropriate.

---

## 21. Business Rules and Constraints

Business rules and constraints may look similar but operate at different levels.

Example:

```text id="q6n2m8"
Business Rule:
A transaction above the threshold requires additional approval.

Technical Constraint:
The system must integrate with the existing approval platform.
```

The first describes business behavior.

The second limits the solution space.

---

## 22. Business Rules and Architecture

Business rules should influence architecture where their characteristics require it.

Examples:

* critical invariants may influence domain boundaries,
* complex state transitions may influence domain modeling,
* strong consistency requirements may influence transaction boundaries,
* authorization policies may influence security boundaries,
* temporal policies may influence data and process modeling.

However:

```text id="y8m3c6"
Business Rule
    ≠
Architecture Decision
```

The agent must not encode architectural choices into the business rule itself.

---

## 23. Business Rule Verification

Every significant business rule should have a verification strategy.

Possible verification mechanisms:

* domain tests,
* acceptance tests,
* specification tests,
* scenario tests,
* integration tests,
* property-based tests,
* manual domain validation,
* audit evidence.

Example:

```text id="r1q7v5"
Rule:
Transactions above threshold require approval.

Verification:
- transaction below threshold → no additional approval
- transaction above threshold → approval required
- transaction with valid exception → exception applies
```

Verification should validate the business behavior rather than merely test implementation details.

---

## 24. Business Rule Traceability

Business rules should be traceable to relevant artifacts.

Typical relationships:

```text id="b4k9x2"
Product Requirement
       ↓
Business Rule
       ↓
Domain Concept
       ↓
Domain Behavior
       ↓
Specification
       ↓
Implementation
       ↓
Verification
```

Recommended relationships include:

```text id="n5r8c1"
DERIVES_FROM
REFINES
GOVERNS
CONSTRAINS
REALIZES
SPECIFIES
VERIFIES
SUPERSEDES
```

---

## 25. Business Rule Change Impact

When a business rule changes, evaluate its impact on:

* product requirements,
* domain model,
* domain invariants,
* state transitions,
* application behavior,
* API contracts,
* events,
* data,
* security,
* specifications,
* tests,
* historical records,
* migration requirements.

The agent should use traceability rather than assume the impact.

---

## 26. Existing Systems

For existing systems, business rules must be distinguished from observed implementation behavior.

Example:

```text id="h2m7q4"
Observed:
The existing system rejects operation X.

Unknown:
Is this rejection an intentional business rule
or an implementation limitation?
```

The agent must not automatically convert observed behavior into a business rule.

Evidence should be classified as:

```text id="j9v5d3"
DOCUMENTED
OBSERVED
INFERRED
CONFIRMED
UNKNOWN
```

---

## 27. System Evolution

During system evolution:

1. Identify existing rules.
2. Determine which rules remain valid.
3. Identify changed rules.
4. Identify new rules.
5. Identify retired rules.
6. Analyze affected domain behavior.
7. Update dependent specifications and verification.
8. Preserve historical traceability.

The agent should avoid redefining unrelated business rules.

---

## 28. Business Rule Ownership

Each significant business rule should have an identifiable source or authority where applicable.

Possible ownership:

* business owner,
* domain expert,
* product owner,
* compliance authority,
* operational owner,
* approved policy.

Technical implementation ownership is not the same as business rule ownership.

---

## 29. Business Rule Review

A business rule should be reviewed when:

* domain terminology changes,
* product scope changes,
* business policy changes,
* requirements change,
* regulatory conditions change,
* a domain boundary changes,
* an observed behavior contradicts the documented rule,
* a rule is found to be ambiguous,
* a rule becomes obsolete.

---

## 30. Business Rule Quality Checklist

### Definition

* [ ] The rule describes domain behavior.
* [ ] The statement is explicit.
* [ ] Conditions are clear.
* [ ] Outcomes are clear.
* [ ] Exceptions are explicit.

### Source

* [ ] The source is identified where possible.
* [ ] Unsupported rules are marked for validation.
* [ ] Regulatory rules have authoritative evidence.

### Domain

* [ ] Relevant domain concepts are identified.
* [ ] Invariants are explicit.
* [ ] Important state transitions are documented.
* [ ] Business terminology is consistent.

### Verification

* [ ] The rule is testable.
* [ ] Verification strategy exists.
* [ ] Important edge cases are considered.

### Governance

* [ ] Status is explicit.
* [ ] Effective period is known when applicable.
* [ ] Conflicts are visible.
* [ ] Ownership or authority is known.

### Traceability

* [ ] Related requirements are identified.
* [ ] Related domain concepts are identified.
* [ ] Related specifications are identified.
* [ ] Verification is traceable.

---

## 31. Gate Contribution

Business rules contribute to both the **Product Discovery Gate** and the **Domain Discovery Gate**.

Product Discovery should establish enough business behavior to understand the product.

Domain Discovery should refine that understanding into explicit domain rules and models.

The gate should verify that:

1. Significant business rules are identified.
2. Business rules are distinguished from technical implementation.
3. Important invariants are explicit.
4. Significant state transitions are understood.
5. Conflicting rules are visible.
6. Rules with unclear authority are identified.
7. Important rules have verification strategies.
8. Rules that materially affect domain boundaries are traceable.

Not every business rule must be fully formalized during early discovery.

---

## 32. Compact Business Rule Register

For lightweight projects:

| ID     | Rule          | Category  | Priority | Status   | Verification |
| ------ | ------------- | --------- | -------- | -------- | ------------ |
| BR-001 | `<statement>` | INVARIANT | CRITICAL | ACTIVE   | `<method>`   |
| BR-002 | `<statement>` | POLICY    | HIGH     | PROPOSED | `<method>`   |

The level of detail should scale according to domain complexity and business consequence.

---

## 33. Agent Instructions

When handling business rules, the agent MUST:

1. Identify business behavior explicitly.
2. Separate business rules from requirements.
3. Separate business rules from technical constraints.
4. Separate business rules from architecture decisions.
5. Avoid encoding implementation details into rules.
6. Identify conditions and outcomes.
7. Identify exceptions explicitly.
8. Identify invariants and state transitions.
9. Identify rule conflicts.
10. Preserve temporal validity.
11. Identify rule sources.
12. Never invent business policies.
13. Treat undocumented legacy behavior as evidence, not automatically as a business rule.
14. Ask domain questions when rule semantics are ambiguous.
15. Trace consequential rules to domain concepts and specifications.
16. Define verification for important rules.
17. Analyze change impact when rules change.
18. Preserve historical rules when they explain past behavior.
19. Avoid over-formalizing trivial business behavior.
20. Prefer domain language over technical terminology.

---

## 34. Anti-Patterns

### 34.1 UI Rules Disguised as Business Rules

Describing button states, screen behavior, or visual interactions as domain rules.

### 34.2 Technical Rules Disguised as Business Rules

Describing database or framework behavior as domain policy.

### 34.3 Invented Business Policy

Creating rules without evidence or domain authority.

### 34.4 Legacy Equals Business Rule

Assuming existing behavior represents intentional business policy.

### 34.5 Hidden Exceptions

Encoding exceptions only inside implementation logic.

### 34.6 Unverifiable Rules

Writing rules too vaguely to determine whether behavior is correct.

### 34.7 Rule Duplication

Representing the same rule independently in multiple artifacts without a canonical source.

### 34.8 Architecture Leakage

Embedding technology or architecture choices directly into domain rules.

### 34.9 Ignoring Temporal Validity

Applying historical business rules to current behavior without checking their effective period.

### 34.10 Rule Explosion

Documenting every trivial implementation condition as a formal business rule.

---

## 35. Final Principle

Business rules describe how the business or domain operates.

They should survive changes in UI, frameworks, infrastructure, persistence mechanisms, and implementation details.

A mature lifecycle makes business rules explicit, authoritative, testable, traceable, and independent of technical implementation.

The agent should continuously ask:

> **Is this statement describing how the business must behave, or am I accidentally describing how we chose to implement it?**

The distinction protects the domain model from unnecessary technical coupling and provides a stable foundation for subsequent Domain Discovery and DDD.

