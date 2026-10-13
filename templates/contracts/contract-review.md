# Contract Review

## 1. Document Metadata

| Field               | Value                              |
| ------------------- | ---------------------------------- |
| Document Type       | Contract Review                    |
| Lifecycle Phase     | Contracts                          |
| Review Type         | Cross-Contract Architecture Review |
| Status              | `DRAFT`                            |
| Version             | `0.1`                              |
| Owner               | `<owner>`                          |
| Created             | `<date>`                           |
| Last Updated        | `<date>`                           |
| System              | `<system>`                         |
| Architecture Review | `<architecture-review>`            |
| Previous Gate       | `<architecture-gate>`              |
| Next Phase          | Architecture Decisions / ADR       |

---

# 2. Purpose

This document provides the final review of the Contracts phase.

It evaluates whether the contracts established across architectural boundaries are:

* Semantically coherent.
* Consistent with the approved architecture.
* Aligned with product and domain understanding.
* Explicit about ownership.
* Sufficiently defined for consumers and providers.
* Consistent across API, Event, Data, Security, and Observability concerns.
* Traceable to requirements, domain concepts, architecture, and decisions.
* Ready to support detailed specifications.
* Ready to expose unresolved decisions that require formal architecture governance.

This document is a **phase checkpoint**.

It does not replace individual contracts.

---

# 3. Core Principle

> **Contract Review validates the coherence and readiness of the contract system as a whole, not merely the existence of individual contract documents.**

A project must not pass the Contracts phase simply because API, Event, Data, Security, and Observability documents exist.

The contracts must collectively describe compatible expectations across architectural boundaries.

---

# 4. Contract Scope

The review should cover applicable contract types:

```text
API
Events
Data
Security
Observability
```

Each contract must be classified as:

```text
REQUIRED
RECOMMENDED
OPTIONAL
NOT_REQUIRED
```

A contract type marked `NOT_REQUIRED` must have an explicit rationale when its absence could otherwise be ambiguous.

---

# 5. Review Outcome

Allowed outcomes:

```text
READY
READY_WITH_RISKS
INCOMPLETE
BLOCKED
```

### READY

Contracts are sufficiently coherent and stable to proceed.

### READY_WITH_RISKS

The phase may proceed, but explicit risks or non-blocking uncertainties remain.

### INCOMPLETE

Important contract understanding is missing, but the situation does not yet constitute a hard architectural block.

### BLOCKED

A missing or conflicting contract decision prevents safe progression.

---

# 6. Review Inputs

Expected inputs may include:

* Product Discovery Summary.
* Requirements.
* Quality Attributes.
* Constraints.
* Business Rules.
* Use Cases.
* Product Decisions.
* Domain Processes.
* Bounded Contexts.
* Domain Model.
* Domain Events.
* Context Map.
* Domain Boundary Review.
* Architecture Context.
* C4 Container Architecture.
* C4 Component Architecture where applicable.
* Architecture Views.
* Architecture Review.
* Contract Governance.
* API Contracts.
* Event Contracts.
* Data Contracts.
* Security Contracts.
* Observability Contracts.
* Relevant ADRs.
* Existing-system evidence.
* Migration analysis.

---

# 7. Review Scope

```text
System:
<system>

Boundaries:
<boundaries>

Contexts:
<contexts>

Containers:
<containers>

External Systems:
<systems>

Contract Types:
<types>

Current State:
<state>

Target State:
<state>

Transition State:
<state>
```

---

# 8. Contract Inventory

| ID     | Contract | Type     | Provider     | Consumers     | Status     | Criticality |
| ------ | -------- | -------- | ------------ | ------------- | ---------- | ----------- |
| `<ID>` | `<name>` | `<type>` | `<provider>` | `<consumers>` | `<status>` | `<level>`   |

---

# 9. Contract Coverage

Evaluate whether relevant boundaries have appropriate contracts.

