# Domain Capabilities

## 1. Document Metadata

| Field                     | Description                                         |
| ------------------------- | --------------------------------------------------- |
| Document ID               | Unique identifier for the capability analysis       |
| Version                   | Current document version                            |
| Status                    | `DRAFT`, `UNDER_REVIEW`, `ACCEPTED`, `SUPERSEDED`   |
| Created                   | Creation date                                       |
| Updated                   | Last update date                                    |
| Project                   | Project or system name                              |
| Domain Scope              | Domain or subdomain covered                         |
| Discovery Mode            | `GREENFIELD`, `EXISTING_SYSTEM`, `SYSTEM_EVOLUTION` |
| Owner                     | Responsible role or person                          |
| Reviewers                 | Relevant domain reviewers                           |
| Related Domain Context    | Related Domain Context artifact                     |
| Related Glossary          | Domain Glossary artifact                            |
| Related Product Artifacts | Relevant Product Discovery artifacts                |

---

# 2. Purpose

This document identifies and structures the major **business capabilities** required by the domain.

A capability represents something the business or domain is able to do.

It describes:

> **What the domain can accomplish.**

It does not describe:

> **How the system implements it.**

The capability model provides a bridge between Product Discovery and deeper domain modeling.

---

# 3. Core Principle

> **A business capability is a stable business ability, not a technical component.**

A capability should remain meaningful even if the project changes:

* programming language;
* framework;
* database;
* API style;
* deployment model;
* application structure;
* infrastructure;
* architecture style.

Therefore:

```text id="y8q2n4"
Business Capability
        ≠
API
        ≠
Microservice
        ≠
Module
        ≠
Database Table
        ≠
Application Screen
```

---

# 4. Capability Definition

A capability describes a business ability that produces or enables meaningful business value.

Examples:

```text id="k5n8s1"
Manage Eligibility
Calculate Pricing
Manage Reservations
Process Claims
Manage Contracts
Fulfill Orders
Manage Subscriptions
```

Capabilities should use business language.

---

# 5. Capability Scope

Define the scope of the capability analysis.

```text id="r4m7c2"
Domain:
...

Subdomain:
...

Product Areas:
...

Included Capabilities:
...

Excluded Capabilities:
...

Deferred Capabilities:
...
```

The capability scope must remain aligned with the current discovery objective.

---

# 6. Capability Characteristics

A useful business capability generally has:

* a clear business purpose;
* identifiable responsibility;
* meaningful business outcome;
* relevant actors;
* associated rules;
* identifiable information;
* relatively stable business meaning.

A capability does not need to correspond to one process.

A single capability may support multiple processes and use cases.

---

# 7. Capability Record

Each capability should have a structured record.

```text id="q2v7m5"
### CAP-001 — <Capability Name>

**Name:**
...

**Purpose:**
...

**Business Ability:**
...

**Business Value:**
...

**Classification:**
...

**Status:**
...

**Confidence:**
...

**Primary Actors:**
...

**Supporting Actors:**
...

**Related Outcomes:**
...

**Related Requirements:**
...

**Related Business Rules:**
...

**Related Concepts:**
...

**Related Processes:**
...

**Dependencies:**
...

**Ownership:**
...

**Boundary Evidence:**
...

**Current State:**
...

**Target State:**
...

**Evidence:**
...

**Traceability:**
...
```

---

# 8. Capability Classification

Capabilities may be classified as:

```text id="n3c9v5"
CORE
SUPPORTING
GENERIC
ENABLING
REGULATORY
EXTERNAL
UNKNOWN
```

### CORE

Directly contributes to the primary differentiation or strategic value of the domain.

### SUPPORTING

Required for the business but not itself the primary differentiator.

### GENERIC

Common capability that may not justify specialized domain modeling.

### ENABLING

Supports other capabilities without directly producing the primary business outcome.

### REGULATORY

Required primarily because of legal, regulatory, or compliance obligations.

### EXTERNAL

