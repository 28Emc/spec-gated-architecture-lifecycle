# Dependencies

## 1. Document Metadata

| Field             | Description                                                                                     |
| ----------------- | ----------------------------------------------------------------------------------------------- |
| Document ID       | Unique identifier for the dependency artifact                                                   |
| Version           | Current document version                                                                        |
| Status            | `DRAFT`, `UNDER_REVIEW`, `ACCEPTED`, `SUPERSEDED`                                               |
| Created           | Creation date                                                                                   |
| Updated           | Last update date                                                                                |
| Scope             | Product, capability, release, increment, or change scope                                        |
| Owner             | Responsible role or person                                                                      |
| Reviewers         | Relevant reviewers or decision authorities                                                      |
| Related Artifacts | Outcomes, requirements, actors, use cases, constraints, risks, unknowns, architecture artifacts |
| Lifecycle Phase | Product Discovery |
---

# 2. Purpose

This document identifies and manages relationships in which one product, domain, technical, organizational, or external element depends on another element to achieve an intended outcome or safely progress through the lifecycle.

The purpose is to make meaningful dependencies explicit before they become hidden blockers, sequencing problems, architectural constraints, or operational risks.

The dependency model should answer:

> What depends on what, why does the dependency exist, what happens if the dependency changes or becomes unavailable, and how does it affect progression?

---

# 3. Core Principle

A dependency exists when the behavior, availability, validity, sequencing, or completion of one element materially relies on another element.

Dependencies may exist between:

* outcomes;
* requirements;
* use cases;
* business rules;
* actors;
* capabilities;
* constraints;
* assumptions;
* unknowns;
* decisions;
* systems;
* external services;
* data sources;
* organizational responsibilities;
* infrastructure;
* releases;
* migrations;
* verification activities.

Dependencies are relationships, not automatically problems.

A dependency becomes a concern when it introduces:

* blocking behavior;
* sequencing constraints;
* uncertainty;
* coupling;
* availability risk;
* ownership ambiguity;
* contract risk;
* security implications;
* migration complexity;
* operational risk;
* architectural consequences.

---

# 4. Dependency Model

The canonical conceptual relationship is:

```text id="m7s4kd"
Dependent
    ↓
Dependency
    ↓
Dependency Target
```

For example:

```text id="3p9yqa"
Use Case A
    ↓ depends on
External Identity Provider
```

or:

```text id="8zq4tx"
Requirement B
    ↓ depends on
Business Rule C
```

or:

```text id="q0r8fm"
Release A
    ↓ depends on
Migration B
```

The dependent element cannot be safely considered independently when the dependency materially affects its behavior, completion, or validity.

---

# 5. Dependency Types

Dependencies should be classified according to their nature.

Recommended types:

| Type             | Description                                                                     |
| ---------------- | ------------------------------------------------------------------------------- |
| `PRODUCT`        | Dependency between product objectives or capabilities                           |
| `DOMAIN`         | Dependency between domain concepts, capabilities, rules, or behaviors           |
| `ACTOR`          | Dependency involving actor responsibility or participation                      |
| `REQUIREMENT`    | One requirement depends on another                                              |
| `USE_CASE`       | One use case depends on another interaction                                     |
| `BUSINESS_RULE`  | Behavior depends on another business rule                                       |
| `DATA`           | Dependency on data availability, ownership, consistency, or transformation      |
| `INTEGRATION`    | Dependency on another system or external integration                            |
| `CONTRACT`       | Dependency on an API, event, data, or other contract                            |
| `SECURITY`       | Dependency involving authentication, authorization, trust, or security controls |
| `OPERATIONAL`    | Dependency on operational capabilities or processes                             |
| `INFRASTRUCTURE` | Dependency on infrastructure or environment capabilities                        |
| `ORGANIZATIONAL` | Dependency on teams, responsibilities, approvals, or ownership                  |
| `TEMPORAL`       | Dependency caused by sequencing or timing                                       |
| `MIGRATION`      | Dependency introduced by transition from one state to another                   |
| `VERIFICATION`   | Dependency on validation, testing, or evidence                                  |
| `DECISION`       | Dependency on an unresolved or accepted decision                                |

