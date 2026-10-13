# Domain Boundary Review

## 1. Document Metadata

| Field                 | Value                              |
| --------------------- | ---------------------------------- |
| Document Type         | Domain Boundary Review             |
| Lifecycle Phase       | Domain Discovery / DDD             |
| Scope                 | Domain / Bounded Context Landscape |
| Status                | `DRAFT`                            |
| Version               | `0.1`                              |
| Owner                 | `<owner>`                          |
| Created               | `<date>`                           |
| Last Updated          | `<date>`                           |
| Reviewed By           | `<reviewer>`                       |
| Related Context Map   | `<context-map>`                    |
| Related Domain Model  | `<domain-model>`                   |
| Related Domain Events | `<domain-events>`                  |

---

# 2. Purpose

This document evaluates whether the discovered domain boundaries are sufficiently understood and justified to support subsequent architecture decisions.

The review assesses:

* Bounded-context boundaries
* Domain responsibilities
* Ubiquitous language
* Concept ownership
* Business rules
* Invariants
* Aggregate boundaries
* Domain processes
* Domain events
* Context relationships
* Coupling
* Change boundaries
* Model integrity
* Existing-system alignment
* Evolution and migration implications
* Remaining uncertainty

The review does not define:

* Microservices
* Deployment units
* APIs
* Databases
* Messaging infrastructure
* Cloud architecture
* Runtime topology

Those concerns belong to subsequent lifecycle phases.

---

# 3. Core Principle

> **A domain boundary is justified by semantic and behavioral coherence, not by technical convenience.**

A boundary should protect a meaningful domain model and its responsibilities.

Architecture may later choose to represent a bounded context as:

* A service
* A module
* A component
* A monolith boundary
* Multiple deployable units
* Another architectural structure

That representation must not be assumed during Domain Discovery.

---

# 4. Review Objective

The review must answer:

> **Are the domain boundaries sufficiently coherent, evidence-based, and understood to allow architecture to define technical boundaries without inventing or distorting domain responsibilities?**

The review should identify:

1. Boundaries that are well supported.
2. Boundaries that remain uncertain.
3. Concepts that may belong to multiple models.
4. Responsibilities that may be misplaced.
5. Invariants whose ownership is unclear.
6. Processes that cross boundaries.
7. Events that reveal boundary relationships.
8. Coupling that may challenge current boundaries.
9. Existing boundaries that conflict with the target model.
10. Decisions that must be carried into Architecture.

---

# 5. Review Inputs

The review should use:

* Product Discovery Summary
* Product Scope
* Requirements
* Business Rules
* Use Cases
* Domain Context
* Domain Glossary
* Domain Capabilities
* Domain Processes
* Bounded Contexts
* Domain Model
* Domain Events
* Context Map
* Domain Decisions
* Assumptions
* Unknowns
* Existing-system evidence
* Relevant traceability information

The review must not rely on a single artifact in isolation.

---

# 6. Review Scope

```text id="f4w2cz"
Domain:
<domain>

Contexts Reviewed:
- <context>

Excluded Contexts:
- <context>

Current State:
<description>

Target State:
<description>

Transition State:
<description>

Review Objective:
<objective>
```

The scope must explicitly distinguish current and target boundaries when the system already exists.

---

# 7. Review Status

Use one of:

* `NOT_STARTED`
* `IN_PROGRESS`
* `READY_FOR_REVIEW`
* `PASSED`
* `PASSED_WITH_RISKS`
* `BLOCKED`
* `SUPERSEDED`

The review status is independent from the status of individual domain artifacts.

---

# 8. Boundary Review Summary

Provide a concise overall assessment.

```text id="n6c1pv"
Overall Result:
<READY | READY_WITH_RISKS | BLOCKED | INCOMPLETE>

Domain Boundary Confidence:
<HIGH | MEDIUM | LOW>

Critical Findings:
- <finding>

Significant Findings:
- <finding>

Non-Blocking Findings:
- <finding>

Required Follow-Up:
- <item>
```

---

# 9. Boundary Inventory

List all relevant boundaries.