```text id="x7q4mr"
Boundary:
<boundary>

API Contract:
<REQUIRED | RECOMMENDED | OPTIONAL | NOT_REQUIRED>

Event Contract:
<REQUIRED | RECOMMENDED | OPTIONAL | NOT_REQUIRED>

Data Contract:
<REQUIRED | RECOMMENDED | OPTIONAL | NOT_REQUIRED>

Security Contract:
<REQUIRED | RECOMMENDED | OPTIONAL | NOT_REQUIRED>

Observability Contract:
<REQUIRED | RECOMMENDED | OPTIONAL | NOT_REQUIRED>

Rationale:
<rationale>
```

Contract coverage is not a completeness score.

The objective is appropriate contractual coverage.

---

# 10. Architecture Alignment

Verify that contracts represent the approved architecture.

```text id="q5m8vc"
Architecture Element:
<element>

Contract:
<contract>

Relationship:
<relationship>

Aligned:
<YES | NO | PARTIAL>

Finding:
<finding>
```

Contracts must not silently introduce architectural boundaries that were not considered during Architecture.

---

# 11. Domain Alignment

Evaluate whether contracts preserve domain semantics.

```text id="v4x9mr"
Domain Concept:
<concept>

Contract:
<contract>

Meaning:
<meaning>

Owner:
<owner>

Aligned:
<YES | NO | PARTIAL>

Finding:
<finding>
```

The contract must not redefine domain concepts merely to simplify technical implementation.

---

# 12. Bounded Context Alignment

```text id="n6q3xr"
Bounded Context:
<context>

Contract:
<contract>

Cross-Context Boundary:
<boundary>

Semantic Translation:
<translation>

Ownership:
<owner>

Aligned:
<YES | NO | PARTIAL>
```

A contract crossing bounded contexts must preserve each context's semantic ownership.

---

# 13. Context Map Alignment

```text id="m8x4qc"
Context Relationship:
<relationship>

Contract:
<contract>

Relationship Type:
<UPSTREAM | DOWNSTREAM | CUSTOMER_SUPPLIER | PARTNERSHIP | ACL | OTHER>

Contract Behavior:
<behavior>

Aligned:
<YES | NO | PARTIAL>
```

Technical integration must not silently change the intended domain relationship.

---

# 14. API Contract Review

Evaluate all API contracts.

### Boundary

* [ ] Provider identified.
* [ ] Consumer identified.
* [ ] Purpose understood.
* [ ] Business capability identified.
* [ ] Architectural boundary clear.

### Semantics

* [ ] Operation meaning is clear.
* [ ] Preconditions are known.
* [ ] Postconditions are known.
* [ ] Side effects are understood.
* [ ] Business rules are referenced.

### Behavior

* [ ] Errors are understood.
* [ ] Idempotency is addressed where relevant.
* [ ] Consistency expectations are clear.
* [ ] Ordering is addressed where relevant.
* [ ] Timing expectations are not invented.

### Security

* [ ] Security Contract referenced.
* [ ] Authentication expectations clear.
* [ ] Authorization semantics clear.
* [ ] Sensitive data considered.

### Evolution

* [ ] Compatibility considered.
* [ ] Versioning strategy justified.
* [ ] Deprecation considered.

---

# 15. Event Contract Review

Evaluate all Event Contracts.

### Semantics

* [ ] Event represents a meaningful occurrence.
* [ ] Domain Event and Integration Event are distinguished.
* [ ] Event ownership is clear.
* [ ] Consumers understand its meaning.

### Delivery

* [ ] Ordering addressed where relevant.
* [ ] Duplicate behavior addressed where relevant.
* [ ] Delivery expectations supported by evidence.
* [ ] Replay is addressed where relevant.

### Evolution

* [ ] Schema evolution considered.
* [ ] Semantic evolution considered.
* [ ] Compatibility considered.
* [ ] Consumer migration considered.

### Security

* [ ] Sensitive data considered.
* [ ] Consumer authorization considered.
* [ ] Relevant Security Contract referenced.

---

# 16. Data Contract Review

Evaluate all Data Contracts.

### Semantics

* [ ] Data meaning is explicit.
* [ ] Ownership is clear.
* [ ] Authority is clear.
* [ ] Derived data is identified.
* [ ] Transformations are understood.

### Quality

* [ ] Consistency considered.
* [ ] Freshness considered.
* [ ] Temporal meaning considered.
* [ ] Historical semantics considered where relevant.