Multiple types may apply to the same dependency.

---

# 6. Dependency Direction

Dependencies should always have an explicit direction.

```text id="f1m3we"
A → B
```

means:

> A depends on B.

The agent must avoid ambiguous statements such as:

> "A and B are related."

Relationship does not necessarily imply dependency.

---

# 7. Dependency Strength

Dependencies may be classified as:

| Strength   | Meaning                                                                                     |
| ---------- | ------------------------------------------------------------------------------------------- |
| `WEAK`     | Dependency exists but alternative paths normally exist                                      |
| `MODERATE` | Dependency materially affects sequencing or behavior                                        |
| `STRONG`   | Dependent element cannot safely proceed without the target                                  |
| `CRITICAL` | Dependency failure threatens a critical outcome, safety, contract, or lifecycle progression |

Strength should describe the consequence of dependency failure, not merely how often the dependency is used.

---

# 8. Dependency Status

Recommended lifecycle states:

```text id="0y2lmb"
IDENTIFIED
ANALYZING
VALIDATED
ACTIVE
BLOCKED
MITIGATED
RESOLVED
RETIRED
SUPERSEDED
REJECTED
```

An identified dependency should not automatically be treated as validated.

---

# 9. Dependency Lifecycle

The dependency lifecycle is:

```text id="x9s5az"
IDENTIFIED
    ↓
ANALYZING
    ↓
VALIDATED
    ↓
ACTIVE
    ↓
MITIGATED / RESOLVED / RETIRED
```

Dependencies may move back to analysis when new evidence changes their nature.

---

# 10. Dependency Record

Each significant dependency should contain:

| Field               | Description                                  |
| ------------------- | -------------------------------------------- |
| ID                  | Unique identifier                            |
| Type                | Dependency category                          |
| Dependent           | Element that relies on another               |
| Dependency Target   | Element being depended upon                  |
| Direction           | Explicit dependency direction                |
| Description         | Nature of the dependency                     |
| Reason              | Why the dependency exists                    |
| Strength            | Weak, moderate, strong, critical             |
| Status              | Current lifecycle status                     |
| Blocking Effect     | Whether progression is blocked               |
| Preconditions       | Conditions required for dependency           |
| Failure Consequence | What happens if dependency fails             |
| Availability        | Relevant availability expectation when known |
| Ownership           | Responsible party for target                 |
| Evidence            | Supporting evidence                          |
| Assumptions         | Relevant assumptions                         |
| Unknowns            | Relevant unresolved questions                |
| Mitigation          | Available mitigation                         |
| Alternative         | Alternative path when applicable             |
| Timing              | Temporal constraints                         |
| Scope               | Applicable scope                             |
| Related Decisions   | Relevant decisions                           |
| Related Risks       | Related risks                                |
| Traceability        | Related artifacts                            |
| Review Date         | Next review point                            |

---

# 11. Product Dependencies

Product outcomes and capabilities may depend on one another.

Example:

```text id="o7v5up"
Outcome A
    ↓
Capability B
    ↓
Capability C
```

The agent should determine whether the dependency is:

* logical;
* temporal;
* organizational;
* technical;
* domain-driven;
* externally imposed.

A product dependency should not be interpreted as an architectural dependency unless architecture analysis confirms it.

---

# 12. Requirement Dependencies

Requirements may depend on:

* other requirements;
* business rules;
* actors;
* external systems;
* data;
* constraints;
* decisions.

Example:

```text id="t8z2h6"
REQ-001
  depends on
REQ-004
```

The dependency should explain why.

Avoid generic relationships such as:

> "REQ-001 is related to REQ-004."

Relationship alone is insufficient.

---

# 13. Use Case Dependencies

Use cases may depend on other use cases when meaningful product behavior requires sequencing or completion of another interaction.

Examples:

```text id="w2q0ga"
Use Case A
    ↓
Use Case B
```

or:

```text id="z9x3kp"
Use Case A
    ↓
Authentication Use Case
```