| ID      | Boundary     | Responsibility     | Model     | Owner     | Confidence     | Assessment     |
| ------- | ------------ | ------------------ | --------- | --------- | -------------- | -------------- |
| BND-001 | `<boundary>` | `<responsibility>` | `<model>` | `<owner>` | `<confidence>` | `<assessment>` |

Possible assessment:

* `COHERENT`
* `MOSTLY_COHERENT`
* `UNCERTAIN`
* `CONTESTED`
* `MISALIGNED`
* `BLOCKED`

---

# 10. Responsibility Coherence

For each bounded context, evaluate whether its responsibility is coherent.

```text id="v5k0rd"
Context:
<context>

Primary Responsibility:
<responsibility>

Included Responsibilities:
- <responsibility>

Potentially Misplaced Responsibilities:
- <responsibility>

Excluded Responsibilities:
- <responsibility>

Assessment:
<COHERENT | PARTIAL | UNCERTAIN | MISALIGNED>

Evidence:
<evidence>
```

A context should have a meaningful domain responsibility rather than merely a collection of technical capabilities.

---

# 11. Semantic Boundary Review

Evaluate the language used inside each context.

| Context     | Language Coherence  | Ambiguous Terms | Conflicting Terms | Assessment     |
| ----------- | ------------------- | --------------- | ----------------- | -------------- |
| `<context>` | `<HIGH/MEDIUM/LOW>` | `<terms>`       | `<terms>`         | `<assessment>` |

Review:

* Meaning consistency
* Context-specific terminology
* Same term with different meanings
* Different terms with same meaning
* Unresolved terminology
* Translation requirements

Terminology conflicts should not automatically be removed.

Different meanings may be evidence of legitimate bounded contexts.

---

# 12. Concept Ownership Review

For important concepts:

| Concept     | Candidate Owner | Current Owner | Evidence     | Conflict     | Result     |
| ----------- | --------------- | ------------- | ------------ | ------------ | ---------- |
| `<concept>` | `<context>`     | `<context>`   | `<evidence>` | `<conflict>` | `<result>` |

Possible results:

* `CONFIRMED`
* `REQUIRES_REVIEW`
* `CONTESTED`
* `UNRESOLVED`

Every strategically important concept should have sufficiently clear semantic ownership.

---

# 13. Business Rule Ownership Review

Evaluate which context owns each important business rule.

| Rule     | Owning Context | Affected Contexts | Ownership Confidence | Result     |
| -------- | -------------- | ----------------- | -------------------- | ---------- |
| `<rule>` | `<context>`    | `<contexts>`      | `<confidence>`       | `<result>` |

Questions:

1. Where is the rule meaningful?
2. Which context has authority over the rule?
3. Which model contains the concepts required to evaluate it?
4. Is the rule duplicated?
5. If duplicated, is duplication intentional?
6. Is one context incorrectly depending on another's internal rule?

---

# 14. Invariant Ownership Review

Critical invariants must have explicit ownership.

| Invariant     | Owner                 | Boundary     | Required Consistency | Confidence     | Result     |
| ------------- | --------------------- | ------------ | -------------------- | -------------- | ---------- |
| `<invariant>` | `<aggregate/context>` | `<boundary>` | `<scope>`            | `<confidence>` | `<result>` |

Potential problems:

* No clear owner
* Multiple conflicting owners
* Cross-context invariant
* Invariant depending on another context's internal state
* Technical transaction used to hide unclear ownership

Cross-context invariants require particular attention because they may materially influence architecture.

---

# 15. Aggregate Boundary Review

Evaluate aggregates independently from bounded contexts.

```text id="x7m4vb"
Aggregate:
<aggregate>

Root:
<root>

Boundary Justification:
<reason>

Owned Invariants:
<invariants>

Consistency Requirement:
<requirement>

Business Ownership:
<ownership>

Cross-Aggregate Dependencies:
<dependencies>

Assessment:
<COHERENT | PARTIAL | UNCERTAIN | MISALIGNED>
```

Important:

> A bounded context may contain multiple aggregates.

Likewise:

> An aggregate boundary does not automatically determine a service boundary.

---

# 16. Process Boundary Review

Evaluate processes that cross bounded contexts.

