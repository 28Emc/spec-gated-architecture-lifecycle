# Assumptions

## 1. Document Metadata

* **Document Type:** Product Discovery — Assumptions
* **Lifecycle Phase:** Product Discovery
* **Status:** `DRAFT`
* **Version:** `1.0`
* **Owner:** `<owner>`
* **Created:** `<date>`
* **Updated:** `<date>`
* **Related Product Context:** `<document>`
* **Related Requirements:** `<references>`
* **Related Constraints:** `<references>`
* **Related Decisions:** `<references>`
* **Related Architecture:** `<references>`

---

## 2. Purpose

This document identifies, records, evaluates, and manages assumptions made during product discovery.

An assumption is information treated as sufficiently plausible for analysis or planning even though it has not yet been fully established as fact.

Assumptions are unavoidable in complex projects. The objective is not to eliminate them, but to make them visible, evaluate their consequences, and prevent them from silently becoming requirements, constraints, architecture decisions, or implementation facts.

---

## 3. Core Principle

An assumption is not a fact.

```text
Fact
    ↓
Supported by evidence

Assumption
    ↓
Currently believed or accepted for analysis
    ↓
Requires validation when consequential

Decision
    ↓
Explicitly selects an option
```

The agent MUST NOT present an assumption as an established fact.

An assumption MAY be used temporarily for analysis when:

* its uncertainty is explicit,
* its potential impact is understood,
* it does not create unsupported commitments,
* and validation is planned when necessary.

---

## 4. Assumption Model

An assumption should capture:

```text id="7s9k3k"
Assumption
├── Identity
├── Statement
├── Category
├── Source
├── Scope
├── Confidence
├── Impact
├── Status
├── Evidence
├── Validation Method
├── Validation Owner
├── Validation Target
├── Consequences
└── Traceability
```

Each consequential assumption should answer:

* What are we assuming?
* Why are we making this assumption?
* What evidence currently supports it?
* How confident are we?
* What happens if it is false?
* Does it block a decision?
* How can it be validated?
* Who or what can validate it?
* Which artifacts depend on it?

---

## 5. Assumption Categories

Assumptions MAY belong to one or more of the following categories.

### 5.1 Product

Assumptions about users, use cases, adoption, workflows, product behavior, or product scope.

Examples:

* Users will primarily interact with the system through a specific workflow.
* A particular capability is expected to be relevant to the initial audience.
* A feature can initially operate without a certain advanced capability.

Product assumptions should be validated through product discovery when they materially affect product scope.

---

### 5.2 User / Actor

Assumptions about users, actors, roles, permissions, behavior, or responsibilities.

Examples:

* A specific actor will initiate a workflow.
* A user is expected to perform a particular action before another action becomes available.

User assumptions must not be treated as confirmed behavioral requirements without evidence.

---

### 5.3 Business

Assumptions about business processes, operating models, policies, commercial behavior, or organizational expectations.

Examples:

* A business process is expected to remain unchanged during the first release.
* A particular operational team is expected to own a capability.

---

### 5.4 Domain

Assumptions about domain concepts, terminology, business rules, relationships, lifecycle, or ownership.

Examples:

* Two terms currently used by stakeholders refer to the same domain concept.
* A specific business event represents the end of a process.

Domain assumptions are particularly important because incorrect assumptions can propagate into the domain model and architecture.

---

### 5.5 Technical

Assumptions about technical capabilities, dependencies, environments, platforms, or integration behavior.

Examples:

* An external system is expected to expose a required capability.
* An existing platform is expected to support the target workload.

Technical assumptions should be validated before they become architecture constraints.

---

### 5.6 Data

Assumptions about data availability, quality, ownership, structure, volume, lifecycle, or consistency.

Examples:

* Historical data is expected to contain the fields required for migration.
* A specific system is expected to remain the authoritative source for a data set.

---

### 5.7 Integration

Assumptions about external systems, APIs, events, protocols, dependencies, or third-party services.

Examples:

* An external dependency is expected to remain available during migration.
* A third-party interface is expected to preserve a specific behavior.

