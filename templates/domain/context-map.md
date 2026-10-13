# Context Map

## 1. Document Metadata

| Field                    | Value                              |
| ------------------------ | ---------------------------------- |
| Document Type            | Context Map                        |
| Lifecycle Phase          | Domain Discovery / DDD             |
| Scope                    | Domain / Bounded Context Landscape |
| Status                   | `DRAFT`                            |
| Version                  | `0.1`                              |
| Owner                    | `<owner>`                          |
| Created                  | `<date>`                           |
| Last Updated             | `<date>`                           |
| Related Domain Model     | `<domain-model>`                   |
| Related Bounded Contexts | `<contexts>`                       |

---

# 2. Purpose

This document defines the relationships between bounded contexts within the domain landscape.

It describes:

* Which contexts interact
* Which context has semantic authority
* Which context depends on another
* How models relate across boundaries
* Where translation is required
* Which relationships are cooperative or asymmetric
* Which integration risks exist
* Which context boundaries may require additional protection

The Context Map is a **domain architecture artifact**.

It does not prescribe:

* Microservices
* APIs
* Message brokers
* Databases
* Deployment units
* Network topology
* Cloud infrastructure

Those decisions belong to later architecture and contract phases.

---

# 3. Core Principle

> **A Context Map describes relationships between domain models, not relationships between software components.**

A bounded context relationship answers:

> How do two distinct domain models interact and what are the consequences of that relationship?

It does not automatically answer:

> How will two applications communicate?

The first question belongs to DDD.

The second belongs to architecture.

---

# 4. Context Map Scope

Define the domain landscape represented by the map.

```text id="g0w6fz"
Domain:
<domain>

Contexts Included:
- <bounded context>
- <bounded context>

Contexts Excluded:
- <bounded context>

Reason for Scope:
<reason>

Current State:
<description>

Target State:
<description>
```

The map may represent:

* Current state
* Target state
* Transition state

These states should not be mixed without explicit labeling.

---

# 5. Bounded Context Registry

Maintain the contexts represented in the map.

| ID     | Bounded Context | Core Responsibility | Role     | Status     | Confidence     |
| ------ | --------------- | ------------------- | -------- | ---------- | -------------- |
| BC-001 | `<context>`     | `<responsibility>`  | `<role>` | `<status>` | `<confidence>` |

Possible roles:

* `CORE`
* `SUPPORTING`
* `GENERIC`
* `UNKNOWN`

These classifications are domain observations and should not be inferred solely from technical importance.

---

# 6. Context Map Overview

Provide a conceptual representation.

```text id="f1x2rm"
                    ┌──────────────────────┐
                    │   Bounded Context A   │
                    │                      │
                    │   Upstream            │
                    └──────────┬───────────┘
                               │
                         Domain Relationship
                               │
                               ▼
                    ┌──────────────────────┐
                    │   Bounded Context B   │
                    │                      │
                    │   Downstream          │
                    └──────────────────────┘
```

The diagram should communicate:

* Context boundaries
* Direction
* Relationship type
* Semantic dependency
* Translation boundaries
* Important risks

Do not introduce infrastructure details into the conceptual map.

---

# 7. Context Relationship Catalog

| ID          | Upstream    | Downstream  | Relationship     | Direction     | Translation  | Status     |
| ----------- | ----------- | ----------- | ---------------- | ------------- | ------------ | ---------- |
| REL-CTX-001 | `<context>` | `<context>` | `<relationship>` | `<direction>` | `<strategy>` | `<status>` |

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

# 8. Context Relationship Record

```text id="3m8v1a"
ID:
Upstream Context:
Downstream Context:

Relationship Type:
<relationship>

Business Meaning:
<meaning>

Direction:
<direction>

Dependency:
<what depends on what?>

Shared Concepts:
<concepts>

Different Concepts:
<concepts>

Translation Required:
<YES | NO | UNKNOWN>

Translation Strategy:
<strategy>

Ownership:
<semantic ownership>

Impact:
<impact>

Risks:
<risks>

Evidence:
<evidence>

Confidence:
<HIGH | MEDIUM | LOW>

Status:
<status>
```