| Process     | Origin Context | Participating Contexts | Cross-Boundary Behavior | Ownership | Assessment     |
| ----------- | -------------- | ---------------------- | ----------------------- | --------- | -------------- |
| `<process>` | `<context>`    | `<contexts>`           | `<behavior>`            | `<owner>` | `<assessment>` |

Review whether the process:

* Has a clear owner.
* Crosses contexts legitimately.
* Depends on internal state from another context.
* Exposes hidden coupling.
* Requires explicit coordination.
* Indicates a missing domain boundary.

A process crossing contexts is not automatically evidence that the contexts should be merged.

---

# 17. Domain Event Boundary Review

Evaluate events that connect contexts conceptually.

| Event     | Origin      | Receiving Context | Meaning     | Ownership | Boundary Risk |
| --------- | ----------- | ----------------- | ----------- | --------- | ------------- |
| `<event>` | `<context>` | `<context>`       | `<meaning>` | `<owner>` | `<risk>`      |

Questions:

1. Is the event meaningful to the originating context?
2. Is the receiving context interpreting it independently?
3. Does the receiving context need a translated concept?
4. Is the dependency semantic or merely technical?
5. Does the event expose excessive coupling?

Do not turn this review into an integration contract design.

---

# 18. Context Relationship Review

Evaluate relationships from the Context Map.

| Upstream    | Downstream  | Relationship     | Justification | Coupling            | Assessment |
| ----------- | ----------- | ---------------- | ------------- | ------------------- | ---------- |
| `<context>` | `<context>` | `<relationship>` | `<evidence>`  | `<LOW/MEDIUM/HIGH>` | `<result>` |

Possible assessments:

* `HEALTHY`
* `ACCEPTABLE`
* `HIGH_COUPLING`
* `UNCERTAIN`
* `MISALIGNED`

---

# 19. Boundary Pressure Analysis

Identify forces that challenge the current boundaries.

### Forces Toward Separation

* Different models
* Different business ownership
* Different invariants
* Different lifecycle
* Different policies
* Different change cadence
* Different domain language

### Forces Toward Collaboration

* Shared business responsibility
* Strong consistency requirement
* Shared lifecycle
* Strongly coupled decisions
* Same domain authority
* Significant shared behavior

Record:

```text id="q8y3mx"
Boundary:
<boundary>

Separation Pressure:
<forces>

Collaboration Pressure:
<forces>

Current Balance:
<assessment>

Confidence:
<confidence>
```

---

# 20. Boundary Coupling

Evaluate coupling independently.

| Boundary Pair | Semantic Coupling | Business Coupling | Change Coupling | Consistency Coupling | Overall Risk |
| ------------- | ----------------- | ----------------- | --------------- | -------------------- | ------------ |
| `<A-B>`       | `<level>`         | `<level>`         | `<level>`       | `<level>`            | `<risk>`     |

High coupling is not automatically a boundary failure.

It is a signal requiring analysis.

---

# 21. Change Coupling

Determine whether changes in one context systematically require changes in another.

```text id="f2v8nq"
Context A:
<context>

Context B:
<context>

Typical Change:
<change>

Required Changes:
<changes>

Why:
<reason>

Frequency:
<frequency>

Evidence:
<evidence>

Assessment:
<LOW | MEDIUM | HIGH>
```

Persistent high change coupling may indicate:

* Incorrect boundaries
* Shared business ownership
* Excessive model sharing
* Missing abstraction
* Legacy constraints
* Legitimate business coordination

---

# 22. Data Meaning Review

This review considers **semantic data ownership**, not database topology.

For important data concepts:

| Concept     | Semantic Owner | Consumers    | Meaning Differences | Boundary Assessment |
| ----------- | -------------- | ------------ | ------------------- | ------------------- |
| `<concept>` | `<context>`    | `<contexts>` | `<differences>`     | `<assessment>`      |

Questions:

* Who defines the meaning?
* Who can change it?
* Who merely consumes it?
* Does another context reinterpret it?
* Is data duplicated intentionally?
* Is the duplication semantic or merely technical?

Do not use database schemas as the primary boundary criterion.

---

# 23. Current vs Target Boundary Review

For existing systems:

| Area     | Current Boundary | Target Boundary | Difference     | Migration Concern |
| -------- | ---------------- | --------------- | -------------- | ----------------- |
| `<area>` | `<current>`      | `<target>`      | `<difference>` | `<concern>`       |

