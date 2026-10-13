# Bounded Contexts

## 1. Document Metadata

| Field                  | Description                                         |
| ---------------------- | --------------------------------------------------- |
| Document ID            | Unique identifier for the bounded context analysis  |
| Version                | Current document version                            |
| Status                 | `DRAFT`, `UNDER_REVIEW`, `ACCEPTED`, `SUPERSEDED`   |
| Created                | Creation date                                       |
| Updated                | Last update date                                    |
| Project                | Project or system name                              |
| Domain Scope           | Domain or subdomain covered                         |
| Discovery Mode         | `GREENFIELD`, `EXISTING_SYSTEM`, `SYSTEM_EVOLUTION` |
| Owner                  | Responsible role or person                          |
| Reviewers              | Relevant domain reviewers                           |
| Related Domain Context | Domain Context artifact                             |
| Related Glossary       | Domain Glossary artifact                            |
| Related Capabilities   | Domain Capabilities artifact                        |
| Related Processes      | Domain Processes artifact                           |

---

# 2. Purpose

This document identifies, evaluates, and governs **bounded context candidates** within the domain.

Its purpose is to establish explicit boundaries around coherent domain models and their language.

A bounded context defines:

* where a particular model is valid;
* where a particular vocabulary has a specific meaning;
* which rules belong to that model;
* which concepts are internally coherent;
* where semantic translation may be required;
* how different models relate to one another.

This document does not define:

* microservices;
* deployment units;
* databases;
* APIs;
* infrastructure;
* programming languages;
* application modules.

Those decisions belong to later lifecycle phases.

---

# 3. Core Principle

> **A bounded context is a boundary around a coherent model and language.**

Therefore:

```text id="b8q3m6"
Bounded Context
        ≠
Microservice

Bounded Context
        ≠
Database

Bounded Context
        ≠
Application Module

Bounded Context
        ≠
Team Boundary

Bounded Context
        ≠
API Boundary
```

These may eventually align, but alignment must be justified rather than assumed.

---

# 4. What a Bounded Context Protects

A bounded context protects the consistency of a particular model.

Within the boundary:

* terms have defined meanings;
* business rules are interpreted consistently;
* concepts have coherent responsibilities;
* invariants are meaningful;
* domain behavior follows a consistent model.

Outside the boundary, another model may legitimately interpret similar concepts differently.

---

# 5. Discovery Inputs

Bounded context discovery should consume evidence from:

```text id="y5m8r2"
Domain Context
      ↓
Domain Glossary
      ↓
Capabilities
      ↓
Processes
      ↓
Business Rules
      ↓
Concepts
      ↓
Ownership
      ↓
Invariants
      ↓
State / Lifecycle
      ↓
Boundary Evidence
```

No single artifact should determine bounded contexts by itself.

---

# 6. Bounded Context Candidate

A candidate represents a hypothesis that a coherent model boundary exists.

```text id="q7c2n5"
### BC-001 — <Context Name>

**Name:**
...

**Purpose:**
...

**Model Scope:**
...

**Core Responsibility:**
...

**Business Capabilities:**
...

**Key Concepts:**
...

**Key Terms:**
...

**Business Rules:**
...

**Invariants:**
...

**Processes:**
...

**Actors:**
...

**Ownership:**
...

**Boundary Evidence:**
...

**External Relationships:**
...

**Confidence:**
...

**Status:**
...
```

A candidate remains provisional until sufficiently validated.

---

# 7. Context Status

Possible statuses:

```text id="m4p8v1"
IDENTIFIED
PROPOSED
UNDER_REVIEW
ACCEPTED
REJECTED
ACTIVE
SUPERSEDED
DEPRECATED
UNKNOWN
```

### IDENTIFIED

A possible boundary has been discovered.

### PROPOSED

Evidence suggests a coherent bounded context.

### UNDER_REVIEW

The boundary is being actively evaluated.

### ACCEPTED

The boundary has sufficient evidence and appropriate authority.

### REJECTED

The proposed boundary was evaluated and rejected.

### ACTIVE