Capability performed outside the analyzed domain but required by it.

### UNKNOWN

Insufficient evidence exists for classification.

Classification is contextual and may change as domain understanding evolves.

---

# 9. Capability Status

Possible statuses:

```text id="j4p8w2"
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

A capability should not become `ACCEPTED` merely because an agent inferred it.

Acceptance requires appropriate evidence or decision authority.

---

# 10. Capability Confidence

Record confidence:

```text id="e6t2q9"
HIGH
MEDIUM
LOW
```

### HIGH

Capability is directly supported by strong domain evidence.

### MEDIUM

Capability is supported by multiple sources but some interpretation remains.

### LOW

Capability is primarily inferred and requires validation.

---

# 11. Capability Purpose

Describe why the capability exists.

```text id="g1s5r7"
Purpose:
...

Business Need:
...

Value Produced:
...
```

Avoid describing implementation.

Weak:

```text id="b6h2n9"
"Provides an API for managing orders."
```

Strong:

```text id="z4p7k1"
"Enables the business to accept and manage customer orders under applicable commercial rules."
```

---

# 12. Capability Outcomes

Identify outcomes enabled by the capability.

```text id="c9v4m2"
Capability
    ↓
Supports
    ↓
Product Outcome
```

For each outcome:

```text id="t5q8w3"
Outcome:
...

Contribution:
...

Evidence:
...
```

A capability should have a meaningful relationship to one or more outcomes unless it is explicitly classified as enabling, generic, or regulatory.

---

# 13. Capability Actors

Identify actors involved in the capability.

Distinguish:

### Primary Actors

Actors who directly initiate or depend on the capability.

### Supporting Actors

Actors that support capability execution.

### External Participants

External organizations or systems involved in the capability.

Record:

```text id="v2k6m8"
Actor:
...

Role:
...

Interaction:
...

Responsibility:
...
```

Business responsibility must not be confused with technical access control.

---

# 14. Capability Responsibilities

Describe the responsibility represented by the capability.

Example:

```text id="p4x8s1"
Capability:
Manage Eligibility

Responsibilities:
- Determine applicable conditions.
- Evaluate eligibility.
- Apply relevant policies.
- Produce an eligibility result.
```

Responsibilities should describe business behavior.

---

# 15. Capability Inputs

Identify important business information required by the capability.

```text id="d6m2q7"
Input:
...

Meaning:
...

Source:
...

Required:
YES / NO / CONDITIONAL

Related Concept:
...
```

Inputs should be expressed in domain terms.

Avoid implementation structures such as DTOs or request payloads.

---

# 16. Capability Outputs

Identify meaningful business results.

```text id="w3r9k5"
Output:
...

Meaning:
...

Consumer:
...

Business Consequence:
...
```

Outputs may include:

* decisions;
* results;
* state changes;
* business records;
* domain events;
* calculated values.

Do not automatically equate outputs with API responses.

---

# 17. Capability Rules

Identify business rules governing the capability.

```text id="m7c4p8"
Rule:
...

Purpose:
...

Applicability:
...

Capability Impact:
...
```

Capabilities may be constrained by multiple rules.

Rules should remain independently traceable.

---

# 18. Capability Invariants

Identify conditions that must remain true within the capability.

```text id="a5n8q3"
Invariant:
...

Why It Matters:
...

Affected Concepts:
...

Potential Boundary Impact:
...
```

Invariants may later influence aggregate or bounded context boundaries.

They should not be used prematurely to define tactical DDD structures.

---

# 19. Capability Processes

Map capabilities to business processes.

```text id="q8y3m6"
Capability:
...

Process:
...

Role:
PRIMARY / SUPPORTING

Relationship:
...
```

Important distinction:

```text id="h6v2p9"
Capability = What the business can do

Process = How a business activity unfolds over time
```

A capability may participate in multiple processes.

---

# 20. Capability Use Cases

Map significant product-level use cases to capabilities.

```text id="n4w7k2"
Use Case:
...