This prevents the current implementation from silently becoming the target domain architecture.

---

# 24. Transitional Boundaries

When evolution requires temporary boundaries:

```text id="k3x7ba"
Current:
<state>

Transition:
<state>

Target:
<state>

Temporary Relationship:
<relationship>

Expected Lifetime:
<known/unknown>

Removal Condition:
<condition>

Risk:
<risk>
```

Temporary structures must be explicitly marked.

Otherwise they may become accidental permanent architecture.

---

# 25. Boundary Alternatives

Where a boundary is uncertain, document viable alternatives.

```text id="u1r5cf"
Boundary Question:
<question>

Option A:
<description>

Option B:
<description>

Option C:
<description>

Evaluation Criteria:
- Domain coherence
- Ownership
- Invariants
- Coupling
- Change impact
- Complexity
- Migration impact

Preferred Option:
<recommendation>

Decision Status:
<status>
```

A recommendation is not a decision.

---

# 26. Boundary Decision Triggers

A boundary should receive formal decision treatment when:

* Multiple viable interpretations exist.
* The boundary significantly affects architecture.
* Aggregate ownership is disputed.
* Cross-context consistency is required.
* External contracts depend on the boundary.
* Migration cost is significant.
* The decision is difficult to reverse.
* The boundary affects security or data ownership.
* The boundary materially affects long-term evolution.

---

# 27. Domain Model Integrity

Evaluate whether each bounded context protects a coherent model.

| Context     | Model Coherence | Rule Coherence | Invariant Coherence | Lifecycle Coherence | Result     |
| ----------- | --------------- | -------------- | ------------------- | ------------------- | ---------- |
| `<context>` | `<level>`       | `<level>`      | `<level>`           | `<level>`           | `<result>` |

A context should not become merely a container for unrelated concepts.

---

# 28. Domain Responsibility Duplication

Identify potentially duplicated responsibilities.

```text id="m9t3xv"
Responsibility:
<responsibility>

Context A:
<context>

Context B:
<context>

Duplication Type:
<semantic | behavioral | policy | data | unknown>

Intentional:
<YES | NO | UNKNOWN>

Risk:
<risk>

Resolution:
<resolution>
```

Duplication may be legitimate.

For example, two contexts may independently maintain their own interpretation of a concept.

The review must determine whether duplication is intentional and semantically justified.

---

# 29. Boundary Gaps

Identify responsibilities that do not clearly belong anywhere.

| ID      | Responsibility     | Candidate Contexts | Why Unresolved | Impact     | Resolution     |
| ------- | ------------------ | ------------------ | -------------- | ---------- | -------------- |
| GAP-001 | `<responsibility>` | `<contexts>`       | `<reason>`     | `<impact>` | `<resolution>` |

A boundary gap may indicate:

* Missing bounded context
* Incorrect responsibility assignment
* Incomplete domain discovery
* Missing domain concept
* Unresolved product scope

---

# 30. Boundary Overlap

Identify responsibilities claimed by multiple contexts.

| ID      | Responsibility     | Context A   | Context B   | Nature of Overlap | Resolution     |
| ------- | ------------------ | ----------- | ----------- | ----------------- | -------------- |
| OVR-001 | `<responsibility>` | `<context>` | `<context>` | `<overlap>`       | `<resolution>` |

Overlap may be:

* Intentional
* Temporary
* Legacy
* Accidental
* Unresolved

---

# 31. Security and Trust Boundary Signals

Domain boundaries may expose security or trust implications.

Review:

* Sensitive domain concepts
* Authorization responsibilities
* Business authority
* Trust relationships
* Ownership of protected information
* Cross-context access
* External actors

Do not define technical security architecture here.

Instead record domain-level signals:

```text id="p8v4nf"
Boundary:
<boundary>

Trust Concern:
<concern>

Domain Authority:
<authority>

Sensitive Concept:
<concept>

Implication:
<implication>

Evidence:
<evidence>
```

---

# 32. Boundary Risks