---

# 9. DDD Relationship Types

The following relationship patterns may be used when supported by evidence.

## 9.1 Upstream / Downstream

An upstream context provides a model or behavior that influences a downstream context.

```text id="lq0j3s"
Upstream
   │
   ▼
Downstream
```

The downstream context is affected by changes in the upstream model.

---

## 9.2 Customer-Supplier

The downstream context has requirements that influence the upstream context's supplied capabilities or model.

```text id="m4g8ne"
Customer
   │ requirements
   ▼
Supplier
```

This relationship indicates a stronger form of dependency and negotiation.

---

## 9.3 Partnership

Two contexts collaborate with significant mutual dependency.

```text id="0x4gqn"
Context A
   ↕
Context B
```

Neither context is simply a passive consumer of the other.

---

## 9.4 Conformist

A downstream context adopts the upstream model without establishing an independent translation model.

This may reduce integration complexity but increases coupling to the upstream model.

Conformist relationships should be intentional.

---

## 9.5 Anti-Corruption Layer

A context protects its own model by translating another context's model.

```text id="h2w8vd"
Context A
   │
   ▼
┌──────────────────────┐
│ Anti-Corruption Layer│
└──────────┬───────────┘
           ▼
Context B
```

An Anti-Corruption Layer is a **boundary strategy**, not automatically a technical service.

---

## 9.6 Shared Kernel

Two contexts intentionally share a limited portion of their domain model.

A Shared Kernel should be:

* Explicit
* Small
* Governed
* Stable enough for shared ownership
* Carefully changed

Convenience alone is insufficient justification.

---

## 9.7 Open Host Service

A context exposes a stable model or service intended for consumption by multiple downstream contexts.

The domain relationship may later influence an architectural integration contract.

---

## 9.8 Published Language

A context publishes a well-defined language or model intended to be understood across boundaries.

This does not automatically imply a specific technical transport.

---

## 9.9 Separate Ways

Two contexts have no meaningful integration requirement and can evolve independently.

This may be preferable to introducing unnecessary coupling.

---

## 9.10 Unknown Relationship

Use:

```text id="u6d5p2"
UNKNOWN
```

when the relationship is suspected but evidence is insufficient.

Do not invent a relationship merely to complete the map.

---

# 10. Upstream and Downstream Semantics

Direction must be based on model influence.

### Upstream

The context whose model or business behavior influences another context.

### Downstream

The context whose model is affected by the upstream context.

Direction is not necessarily equivalent to:

* Request direction
* HTTP direction
* Message direction
* Database access direction
* Deployment dependency

These may differ.

---

# 11. Semantic Ownership

For every significant shared or exchanged concept, identify the semantic owner.

```text id="7c1q4n"
Concept:
<concept>

Owning Context:
<context>

Consumers:
<contexts>

Interpretation:
<meaning>

Translation Required:
<yes/no>

Evidence:
<evidence>
```

A concept should not have multiple owners simply because multiple contexts use similar terminology.

Two contexts may use the same word while assigning it different meanings.

That is a semantic distinction, not necessarily a conflict.

---

# 12. Shared Concepts

Document concepts that cross boundaries.

| Concept     | Owning Context | Consumer Contexts | Meaning in Owner | Meaning Elsewhere | Translation  |
| ----------- | -------------- | ----------------- | ---------------- | ----------------- | ------------ |
| `<concept>` | `<context>`    | `<contexts>`      | `<meaning>`      | `<meaning>`       | `<strategy>` |

Avoid assuming that identical names imply identical models.

---

# 13. Translation Boundaries

When two contexts use different models, explicitly document translation.

```text id="n5t7c0"
Source Context:
<context>

Source Concept:
<concept>

Target Context:
<context>

Target Concept:
<concept>

Translation:
<semantic transformation>

Reason:
<why models differ>

Ownership:
<owner>

Risk:
<risk>
```

Translation should preserve semantic integrity rather than merely rename fields.

---

# 14. Anti-Corruption Layer Assessment

An Anti-Corruption Layer may be justified when:

* The upstream model conflicts with the downstream model.
* The downstream context has stronger semantic independence.
* External model complexity should not leak into the internal model.
* Legacy concepts must be isolated.
* Different terminology or invariants exist.
* The dependency is strategically important.

It may be unnecessary when:

* The models are genuinely compatible.
* The dependency is trivial.
* Translation adds more complexity than value.
* The contexts are intentionally conformist.

The decision must be evidence-based.

---

# 15. Shared Kernel Assessment

A Shared Kernel should document:

```text id="v3r8ka"
Shared Concepts:
<concepts>

Shared Rules:
<rules>

Shared Invariants:
<invariants>

Owning Contexts:
<contexts>

Change Authority:
<authority>

Change Process:
<process>

Risk:
<risk>

Reason for Sharing:
<reason>
```

A Shared Kernel should remain deliberately small.

If the majority of two contexts becomes shared, reconsider whether their boundaries are actually valid.

---

# 16. Context Dependency Analysis

For every relationship, assess:

| Dimension              | Assessment          |
| ---------------------- | ------------------- |
| Semantic Coupling      | `<LOW/MEDIUM/HIGH>` |
| Business Coupling      | `<LOW/MEDIUM/HIGH>` |
| Change Coupling        | `<LOW/MEDIUM/HIGH>` |
| Ownership Clarity      | `<HIGH/MEDIUM/LOW>` |
| Translation Complexity | `<LOW/MEDIUM/HIGH>` |
| Dependency Risk        | `<LOW/MEDIUM/HIGH>` |
| Evolution Risk         | `<LOW/MEDIUM/HIGH>` |

The assessment should be evidence-based.

---

# 17. Context Volatility

Record differences in change frequency.

```text id="c7n1zv"
Context A Volatility:
<LOW | MEDIUM | HIGH>

Context B Volatility:
<LOW | MEDIUM | HIGH>

Shared Model Volatility:
<LOW | MEDIUM | HIGH | UNKNOWN>

Risk:
<risk>

Implication:
<implication>
```

High volatility differences may justify stronger model isolation.

Do not use volatility alone to determine boundaries.

---

# 18. Context Complexity

Assess domain complexity independently for each context.

| Context     | Domain Complexity   | Rule Complexity | Lifecycle Complexity | Integration Complexity |
| ----------- | ------------------- | --------------- | -------------------- | ---------------------- |
| `<context>` | `<LOW/MEDIUM/HIGH>` | `<...>`         | `<...>`              | `<...>`                |

This information contributes to later architecture sizing.

---

# 19. Context Ownership

For each context, identify:

```text id="q2w5az"
Business Responsibility:
<responsibility>

Domain Ownership:
<owner>

Decision Authority:
<authority>

Model Authority:
<authority>

Change Authority:
<authority>

Operational Ownership:
<known information>

Evidence:
<evidence>
```

Do not invent organizational ownership when it has not been established.

---

# 20. Context Boundary Signals

Document evidence supporting each boundary.

Potential signals include:

* Different business responsibilities
* Different language
* Different invariants
* Different lifecycle
* Different ownership
* Different change cadence
* Different business policies
* Different domain models
* Different data meaning
* Different consistency requirements
* Different external relationships

A boundary should be supported by multiple meaningful signals where possible.

---

# 21. Boundary Pressure

Identify forces pushing contexts together or apart.

```text id="e7u4qc"
Context Pair:
<context A> ↔ <context B>

Forces Toward Separation:
- <force>

Forces Toward Collaboration:
- <force>

Current Assessment:
<assessment>

Uncertainty:
<uncertainty>
```

This helps avoid simplistic “split everything” or “merge everything” decisions.

---

# 22. Context Map and Bounded Context Validation

For every relationship, ask:

1. Are the contexts actually using distinct models?
2. Is the relationship supported by domain behavior?
3. Is semantic ownership clear?
4. Is the direction meaningful?
5. Are translation requirements understood?
6. Are coupling risks visible?
7. Could the relationship be unnecessary?
8. Could the relationship indicate an incorrect boundary?
9. Are technical integration assumptions being mistaken for domain relationships?

---

# 23. Existing System Analysis

For existing systems, distinguish:

