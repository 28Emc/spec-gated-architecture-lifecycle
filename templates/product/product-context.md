# Product Context

> Template for establishing the minimum product context required before domain and architecture decisions are made.

## 1. Document Metadata

| Field          | Value                                             |
| -------------- | ------------------------------------------------- |
| Document ID    | `PROD-CTX-XXX`                                    |
| Title          | `<Product / System Name>`                         |
| Version        | `<version>`                                       |
| Status         | `DRAFT`                                           |
| Lifecycle Mode | `GREENFIELD / EXISTING_SYSTEM / SYSTEM_EVOLUTION` |
| Owner          | `<owner>`                                         |
| Date           | `<YYYY-MM-DD>`                                    |
| Last Updated   | `<YYYY-MM-DD>`                                    |

### Status

Allowed values:

```text
DRAFT
IN_REVIEW
APPROVED
SUPERSEDED
```

---

# 2. Purpose

Describe why the product or change exists.

Answer:

> What problem are we trying to solve?

Keep this section focused on the problem and desired outcome rather than implementation.

```text
<Describe the problem or opportunity in concise terms.>
```

---

# 3. Product Vision

Describe the intended product outcome at a high level.

```text
<What should this product enable or improve?>
```

The vision should remain technology-independent.

---

# 4. Problem Statement

Describe the problem from the perspective of the relevant users, stakeholders, or business context.

```text
Current Situation:
<Describe the current situation.>

Problem:
<Describe the problem.>

Impact:
<Describe the consequence of the problem.>

Desired Outcome:
<Describe the desired outcome.>
```

---

# 5. Target Users and Actors

Identify the relevant actors.

| Actor     | Description     | Primary Need | Relevance                        |
| --------- | --------------- | ------------ | -------------------------------- |
| `<Actor>` | `<Description>` | `<Need>`     | `PRIMARY / SECONDARY / EXTERNAL` |

Do not invent actors when insufficient evidence exists.

If an actor is uncertain:

```text
Status: UNKNOWN
Reason: <why this cannot currently be determined>
```

---

# 6. Product Scope

## 6.1 In Scope

List capabilities or outcomes explicitly included in the current scope.

* `<Capability / Outcome>`
* `<Capability / Outcome>`
* `<Capability / Outcome>`

## 6.2 Out of Scope

List explicitly excluded capabilities.

* `<Capability / Outcome>`
* `<Capability / Outcome>`

## 6.3 Deferred

List relevant capabilities that may be addressed later.

* `<Capability / Outcome>`

A deferred item must not be treated as part of the current scope unless explicitly promoted.

---

# 7. Product Outcomes

Define the outcomes the product should achieve.

| ID        | Outcome     | Expected Value | Measurement     |
| --------- | ----------- | -------------- | --------------- |
| `OUT-001` | `<Outcome>` | `<Value>`      | `<Measurement>` |

Outcomes should describe meaningful results rather than implementation tasks.

Prefer:

```text
Reduce the time required to complete weekly planning.
```

over:

```text
Create a planning service.
```

---

# 8. Requirements

Capture known product-level requirements.

| ID        | Requirement     | Type         | Priority | Status |
| --------- | --------------- | ------------ | -------- | ------ |
| `REQ-001` | `<Requirement>` | `FUNCTIONAL` | `HIGH`   | `OPEN` |

### Requirement Types

```text
FUNCTIONAL
QUALITY_ATTRIBUTE
SECURITY
COMPLIANCE
OPERATIONAL
INTEGRATION
DATA
CONSTRAINT
```

### Requirement Status

```text
OPEN
PROPOSED
ACCEPTED
REJECTED
DEFERRED
SUPERSEDED
```

Requirements should represent what the product needs, not how the system must implement it, unless the constraint is explicitly part of the requirement.

---

# 9. Quality Attributes

Capture relevant non-functional expectations.