| ID           | Risk     | Boundary     | Impact     | Likelihood     | Severity     | Mitigation     |
| ------------ | -------- | ------------ | ---------- | -------------- | ------------ | -------------- |
| RISK-BND-001 | `<risk>` | `<boundary>` | `<impact>` | `<likelihood>` | `<severity>` | `<mitigation>` |

Severity:

* `INFO`
* `WARNING`
* `SIGNIFICANT`
* `BLOCKING`

---

# 33. Boundary Unknowns

| ID          | Unknown      | Boundary     | Why It Matters | Impact     | Blocking   | Resolution |
| ----------- | ------------ | ------------ | -------------- | ---------- | ---------- | ---------- |
| UNK-BND-001 | `<question>` | `<boundary>` | `<reason>`     | `<impact>` | `<yes/no>` | `<method>` |

Prioritize unknowns according to their architectural consequence and reversibility.

---

# 34. Boundary Assumptions

```text id="w5r2ak"
ID:
Boundary:
Assumption:
Reason:
Evidence:
Confidence:
Impact If False:
Validation Method:
Status:
```

No assumption should be silently treated as an established boundary fact.

---

# 35. Boundary Decisions

Record consequential boundary decisions.

| ID          | Decision     | Scope     | Status     | Authority     | Related Artifacts |
| ----------- | ------------ | --------- | ---------- | ------------- | ----------------- |
| DEC-BND-001 | `<decision>` | `<scope>` | `<status>` | `<authority>` | `<artifacts>`     |

Typical decisions:

* Context split
* Context merge
* Ownership
* Aggregate boundary
* Cross-context relationship
* Translation strategy
* Shared Kernel
* Anti-Corruption Layer
* Context dependency
* Transitional boundary

Significant decisions should be recorded using the appropriate decision/ADR process.

---

# 36. Traceability Review

Validate the chain:

```text id="5j8d0m"
Product Need
     ↓
Requirement
     ↓
Domain Capability
     ↓
Domain Process
     ↓
Bounded Context
     ↓
Domain Model
     ↓
Business Rule / Invariant
     ↓
Context Relationship
     ↓
Scenario / Verification
```

Check for:

* Missing links
* Unsupported boundaries
* Orphaned contexts
* Untraceable responsibilities
* Unowned invariants
* Unexplained relationships
* Stale evidence

Traceability gaps are findings, not automatically boundary failures.

---

# 37. Evidence Quality

Evaluate evidence supporting each important boundary.

Possible evidence sources:

1. Explicit domain decision
2. Approved product decision
3. Current domain behavior
4. Current business rules
5. Current domain processes
6. Current model
7. Current contracts
8. Existing code/data/runtime behavior
9. Historical documentation
10. Agent inference

Record:

```text id="j4q6pz"
Boundary:
<boundary>

Primary Evidence:
<evidence>

Evidence Strength:
<HIGH | MEDIUM | LOW>

Conflicting Evidence:
<evidence>

Confidence:
<HIGH | MEDIUM | LOW>
```

Agent inference alone should rarely justify a strategic boundary.

---

# 38. Review Findings

Classify findings.

### INFO

Useful observation without immediate action.

### WARNING

Potential weakness that should be monitored.

### SIGNIFICANT

Issue likely to influence architecture or domain evolution.

### BLOCKING

Insufficient domain understanding to proceed safely.

| ID       | Finding     | Boundary     | Severity     | Evidence     | Recommendation     |
| -------- | ----------- | ------------ | ------------ | ------------ | ------------------ |
| FIND-001 | `<finding>` | `<boundary>` | `<severity>` | `<evidence>` | `<recommendation>` |

---

# 39. Findings Resolution

For each significant finding:

```text id="c2v6hm"
Finding:
<finding>

Current Status:
<OPEN | ANALYZING | RESOLVED | ACCEPTED | DEFERRED>

Resolution:
<resolution>

Evidence:
<evidence>

Affected Artifacts:
<artifacts>

Follow-Up:
<follow-up>
```

Resolved findings should not be removed from history.

---

# 40. Domain Boundary Review Matrix

Use a consolidated assessment.