---

### 5.8 Security

Assumptions about identities, access models, trust boundaries, authentication, authorization, or threat conditions.

Examples:

* An existing identity provider is expected to remain available.
* A specific actor is expected to operate within an established trust boundary.

Security assumptions with significant consequences should be validated before security architecture is finalized.

---

### 5.9 Operational

Assumptions about deployment, support, monitoring, incident response, maintenance, or operational ownership.

Examples:

* An existing operations team is expected to support the new capability.
* A deployment environment is expected to remain available.

---

### 5.10 Infrastructure

Assumptions about hosting, network, storage, compute, availability, environments, or platform capabilities.

Examples:

* Required infrastructure capacity is expected to be available.
* A deployment environment is expected to support the selected operational model.

---

## 6. Assumption Status

Recommended lifecycle states:

```text id="y58kde"
OPEN
PROPOSED
ACCEPTED_FOR_ANALYSIS
VALIDATING
VALIDATED
INVALIDATED
SUPERSEDED
DEFERRED
```

### `OPEN`

The assumption has been identified but not yet evaluated.

### `PROPOSED`

The assumption has been formulated but requires explicit acceptance before being used significantly.

### `ACCEPTED_FOR_ANALYSIS`

The assumption may temporarily be used for reasoning while remaining explicitly uncertain.

This does not mean that the assumption has become a fact.

### `VALIDATING`

A validation activity is currently in progress.

### `VALIDATED`

Evidence confirms the assumption sufficiently for the relevant scope.

A validated assumption should normally be converted into the appropriate artifact:

* fact,
* requirement,
* constraint,
* domain rule,
* decision,
* or other relevant project knowledge.

### `INVALIDATED`

Evidence demonstrates that the assumption is incorrect.

### `SUPERSEDED`

A newer assumption, fact, or decision replaces it.

### `DEFERRED`

Validation is intentionally postponed.

Deferred assumptions must remain visible when they could affect future work.

---

## 7. Confidence

Assumptions should have an explicit confidence level.

### `HIGH`

Strong evidence exists, but the information has not yet been fully confirmed.

### `MEDIUM`

Some supporting evidence exists, but meaningful uncertainty remains.

### `LOW`

The assumption is primarily based on incomplete information or weak inference.

Confidence does not determine whether an assumption is safe to use.

A high-confidence assumption may still be high-risk if its consequences are significant.

---

## 8. Impact

The impact of an incorrect assumption should be classified.

```text id="pg4n5e"
LOW
MEDIUM
HIGH
CRITICAL
```

### LOW

Invalidation has limited local consequences.

### MEDIUM

Invalidation affects a meaningful part of the product or design.

### HIGH

Invalidation may require significant changes to domain, architecture, contracts, data, or infrastructure.

### CRITICAL

Invalidation may compromise major product objectives, security, regulatory obligations, system viability, or a significant architecture commitment.

---

## 9. Uncertainty vs Assumption

Not every unknown is an assumption.

An unknown means:

> We do not currently know this information.

An assumption means:

> We do not know this with certainty, but we are temporarily treating a particular interpretation as plausible.

Example:

```text
Unknown:
How many users will access the system concurrently?

Assumption:
Initial usage is expected to remain within a relatively small operational scale.
```

The assumption should not be converted into a hard capacity constraint unless evidence supports it.

---

## 10. Assumption Record

Each significant assumption should contain:

```text id="p8a1j5"
Assumption ID:
Title:
Statement:
Category:
Source:
Scope:
Confidence:
Impact:
Status:
Rationale:
Evidence:
Validation Method:
Validation Owner:
Validation Target:
Consequences if False:
Affected Requirements:
Affected Constraints:
Affected Decisions:
Affected Architecture:
Affected Contracts:
Traceability:
Review Date:
```

Example:

```text id="lq7j0v"
Assumption ID: ASM-001

Title:
External Identity Provider Availability

Statement:
The existing identity provider is expected to remain available
throughout the initial migration period.

Category:
INTEGRATION

Scope:
Authentication boundary

Confidence:
MEDIUM

Impact:
HIGH

Status:
ACCEPTED_FOR_ANALYSIS

Evidence:
Existing production integration.

Validation Method:
Confirm provider lifecycle and migration compatibility.

Consequences if False:
Authentication architecture may require redesign.

Affected Areas:
Security, architecture, infrastructure.

Review Date:
<date>
```

---

## 11. Assumption Register

Projects should maintain a consolidated register.

| ID      | Statement     | Category     | Confidence | Impact | Status                | Validation |
| ------- | ------------- | ------------ | ---------- | ------ | --------------------- | ---------- |
| ASM-001 | `<statement>` | `<category>` | HIGH       | MEDIUM | ACCEPTED_FOR_ANALYSIS | `<method>` |
| ASM-002 | `<statement>` | `<category>` | MEDIUM     | HIGH   | VALIDATING            | `<method>` |

The register provides visibility across the lifecycle.

---

## 12. Assumption Validation

Validation should be proportional to consequence.

Possible validation mechanisms include:

* stakeholder confirmation,
* domain expert review,
* documentation review,
* existing-system inspection,
* runtime observation,
* prototype,
* proof of concept,
* data analysis,
* contract verification,
* integration test,
* security analysis,
* architecture experiment,
* measurement,
* production evidence.

The agent should select the smallest validation activity capable of reducing the relevant uncertainty.

---

## 13. Consequence Analysis

For consequential assumptions, analyze:

* What happens if the assumption is true?
* What happens if it is false?
* Which artifacts depend on it?
* Which decisions become invalid?
* What would need to change?
* Can the impact be isolated?
* Is there a reversible option?
* Does validation need to occur before progression?

Example:

```text id="r6zv3k"
Assumption:
External service supports required operation.

If true:
Candidate integration remains viable.

If false:
Alternative integration mechanism is required.

Potential impact:
Architecture + contract + implementation.

Validation:
Review external contract before architecture gate.
```

---

## 14. Critical Assumptions

An assumption should be considered critical when its invalidation could materially affect:

* product viability,
* core domain understanding,
* architecture boundaries,
* public contracts,
* data ownership,
* security boundaries,
* regulatory compliance,
* major infrastructure choices,
* migration strategy,
* significant cost,
* difficult-to-reverse decisions.

Critical assumptions should normally be validated before the affected gate is passed.

---

## 15. Assumption Dependencies

Assumptions may depend on other assumptions.

Example:

```text id="6r6v7c"
ASM-001:
Users are expected to authenticate through the existing identity provider.

ASM-002:
The existing identity provider supports the required authorization model.

ASM-002 depends on ASM-001.
```

Recommended relationship types:

```text id="j7s9hr"
DEPENDS_ON
SUPPORTS
CONTRADICTS
INVALIDATES
REFINES
INFLUENCES
```

Dependencies should be explicit when they affect progression or decisions.

---

## 16. Assumption Conflicts

Conflicting assumptions must be identified.

Example:

```text id="g8r0gy"
ASM-001:
Users are expected to operate individually.

ASM-002:
Users are expected to collaborate within shared workflows.
```

The agent MUST NOT silently select one assumption.

Instead:

1. Identify the conflict.
2. Identify the evidence supporting each assumption.
3. Determine which product/domain questions are affected.
4. Assess the consequences.
5. Request clarification or perform validation when appropriate.

---

## 17. Assumptions and Requirements

An assumption must not silently become a requirement.

Example:

```text id="q2cb2m"
Assumption:
Users are expected to receive notifications.

Requirement:
The system must notify users when event X occurs.
```

The requirement requires explicit product intent.

The assumption merely represents an interpretation that may help discovery.

When an assumption becomes confirmed product intent, it should be promoted into the appropriate requirement or product artifact.

---

## 18. Assumptions and Constraints

An assumption must not silently become a constraint.

Example:

```text id="e9u6dr"
Assumption:
The organization probably prefers its existing infrastructure.

Constraint:
The system must be deployed using the existing infrastructure.
```