The dependency must represent meaningful product behavior.

The agent should not create artificial dependencies simply because two use cases eventually call the same technical service.

---

# 14. Actor Dependencies

Actor dependencies may involve:

* required participation;
* approval;
* responsibility;
* authorization;
* information provision;
* external action;
* organizational ownership.

Example:

```text id="2l7k4v"
Product Process
    ↓ requires
External Organization
```

Actor dependency must not automatically imply technical integration.

A human or organization may be an operational dependency without being represented as a software component.

---

# 15. Business Rule Dependencies

Business rules may depend on:

* other rules;
* domain states;
* policies;
* external conditions;
* temporal conditions;
* authoritative data.

Example:

```text id="p5n8cs"
Eligibility Rule
    ↓ depends on
Account Status Rule
```

The agent should identify dependency chains when one rule cannot be interpreted correctly without another.

Circular rule dependencies should be investigated because they may indicate:

* inconsistent domain modeling;
* missing concepts;
* ambiguous authority;
* incomplete rules;
* an incorrect dependency direction.

---

# 16. Data Dependencies

Data dependencies exist when an element relies on:

* a data source;
* an authoritative record;
* a specific data state;
* data availability;
* data freshness;
* data ownership;
* a transformation;
* another data lifecycle.

The agent should distinguish:

```text id="6zq8bm"
Data availability
Data ownership
Data authority
Data consistency
Data freshness
Data transformation
```

These are not interchangeable concepts.

---

# 17. Integration Dependencies

External systems frequently introduce dependencies.

For each integration dependency, identify when known:

* external system;
* responsibility;
* required capability;
* contract;
* availability;
* authentication;
* data exchanged;
* timing;
* failure behavior;
* ownership;
* fallback;
* versioning;
* operational contact.

Do not invent technical integration details before architecture and contract discovery establish them.

---

# 18. Contract Dependencies

A contract dependency exists when a component, system, or process depends on an externally defined interface or behavioral agreement.

Examples:

* API contract;
* event contract;
* data exchange contract;
* authentication contract;
* file exchange contract;
* operational contract.

Contract dependencies should be traced to the relevant contract artifact once contracts are formally defined.

---

# 19. Security Dependencies

Security dependencies may include:

* identity provider;
* authentication mechanism;
* authorization authority;
* trust boundary;
* key management;
* security policy;
* audit capability;
* security control;
* external identity;
* organizational approval.

Security dependencies should be treated as potentially blocking when their absence prevents safe progression.

The agent must not infer security responsibilities merely from the existence of a dependency.

---

# 20. Organizational Dependencies

Some dependencies exist outside the software system.

Examples:

```text id="m8z0sn"
Team approval
Legal review
Security review
External provider agreement
Operational ownership
Data-owner approval
```

These dependencies may materially affect delivery even when they have no direct technical representation.

Organizational dependencies should remain explicit rather than being hidden inside technical tasks.

---

# 21. Temporal Dependencies

Temporal dependencies describe required sequencing.

Examples:

```text id="5f2j1q"
Migration A
    must occur before
Feature B
```

or:

```text id="8d4x0k"
Decision A
    must be resolved before
Architecture B
```

Temporal dependencies should include the reason for ordering.

Not every sequence is a dependency.

A sequence becomes meaningful when changing the order could cause:

* failure;
* invalid assumptions;
* rework;
* unsafe behavior;
* inconsistent state;
* contractual violation;
* increased risk.

---

# 22. Migration Dependencies

Migration dependencies are especially important in existing systems and system evolution.

They may involve:

* legacy data;
* compatibility;
* dual operation;
* synchronization;
* rollout;
* rollback;
* consumer migration;
* schema transition;
* external integrations.

The agent should distinguish:

```text id="r5d8qc"
Current State
Target State
Transition State
```

A target-state dependency may not exist in the current system but may be required during transition.

---

# 23. Decision Dependencies

Some dependencies exist because a decision must be resolved before another artifact can safely progress.

Example:

```text id="w0x9ka"
Data Ownership Decision
        ↓
Data Architecture
        ↓
API Contract
```