### Security

* [ ] Sensitive data identified.
* [ ] Data minimization considered.
* [ ] Privacy requirements considered.
* [ ] Allowed consumers identified.

### Evolution

* [ ] Compatibility considered.
* [ ] Migration considered where relevant.
* [ ] Deprecation considered.

---

# 17. Security Contract Review

Evaluate security expectations across boundaries.

### Trust

* [ ] Trust boundaries identified.
* [ ] Trust assumptions explicit.
* [ ] Principals identified.

### Identity

* [ ] Identity ownership understood.
* [ ] Authentication requirements clear.
* [ ] Authentication failures understood.

### Authorization

* [ ] Protected resources identified.
* [ ] Authorization semantics clear.
* [ ] Business authority distinguished from technical authorization.
* [ ] Denied behavior understood.

### Protection

* [ ] Sensitive data identified.
* [ ] Confidentiality addressed where relevant.
* [ ] Integrity addressed where relevant.
* [ ] Audit requirements addressed where relevant.

---

# 18. Observability Contract Review

Evaluate observability expectations.

### Questions

* [ ] Important operational questions identified.
* [ ] Business questions addressed where relevant.
* [ ] Failure diagnosis is possible.

### Signals

* [ ] Signal types are justified.
* [ ] Logs have defined semantics.
* [ ] Metrics have defined semantics.
* [ ] Traces have defined semantics where required.
* [ ] Audit evidence is distinguished from operational telemetry.

### Correlation

* [ ] Correlation requirements are clear.
* [ ] Causation is not falsely inferred.
* [ ] Cross-boundary context propagation is justified.

### Security

* [ ] Sensitive telemetry is protected.
* [ ] Secrets are excluded.
* [ ] Redaction is addressed.

---

# 19. Cross-Contract Consistency

Contracts must be reviewed against each other.

```text id="x4q8mk"
Contract A:
<contract>

Contract B:
<contract>

Shared Concept:
<concept>

Relationship:
<relationship>

Consistent:
<YES | NO | PARTIAL>

Finding:
<finding>
```

Important cross-contract relationships include:

```text
API ↔ Data
API ↔ Security
API ↔ Observability

Event ↔ Data
Event ↔ Security
Event ↔ Observability

Data ↔ Security
Data ↔ Observability

Security ↔ Observability
```

---

# 20. Semantic Consistency

Evaluate whether the same concept has consistent meaning.

```text id="q7m5vc"
Concept:
<concept>

API Meaning:
<meaning>

Event Meaning:
<meaning>

Data Meaning:
<meaning>

Security Meaning:
<meaning>

Observability Meaning:
<meaning>

Conflict:
<conflict>
```

Different bounded contexts may legitimately use different meanings.

Such differences must be explicit rather than accidental.

---

# 21. Ownership Consistency

```text id="v9x4mr"
Concept / Data:
<concept>

API Owner:
<owner>

Event Owner:
<owner>

Data Owner:
<owner>

Security Owner:
<owner>

Observability Owner:
<owner>

Conflict:
<conflict>
```

Different technical responsibilities may have different owners while semantic ownership remains coherent.

---

# 22. Security Consistency

Check whether security expectations align across contracts.

```text id="n4q8xc"
Boundary:
<boundary>

API Security:
<expectation>

Event Security:
<expectation>

Data Security:
<expectation>

Observability Security:
<expectation>

Consistent:
<YES | NO | PARTIAL>

Finding:
<finding>
```

A contract must not weaken security expectations established elsewhere.

---

# 23. Data Consistency

```text id="m7x3vq"
Concept:
<concept>

API Representation:
<representation>

Event Representation:
<representation>

Data Contract:
<representation>

Persistence Representation:
<representation>

Conflict:
<conflict>
```

Persistence structure must not accidentally become the canonical cross-boundary meaning.

---

# 24. Observability Consistency

```text id="x5q9mk"
Behavior:
<behavior>

API Signal:
<signal>

Event Signal:
<signal>

Data Signal:
<signal>

Security Signal:
<signal>

Conflict:
<conflict>
```

Observability should support the behavior defined by the other contracts.

---