Capability:
...

Contribution:
...
```

A use case may involve multiple capabilities.

A capability may support multiple use cases.

Do not create one capability per use case automatically.

---

# 21. Capability Concepts

Identify domain concepts relevant to the capability.

```text id="u5m9c3"
Concept:
...

Role:
...

Business Meaning:
...

Capability Relationship:
...
```

These concepts may later participate in domain models and bounded contexts.

---

# 22. Capability Dependencies

Identify material dependencies.

Possible dependency types:

```text id="s2k7v4"
CAPABILITY_DEPENDENCY
INFORMATION_DEPENDENCY
POLICY_DEPENDENCY
ACTOR_DEPENDENCY
EXTERNAL_DEPENDENCY
DOMAIN_DEPENDENCY
UNKNOWN
```

For each dependency:

```text id="r8p3n6"
Source:
...

Target:
...

Reason:
...

Direction:
...

Impact:
...

Confidence:
...
```

Avoid representing technical call graphs as capability dependencies.

---

# 23. Capability Decomposition

Capabilities may be decomposed when useful.

Example:

```text id="e7c2m5"
Manage Orders
├── Capture Order
├── Validate Order
├── Confirm Order
└── Fulfill Order
```

Decomposition should reveal meaningful business abilities.

Stop decomposing when further subdivision only creates procedural or technical detail.

---

# 24. Capability Hierarchy

A capability hierarchy may be represented as:

```text id="k3n8q4"
Domain Capability
├── Capability A
│   ├── Capability A.1
│   └── Capability A.2
├── Capability B
└── Capability C
```

The hierarchy should represent meaningful business structure.

It must not become a disguised technical module tree.

---

# 25. Capability Boundaries

Identify potential responsibility boundaries.

For each capability ask:

* Who owns it?
* Which business rules govern it?
* Which concepts are central?
* Which actors depend on it?
* Which outcomes does it support?
* Which capabilities depend on it?
* Which policies are specific to it?
* How does its responsibility differ from neighboring capabilities?

---

# 26. Capability Ownership

Ownership may be:

```text id="z7p2m6"
CLEAR
SHARED
CONTESTED
EXTERNAL
UNKNOWN
```

Record:

```text id="c5v9k1"
Capability:
...

Business Owner:
...

Operational Owner:
...

Domain Area:
...

Authority:
...

Evidence:
...
```

Shared or contested ownership is an important signal for further domain analysis.

---

# 27. Capability Stability

Capabilities often remain relatively stable even when implementation changes.

Assess:

```text id="m4q8x2"
STABLE
EVOLVING
VOLATILE
UNKNOWN
```

Consider:

* business meaning;
* strategic importance;
* organizational ownership;
* regulatory influence;
* expected change;
* dependency patterns.

Capability stability can inform architecture but should not determine it alone.

---

# 28. Capability Volatility

Record areas expected to change frequently.

```text id="n7s3d5"
Capability:
...

Change Driver:
...

Expected Change:
...

Frequency:
...