The bounded context is an accepted part of the current domain model.

### SUPERSEDED

The context was replaced by another accepted model.

### DEPRECATED

The context remains historically relevant but should not be extended.

### UNKNOWN

Insufficient evidence exists to determine the boundary.

---

# 8. Context Naming

A bounded context name should use meaningful domain language.

Prefer:

```text id="v9k3m7"
Eligibility Management
Order Fulfillment
Contract Management
Claims Processing
Settlement
```

Avoid technical names:

```text id="p6r2w8"
OrderService
BillingMicroservice
CustomerModule
PaymentAPI
OrderDB
```

The name should communicate the model's business responsibility.

---

# 9. Context Purpose

Define why the context exists.

```text id="x3m7q5"
Purpose:
...

Primary Responsibility:
...

Business Value:
...

Model It Protects:
...
```

The purpose should be understandable without knowing the implementation architecture.

---

# 10. Model Scope

Define what the context models.

```text id="n8c4v2"
Included Concepts:
...

Included Rules:
...

Included Behaviors:
...

Included Capabilities:
...

Included Processes:
...

Excluded Concepts:
...

Excluded Responsibilities:
...
```

The scope must be explicit enough to identify what the context owns and what it does not.

---

# 11. Ubiquitous Language

Identify the language specific to the context.

```text id="q5m9c3"
Context:
...

Core Terms:
...

Context-Specific Definitions:
...

Terms Shared Lexically:
...

Terms With Different Meaning Elsewhere:
...

Deprecated Terms:
...
```

A term may exist in multiple contexts with different meanings.

This is acceptable and often expected.

---

# 12. Semantic Coherence

Evaluate whether the concepts inside the candidate context form a coherent model.

Consider:

* shared terminology;
* shared business meaning;
* shared rules;
* shared invariants;
* shared lifecycle;
* shared responsibility;
* shared ownership;
* shared decision authority.

Record:

```text id="r7v2k8"
Semantic Coherence:
HIGH / MEDIUM / LOW / UNKNOWN

Evidence:
...
```

---

# 13. Language Boundary

A language boundary exists when a term's meaning changes materially across areas.

Example:

```text id="u4n8p6"
Term: Account

Context A:
Represents a financial relationship.

Context B:
Represents an identity credential.

Boundary Signal:
HIGH
```

Language differences should be considered alongside other evidence.

Language differences alone do not automatically require separate contexts.

---

# 14. Capability Alignment

Map capabilities to the candidate context.

```text id="w3c7m2"
Context:
...

Capabilities:
- CAP-001
- CAP-002
- CAP-004

Primary Capability:
...

Supporting Capabilities:
...
```

A bounded context may contain:

* one major capability;
* several related capabilities;
* supporting capabilities.

There is no required one-to-one relationship.

---

# 15. Process Alignment

Map domain processes to the context.

```text id="k6p2v9"
Process:
...

Context Role:
PRIMARY / SUPPORTING / EXTERNAL

Reason:
...
```

Processes may cross context boundaries.

Crossing a boundary is evidence of interaction, not evidence that the boundary is incorrect.

---

# 16. Concept Ownership

Identify concepts for which the context owns the authoritative model.

```text id="m8q4c1"
Concept:
...

Ownership:
AUTHORITATIVE / REFERENCED / EXTERNAL / SHARED / UNKNOWN

Reason:
...

Evidence:
...
```

A concept may be referenced by multiple contexts while having one authoritative model.

---

# 17. Rule Ownership

Identify business rules owned by the context.

```text id="p5v8n3"
Rule:
...

Owner Context:
...

Reason:
...

Enforcement Responsibility:
...

External Dependencies:
...
```

Rules should not be duplicated across contexts without understanding semantic consequences.

---

# 18. Invariant Ownership

Identify invariants that the context must protect.

```text id="s2m7r4"
Invariant:
...

Context:
...

Affected Concepts:
...

Why This Boundary Protects It:
...

Confidence:
...
```

Invariant ownership is one of the strongest signals for determining whether concepts belong together.

---