# 25. Failure Semantics Consistency

Failure behavior must be consistent across contracts.

```text id="q8m4vr"
Failure:
<failure>

API:
<behavior>

Event:
<behavior>

Data:
<behavior>

Security:
<behavior>

Observability:
<behavior>

Conflict:
<conflict>
```

Examples of relevant failure categories:

* Validation failure.
* Authorization failure.
* Dependency failure.
* Data inconsistency.
* Duplicate delivery.
* Timeout.
* Partial failure.
* Recovery failure.

---

# 26. Consistency and Transaction Boundaries

Evaluate whether contracts imply consistency requirements that architecture must support.

```text id="v4x7mc"
Contract:
<contract>

Consistency Requirement:
<requirement>

Boundary:
<boundary>

Cross-Boundary:
<YES | NO>

Architectural Consequence:
<consequence>

Decision:
<ADR-ID>
```

Contracts must not accidentally imply distributed transactions without explicit architectural consideration.

---

# 27. Idempotency Consistency

Where relevant:

```text id="n6q3xr"
Interaction:
<interaction>

Idempotency Requirement:
<requirement>

API:
<behavior>

Event:
<behavior>

Consumer:
<behavior>

Conflict:
<conflict>
```

Idempotency should be required only where business or architectural behavior justifies it.

---

# 28. Ordering Consistency

```text id="m8x4qc"
Behavior:
<behavior>

Ordering Requirement:
<requirement>

API:
<expectation>

Event:
<expectation>

Consumer:
<expectation>

Conflict:
<conflict>
```

Do not introduce stronger ordering guarantees than required.

---

# 29. Compatibility Review

Evaluate contract evolution as a system-wide concern.

```text id="x7q3mr"
Change:
<change>

Affected Contract:
<contract>

Affected Consumers:
<consumers>

Compatibility:
<COMPATIBLE | CONDITIONALLY_COMPATIBLE | BREAKING | UNKNOWN>

Semantic Impact:
<impact>

Migration:
<migration>
```

Compatibility must be evaluated semantically, not only structurally.

---

# 30. Contract Evolution Dependencies

```text id="q4m8vk"
Contract:
<contract>

Depends On:
<contract>

Dependency:
<dependency>

Change Impact:
<impact>

Migration Order:
<order>
```

Contract evolution may require coordinated changes.

---

# 31. External Consumer Review

For public or external contracts:

```text id="v6x3qc"
Contract:
<contract>

External Consumer:
<consumer>

Consumer Control:
<CONTROLLED | PARTIALLY_CONTROLLED | UNKNOWN>

Compatibility Requirement:
<requirement>

Migration Ability:
<ability>

Risk:
<risk>
```

External consumers increase the cost of breaking changes.

---

# 32. Legacy Contract Review

For existing systems:

```text id="n8q5xr"
Contract:
<contract>

Documented:
<behavior>

Observed:
<behavior>

Actual Consumers:
<consumers>

Undocumented Dependency:
<dependency>

Target:
<target>

Conflict:
<conflict>
```

Observed behavior must be considered before declaring a contract safely changeable.

---

# 33. Transitional Contract Review

For system evolution:

```text id="m5x9vc"
Current Contract:
<contract>

Target Contract:
<contract>

Transition Contract:
<contract>

Compatibility:
<compatibility>

Migration Strategy:
<strategy>

Retirement Condition:
<condition>
```

Temporary contracts should have explicit lifecycle ownership.

---

# 34. Contract Boundary Conflicts

Record contradictions such as:

* API says data is immediately consistent while Event Contract implies eventual propagation.
* Security Contract denies an action that API semantics appear to allow.
* Event Contract promises ordering that architecture cannot guarantee.
* Data Contract identifies one authority while another component mutates the same data.
* Observability Contract requires information that Security Contract prohibits exposing.
* Consumer relies on a field that the provider considers implementation detail.

```text id="x3q7mr"
Conflict ID:
<CONTRACT-CONFLICT-ID>

Contracts:
<contracts>

Conflict:
<description>

Severity:
<INFO | WARNING | SIGNIFICANT | BLOCKING>

Impact:
<impact>

Resolution:
<resolution>

Decision:
<ADR-ID>
```