The second statement requires authoritative evidence.

Until confirmed, the first remains an assumption or preference.

---

## 19. Assumptions and Architecture Decisions

Architecture decisions should identify consequential assumptions on which they depend.

Example:

```text id="0t0xk3"
ASM-004
   ↓ INFLUENCES
ADR-003
   ↓ SELECTS
Architecture Option B
```

If ASM-004 is invalidated, ADR-003 should be reviewed.

The agent MUST NOT treat a decision as permanently valid when a foundational assumption has changed.

---

## 20. Assumption and Evidence

Evidence supporting an assumption may include:

* explicit stakeholder statements,
* current system behavior,
* existing contracts,
* approved documentation,
* tests,
* operational measurements,
* domain expert input,
* external documentation,
* validated experiments.

Evidence should be identified rather than described vaguely.

Weak:

```text
Evidence:
This is probably how the system works.
```

Better:

```text
Evidence:
Current production API contract and observed behavior from the
existing integration.
```

---

## 21. Existing Systems

Existing systems frequently contain undocumented assumptions.

The agent should distinguish:

```text id="z5e0yy"
Documented behavior
        ↓
Observed behavior
        ↓
Inferred assumptions
        ↓
Validated facts
```

For existing systems:

* documented behavior is evidence,
* actual behavior is evidence,
* undocumented behavior is not automatically a requirement,
* historical implementation is not automatically a constraint,
* inferred behavior should be marked accordingly.

When documentation and runtime behavior differ, the discrepancy itself should be recorded.

---

## 22. System Evolution

During system evolution, assumptions should be evaluated specifically against the change boundary.

Example:

```text id="4hyq1t"
Existing assumption
        ↓
Affected by change?
        ↓
YES
        ↓
Validate
        ↓
Update dependent decisions/specifications
```

Unrelated assumptions do not need to be revalidated solely because another part of the system changed.

---

## 23. Assumption Expiration

Some assumptions are valid only temporarily.

Examples:

* during migration,
* during a prototype,
* until an external dependency is verified,
* until user research is completed,
* until infrastructure capacity is measured.

Temporary assumptions should include:

```text id="w2u6r5"
Review Date:
Expiration Condition:
Validation Target:
```

An expired assumption should never remain silently active.

---

## 24. Assumption Change Impact

When an assumption is invalidated, identify affected artifacts:

```text id="8p4tqk"
Invalidated Assumption
        ↓
Dependent Requirements
        ↓
Constraints
        ↓
Domain Understanding
        ↓
Architecture Decisions
        ↓
Contracts
        ↓
Specifications
        ↓
Implementation
        ↓
Verification
```

Impact propagation should follow actual traceability relationships.

The agent should not automatically invalidate the entire project.

---

## 25. Decision Readiness

Before making a consequential decision, the agent should check whether important assumptions remain unresolved.

A decision MAY proceed when:

* assumptions are low-impact,
* assumptions are explicitly documented,
* consequences are acceptable,
* the decision is reversible,
* or validation can safely occur later.

A decision SHOULD be blocked when:

* a critical assumption is unresolved,
* the decision is difficult to reverse,
* invalidation would cause major redesign,
* the assumption affects security or compliance,
* or the decision would create an external contract prematurely.

---

## 26. Assumption Review Checklist

### Identification

* [ ] Important assumptions are explicitly recorded.
* [ ] Facts and assumptions are distinguished.
* [ ] Unknowns are not incorrectly represented as assumptions.

### Evidence

* [ ] Supporting evidence is identified.
* [ ] Weak inference is marked appropriately.
* [ ] Confidence is explicit.

### Impact

* [ ] Consequences of invalidation are understood.
* [ ] Critical assumptions are identified.
* [ ] Dependent artifacts are known.

### Validation

* [ ] Validation method is defined where necessary.
* [ ] Validation timing is appropriate.
* [ ] Validation ownership is clear.
* [ ] Temporary assumptions have review or expiration conditions.

### Governance