### Documented Context Map

What existing architecture/domain documentation claims.

### Actual Context Map

What current behavior, terminology, ownership, code, data, and integrations demonstrate.

### Target Context Map

What the intended domain evolution requires.

Example:

```text id="h6w0p1"
Documented:
<description>

Actual:
<description>

Target:
<description>

Differences:
<differences>

Migration Implications:
<implications>
```

Existing technical integrations are evidence, but they do not automatically define the target domain landscape.

---

# 24. Legacy Boundary Assessment

For legacy systems, evaluate whether existing boundaries correspond to meaningful domain boundaries.

Possible outcomes:

* `ALIGNED`
* `PARTIALLY_ALIGNED`
* `MISALIGNED`
* `UNKNOWN`

Assessment:

```text id="f8s1ro"
Existing Boundary:
<boundary>

Domain Responsibility:
<responsibility>

Language Coherence:
<assessment>

Invariant Coherence:
<assessment>

Ownership Coherence:
<assessment>

Change Coupling:
<assessment>

Target Recommendation:
<recommendation>

Evidence:
<evidence>
```

---

# 25. System Evolution

When evolving an existing system, define the affected context relationships.

```text id="8y2q4v"
Change:
<change>

Affected Contexts:
<contexts>

Existing Relationship:
<relationship>

Target Relationship:
<relationship>

Migration Boundary:
<boundary>

Compatibility Requirement:
<requirement>

Temporary Relationship:
<relationship>

Target State:
<description>
```

Temporary relationships should be explicitly identified rather than mistaken for permanent architecture.

---

# 26. Context Map Risks

Record risks such as:

* Strong semantic coupling
* Shared terminology without shared meaning
* Unclear ownership
* Excessive Shared Kernel
* Legacy model leakage
* Translation complexity
* High change coupling
* Circular dependencies
* Context boundary ambiguity
* Integration assumptions
* Organizational coupling
* Unclear target state

| ID           | Risk     | Contexts     | Impact     | Likelihood     | Mitigation     |
| ------------ | -------- | ------------ | ---------- | -------------- | -------------- |
| RISK-CTX-001 | `<risk>` | `<contexts>` | `<impact>` | `<likelihood>` | `<mitigation>` |

---

# 27. Circular Context Dependencies

Identify circular semantic dependencies.

```text id="n0c7ya"
Context A
   ↓
Context B
   ↓
Context C
   ↓
Context A
```

A circular relationship may indicate:

* Shared responsibility
* Incorrect boundary
* Excessive coupling
* Missing intermediary concept
* Incorrect upstream/downstream interpretation

Do not automatically eliminate cycles without understanding their domain cause.

---

# 28. Context Map Decisions

Record consequential decisions separately.

Examples:

* Context relationship type
* Upstream/downstream direction
* Translation strategy
* Shared Kernel adoption
* Anti-Corruption Layer
* Conformist relationship
* Published Language
* Context merge/split
* Context ownership
* Boundary evolution

Each significant decision should reference the appropriate decision artifact.

---

# 29. Context Map Unknowns

| ID          | Unknown      | Contexts     | Why It Matters | Impact     | Blocking   | Resolution |
| ----------- | ------------ | ------------ | -------------- | ---------- | ---------- | ---------- |
| UNK-CTX-001 | `<question>` | `<contexts>` | `<reason>`     | `<impact>` | `<yes/no>` | `<method>` |

Examples:

* Is a relationship truly required?
* Which context owns a concept?
* Are models actually different?
* Is translation required?
* Is an existing integration temporary or permanent?

---

# 30. Context Map Assumptions

```text id="k4e6mp"
ID:
Assumption:
Contexts:
Reason:
Evidence:
Confidence:
Impact If False:
Validation Method:
Status:
```

Assumptions must not silently become boundary facts.

---

# 31. Context Map Traceability

The Context Map should connect strategic and tactical DDD artifacts.

Recommended chain:

```text id="s2z4qj"
Product Scope
     ↓
Domain Capability
     ↓
Bounded Context
     ↓
Domain Model
     ↓
Context Relationship
     ↓
Domain Event / Process
     ↓
Future Architecture Boundary
```