Decision dependencies should be prioritized according to their downstream consequences.

An unresolved decision may become a lifecycle gate blocker.

---

# 24. Verification Dependencies

Some work cannot be considered complete until evidence exists.

Examples:

```text id="a7k3pw"
Requirement
    ↓ requires verification from
Acceptance Test
```

or:

```text id="y2n8hf"
Security Decision
    ↓ requires
Security Validation
```

Verification dependencies should be identified early enough to avoid discovering validation requirements after implementation.

---

# 25. Blocking Dependencies

A dependency should be explicitly marked as blocking when its unresolved state prevents safe progression.

Recommended classification:

```text id="m4x7cz"
NONE
LOCAL
PHASE
RELEASE
SYSTEM
EXTERNAL
```

Examples:

* `LOCAL` — blocks one artifact or work item.
* `PHASE` — prevents lifecycle progression.
* `RELEASE` — prevents release readiness.
* `SYSTEM` — threatens system-level progress.
* `EXTERNAL` — depends on an external party or system outside project control.

Blocking status should be evidence-based.

---

# 26. Dependency Failure Analysis

For important dependencies, analyze:

1. What happens if the target is unavailable?
2. What happens if its behavior changes?
3. What happens if its data becomes invalid?
4. What happens if ownership changes?
5. What happens if timing changes?
6. What happens if the dependency is removed?
7. Is there an alternative?
8. Can the dependent continue safely?
9. Does failure affect security?
10. Does failure affect contractual behavior?

The answers should influence risk and architecture analysis.

---

# 27. Dependency Alternatives

When a dependency creates significant risk, identify possible alternatives when known.

Examples:

```text id="e8p2vn"
Primary external provider
        ↓
Alternative provider

Primary data source
        ↓
Fallback data source

Direct dependency
        ↓
Asynchronous integration
```

Alternatives should not be invented merely to make the dependency model appear complete.

If no alternative is known, record:

```text
Alternative: UNKNOWN
```

---

# 28. Dependency Mitigation

Possible mitigation strategies include:

* remove dependency;
* reduce dependency strength;
* introduce fallback behavior;
* introduce buffering;
* defer coupling;
* establish a stable contract;
* isolate ownership;
* provide compatibility;
* change sequencing;
* validate earlier;
* introduce monitoring;
* establish operational ownership;
* document failure behavior.

Mitigation must be proportional to the consequence of dependency failure.

---

# 29. Dependency Risk

Dependencies should be evaluated for risk when they involve:

* external systems;
* critical business capabilities;
* sensitive data;
* unavailable ownership;
* unstable contracts;
* high availability expectations;
* difficult migrations;
* irreversible architectural choices;
* regulatory requirements;
* single points of failure.

A dependency is not automatically a risk.

Risk should be derived from the consequence and uncertainty associated with the dependency.

---

# 30. Dependency Chains

Dependencies may form chains:

```text id="2f8c1m"
A
↓
B
↓
C
↓
D
```

The agent should identify long or critical chains because a failure at one point may affect several downstream elements.

Important questions:

* Where does the chain begin?
* Which element is authoritative?
* Which dependency is most fragile?
* Which dependency blocks the most downstream work?
* Is there unnecessary coupling?
* Is there a circular dependency?

---

# 31. Dependency Graphs

The dependency model may be represented as a directed graph:

```text id="f6k1qa"
A ──depends on──> B
B ──depends on──> C
A ──depends on──> D
```

The graph can help identify:

* dependency hubs;
* critical paths;
* bottlenecks;
* circular dependencies;
* orphaned dependencies;
* highly coupled areas;
* external dependency concentration.

The graph is an analysis aid, not a substitute for understanding the relationships.

---

# 32. Circular Dependencies

Circular dependencies require explicit analysis.

Example:

```text id="q8m4rx"
A → B
B → C
C → A
```

A circular relationship may be valid in some domains, but it may also indicate:

* incorrect direction;
* missing intermediary concept;
* inappropriate coupling;
* unclear ownership;
* inconsistent domain boundaries;
* incomplete lifecycle modeling.