| Attribute     | Expectation     | Priority          | Evidence     |
| ------------- | --------------- | ----------------- | ------------ |
| `<Attribute>` | `<Expectation>` | `HIGH/MEDIUM/LOW` | `<Evidence>` |

Examples include:

* Availability
* Performance
* Security
* Scalability
* Reliability
* Maintainability
* Observability
* Accessibility
* Compatibility
* Privacy

Do not introduce quality attributes merely because they are common in software systems.

Include them when they are relevant to the product.

---

# 10. Constraints

Document known constraints.

| ID        | Constraint     | Source     | Impact     |
| --------- | -------------- | ---------- | ---------- |
| `CON-001` | `<Constraint>` | `<Source>` | `<Impact>` |

Constraints may originate from:

* Business requirements
* Existing systems
* Regulatory requirements
* Organizational policy
* Budget
* Time
* Technology
* Infrastructure
* External dependencies
* Explicit stakeholder decisions

Distinguish mandatory constraints from preferences.

---

# 11. Assumptions

Record assumptions that influence product understanding.

| ID        | Assumption     | Confidence        | Validation Needed |
| --------- | -------------- | ----------------- | ----------------- |
| `ASM-001` | `<Assumption>` | `HIGH/MEDIUM/LOW` | `<Validation>`    |

An assumption must not be presented as a requirement or decision.

---

# 12. Unknowns

Record information that is currently unavailable but potentially relevant.

| ID        | Unknown     | Impact     | Blocking? | Resolution         |
| --------- | ----------- | ---------- | --------- | ------------------ |
| `UNK-001` | `<Unknown>` | `<Impact>` | `YES/NO`  | `<How to resolve>` |

Use this section instead of silently filling gaps with assumptions.

---

# 13. Business Rules

Capture known high-level rules that constrain product behavior.

| ID       | Business Rule | Scope     | Source     |
| -------- | ------------- | --------- | ---------- |
| `BR-001` | `<Rule>`      | `<Scope>` | `<Source>` |

Detailed domain modeling should occur during Domain Discovery.

This section should contain product-relevant rules that are already known.

---

# 14. Success Criteria

Define how successful delivery will be evaluated.

| ID       | Criterion     | Measurement     | Target     |
| -------- | ------------- | --------------- | ---------- |
| `SC-001` | `<Criterion>` | `<Measurement>` | `<Target>` |

Success criteria should be observable where possible.

---

# 15. Major Risks

Capture relevant product-level risks.

| ID         | Risk     | Probability       | Impact            | Mitigation     |
| ---------- | -------- | ----------------- | ----------------- | -------------- |
| `RISK-001` | `<Risk>` | `LOW/MEDIUM/HIGH` | `LOW/MEDIUM/HIGH` | `<Mitigation>` |

Architecture-specific risks should later be refined during architecture analysis.

---

# 16. External Dependencies

Identify dependencies outside the immediate product boundary.

| Dependency     | Type     | Purpose     | Owner     | Risk     |
| -------------- | -------- | ----------- | --------- | -------- |
| `<Dependency>` | `<Type>` | `<Purpose>` | `<Owner>` | `<Risk>` |

Examples:

* External systems
* Identity providers
* Payment providers
* Regulatory services
* Data providers
* Organizational platforms

---

# 17. Product Boundaries

Describe the initial conceptual boundary of the product.

```text
Inside Product Boundary:
- <Capability>
- <Capability>

Outside Product Boundary:
- <External Capability>
- <External System>
```

This is not yet an architecture diagram.

The purpose is to establish product scope before architectural decomposition.

---

# 18. Current State

Required primarily for `EXISTING_SYSTEM` and `SYSTEM_EVOLUTION`.

Describe the relevant current behavior.

```text
Current State:
<Describe what currently exists and how it behaves.>
```

Where possible, distinguish:

```text
DOCUMENTED
ACTUAL
INFERRED
UNKNOWN
```

Do not assume that historical documentation represents current behavior.