| Criterion                 | Status     | Confidence     | Findings     |
| ------------------------- | ---------- | -------------- | ------------ |
| Responsibility coherence  | `<status>` | `<confidence>` | `<findings>` |
| Language coherence        | `<status>` | `<confidence>` | `<findings>` |
| Concept ownership         | `<status>` | `<confidence>` | `<findings>` |
| Business-rule ownership   | `<status>` | `<confidence>` | `<findings>` |
| Invariant ownership       | `<status>` | `<confidence>` | `<findings>` |
| Aggregate boundaries      | `<status>` | `<confidence>` | `<findings>` |
| Process boundaries        | `<status>` | `<confidence>` | `<findings>` |
| Event relationships       | `<status>` | `<confidence>` | `<findings>` |
| Context relationships     | `<status>` | `<confidence>` | `<findings>` |
| Change coupling           | `<status>` | `<confidence>` | `<findings>` |
| Data meaning ownership    | `<status>` | `<confidence>` | `<findings>` |
| Existing/target alignment | `<status>` | `<confidence>` | `<findings>` |
| Traceability              | `<status>` | `<confidence>` | `<findings>` |
| Critical unknowns         | `<status>` | `<confidence>` | `<findings>` |

---

# 41. Architecture Handoff

The review must explicitly state what Architecture may now consume.

```text id="r7p1wy"
Architecture May Assume:
- <established fact>

Architecture Must Preserve:
- <domain invariant>

Architecture Must Not Assume:
- <unsupported assumption>

Architecture Decisions Still Open:
- <decision>

Domain Risks to Carry Forward:
- <risk>

Domain Constraints for Architecture:
- <constraint>

Required Architecture Questions:
- <question>
```

This section prevents Architecture from treating every domain observation as a technical decision.

---

# 42. Architecture Handoff Contract

The handoff should communicate:

### Stable Domain Knowledge

What Architecture can treat as sufficiently established.

### Open Domain Questions

What remains unresolved.

### Protected Semantics

Concepts and rules whose meaning must not be altered casually.

### Boundary Constraints

Domain boundaries Architecture must respect unless explicitly reconsidered.

### Required Feedback

Questions Architecture must return to Domain Discovery if its analysis reveals contradictions.

Example:

```text id="n2v7cx"
Stable:
<items>

Open:
<items>

Protected:
<items>

Architecture Constraints:
<items>

Feedback Triggers:
<items>
```

---

# 43. Feedback to Domain Discovery

Architecture may reveal that a domain assumption is incorrect.

Architecture should return to Domain Discovery when it discovers:

* Impossible boundary representation
* Missing domain responsibility
* Hidden consistency requirement
* Contradictory ownership
* Unrecognized business rule
* Missing lifecycle
* Incorrect context relationship
* Unreasonable coupling
* Unsupported assumption

The response should be controlled iteration, not silent modification.

---

# 44. Review Outcome

Use one of:

### `READY`

Domain boundaries are sufficiently understood for Architecture.

### `READY_WITH_RISKS`

Architecture may proceed, but explicit risks and uncertainties must be carried forward.

### `INCOMPLETE`

Additional domain analysis is required, but no critical blocker has been identified.

### `BLOCKED`

A critical unresolved domain issue prevents safe architecture progression.

---

# 45. Gate Recommendation

```text id="z4c8me"
Domain Boundary Review:
<PASSED | PASSED_WITH_RISKS | BLOCKED | INCOMPLETE>

Reason:
<reason>

Blocking Conditions:
<conditions>

Non-Blocking Risks:
<risks>

Required Actions:
<actions>

Architecture Readiness:
<READY | READY_WITH_RISKS | NOT_READY>
```

The recommendation must be evidence-based.

---

# 46. Final Review Checklist

### Domain Boundaries

* [ ] Each bounded context has a meaningful responsibility.
* [ ] Context boundaries are supported by domain evidence.
* [ ] Semantic ownership is sufficiently clear.
* [ ] Important concepts have appropriate owners.
* [ ] Business rules have appropriate owners.
* [ ] Important invariants have clear owners.

### Domain Model

* [ ] Entities are justified.
* [ ] Value Objects are meaningful.
* [ ] Aggregate boundaries are justified by consistency and invariants.
* [ ] Domain behavior is appropriately assigned.
* [ ] Domain Services are justified.
* [ ] Domain Events are meaningful.

### Context Relationships