# 19. Lifecycle Alignment

Evaluate whether important concepts share coherent lifecycles.

```text id="e9c3w6"
Concept:
...

Lifecycle:
...

Context:
...

Shared With:
...

Differences:
...
```

Different lifecycle semantics may indicate different models.

---

# 20. Responsibility Boundary

Identify the business responsibility separating the context from neighboring areas.

```text id="j4p8n2"
Context Responsibility:
...

Neighboring Responsibility:
...

Boundary:
...

Evidence:
...
```

A strong boundary typically separates distinct responsibilities rather than arbitrary technical modules.

---

# 21. Ownership Boundary

Identify who has business authority.

```text id="c7m5q9"
Context:
...

Business Owner:
...

Decision Authority:
...

Operational Responsibility:
...

Contested Ownership:
...
```

Organizational ownership is evidence, but organizational structure alone must not define bounded contexts.

---

# 22. Change Boundary

Evaluate whether the context has a meaningful change boundary.

Consider:

* different business policies;
* different regulatory drivers;
* different product evolution;
* different ownership;
* different release pressure;
* different domain volatility.

Record:

```text id="v8r3k6"
Change Pattern:
...

Expected Change Drivers:
...

Shared Changes With:
...

Independent Changes:
...
```

Change independence is useful evidence but should not be confused with deployment independence.

---

# 23. Domain Volatility

Assess relative volatility:

```text id="q2m6p8"
LOW
MEDIUM
HIGH
UNKNOWN
```

Consider:

* rule changes;
* policy changes;
* business experimentation;
* regulatory changes;
* organizational changes.

Volatility may support a boundary hypothesis but cannot establish it alone.

---

# 24. Context Complexity

Assess the complexity of the model.

```text id="n5c8r3"
LOW
MEDIUM
HIGH
UNKNOWN
```

Consider:

* number of interacting rules;
* invariant complexity;
* lifecycle complexity;
* policy variation;
* domain terminology;
* decision complexity;
* exception behavior.

Technical complexity should not be used as a substitute for domain complexity.

---

# 25. Core Domain Alignment

Evaluate whether the context contains strategic domain behavior.

```text id="w7p4m2"
CORE
SUPPORTING
GENERIC
MIXED
UNKNOWN
```

This classification should be inherited from domain analysis where appropriate, not invented from architectural importance.

---

# 26. Boundary Evidence Matrix

Evaluate candidate boundaries systematically.

| Dimension         | Evidence | Strength        |
| ----------------- | -------- | --------------- |
| Language          | —        | HIGH/MEDIUM/LOW |
| Responsibility    | —        | HIGH/MEDIUM/LOW |
| Ownership         | —        | HIGH/MEDIUM/LOW |
| Rules             | —        | HIGH/MEDIUM/LOW |
| Invariants        | —        | HIGH/MEDIUM/LOW |
| Lifecycle         | —        | HIGH/MEDIUM/LOW |
| Capabilities      | —        | HIGH/MEDIUM/LOW |
| Processes         | —        | HIGH/MEDIUM/LOW |
| Actors            | —        | HIGH/MEDIUM/LOW |
| Change Pattern    | —        | HIGH/MEDIUM/LOW |
| Domain Volatility | —        | HIGH/MEDIUM/LOW |
| Strategic Value   | —        | HIGH/MEDIUM/LOW |

No numeric score should automatically determine acceptance.

Qualitative reasoning remains authoritative.

---

# 27. Candidate Boundary Evaluation

For every candidate ask:

### Coherence

Do the concepts form a coherent model?

### Language

Do terms retain consistent meanings?

### Responsibility

Does the context have a clear business responsibility?

### Ownership

Is there meaningful ownership?

### Rules

Are important rules cohesive?

### Invariants

Do important invariants belong together?

### Lifecycle

Do concepts share meaningful lifecycle behavior?

### Dependencies

Can external relationships be understood without collapsing the boundary?

### Change

Is there evidence of a meaningful change boundary?

### Model Integrity

Would combining this candidate with another model create semantic ambiguity?

---