---

# 35. Contract Risks

| ID                | Risk     | Contracts     | Impact     | Severity     | Mitigation     |
| ----------------- | -------- | ------------- | ---------- | ------------ | -------------- |
| RISK-CONTRACT-001 | `<risk>` | `<contracts>` | `<impact>` | `<severity>` | `<mitigation>` |

Typical risks:

* Hidden consumer dependency.
* Ambiguous ownership.
* Semantic inconsistency.
* Unsupported guarantees.
* Security contradiction.
* Data authority conflict.
* Uncontrolled evolution.
* Excessive coupling.
* Contract proliferation.
* Legacy behavior incorrectly treated as target behavior.

---

# 36. Contract Unknowns

| ID               | Unknown     | Contracts     | Why It Matters | Impact     | Resolution |
| ---------------- | ----------- | ------------- | -------------- | ---------- | ---------- |
| UNK-CONTRACT-001 | `<unknown>` | `<contracts>` | `<reason>`     | `<impact>` | `<method>` |

Prioritize unknowns that affect:

* Ownership.
* Security.
* External consumers.
* Data authority.
* Consistency.
* Evolution.
* Critical business behavior.
* Difficult-to-reverse decisions.

---

# 37. Contract Decisions

Identify decisions that require explicit architecture governance.

```text id="q9m5xc"
Decision Candidate:
<decision>

Reason:
<reason>

Options:
<options>

Impact:
<impact>

Reversibility:
<reversibility>

Affected Contracts:
<contracts>

ADR Required:
<YES | NO>

Status:
<status>
```

Examples:

* Whether a domain event becomes an integration event.
* Whether data is shared or replicated.
* Who owns authoritative data.
* Whether an API is synchronous or asynchronous.
* Whether an event requires ordering.
* Whether an external contract requires versioning.
* Whether a security boundary changes.
* Whether observability requirements introduce new runtime dependencies.

---

# 38. Architecture Decision Readiness

Contracts may expose decisions that should become ADRs.

```text id="v5x8mr"
Decision:
<decision>

Contract Evidence:
<evidence>

Architecture Impact:
<impact>

Options Identified:
<YES | NO>

Trade-offs Known:
<YES | NO>

Decision Authority:
<authority>

ADR Readiness:
<READY | INCOMPLETE | BLOCKED>
```

A contract does not silently decide architecture.

---

# 39. Contract Traceability

Canonical relationship:

```text id="n3q7vk"
Requirement
      ↓
Domain Concept / Rule
      ↓
Architecture Boundary
      ↓
Contract
      ↓
Architecture Decision
      ↓
Specification
      ↓
Implementation
      ↓
Verification
```

Traceability should remain bidirectional where practical.

---

# 40. Traceability Health

```text id="m8x4qc"
Dimension:
<dimension>

Status:
<HEALTHY | PARTIAL | DEGRADED | BROKEN>

Evidence:
<evidence>

Impact:
<impact>
```

Evaluate:

* Requirement → Contract.
* Domain → Contract.
* Architecture → Contract.
* Contract → Consumer.
* Contract → Decision.
* Contract → Specification.
* Contract → Verification.

---

# 41. Contract Orphans

Identify:

* Contracts without clear consumers.
* Contracts without owners.
* Contracts without architectural boundaries.
* Contracts without domain meaning.
* Contracts without evidence.
* Contracts without verification.
* Contracts that no requirement or architecture element justifies.

```text id="x6q3mr"
Orphan:
<artifact>

Type:
<type>

Problem:
<problem>

Severity:
<severity>

Resolution:
<resolution>
```

---

# 42. Contract Duplication

```text id="q4m9vk"
Concept:
<concept>

Contract A:
<contract>

Contract B:
<contract>

Duplication:
<description>

Conflict:
<conflict>

Resolution:
<resolution>
```

Duplication is not automatically wrong.

Different contracts may intentionally expose different representations of the same underlying concept.

---

# 43. Contract Coupling