Possible relationships:

* `DERIVES_FROM`
* `CONTAINS`
* `OWNS`
* `DEPENDS_ON`
* `INFLUENCES`
* `TRANSLATES`
* `PROTECTS`
* `CONSTRAINS`
* `REALIZES`
* `SUPERSEDES`

Traceability must distinguish domain relationships from later technical representations.

---

# 32. Context Map and Domain Model Alignment

Validate:

| Bounded Context | Domain Model | Responsibility     | Language       | Invariants     | Alignment  |
| --------------- | ------------ | ------------------ | -------------- | -------------- | ---------- |
| `<context>`     | `<model>`    | `<responsibility>` | `<assessment>` | `<assessment>` | `<status>` |

A context map should not describe relationships between contexts whose models have not been sufficiently understood.

---

# 33. Context Map and Domain Events

Where events cross context boundaries conceptually, document the relationship.

```text id="9v4m2w"
Origin Context:
<context>

Domain Event:
<event>

Receiving Context:
<context>

Domain Meaning:
<meaning>

Expected Reaction:
<reaction>

Cross-Context Significance:
<significance>

Integration Decision:
<NOT_YET_DECIDED | DECIDED_LATER | KNOWN>
```

Do not define transport details here.

---

# 34. Context Map Health

Assess:

### Boundary Clarity

Are bounded contexts meaningful and distinguishable?

### Semantic Ownership

Is responsibility for concepts clear?

### Relationship Clarity

Are context relationships understood?

### Direction

Are upstream/downstream relationships justified?

### Translation

Are semantic differences understood?

### Coupling

Are strong dependencies visible?

### Evolution

Can contexts evolve independently where expected?

### Legacy Alignment

Are documented, actual, and target states distinguishable?

### Evidence

Are relationships supported by evidence?

### Uncertainty

Are unresolved relationships explicit?

---

# 35. Context Map Debt

Record weaknesses such as:

* Undefined relationship
* Incorrect terminology
* Unclear ownership
* Hidden coupling
* Excessive Shared Kernel
* Missing translation
* Legacy boundary mismatch
* Circular dependency
* Unverified relationship
* Technical integration mistaken for domain dependency

---

# 36. Review Checklist

### Contexts

* [ ] All represented bounded contexts are defined.
* [ ] Context responsibilities are clear.
* [ ] Context language is sufficiently understood.
* [ ] Model ownership is explicit.

### Relationships

* [ ] Significant relationships are identified.
* [ ] Direction is meaningful.
* [ ] Relationship type is justified.
* [ ] Semantic dependencies are understood.
* [ ] Translation needs are explicit.

### DDD Patterns

* [ ] Shared Kernel is intentional.
* [ ] Anti-Corruption Layer is justified where used.
* [ ] Conformist relationships are explicit.
* [ ] Partnership relationships are meaningful.
* [ ] Separate Ways is considered where appropriate.

### Existing Systems

* [ ] Documented, actual, and target states are distinguished.
* [ ] Legacy integrations are not automatically treated as target domain relationships.
* [ ] Migration relationships are identified where relevant.

### Architecture Independence

* [ ] No microservice mapping is assumed.
* [ ] No database topology is assumed.
* [ ] No transport is assumed.
* [ ] No deployment relationship is embedded.

### Traceability

* [ ] Contexts trace to domain responsibilities.
* [ ] Relationships trace to domain evidence.
* [ ] Important events/processes are connected.
* [ ] Decisions are traceable.

---

# 37. Gate Contribution

This artifact contributes to Domain Discovery readiness.

```text id="w1k7hp"
Context Map Status:
<READY | READY_WITH_RISKS | INCOMPLETE | BLOCKED>

Boundary Clarity:
<HIGH | MEDIUM | LOW>

Relationship Clarity:
<HIGH | MEDIUM | LOW>

Semantic Ownership:
<HIGH | MEDIUM | LOW>

Coupling Understanding:
<HIGH | MEDIUM | LOW>

Translation Understanding:
<HIGH | MEDIUM | LOW>

Traceability:
<HEALTHY | DEGRADED | BROKEN>

Blocking Issues:
<issues>

Gate Recommendation:
<recommendation>
```