Impact:
...
```

High volatility may indicate:

* evolving business policy;
* experimental behavior;
* regulatory change;
* market adaptation;
* unstable ownership.

Volatility is evidence, not an automatic boundary.

---

# 29. Capability Differentiation

Assess whether the capability is strategically differentiating.

Possible assessment:

```text id="f8k2m7"
HIGH
MEDIUM
LOW
UNKNOWN
```

Consider:

* competitive differentiation;
* business uniqueness;
* strategic value;
* domain expertise required;
* policy complexity;
* business risk.

Do not classify capabilities based solely on implementation complexity.

---

# 30. Capability Complexity

Assess domain complexity:

```text id="q6m3p9"
LOW
MEDIUM
HIGH
UNKNOWN
```

Relevant factors include:

* number of business rules;
* rule interactions;
* lifecycle complexity;
* policy variation;
* invariants;
* ownership;
* external dependencies;
* temporal behavior;
* exception handling.

Technical complexity should not automatically be interpreted as domain complexity.

---

# 31. Capability Risk

Assess business risk:

```text id="x5r8c2"
LOW
MEDIUM
HIGH
CRITICAL
```

Risk may involve:

* financial consequences;
* compliance;
* security;
* customer impact;
* operational continuity;
* irreversible actions;
* data integrity.

---

# 32. Capability Matrix

A capability matrix can provide a high-level view:

| Capability | Classification | Business Value | Complexity | Risk | Ownership | Confidence |
| ---------- | -------------- | -------------- | ---------- | ---- | --------- | ---------- |
| —          | CORE           | HIGH           | HIGH       | HIGH | CLEAR     | HIGH       |
| —          | SUPPORTING     | MEDIUM         | MEDIUM     | LOW  | CLEAR     | MEDIUM     |

The matrix is a discovery aid.

It must not replace detailed analysis.

---

# 33. Capability Map

A capability map may be represented as:

```text id="h8n3v6"
                    DOMAIN
                       │
        ┌──────────────┼──────────────┐
        │              │              │
      CORE         SUPPORTING       GENERIC
        │              │              │
    Capability A   Capability C   Capability E
    Capability B   Capability D   Capability F
```

The map should reflect business structure rather than application structure.

---

# 34. Capability Relationships

Supported relationships include:

```text id="y4p7c1"
DEPENDS_ON
SUPPORTS
ENABLES
COMPOSES
SPECIALIZES
GENERALIZES
CONSTRAINS
GOVERNS
COLLABORATES_WITH
REPLACES
SUPERSEDES
CONFLICTS_WITH
```

Each relationship should have a meaningful business explanation.

---

# 35. Capability-to-Context Evidence

Capabilities may provide evidence for future bounded context discovery.

Relevant signals include:

* capability ownership;
* cohesive language;
* shared rules;
* shared invariants;
* shared lifecycle;
* cohesive concepts;
* independent responsibility;
* meaningful business boundary.

However:

```text id="j2m6q8"
Capability
    ≠
Bounded Context
```

A bounded context may contain multiple capabilities.

A capability may interact with multiple contexts.

---

# 36. Capability-to-Architecture Boundary

Architecture must not be derived directly from capability count.

For example:

```text id="p7c4n9"
10 Capabilities
≠
10 Services
```

The eventual architecture must also consider:

* domain boundaries;
* consistency requirements;
* contracts;
* data ownership;
* quality attributes;
* operational constraints;
* deployment requirements;
* organizational structure;
* change patterns.

These concerns belong to later lifecycle phases.

---

# 37. Existing System Capability Analysis

For existing systems distinguish:

```text id="b6w2m5"
Documented Capabilities:
...

Observed Capabilities:
...

Implemented Capabilities:
...

Target Capabilities:
...
```

Implementation structure should not automatically be interpreted as the actual capability model.

For example:

```text id="s3q8v1"
Existing module: OrderModule

Possible capability:
Manage Orders
```

The mapping requires domain validation.

---

# 38. Capability Debt

Capability debt exists when:

* important business abilities are not explicitly recognized;
* multiple capabilities overlap ambiguously;
* one capability owns too many unrelated responsibilities;
* ownership is unclear;
* business capabilities are hidden behind technical terminology;
* legacy structures distort capability understanding.

Record:

```text id="c9m4x7"
Debt:
...

Impact:
...

Affected Capabilities:
...

Priority:
...

Resolution:
...
```

---

# 39. Capability Gaps

Identify required capabilities that are currently missing or insufficient.

```text id="w5n8p2"
Gap:
...

Required Capability:
...

Reason:
...

Affected Outcome:
...

Current Coverage:
...

Target Coverage:
...

Priority:
...
```

Capability gaps may result from:

* new product requirements;
* regulatory changes;
* missing business responsibility;
* incomplete legacy systems;
* system evolution.

---

# 40. Capability Conflicts

Identify contradictions such as:

```text id="e2r7k4"
Two capabilities claim ownership of the same business responsibility.