```text id="v7x5mc"
Contract:
<contract>

Consumer:
<consumer>

Coupling:
<LOW | MEDIUM | HIGH | UNKNOWN>

Type:
<SEMANTIC | STRUCTURAL | TEMPORAL | SECURITY | OPERATIONAL | DATA>

Reason:
<reason>

Mitigation:
<mitigation>
```

Asynchronous communication does not automatically imply low coupling.

---

# 44. Contract Stability

```text id="n5q8xr"
Contract:
<contract>

Stability:
<STABLE | EVOLVING | TRANSITIONAL | LEGACY | UNKNOWN>

Reason:
<reason>

Expected Change:
<change>

Consumer Impact:
<impact>
```

Contract stability should reflect actual business and architectural volatility.

---

# 45. Contract Criticality

```text id="m3x9vc"
Contract:
<contract>

Criticality:
<CRITICAL | HIGH | MEDIUM | LOW>

Reason:
<reason>

Failure Impact:
<impact>

Recovery:
<recovery>
```

Criticality should influence governance and verification depth.

---

# 46. Contract Fitness

Evaluate whether contracts are fit for their intended architectural purpose.

```text id="x8q4mr"
Contract:
<contract>

Purpose:
<purpose>

Fitness:
<FIT | PARTIALLY_FIT | NOT_FIT | UNKNOWN>

Reason:
<reason>

Required Improvement:
<improvement>
```

---

# 47. Contract Readiness

```text id="q6m3vk"
Contract:
<contract>

Semantic Readiness:
<READY | PARTIAL | NOT_READY>

Consumer Readiness:
<READY | PARTIAL | NOT_READY>

Security Readiness:
<READY | PARTIAL | NOT_READY>

Evolution Readiness:
<READY | PARTIAL | NOT_READY>

Verification Readiness:
<READY | PARTIAL | NOT_READY>

Overall:
<READY | READY_WITH_RISKS | INCOMPLETE | BLOCKED>
```

---

# 48. Review Findings

| ID                | Finding     | Type     | Severity     | Contract     | Evidence     | Status     |
| ----------------- | ----------- | -------- | ------------ | ------------ | ------------ | ---------- |
| FIND-CONTRACT-001 | `<finding>` | `<type>` | `<severity>` | `<contract>` | `<evidence>` | `<status>` |

Possible finding types:

* `SEMANTIC`
* `OWNERSHIP`
* `SECURITY`
* `DATA`
* `EVOLUTION`
* `COMPATIBILITY`
* `OBSERVABILITY`
* `CONSUMER`
* `ARCHITECTURE`
* `TRACEABILITY`
* `VERIFICATION`

---

# 49. Finding Resolution

```text id="v9x4mr"
Finding:
<FIND-CONTRACT-ID>

Resolution:
<resolution>

Owner:
<owner>

Evidence:
<evidence>

Status:
<OPEN | RESOLVED | ACCEPTED_RISK | DEFERRED>

Related Decision:
<ADR-ID>
```

No blocking finding should be silently ignored.

---

# 50. Gate Blocking Conditions

The Contracts phase should be considered blocked when, for example:

* A critical contract has unresolved semantic ambiguity.
* Ownership of authoritative data is unknown where architecture depends on it.
* Security expectations conflict with contract behavior.
* Critical consumers are unknown.
* A required external contract is undefined.
* Contract behavior contradicts approved architecture.
* A contract makes unsupported guarantees.
* A breaking change lacks a viable migration strategy.
* A critical data boundary is undefined.
* Contract semantics depend on unresolved domain concepts.

These are examples, not an exhaustive list.

---

# 51. Non-Blocking Risks

Examples:

* Minor documentation gaps.
* Non-critical optional fields still under review.
* Low-risk observability improvements.
* Future optimization opportunities.
* Known technical details intentionally deferred to Specifications.
* Low-impact legacy inconsistencies with an accepted migration plan.

Every accepted non-blocking risk should remain traceable.

---

# 52. Waivers

If a blocking condition is intentionally waived:

```text id="n7q3xc"
Waiver ID:
<WAIVER-ID>

Gate:
<gate>

Condition:
<condition>

Reason:
<reason>

Risk:
<risk>

Mitigation:
<mitigation>

Authority:
<authority>

Date:
<date>

Review / Expiration:
<date or condition>
```