# 28. Splitting a Candidate Context

A candidate may need to be split when evidence shows:

* materially different meanings;
* independent business responsibilities;
* conflicting rules;
* different invariants;
* different ownership;
* different decision authority;
* distinct lifecycles;
* incompatible models.

Example:

```text id="a6m3q8"
Candidate Context
       ↓
Semantic Conflict
       ↓
Context A
Context B
```

Splitting must be justified by domain evidence.

---

# 29. Merging Candidate Contexts

Candidates may be merged when:

* language is coherent;
* responsibilities are strongly related;
* rules are shared;
* invariants belong together;
* ownership is aligned;
* lifecycles are cohesive;
* separate boundaries provide little semantic value.

Avoid splitting simply because separate components may be technically convenient.

---

# 30. Context Boundary Trade-offs

Evaluate both the benefits and costs of a proposed boundary.

### Potential Benefits

* semantic clarity;
* explicit ownership;
* coherent rules;
* reduced model ambiguity;
* controlled evolution;
* clearer responsibilities.

### Potential Costs

* translation;
* duplicated representations;
* coordination;
* additional contracts;
* consistency complexity;
* increased cognitive load;
* migration complexity.

A boundary is useful only when its semantic value justifies its coordination cost.

---

# 31. Context Granularity

Context granularity should be proportional to domain complexity.

Avoid:

```text id="z8q4m1"
One context per entity
```

and:

```text id="x5c7n2"
One context for the entire business
```

The correct granularity is the smallest meaningful set of models that preserves domain coherence without unnecessary fragmentation.

---

# 32. Context Relationships

Context relationships describe how bounded contexts interact.

Possible relationships include:

```text id="r6m2p8"
UPSTREAM
DOWNSTREAM
CUSTOMER_SUPPLIER
PARTNERSHIP
CONFORMIST
ANTI_CORRUPTION_LAYER
SHARED_KERNEL
OPEN_HOST_SERVICE
PUBLISHED_LANGUAGE
SEPARATE_WAYS
UNKNOWN
```

The relationship describes semantic and organizational dependency.

It does not prescribe a technical integration mechanism.

---

# 33. Upstream / Downstream

When one context influences another:

```text id="c4v8q3"
Upstream Context:
...

Downstream Context:
...

Influence:
...

Dependency:
...

Protected Model:
...
```

The relationship should explain what the downstream context depends on.

---

# 34. Customer-Supplier Relationship

Use when one context provides capabilities or information that another depends on, with explicit collaboration regarding requirements.

Record:

```text id="m7p3n9"
Supplier:
...

Customer:
...

Shared Responsibility:
...

Expected Contract:
...

Risk:
...
```

Do not confuse this with a technical provider/consumer relationship alone.

---

# 35. Partnership

Use when two contexts depend on coordinated evolution.

Record:

```text id="q8c5r2"
Context A:
...

Context B:
...

Shared Goal:
...

Coordination Required:
...

Shared Risks:
...
```

---

# 36. Conformist Relationship

Use when a downstream context intentionally adopts another context's model because changing or translating it is not justified.

Record:

```text id="v4n7m1"
Upstream:
...

Downstream:
...

Adopted Model:
...

Reason:
...

Trade-off:
...
```

This is a deliberate domain decision, not a default.

---

# 37. Anti-Corruption Layer

An Anti-Corruption Layer may be considered when one context must protect its model from an external or incompatible model.

Record:

```text id="p9m3c6"
Protected Context:
...

External Context:
...

Semantic Conflict:
...

Protection Required:
...

Translation Responsibility:
...

Reason:
...
```

The existence of an ACL is an architectural/design decision that may require later ADR governance.

---

# 38. Shared Kernel

A Shared Kernel may be considered when contexts intentionally share a small, jointly governed model.

Record:

```text id="k5r8q2"
Shared Model:
...

Contexts:
...

Shared Responsibility:
...

Change Governance:
...

Risk:
...
```

Shared kernels should remain intentionally small.

---

# 39. Open Host Service

Use when a context intentionally exposes a stable language or model for other contexts to consume.