* [ ] Assumptions do not silently become requirements.
* [ ] Assumptions do not silently become constraints.
* [ ] Assumptions do not silently become architecture decisions.
* [ ] Conflicting assumptions are visible.

### Lifecycle

* [ ] Status is current.
* [ ] Invalidated assumptions remain traceable.
* [ ] Superseded assumptions preserve history.

---

## 27. Gate Contribution

Assumptions contribute primarily to the **Product Discovery Gate**, but consequential assumptions may affect later gates.

The gate should verify that:

1. Important assumptions are identified.
2. Facts, assumptions, and unknowns are distinguished.
3. High-impact assumptions have appropriate validation plans.
4. Critical assumptions are validated before dependent irreversible decisions.
5. Temporary assumptions have review or expiration conditions.
6. Assumption dependencies are traceable.
7. No significant requirement or constraint exists solely because of an undocumented assumption.

The presence of unresolved assumptions does not automatically block progression.

The deciding factor is their consequence.

---

## 28. Compact Assumption Register

For lightweight projects:

| ID      | Statement     | Confidence | Impact | Status                | Validation |
| ------- | ------------- | ---------- | ------ | --------------------- | ---------- |
| ASM-001 | `<statement>` | MEDIUM     | HIGH   | VALIDATING            | `<method>` |
| ASM-002 | `<statement>` | HIGH       | LOW    | ACCEPTED_FOR_ANALYSIS | `<method>` |

The amount of detail should scale according to uncertainty and consequence.

---

## 29. Agent Instructions

When handling assumptions, the agent MUST:

1. Distinguish facts from assumptions.
2. Never present assumptions as facts.
3. Record consequential assumptions explicitly.
4. Identify supporting evidence.
5. Assign confidence and impact.
6. Define validation when uncertainty matters.
7. Avoid converting assumptions into requirements without explicit product intent.
8. Avoid converting assumptions into constraints without authoritative evidence.
9. Avoid allowing assumptions to silently become architecture decisions.
10. Identify assumptions that influence consequential decisions.
11. Detect conflicting assumptions.
12. Revalidate assumptions when relevant context changes.
13. Preserve invalidated and superseded assumptions for traceability.
14. Use the smallest sufficient validation activity.
15. Escalate critical unresolved assumptions before irreversible decisions.
16. Treat existing-system behavior as evidence, not automatically as truth about intended future behavior.
17. Distinguish temporary assumptions from durable project knowledge.
18. Propagate invalidation through actual traceability relationships.
19. Never invent stakeholder intent.
20. Ask targeted questions when the assumption materially affects the solution.

---

## 30. Anti-Patterns

### 30.1 Hidden Assumptions

Using assumptions without recording them.

### 30.2 Assumption as Fact

Presenting uncertain information as confirmed project knowledge.

### 30.3 Assumption as Requirement

Turning expected behavior into mandatory product behavior without explicit intent.

### 30.4 Assumption as Constraint

Treating an unverified preference or expectation as a limitation.

### 30.5 Assumption as Decision

Allowing an inferred implementation choice to become an architectural commitment.

### 30.6 False Confidence

Assigning high confidence without meaningful evidence.

### 30.7 Validation Theater

Defining validation activities that do not actually reduce the relevant uncertainty.

### 30.8 Permanent Temporary Assumption

Allowing temporary assumptions to remain active indefinitely.

### 30.9 Ignoring Consequences

Recording an assumption without analyzing what happens if it is false.

### 30.10 Assumption Explosion

Recording trivial guesses that add documentation overhead without improving reasoning.

---

## 31. Final Principle

Assumptions are temporary bridges across uncertainty.

They allow reasoning to continue without pretending that incomplete information is known.

A well-governed lifecycle makes assumptions visible, evidence-based, confidence-aware, impact-aware, and traceable.

The agent should continuously ask:

> **What am I currently assuming, what evidence supports it, and what happens if I am wrong?**

The goal is not to eliminate every assumption.

The goal is to ensure that consequential assumptions are visible and validated before they become expensive commitments.