Waivers must never be implicit.

---

# 53. Handoff to Architecture Decisions

The Contracts phase should produce an explicit handoff.

```text id="m4x8vr"
Architecture Decisions May Assume:
<assumptions>

Architecture Decisions Must Preserve:
<constraints>

Architecture Decisions Must Not Assume:
<unknowns>

Decision Candidates:
<decisions>

Contract Risks:
<risks>

Contract Constraints:
<constraints>

Required ADRs:
<ADR IDs / candidates>
```

---

# 54. Handoff Contract

The next phase must receive:

```text id="x5q9mk"
Contract Baseline:
<baseline>

Stable Contract Semantics:
<semantics>

Open Contract Decisions:
<decisions>

Known Trade-offs:
<trade-offs>

Known Risks:
<risks>

Known Unknowns:
<unknowns>

Required Architecture Decisions:
<decisions>

Required Feedback:
<feedback>
```

---

# 55. Feedback to Previous Phases

Contract review may reveal issues requiring earlier-phase revision.

```text id="q8m4vc"
Finding:
<finding>

Affected Phase:
<PRODUCT | DOMAIN | ARCHITECTURE>

Reason:
<reason>

Required Revisit:
<artifact>

Impact:
<impact>

Action:
<action>
```

Examples:

* API semantics reveal an unresolved use case.
* Event semantics reveal an unclear domain event.
* Data ownership reveals an incorrect bounded context.
* Security requirements reveal unresolved business authority.
* Observability requirements reveal an architectural runtime boundary.

---

# 56. Review Outcome

```text id="v6x3mr"
Outcome:
<READY | READY_WITH_RISKS | INCOMPLETE | BLOCKED>

Summary:
<summary>

Critical Findings:
<findings>

Non-Blocking Risks:
<risks>

Open Decisions:
<decisions>

Open Unknowns:
<unknowns>

Required Actions:
<actions>
```

---

# 57. Gate Recommendation

```text id="n9q5xc"
Gate:
Contracts Gate

Recommendation:
<PASS | PASS_WITH_RISKS | BLOCK | WAIVE>

Reason:
<reason>

Evidence:
<evidence>

Conditions:
<conditions>

Authority:
<authority>
```

The gate result must be based on contract readiness, not document count.

---

# 58. Contract Review Checklist

### Phase Readiness

* [ ] Relevant contract types have been identified.
* [ ] Required contracts exist.
* [ ] Not-required contracts have justified rationale.
* [ ] Contracts have clear owners.
* [ ] Contracts have clear boundaries.
* [ ] Contract semantics are sufficiently understood.

### Cross-Contract Coherence

* [ ] API semantics are consistent with Data semantics.
* [ ] Event semantics are consistent with Domain semantics.
* [ ] Security semantics apply consistently.
* [ ] Observability supports important behavior.
* [ ] Data ownership is coherent.
* [ ] Failure behavior is consistent.
* [ ] Evolution strategies do not conflict.

### Architecture

* [ ] Contracts align with architecture.
* [ ] Contracts do not silently create architecture.
* [ ] Cross-boundary coupling is understood.
* [ ] Consistency implications are understood.
* [ ] Security boundaries are understood.

### Governance

* [ ] Significant decisions are identified.
* [ ] ADR candidates are identified.
* [ ] Conflicts are recorded.
* [ ] Waivers are explicit.
* [ ] Risks are traceable.

### Verification

* [ ] Critical contracts have validation scenarios.
* [ ] Contract verification is defined.
* [ ] Traceability is established.
* [ ] Consumer expectations can be verified.

### Handoff

* [ ] Architecture Decision phase can consume the contract baseline.
* [ ] Open decisions are explicit.
* [ ] Open unknowns are explicit.
* [ ] Risks are explicit.
* [ ] Feedback paths are defined.

---

# 59. Compact Contract Baseline

```text id="m7x4vr"
System:
<system>

Contract Types:
<types>

Critical Contracts:
<contracts>

Providers:
<providers>

Consumers:
<consumers>

Key Boundaries:
<boundaries>

Security Boundaries:
<boundaries>

Data Authorities:
<authorities>

Important Events:
<events>

Important APIs:
<apis>

Observability Requirements:
<requirements>

Open Decisions:
<decisions>

Open Risks:
<risks>

Open Unknowns:
<unknowns>

Overall Status:
<status>
```