---

# 19. Target State

Describe the desired outcome after the current initiative.

```text
Target State:
<Describe the intended future behavior or capability.>
```

Avoid prescribing implementation details unless they are explicit constraints or decisions.

---

# 20. Open Product Decisions

List unresolved decisions that may affect subsequent lifecycle phases.

| ID        | Decision     | Options     | Impact     | Status |
| --------- | ------------ | ----------- | ---------- | ------ |
| `DEC-001` | `<Decision>` | `<Options>` | `<Impact>` | `OPEN` |

Do not record a recommendation as an accepted decision.

---

# 21. Traceability

Record relationships to upstream or related artifacts.

| Relationship   | Artifact        | Status  |
| -------------- | --------------- | ------- |
| `DERIVES_FROM` | `<Artifact ID>` | `VALID` |
| `REFINES`      | `<Artifact ID>` | `VALID` |
| `CONSTRAINS`   | `<Artifact ID>` | `VALID` |

For inferred relationships:

```text
Status: INFERRED
Confidence: <HIGH/MEDIUM/LOW>
Evidence: <Evidence>
```

---

# 22. Evidence

List the sources used to establish the product context.

| Evidence     | Type                                                   | Source     | Confidence        |
| ------------ | ------------------------------------------------------ | ---------- | ----------------- |
| `<Evidence>` | `USER_INPUT / DOCUMENT / SYSTEM / CODE / TEST / OTHER` | `<Source>` | `HIGH/MEDIUM/LOW` |

The agent must not fabricate evidence.

---

# 23. Product Discovery Status

```text
Status:
DRAFT / IN_REVIEW / APPROVED / BLOCKED
```

### Blocking Conditions

Product Discovery should not be considered complete when:

* The primary problem is unknown.
* The intended outcome is materially ambiguous.
* Critical scope boundaries are unresolved.
* A decision-relevant requirement is missing.
* A critical constraint is unknown.
* Major conflicting stakeholder expectations remain unresolved.
* The agent would need to invent product context to continue safely.

---

# 24. Review Checklist

Before Product Discovery can pass its lifecycle gate:

* [ ] Problem is clearly described.
* [ ] Intended outcome is understood.
* [ ] Relevant users/actors are identified.
* [ ] Scope is defined.
* [ ] Out-of-scope areas are identified where necessary.
* [ ] Important requirements are recorded.
* [ ] Relevant quality attributes are identified.
* [ ] Important constraints are recorded.
* [ ] Significant assumptions are explicit.
* [ ] Important unknowns are visible.
* [ ] Major risks are identified.
* [ ] Relevant dependencies are identified.
* [ ] Open product decisions are visible.
* [ ] Evidence is traceable.
* [ ] No critical product ambiguity remains unresolved.

---

# 25. Gate Result

```text
Gate:
GATE-1 — Product Discovery

Result:
NOT_EVALUATED / PASSED / PASSED_WITH_RISKS / BLOCKED / WAIVED

Blocking Issues:
- <Issue>

Non-Blocking Risks:
- <Risk>

Required Follow-Up:
- <Action>
```

---

# 26. Change History

| Version | Date           | Change          | Author     |
| ------- | -------------- | --------------- | ---------- |
| `1.0`   | `<YYYY-MM-DD>` | Initial version | `<Author>` |

---

# Template Usage Rules

1. Complete only sections supported by available evidence.
2. Mark unavailable information as `UNKNOWN` rather than inventing values.
3. Keep product intent separate from technical implementation.
4. Record assumptions explicitly.
5. Record decisions separately from recommendations.
6. Keep the document proportional to project size.
7. Preserve historical information when working with an existing system.
8. Update the document when major product assumptions change.
9. Maintain traceability to subsequent lifecycle artifacts.
10. Do not consider the document complete merely because every section contains text.

> **The purpose of Product Context is to establish enough shared understanding to make subsequent domain and architecture decisions safely.**