A complete-looking context map does not automatically mean that Domain Discovery is complete.

---

# 38. Compact Context Map Register

| ID          | Upstream    | Downstream  | Relationship     | Translation  | Coupling            | Status     |
| ----------- | ----------- | ----------- | ---------------- | ------------ | ------------------- | ---------- |
| REL-CTX-001 | `<context>` | `<context>` | `<relationship>` | `<strategy>` | `<LOW/MEDIUM/HIGH>` | `<status>` |

---

# 39. Agent Instructions

When creating or modifying a Context Map:

1. Start from established bounded contexts.
2. Preserve domain language.
3. Model semantic relationships, not technical dependencies.
4. Identify semantic ownership explicitly.
5. Determine upstream/downstream based on model influence.
6. Use DDD relationship patterns only when supported by evidence.
7. Do not map every API call as a context relationship.
8. Do not equate microservice dependencies with DDD relationships.
9. Do not assume identical terminology means identical models.
10. Identify translation requirements explicitly.
11. Use Anti-Corruption Layers when model protection is justified.
12. Keep Shared Kernels intentionally small.
13. Do not introduce Shared Kernels merely for convenience.
14. Identify strong coupling and boundary pressure.
15. Distinguish current, actual, documented, target, and transitional relationships.
16. Treat existing integrations as evidence, not automatic target architecture.
17. Record unknowns instead of inventing relationships.
18. Record consequential decisions separately.
19. Preserve traceability to capabilities, processes, models, events, and rules.
20. Revisit bounded-context boundaries when relationships reveal excessive coupling.
21. Do not introduce infrastructure details during domain analysis.
22. Keep the map proportional to domain complexity.

Before finalizing, ask:

> **Do the context relationships accurately represent how domain models depend on, influence, protect, or collaborate with one another, without confusing those relationships with technical integration mechanisms?**

---

# 40. Anti-Patterns

Avoid:

### Microservice Context Map

Treating every service dependency as a bounded-context relationship.

### API Relationship Mapping

Using HTTP calls as the primary evidence for domain relationships.

### Database Relationship Mapping

Using foreign keys or schemas to determine context relationships.

### Deployment Mapping

Treating deployment boundaries as domain boundaries.

### Shared Everything

Using a Shared Kernel because contexts happen to use similar concepts.

### Translation by Renaming

Assuming semantic translation is only field or class renaming.

### Context Ownership by Team

Defining domain ownership solely according to organizational structure.

### Legacy Integration Worship

Assuming an existing technical integration represents the correct target domain relationship.

### Forced Symmetry

Assuming both contexts have equal authority or dependency.

### Relationship Completeness Theater

Creating relationships for every possible connection simply to make the diagram look complete.

### Premature Integration Design

Defining queues, topics, APIs, protocols, or deployment mechanisms inside the Context Map.

---

# 41. Safe Progression Question

Before progressing from Domain Discovery toward Architecture, ask:

> **Are the bounded contexts, their semantic responsibilities, ownership, relationships, dependencies, translation boundaries, coupling pressures, and evolution concerns sufficiently understood to define architecture boundaries without treating technical integration as a substitute for domain understanding?**

If:

* **Yes** → the domain landscape is ready to feed Architecture/C4.
* **Yes, with risks** → proceed while preserving the risks.
* **No, but non-blocking** → record the gaps and continue cautiously.
* **No, because a boundary is unclear** → return to bounded-context analysis.
* **No, because a relationship is materially ambiguous** → resolve the domain uncertainty before making architectural commitments.

---

# 42. Final Principle

> **A Context Map makes the relationships between bounded-context models explicit while preserving their semantic independence.**

Its purpose is not to draw a network of services.

Its purpose is to reveal:

* Who owns meaning
* Who depends on whom
* Where models differ
* Where translation is necessary
* Where coupling exists
* Where boundaries are strong or weak
* Where architecture will later need to protect domain integrity

A good Context Map therefore becomes evidence for architecture, rather than a premature architecture diagram.