---

# 60. Agent Instructions

When performing Contract Review:

1. Review contracts as a connected system.
2. Do not evaluate contracts only in isolation.
3. Verify alignment with Product, Domain, and Architecture.
4. Verify semantic ownership.
5. Verify provider and consumer responsibilities.
6. Compare shared concepts across contracts.
7. Detect semantic contradictions.
8. Detect ownership conflicts.
9. Detect unsupported guarantees.
10. Evaluate security consistency.
11. Evaluate data authority.
12. Evaluate consistency and transaction implications.
13. Evaluate event delivery and ordering assumptions.
14. Evaluate observability requirements.
15. Evaluate contract evolution and compatibility.
16. Consider undocumented consumers in existing systems.
17. Distinguish current behavior from target behavior.
18. Identify decisions that require ADR governance.
19. Record risks and unknowns explicitly.
20. Do not mark the phase ready because documents exist.
21. Do not silently resolve contradictions.
22. Do not turn recommendations into decisions.
23. Do not introduce implementation details merely to close a semantic gap.
24. Revisit Architecture when contracts reveal architectural consequences.
25. Revisit Domain Discovery when contracts reveal unresolved domain semantics.
26. Revisit Product Discovery when contract behavior contradicts product intent.
27. Produce an explicit handoff to Architecture Decisions.
28. Preserve all traceability relationships.

---

# 61. Anti-Patterns

## Document Count as Readiness

Assuming the phase is complete because every template has been filled.

## Contract Isolation

Reviewing each contract independently without checking cross-contract consistency.

## API-Centric Architecture

Treating the API as the authoritative model for all other contracts.

## Schema-Centric Architecture

Treating a data schema as the canonical meaning of the system.

## Security Afterthought

Adding Security Contract review only after other contracts are complete.

## Observability Afterthought

Defining telemetry after implementation without considering architectural questions.

## Hidden Decisions

Allowing contract assumptions to become architecture decisions without governance.

## Unsupported Guarantees

Promising ordering, delivery, consistency, availability, latency, or security properties without evidence.

## Contract Duplication

Creating multiple contradictory definitions of the same semantic concept.

## Legacy Contract Worship

Treating undocumented historical behavior as the desired future contract.

## False Compatibility

Assuming structural compatibility means semantic compatibility.

## Consumer Blindness

Defining contracts without understanding who depends on them.

## Architecture Leakage

Using contract documents to prematurely prescribe deployment, infrastructure, frameworks, or technologies.

## Specification Prematurity

Trying to solve implementation details before contract semantics are stable.

## Traceability Theater

Adding links that do not represent meaningful relationships.

## Gate by Checklist

Passing the phase because every checkbox is marked without evaluating actual readiness.

---

# 62. Safe Progression Question

Before progressing to Architecture Decisions:

> **Are the relevant contracts sufficiently understood, mutually coherent, aligned with product, domain, and architecture, explicit about ownership, security, data, failure, evolution, observability, and consumer expectations, and stable enough that remaining consequential choices can be governed through explicit architecture decisions rather than hidden contract assumptions?**

If **yes**, proceed to Architecture Decisions / ADR.

If **no**, identify whether the missing information requires returning to:

```text id="8q3m7x"
Product Discovery
       ↕
Domain Discovery
       ↕
Architecture
       ↕
Contracts
       ↓
Architecture Decisions
```

The lifecycle is iterative.

---

# 63. Final Principle

> **Contract Review transforms a collection of individual contracts into a coherent contractual baseline for architecture governance.**

A successful review establishes:

```text id="5v9m3q"
Semantic Coherence
Ownership
Consumer Understanding
Security Consistency
Data Authority
Failure Semantics
Evolution Strategy
Observability
Traceability
Decision Readiness
```

The objective is not to eliminate every unknown.

The objective is to ensure that remaining uncertainty is explicit, understood, appropriately governed, and does not cause the next phase to rely on hidden architectural assumptions.