* [ ] Significant context relationships are identified.
* [ ] Direction is understood.
* [ ] Translation requirements are known.
* [ ] Coupling is visible.
* [ ] Shared Kernel usage is intentional.
* [ ] Anti-Corruption Layer usage is justified.

### Existing Systems

* [ ] Documented state is distinguished from actual state.
* [ ] Actual state is distinguished from target state.
* [ ] Legacy boundaries are evaluated rather than blindly preserved.
* [ ] Transitional boundaries are explicit.

### Uncertainty

* [ ] Critical unknowns are resolved or explicitly blocking.
* [ ] Assumptions are documented.
* [ ] Conflicts are visible.
* [ ] Findings have clear status.

### Architecture Readiness

* [ ] Domain constraints are explicit.
* [ ] Architecture assumptions are clearly separated.
* [ ] Architecture handoff is defined.
* [ ] Feedback triggers are defined.
* [ ] No technical boundary has been presented as a domain fact without evidence.

---

# 47. Agent Instructions

When performing a Domain Boundary Review:

1. Review the complete domain discovery evidence.
2. Do not evaluate boundaries using technical topology alone.
3. Verify responsibility coherence.
4. Verify semantic ownership.
5. Verify business-rule ownership.
6. Verify invariant ownership.
7. Review aggregate boundaries separately from bounded contexts.
8. Review process and event interactions across contexts.
9. Evaluate coupling without automatically treating it as failure.
10. Distinguish semantic duplication from accidental duplication.
11. Distinguish existing technical boundaries from target domain boundaries.
12. Identify boundary gaps and overlaps.
13. Record contradictions explicitly.
14. Record unknowns instead of inventing conclusions.
15. Escalate consequential boundary decisions.
16. Preserve traceability to product and domain evidence.
17. Produce an explicit Architecture Handoff.
18. Do not define technical architecture in this artifact.
19. If Architecture later exposes a domain contradiction, return through the feedback loop.
20. Do not mark the review as passed merely because all documents exist.

Before approving the review, ask:

> **Are the domain boundaries coherent enough that Architecture can represent them without inventing responsibilities, changing business semantics, or relying on unsupported assumptions?**

---

# 48. Anti-Patterns

Avoid:

### Microservice Boundary Review

Evaluating domain boundaries primarily by number of services.

### Database Boundary Review

Using schemas or tables as the primary domain-boundary evidence.

### Team Boundary Review

Assuming organizational ownership equals domain ownership.

### API Boundary Review

Treating endpoints as bounded contexts.

### Diagram Completion

Passing the review because every context has been drawn.

### False Precision

Declaring uncertain boundaries as definitive.

### Legacy Preservation

Assuming current technical boundaries are automatically correct.

### Boundary by Convenience

Choosing boundaries because they are easy to implement.

### Aggregate Confusion

Treating aggregates and bounded contexts as equivalent.

### Event Confusion

Treating event communication as proof of a domain boundary.

### Hidden Cross-Context Invariants

Ignoring business rules that require multiple contexts.

### Silent Reclassification

Changing domain responsibilities without recording the reason.

### Architecture Leakage

Embedding deployment, framework, database, or transport decisions prematurely.

---

# 49. Safe Progression Question

Before entering Architecture / C4:

> **Do we have sufficient evidence-based confidence in domain responsibilities, bounded contexts, aggregate boundaries, invariants, processes, events, context relationships, ownership, and coupling to allow architecture to define technical boundaries without distorting domain semantics?**

If **yes**, proceed to Architecture.

If **yes, with risks**, proceed while explicitly carrying those risks.

If **no but the gaps are non-blocking**, record them and continue cautiously.

If **no because a critical boundary, ownership, invariant, or business rule remains unresolved**, return to Domain Discovery.

---

# 50. Final Principle

> **Domain Boundary Review is the final semantic checkpoint before architecture.**

Its purpose is not to prove that the domain model is perfect.

Its purpose is to establish whether the domain has been understood well enough that architectural decisions can begin without silently inventing, merging, splitting, or distorting business responsibilities.

A successful review does not eliminate uncertainty.

It makes the remaining uncertainty explicit, bounded, traceable, and safe enough for the next lifecycle phase.