Record:

```text id="n2v6m8"
Providing Context:
...

Published Model:
...

Consumers:
...

Semantic Contract:
...

Governance:
...
```

Technical API design belongs to the Contracts phase.

---

# 40. Published Language

A published language is a deliberately shared representation used between contexts.

Record:

```text id="s7c3p9"
Language:
...

Provider:
...

Consumers:
...

Meaning:
...

Stability Expectations:
...

Translation Required:
...
```

Do not assume that a shared JSON schema automatically constitutes a published domain language.

---

# 41. Separate Ways

Use when contexts have no meaningful reason to coordinate.

Record:

```text id="w4m8q2"
Context A:
...

Context B:
...

Reason Coordination Is Avoided:
...

Independent Responsibilities:
...
```

This may be preferable to introducing unnecessary integration.

---

# 42. Context Translation

When two contexts use different models, identify translation explicitly.

```text id="j6p2v5"
Source Context:
...

Source Model:
...

Target Context:
...

Target Model:
...

Semantic Difference:
...

Translation Responsibility:
...

Information Lost:
...

Information Added:
...
```

Translation should preserve the target context's model rather than importing external semantics blindly.

---

# 43. Context Map

Represent the overall relationship:

```text id="f3n7c8"
+------------------+        +------------------+
| Context A        |        | Context B        |
|                  |        |                  |
| Model A          | -----> | Model B          |
+------------------+        +------------------+
         UPSTREAM                 DOWNSTREAM
```

For more complex domains:

```text id="r8m4q1"
                 +----------------+
                 | Context A      |
                 +-------+--------+
                         |
                         v
                 +-------+--------+
                 | Context B      |
                 +---+--------+---+
                     |        |
                     v        v
              +------+--+  +--+------+
              | Context C|  |Context D|
              +---------+  +---------+
```

The diagram should communicate semantic relationships, not infrastructure topology.

---

# 44. Context Interaction Questions

For each relationship ask:

* What model is authoritative?
* Which vocabulary is used?
* Who depends on whom?
* What information crosses the boundary?
* What meaning changes?
* Who owns the rule?
* Who owns the data concept?
* What happens when models evolve?
* Is translation required?
* Is coordination required?
* Is the relationship temporary or structural?

---

# 45. Context Boundary Validation

A candidate context should be challenged before acceptance.

Ask:

```text id="u5q9m3"
If this context were merged with its neighbor:

Would language become ambiguous?

Would responsibilities become unclear?

Would rules conflict?

Would invariants become difficult to protect?

Would ownership become unclear?

Would the model become less coherent?
```

If the answer is consistently no, the boundary may be unnecessary.

---

# 46. Context Fragmentation Test

Ask:

```text id="c7m2v8"
If this context were split:

Would each resulting context have a meaningful model?

Would each have meaningful responsibility?

Would each have meaningful language?

Would the separation reduce semantic ambiguity?

Would the coordination cost be justified?
```

If not, fragmentation may be premature.

---

# 47. Architecture Independence

A bounded context should be expressible without specifying:

* programming language;
* framework;
* database;
* deployment technology;
* cloud provider;
* container;
* message broker;
* API protocol.

Example:

```text id="m8r4q2"
Valid:
"Order Fulfillment owns the business rules governing fulfillment."

Premature:
"Order Fulfillment will be a Spring Boot microservice using PostgreSQL."
```

The second statement belongs to later architecture work.

---

# 48. Existing System Analysis

For existing systems distinguish:

```text id="p3v7n5"
Documented Contexts:
...

Observed Semantic Boundaries:
...

Implementation Boundaries:
...

Current Domain Boundaries:
...

Target Domain Boundaries:
...
```

An existing service or module may:

* contain multiple bounded contexts;
* implement only part of a context;
* cross multiple contexts;
* represent an accidental technical boundary.

---

# 49. Legacy Boundary Assessment

For each existing technical boundary ask:

```text id="w6c2m9"
Does the boundary correspond to a coherent domain model?

Does terminology remain consistent?

Are responsibilities cohesive?

Are rules aligned?

Are invariants preserved?

Is ownership meaningful?
```