A capability supports conflicting outcomes.

A business rule applies differently across supposedly identical capabilities.

A capability boundary conflicts with accepted domain ownership.
```

Conflicts should remain explicit until resolved.

---

# 41. Capability Unknowns

Maintain unresolved capability questions.

Examples:

```text id="m8q3c5"
- Is capability X part of this domain?
- Who owns capability Y?
- Is capability Z strategic or supporting?
- Is capability A separate from capability B?
```

Classify:

```text id="t4v9n6"
NON_BLOCKING
DECISION_RELEVANT
GATE_BLOCKING
```

---

# 42. Capability Assumptions

Record inferred capability structures.

```text id="u6p2s8"
Assumption:
...

Evidence:
...

Reason:
...

Confidence:
...

Impact If False:
...

Validation Method:
...
```

Capabilities must not become accepted facts merely because they appear logical.

---

# 43. Capability Traceability

Maintain traceability between product and domain artifacts.

Recommended relationships:

```text id="r5k8m3"
Product Outcome
    ↓ SUPPORTS
Capability
    ↓ REALIZES
Domain Responsibility
    ↓ INVOLVES
Domain Concept
    ↓ GOVERNS
Business Rule
```

Other useful relationships:

```text id="v2c7q9"
DERIVES_FROM
REALIZES
SUPPORTS
GOVERNS
CONSTRAINS
DEPENDS_ON
INVOLVES
OWNED_BY
VERIFIES
CONFLICTS_WITH
SUPERSEDES
```

---

# 44. Capability Validation

Validate each important capability against:

### Business Evidence

Is there evidence that the business performs or requires this ability?

### Outcome Alignment

Does it contribute to an established outcome?

### Responsibility

Is its responsibility distinguishable?

### Ownership

Is ownership sufficiently understood?

### Language

Does its name reflect accepted domain terminology?

### Rules

Are relevant rules identifiable?

### Concepts

Are relevant concepts identifiable?

### Boundary

Can its responsibility be distinguished from neighboring capabilities?

---

# 45. Capability Discovery Gate Contribution

Capability analysis contributes to the Domain Discovery Gate.

Minimum expectations:

* major capabilities identified;
* significant capability gaps known;
* important ownership issues visible;
* core/supporting classification sufficiently understood;
* major dependencies identified;
* important capability conflicts documented;
* terminology aligned with the glossary;
* product outcomes traceable to capabilities.

The gate does not require every capability to be modeled exhaustively.

---

# 46. Review Checklist

### Capability Identification

* [ ] Major business capabilities are identified.
* [ ] Capabilities use business language.
* [ ] Capabilities represent business abilities rather than technical components.
* [ ] Capability scope is explicit.

### Capability Meaning

* [ ] Purpose is clear.
* [ ] Business value is understood.
* [ ] Responsibilities are explicit.
* [ ] Outcomes are identified.

### Domain Alignment

* [ ] Relevant concepts are mapped.
* [ ] Relevant business rules are mapped.
* [ ] Relevant processes are mapped.
* [ ] Relevant use cases are mapped.

### Boundaries

* [ ] Ownership is considered.
* [ ] Dependencies are identified.
* [ ] Capability relationships are explicit.
* [ ] Potential boundary signals are identified.

### Classification

* [ ] Core/supporting/generic classification is evidence-based.
* [ ] Complexity is distinguished from technical complexity.
* [ ] Risk is explicitly assessed.
* [ ] Differentiation is considered where relevant.

### Uncertainty

* [ ] Assumptions are explicit.
* [ ] Unknowns are explicit.
* [ ] Conflicts are explicit.
* [ ] Confidence is recorded.

### Existing Systems

* [ ] Documented and observed capabilities are distinguished.
* [ ] Technical modules are not automatically treated as capabilities.
* [ ] Target capabilities are explicitly separated.

### Transition

* [ ] Capability-to-domain traceability exists.
* [ ] Important boundary evidence is available.
* [ ] Findings are ready to inform bounded context discovery.

---

# 47. Agent Instructions

When creating or reviewing this artifact, the agent must:

1. Start from validated Product Discovery and Domain Context.
2. Use the Domain Glossary for capability terminology.
3. Describe business abilities, not technical components.
4. Prefer stable business responsibilities over implementation structure.
5. Identify capabilities before proposing architecture.
6. Avoid equating capabilities with microservices.
7. Avoid equating capabilities with APIs or modules.
8. Validate capabilities against outcomes and business evidence.
9. Identify ownership and responsibility.
10. Record capability dependencies explicitly.
11. Identify capability gaps and overlaps.
12. Use uncertainty when capability boundaries are unclear.
13. Avoid decomposing capabilities into procedural implementation steps.
14. Avoid creating capabilities solely from use cases.
15. Avoid creating capabilities solely from database tables.
16. Consider capability relationships as domain evidence.
17. Use capability information to inform, not determine, bounded contexts.
18. Preserve current/target distinctions in existing systems.
19. Propagate significant domain discoveries upstream when required.
20. Keep capability modeling proportional to project scope and complexity.

---

# 48. Anti-Patterns

## 48.1 Capability = Microservice

Assuming each capability should become a separate deployable service.

---

## 48.2 Capability = API

Defining capabilities according to exposed endpoints.

---

## 48.3 Capability = CRUD

Creating capabilities such as:

```text
Create Customer
Update Customer
Delete Customer
```

when the actual business capability is broader.

---

## 48.4 Capability = Screen

Treating UI screens as business capabilities.

---

## 48.5 Capability = Database Table

Using persistence structures as evidence of business responsibility without validation.

---

## 48.6 Capability Explosion

Creating dozens of tiny capabilities that represent individual operations rather than meaningful business abilities.

---

## 48.7 Capability Monolith

Grouping unrelated business responsibilities into one capability because they happen to exist in one current application module.

---

## 48.8 Technical Naming

Using names such as:

```text
UserService
OrderController
PaymentAPI
BillingModule
```

as capability names.

---

## 48.9 Unsupported Classification

Declaring a capability Core, Generic, or Supporting without evidence.

---

## 48.10 Architecture Leakage

Allowing preferred technology or deployment architecture to determine capability boundaries.

---

## 48.11 False Ownership

Assigning ownership to a capability merely because one application currently implements it.

---

# 49. Compact Capability Register

Maintain a compact index:

| ID      | Capability | Classification | Status   | Owner | Complexity | Risk | Confidence |
| ------- | ---------- | -------------- | -------- | ----- | ---------- | ---- | ---------- |
| CAP-001 | —          | CORE           | ACCEPTED | —     | HIGH       | HIGH | HIGH       |
| CAP-002 | —          | SUPPORTING     | PROPOSED | —     | MEDIUM     | LOW  | MEDIUM     |

The register is a navigation aid and must not replace detailed capability records.

---

# 50. Safe Progression Question

Before progressing to domain processes and bounded context analysis, ask:

> **Do we understand the major business capabilities, their responsibilities, ownership, dependencies, outcomes, rules, and boundaries well enough to identify coherent domain structures without turning technical implementation into the domain model?**

If not, continue capability discovery or explicitly record the remaining uncertainty.

---

# 51. Final Principle

> **Capabilities describe what the business is able to do; they do not prescribe how software must be built.**

The capability model should therefore provide a stable business view:

```text id="g5m2x8"
Product Outcomes
        ↓
Business Capabilities
        ↓
Responsibilities
        ↓
Domain Concepts
        ↓
Business Rules
        ↓
Potential Boundaries
```

The resulting model becomes evidence for deeper domain analysis, particularly process discovery and bounded context discovery, without prematurely becoming architecture.