The agent must not automatically eliminate a circular dependency merely because it appears undesirable.

It should first determine whether the cycle reflects real domain behavior or a modeling problem.

---

# 33. Dependency Ownership

Each significant dependency should identify ownership where meaningful.

Ownership may belong to:

* product team;
* domain owner;
* another internal team;
* external organization;
* external provider;
* shared platform;
* regulatory authority.

Ownership must not be invented.

When ownership is unknown:

```text
Owner: UNKNOWN
```

and the unknown may itself become a decision-relevant item.

---

# 34. Existing Systems

For existing systems, dependencies should be analyzed across:

```text id="n1x4sp"
Documented Dependencies
Actual Dependencies
Target Dependencies
```

The agent should verify important dependencies against actual behavior.

Historical documentation must not be treated as authoritative when runtime evidence contradicts it.

Unexpected actual dependencies should be explicitly recorded because they may represent hidden coupling or technical debt.

---

# 35. System Evolution

For system evolution, dependency analysis should focus on the change boundary.

Determine:

* what currently depends on the changed element;
* what the changed element depends on;
* what new dependencies are introduced;
* what existing dependencies are removed;
* what contracts are affected;
* what migration dependencies arise;
* what downstream consumers may be impacted.

The objective is to understand the dependency delta, not recreate the entire system dependency graph unnecessarily.

---

# 36. Dependency Change Impact

When a dependency changes, evaluate:

```text id="k2v8mx"
Dependent Elements
Contracts
Data
Security
Operational Behavior
Architecture
Migration
Verification
Release Readiness
```

Change impact should follow traceability relationships.

A seemingly local dependency change may have system-wide consequences.

---

# 37. Dependency Register

A compact register may use:

| ID      | Type        | Dependent | Target          | Strength | Blocking | Status    | Owner | Risk | Scope        |
| ------- | ----------- | --------- | --------------- | -------- | -------- | --------- | ----- | ---- | ------------ |
| DEP-001 | INTEGRATION | —         | External System | STRONG   | RELEASE  | ACTIVE    | —     | HIGH | Release A    |
| DEP-002 | DOMAIN      | —         | —               | MODERATE | NONE     | VALIDATED | —     | LOW  | Product      |
| DEP-003 | DECISION    | —         | ADR/Decision    | CRITICAL | PHASE    | BLOCKED   | —     | HIGH | Architecture |

The register summarizes the dependency model.

Important dependencies should retain their full rationale and evidence.

---

# 38. Dependency Validation

A dependency should be considered validated when there is sufficient evidence that:

* the dependent relationship actually exists;
* the direction is correct;
* the dependency target is correctly identified;
* the reason is understood;
* the consequence of failure is understood sufficiently;
* ownership is known when relevant;
* relevant contracts or rules are identified;
* uncertainty is explicitly recorded.

Validation does not require every implementation detail to be known.

---

# 39. Review Checklist

Before accepting the dependency artifact, verify:

### Identification

* [ ] Significant dependencies are identified.
* [ ] Dependency direction is explicit.
* [ ] Dependency type is classified.
* [ ] Dependency strength is justified.
* [ ] Dependency status is explicit.

### Context

* [ ] Product context is considered.
* [ ] Relevant requirements and use cases are linked.
* [ ] Actors and organizational responsibilities are considered.
* [ ] External systems are identified where applicable.

### Risk

* [ ] Blocking dependencies are identified.
* [ ] Failure consequences are understood.
* [ ] High-risk dependencies are identified.
* [ ] Critical unknowns are visible.
* [ ] Alternatives or mitigations are considered when necessary.

### Architecture Readiness

* [ ] Dependencies that may affect domain boundaries are identified.
* [ ] Dependencies that may affect contracts are identified.
* [ ] Dependencies that may affect data ownership are identified.
* [ ] Security dependencies are identified.
* [ ] Migration dependencies are identified where relevant.

### Existing Systems

* [ ] Documented dependencies are distinguished from actual dependencies.
* [ ] Hidden or unexpected dependencies are recorded.
* [ ] Target-state dependencies are distinguished from current dependencies.