Classify:

```text id="q4n8r1"
DOMAIN_ALIGNED
PARTIALLY_ALIGNED
TECHNICAL_ONLY
CONTESTED
UNKNOWN
```

---

# 50. System Evolution Context Analysis

For evolution work identify:

```text id="v5m7c3"
Current Context:
...

Change Boundary:
...

Affected Model:
...

Affected Language:
...

Affected Rules:
...

Affected Relationships:
...

Target Context:
...

Migration Strategy:
...
```

Do not redesign unrelated contexts merely because they could theoretically be improved.

---

# 51. Context Migration Considerations

When a boundary changes, identify:

* concepts moving between contexts;
* rules moving between contexts;
* terminology changes;
* data ownership changes;
* relationship changes;
* contract implications;
* transitional models;
* coexistence requirements.

Migration strategy belongs to later architecture/infrastructure work, but domain consequences must be identified here.

---

# 52. Context Conflicts

Record conflicts such as:

```text id="n7p3k8"
Two contexts claim ownership of the same invariant.

Two contexts use incompatible definitions of a critical term.

A candidate context contains conflicting business responsibilities.

A context boundary contradicts accepted domain ownership.

A proposed split creates excessive coordination.
```

For each conflict:

```text id="x2m6v9"
Conflict:
...

Contexts:
...

Evidence:
...

Impact:
...

Resolution:
...

Status:
...
```

---

# 53. Context Unknowns

Record unresolved questions.

Examples:

```text id="c5r8q2"
- Is concept X authoritative in Context A or Context B?
- Does rule Y belong to one context or both?
- Is this language difference meaningful?
- Is this relationship structural or temporary?
- Does this candidate context have sufficient independent responsibility?
```

Classify:

```text id="m4v7n1"
NON_BLOCKING
DECISION_RELEVANT
GATE_BLOCKING
```

---

# 54. Context Assumptions

Record inferred boundaries.

```text id="p8q3c6"
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

No candidate bounded context should silently become an accepted architectural fact.

---

# 55. Context Decisions

Material decisions may include:

* accepting a bounded context;
* rejecting a candidate boundary;
* merging contexts;
* splitting contexts;
* accepting a context relationship;
* accepting a translation boundary;
* accepting shared terminology within a context.

Record consequential decisions explicitly.

Architecture consequences may require separate ADRs later.

---

# 56. Context Decision Record

A minimal record:

```text id="r6m8v2"
Decision ID:
...

Context:
...

Problem:
...

Evidence:
...

Options:
...

Decision:
...

Rationale:
...

Consequences:
...

Risks:
...

Reversibility:
...

Related Contexts:
...

Traceability:
...
```

---

# 57. Context-to-Product Traceability

Maintain:

```text id="j3p7m5"
Product Outcome
      ↓
Capability
      ↓
Process
      ↓
Bounded Context
```

This relationship helps verify that proposed contexts support actual product intent.

A bounded context with no meaningful business purpose should be challenged.

---

# 58. Context-to-Domain Traceability

Recommended relationships:

```text id="x8m4q1"
Capability
    ↓ BELONGS_TO
Bounded Context

Concept
    ↓ MODELED_BY
Bounded Context

Rule
    ↓ OWNED_BY
Bounded Context

Invariant
    ↓ PROTECTED_BY
Bounded Context

Process
    ↓ PRIMARILY_SUPPORTED_BY
Bounded Context
```

These relationships should remain explicit where they materially affect domain understanding.

---

# 59. Context Discovery Health

Evaluate:

### Semantic Coherence

Is the model internally coherent?

### Boundary Clarity

Can the boundary be explained?

### Language Integrity

Are terms meaningful within the boundary?

### Responsibility

Is business responsibility clear?

### Ownership

Is authority understood?

### Rule Cohesion

Do relevant rules belong together?

### Invariant Protection

Can important invariants be protected?

### Relationship Clarity

Are interactions with other contexts understood?

### Evidence

Are boundary decisions supported?

---

# 60. Context Boundary Debt

Boundary debt exists when:

* contexts are poorly defined;
* responsibilities overlap;
* terminology conflicts;
* ownership is unclear;
* context relationships are undocumented;
* technical boundaries obscure domain boundaries;
* translation responsibilities are implicit.

Record:

```text id="v7c3m9"
Debt:
...

Impact:
...

Affected Contexts:
...

Priority:
...

Resolution:
...
```

---

# 61. Context Map Review

Review the complete context map and verify:

* every accepted context has a purpose;
* major capabilities have a context relationship;
* important concepts have model ownership;
* critical rules have ownership;
* major processes have context participation;
* context relationships are explicit;
* translation requirements are known;
* unresolved boundaries are visible;
* no context exists solely because of technical convenience.

---

# 62. Domain Boundary Review Input

The bounded context analysis should provide evidence for a later formal **Domain Boundary Review**.

The review should evaluate:

```text id="q2m8v4"
Domain Understanding
        ↓
Language
        ↓
Capabilities
        ↓
Processes
        ↓
Rules
        ↓
Ownership
        ↓
Invariants
        ↓
Bounded Contexts
        ↓
Context Relationships
```

The review should challenge the proposed boundaries rather than merely confirm their existence.

---

# 63. Architecture Handoff

Bounded contexts may now become inputs to Architecture / C4 analysis.

The handoff should distinguish:

### Accepted Domain Boundaries

Boundaries supported by evidence and accepted through appropriate governance.

### Proposed Boundaries

Strong hypotheses that still require confirmation.

### Open Boundaries

Areas where domain evidence is insufficient.

### Domain Constraints

Rules or ownership boundaries that architecture must respect.

### Architectural Questions

Questions that architecture must investigate without redefining the domain silently.

---

# 64. What Architecture Must Not Assume

Architecture must not automatically assume:

```text id="n4p7c2"
1 bounded context = 1 microservice
1 bounded context = 1 database
1 bounded context = 1 repository
1 bounded context = 1 team
1 bounded context = 1 API
1 bounded context = 1 deployment unit
```

These mappings require separate architectural analysis.

---

# 65. Review Checklist

### Boundary Definition

* [ ] Every candidate has a clear purpose.
* [ ] Model scope is explicit.
* [ ] Responsibility is explicit.
* [ ] Ownership is understood.
* [ ] Language is coherent.

### Domain Evidence

* [ ] Glossary evidence was considered.
* [ ] Capability evidence was considered.
* [ ] Process evidence was considered.
* [ ] Rule evidence was considered.
* [ ] Invariant evidence was considered.
* [ ] Lifecycle evidence was considered.

### Context Relationships

* [ ] Relationships are explicit.
* [ ] Relationship semantics are understood.
* [ ] Translation needs are identified.
* [ ] Model ownership is explicit.

### Granularity

* [ ] Contexts are not artificially fragmented.
* [ ] Contexts are not unnecessarily merged.
* [ ] Boundary trade-offs are documented.
* [ ] Coordination costs are considered.

### Existing Systems

* [ ] Technical boundaries are distinguished from domain boundaries.
* [ ] Legacy boundaries have been evaluated.
* [ ] Observed behavior is distinguished from target behavior.

### Uncertainty

* [ ] Assumptions are explicit.
* [ ] Unknowns are explicit.
* [ ] Conflicts are explicit.
* [ ] Confidence is recorded.

### Architecture Handoff

* [ ] Accepted/proposed/open boundaries are distinguished.
* [ ] Domain constraints are explicit.
* [ ] Technical architecture has not been prematurely prescribed.

---

# 66. Agent Instructions

When creating or reviewing this artifact, the agent must:

1. Start from Domain Context, Glossary, Capabilities, and Processes.
2. Treat bounded contexts as model and language boundaries.
3. Evaluate multiple forms of domain evidence.
4. Identify semantic coherence.
5. Identify responsibility and ownership.
6. Evaluate rule and invariant cohesion.
7. Evaluate lifecycle alignment.
8. Identify meaningful language boundaries.
9. Identify context relationships.
10. Distinguish context boundaries from technical boundaries.
11. Never equate bounded contexts with microservices automatically.
12. Never derive boundaries solely from database schemas.
13. Never derive boundaries solely from existing service boundaries.
14. Never derive boundaries solely from organizational teams.
15. Never use deployment independence as primary domain evidence.
16. Preserve candidate boundaries when evidence is incomplete.
17. Challenge both fragmentation and excessive merging.
18. Identify translation responsibilities explicitly.
19. Preserve different meanings of the same term when context requires them.
20. Distinguish accepted, proposed, and unknown boundaries.
21. Propagate contradictions back to earlier Domain Discovery artifacts.
22. Prepare domain evidence for later architecture analysis.
23. Avoid making infrastructure decisions inside domain discovery.
24. Keep boundary analysis proportional to complexity and risk.

---

# 67. Anti-Patterns

## 67.1 Microservice-First Boundaries

Creating bounded contexts by deciding the number of microservices first.

---

## 67.2 Database Boundaries

Treating separate schemas or databases as proof of separate bounded contexts.

---

## 67.3 Team-First Boundaries

Using organizational teams as the sole basis for domain boundaries.

---

## 67.4 Endpoint Boundaries

Grouping concepts according to API endpoints.

---

## 67.5 Entity-per-Context

Creating a context for every major domain entity.

---

## 67.6 One Giant Context

Keeping unrelated business models together because they belong to the same product.

---

## 67.7 Context by Deployment

Defining a context because something needs independent deployment.

---

## 67.8 Context by Technology

Using programming language, framework, database, or cloud service as the primary boundary criterion.

---

## 67.9 False Context Independence

Declaring contexts independent despite shared rules, invariants, ownership, or semantic responsibility.

---

## 67.10 Premature Context Mapping

Defining sophisticated DDD relationships before the underlying models are understood.

---

## 67.11 Forced Shared Model

Creating a shared domain model merely because two contexts use similar terminology.

---

## 67.12 Shared Kernel by Convenience

Sharing concepts because duplication appears inconvenient rather than because shared ownership is justified.

---

## 67.13 Legacy Boundary Worship

Assuming existing technical service boundaries are correct domain boundaries.

---

## 67.14 Boundary Without Responsibility

Creating a bounded context that has no meaningful business responsibility or model coherence.

---

# 68. Compact Context Register

Maintain a compact index:

| ID     | Context | Status   | Responsibility | Ownership | Coherence | Confidence |
| ------ | ------- | -------- | -------------- | --------- | --------- | ---------- |
| BC-001 | —       | ACCEPTED | —              | CLEAR     | HIGH      | HIGH       |
| BC-002 | —       | PROPOSED | —              | CONTESTED | MEDIUM    | MEDIUM     |
| BC-003 | —       | UNKNOWN  | —              | UNKNOWN   | LOW       | LOW        |

The register is a navigation aid and does not replace the detailed context analysis.

---

# 69. Safe Progression Question

Before progressing from strategic domain discovery to tactical domain modeling and architecture, ask:

> **Do the proposed bounded contexts represent coherent business models with meaningful language, responsibilities, rules, invariants, ownership, and relationships, and have we avoided deriving those boundaries from technical architecture prematurely?**

If not, continue domain boundary discovery or explicitly record the unresolved uncertainty.

---

# 70. Final Principle

> **A bounded context exists to protect the integrity of a domain model and its language.**

The discovery sequence is:

```text id="m7q2c8"
Domain Language
       ↓
Capabilities
       ↓
Processes
       ↓
Rules
       ↓
Concepts
       ↓
Ownership
       ↓
Invariants
       ↓
Semantic Boundaries
       ↓
Bounded Contexts
       ↓
Context Relationships
```

Only after these boundaries are sufficiently understood should the lifecycle ask:

```text id="r4n8v6"
How should these domain boundaries be represented
within the system architecture?
```

That question belongs to the Architecture phase, not to Bounded Context Discovery.