### Traceability

* [ ] Dependencies trace to relevant artifacts.
* [ ] Material dependency changes can be propagated.
* [ ] Ownership is explicit or marked unknown.

---

# 40. Gate Contribution

Dependency analysis contributes to lifecycle gates by demonstrating that:

* important relationships are understood;
* blocking dependencies are visible;
* sequencing constraints are explicit;
* external dependencies are identified;
* ownership is sufficiently understood;
* critical dependency risks are known;
* contracts and boundaries likely to be affected are identified;
* migration dependencies are understood where applicable.

The artifact is not complete merely because a dependency list exists.

The relevant question is whether the project understands the dependencies sufficiently to proceed without introducing unsupported assumptions.

---

# 41. Agent Instructions

When applying this artifact, the agent must:

1. Identify the dependent and dependency target.
2. State dependency direction explicitly.
3. Classify the dependency.
4. Determine its strength.
5. Identify why the dependency exists.
6. Identify blocking effects.
7. Identify relevant ownership.
8. Identify failure consequences.
9. Identify related risks and unknowns.
10. Identify contracts or boundaries affected.
11. Identify temporal sequencing when relevant.
12. Identify alternatives or mitigations when necessary.
13. Distinguish current, transitional, and target-state dependencies.
14. Verify important dependencies against evidence in existing systems.
15. Avoid inventing external behavior or ownership.
16. Detect possible circular dependencies.
17. Analyze dependency changes through traceability.
18. Escalate consequential dependency decisions.
19. Scale dependency analysis according to project scope and risk.
20. Record unknowns rather than fabricating dependency details.

The agent should prefer:

```text id="0m3r8x"
Evidence
   ↓
Dependency
   ↓
Consequence
   ↓
Risk / Mitigation
```

over:

```text id="w6n1qp"
Assumption
   ↓
Dependency
   ↓
Architecture
```

---

# 42. Anti-Patterns

## 42.1 Relationship Equals Dependency

> "These elements are related, therefore one depends on the other."

Association does not automatically imply dependency.

---

## 42.2 Technical Dependency Inflation

Creating technical dependencies before understanding product or domain relationships introduces premature architecture.

---

## 42.3 Hidden External Dependencies

Treating external providers or systems as implementation details hides operational and contractual risk.

---

## 42.4 Legacy Dependency Assumption

Assuming that documented legacy dependencies accurately represent actual runtime behavior can produce incorrect change analysis.

---

## 42.5 Dependency Without Direction

A statement such as:

> "A and B are dependent."

is incomplete.

The dependency direction must be explicit.

---

## 42.6 Dependency Without Consequence

Recording:

> "A depends on B."

without explaining why or what happens if B fails provides little decision value.

---

## 42.7 Invented Fallbacks

The agent must not invent alternative providers, fallback mechanisms, or ownership simply to complete the dependency model.

---

## 42.8 Ignoring Organizational Dependencies

Not every dependency is technical.

Approvals, ownership, legal constraints, security review, and external coordination can materially affect progression.

---

## 42.9 Circular Dependency Suppression

Removing a cycle merely because it looks architecturally undesirable can hide legitimate domain behavior.

---

## 42.10 Dependency Documentation Theater

A large dependency graph is not inherently better.

Only meaningful dependencies should be documented at the appropriate level of detail.

---

# 43. Safe Progression Question

Before progressing beyond dependency analysis, the agent should be able to answer:

> **Do I understand the dependencies that materially affect product behavior, sequencing, domain understanding, contracts, risk, and safe progression, including their direction, consequences, ownership, and unresolved uncertainty?**

If the answer is no, the agent should identify the missing evidence or ask targeted questions rather than inventing dependency relationships.

---

# 44. Final Principle

> **Dependencies make relationships of reliance explicit so that sequencing, risk, ownership, boundaries, and change impact can be understood before they become hidden constraints or failures.**

A strong dependency model does not attempt to eliminate every dependency.

It makes consequential dependencies visible, understandable, traceable, and manageable.

