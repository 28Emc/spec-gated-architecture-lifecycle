# Constraints

## 1. Document Metadata

* **Document Type:** Product Discovery — Constraints
* **Lifecycle Phase:** Product Discovery
* **Status:** `DRAFT`
* **Version:** `1.0`
* **Owner:** `<owner>`
* **Created:** `<date>`
* **Updated:** `<date>`
* **Related Product Context:** `<document>`
* **Related Requirements:** `<references>`
* **Related Decisions:** `<references>`
* **Related Architecture:** `<references>`

---

## 2. Purpose

This document defines and manages the constraints that limit the solution space of a system.

Constraints represent conditions that the solution must respect or strongly consider. They may originate from business, regulatory, organizational, technical, security, data, infrastructure, integration, legacy, cost, time, or environmental factors.

The purpose of this document is to make constraints explicit before they influence domain, architecture, technology, infrastructure, or implementation decisions.

A constraint must be treated as an input to reasoning, not as an implicit justification for a predetermined solution.

---

## 3. Core Principle

A constraint limits the set of acceptable solutions.

A requirement expresses what the system needs to achieve.

An architecture decision selects how the system will achieve it.

A preference expresses what is desirable but not necessarily mandatory.

These concepts must remain separate.

```text
Requirement
    ↓
Defines desired outcome

Constraint
    ↓
Limits acceptable solution space

Options
    ↓
Possible solutions that satisfy requirements and constraints

Architecture Decision
    ↓
Selected option
```

An agent MUST NOT transform a preference, assumption, historical implementation detail, or personal recommendation into a mandatory constraint without sufficient evidence.

---

## 4. Constraint Model

A constraint should be represented as an explicit statement with identifiable origin, scope, strength, and evidence.

Minimum model:

```text
Constraint
├── Identity
├── Statement
├── Category
├── Source
├── Scope
├── Strength
├── Status
├── Rationale
├── Evidence
├── Affected Areas
├── Dependencies
├── Review / Expiration
└── Traceability
```

A constraint should answer:

* What is constrained?
* Why is it constrained?
* Who or what imposes the constraint?
* Is it mandatory or preferred?
* What part of the system does it affect?
* Is it current, transitional, or target-state?
* What evidence supports it?
* Can it expire or change?
* What decisions may be influenced by it?

---

## 5. Constraint Categories

Constraints MAY belong to one or more of the following categories.

### 5.1 Business

Constraints imposed by business policies, operating models, commercial agreements, or business strategy.

Examples:

* A business process must preserve an existing approval sequence.
* A service must support an existing commercial agreement.
* A product must operate within an established business model.

---

### 5.2 Regulatory / Compliance

Constraints imposed by laws, regulations, contractual obligations, standards, or compliance requirements.

Examples:

* Certain information must be retained for a defined period.
* Access to specific information must be restricted.
* A process must satisfy an applicable regulatory requirement.

The agent MUST NOT infer legal obligations without evidence.

---

### 5.3 Organizational

Constraints resulting from organizational structure, governance, ownership, policies, or operational responsibilities.

Examples:

* A component must remain under the ownership of a specific team.
* Production changes require an established approval process.
* Certain operational responsibilities cannot be transferred.

---

### 5.4 Technical

Constraints resulting from an established technical environment or unavoidable technical dependency.

Examples:

* An existing external system exposes only a specific protocol.
* A required runtime environment imposes compatibility limitations.
* An existing platform cannot support a required capability.

Technical constraints must be distinguished from technology preferences.

---

### 5.5 Architectural

Constraints imposed by established architectural principles, boundaries, or approved architectural decisions.

Examples:

* A bounded context must not directly access another bounded context's internal persistence model.
* A public contract cannot be changed without a compatibility strategy.
* A system boundary must remain independently deployable.

An architectural constraint should normally be traceable to an accepted architectural principle or decision.

---

### 5.6 Infrastructure

Constraints imposed by the available or mandated infrastructure environment.

Examples:

* The system must operate within an existing hosting environment.
* Deployment must comply with an established network boundary.
* Certain infrastructure resources are unavailable.

Infrastructure constraints must not be invented from assumptions about the deployment environment.

---

### 5.7 Security

Constraints imposed by security policies, threat models, access boundaries, or mandatory security controls.

Examples:

* Sensitive operations require authenticated access.
* Certain information cannot cross a defined security boundary.
* Administrative operations require stronger authorization controls.

Security constraints should be traceable to security requirements, policies, threat analysis, or explicit decisions where applicable.

---

### 5.8 Data

Constraints concerning data ownership, structure, lifecycle, residency, integrity, availability, or compatibility.

Examples:

* Existing data must remain accessible during migration.
* A data owner must remain authoritative for a specific information set.
* Historical records cannot be modified after a defined business event.

---

### 5.9 Integration

Constraints imposed by external systems, third-party services, internal platforms, protocols, contracts, or integration dependencies.

Examples:

* An external system accepts only a defined interface.
* An integration cannot guarantee synchronous availability.
* A third-party contract cannot be modified by the project.

---

### 5.10 Compatibility

Constraints required to preserve compatibility with existing clients, systems, environments, or supported versions.

Examples:

* Existing consumers must continue operating during migration.
* A public interface must preserve backward compatibility for an agreed period.
* A system must support an existing data format.

---

### 5.11 Budget / Cost

Constraints imposed by available financial or resource limits.

Examples:

* Infrastructure expenditure must remain within an approved budget.
* A third-party service cannot exceed an agreed operational cost.

Cost constraints should not be confused with general cost optimization preferences.

---

### 5.12 Time / Delivery

Constraints imposed by deadlines, release windows, contractual dates, or operational events.

Examples:

* A required capability must be available before a specific business event.
* Migration must occur within an approved maintenance window.

A deadline is a constraint; it does not automatically justify reducing required quality or security controls.

---

### 5.13 Platform / Environment

Constraints imposed by supported platforms, environments, operating conditions, or execution contexts.

Examples:

* The system must support an existing client environment.
* A deployment must operate within an approved execution environment.
* A capability must remain available under an established operating condition.

---

### 5.14 Legacy / Existing System

Constraints originating from an existing system that cannot immediately be removed.

Examples:

* An existing interface must remain available during migration.
* Historical data must remain readable.
* A legacy process must continue operating until its replacement is validated.

Legacy behavior is NOT automatically a mandatory constraint.

The agent must establish whether the behavior is:

* intentionally required,
* contractually required,
* operationally required,
* temporarily tolerated,
* accidental,
* obsolete,
* or unknown.

---

## 6. Constraint Strength

Constraints must indicate how strongly they restrict the solution space.

### 6.1 Mandatory

The solution MUST satisfy the constraint.

```text
Strength: MANDATORY
```

Failure to satisfy the constraint normally blocks progression or requires explicit authorization.

---

### 6.2 Preferred

The constraint represents a strong preference but may be violated when justified.

```text
Strength: PREFERRED
```

A preferred constraint should normally be evaluated as a trade-off rather than treated as an absolute limitation.

---

### 6.3 Informational

The information may influence analysis but does not currently restrict the solution space.

```text
Strength: INFORMATIONAL
```

Informational constraints must not silently become mandatory.

---

## 7. Constraint Status

Recommended lifecycle states:

```text
OPEN
PROPOSED
ACCEPTED
ACTIVE
REJECTED
SUPERSEDED
EXPIRED
```

### `OPEN`

The constraint has been identified but has not yet been validated.

### `PROPOSED`

The constraint has been formulated and is awaiting confirmation.

### `ACCEPTED`

The constraint has been explicitly accepted but is not yet applicable to the current solution state.

### `ACTIVE`

The constraint currently applies to the system or change being analyzed.

### `REJECTED`

The proposed constraint was evaluated and determined not to apply.

### `SUPERSEDED`

The constraint was replaced by another constraint or decision.

### `EXPIRED`

The constraint no longer applies because its temporal validity ended.

---

## 8. Explicit vs Inferred Constraints

Constraints must be classified according to their evidence.

### 8.1 Explicit Constraint

A constraint directly stated by an authoritative source.

Examples:

* approved project policy,
* regulatory requirement,
* accepted architecture decision,
* external contract,
* explicit stakeholder decision.

---

### 8.2 Inferred Constraint

A constraint inferred from evidence but not explicitly stated.

Inferred constraints MUST NOT automatically become mandatory.

They should be represented as:

```text
Status: PROPOSED
Evidence: <supporting evidence>
Confidence: <HIGH | MEDIUM | LOW>
Validation Required: YES
```

The agent must seek confirmation when the inferred constraint materially affects architecture, contracts, data, security, or other consequential decisions.

---

## 9. Constraint Record

Each constraint should contain at least:

```text
Constraint ID:
Title:
Statement:
Category:
Source:
Scope:
Strength:
Status:
Rationale:
Evidence:
Confidence:
Affected Areas:
Dependencies:
Review Date:
Expiration:
Related Requirements:
Related Decisions:
Related Architecture:
Related Contracts:
Traceability:
```

### Constraint ID

A stable identifier.

Example:

```text
CON-001
```

### Statement

A precise statement describing the limitation.

Weak:

```text
The system should be secure.
```

Better:

```text
Administrative operations must remain inaccessible to unauthenticated users.
```

The statement should describe the constraint itself rather than restating a broad quality goal.

---

## 10. Constraint Register

Projects should maintain a consolidated register.

| ID      | Title     | Category     | Strength  | Status   | Scope     | Source     |
| ------- | --------- | ------------ | --------- | -------- | --------- | ---------- |
| CON-001 | `<title>` | `<category>` | MANDATORY | ACTIVE   | `<scope>` | `<source>` |
| CON-002 | `<title>` | `<category>` | PREFERRED | PROPOSED | `<scope>` | `<source>` |

The register provides visibility but does not replace detailed constraint records when analysis is required.

---

## 11. Temporal Constraints

Constraints may apply to different system states.

Every relevant constraint should distinguish between:

* `CURRENT`
* `TRANSITIONAL`
* `TARGET`

### Current Constraint

Applies to the current system state.

### Transitional Constraint

Applies only during migration or an intermediate state.

### Target Constraint

Applies to the intended future state.

Example:

```text
Current:
Legacy interface must remain available.

Transition:
Both old and new interfaces must operate concurrently.

Target:
The legacy interface may be retired after migration completion.
```

An agent MUST NOT carry transitional constraints indefinitely into the target architecture.

---

## 12. Constraint Scope

A constraint may apply at different levels:

```text
PRODUCT
DOMAIN
BOUNDED_CONTEXT
SYSTEM
SERVICE
COMPONENT
API
EVENT
DATA
INFRASTRUCTURE
DEPLOYMENT
OPERATION
```

The smallest valid scope should be preferred.

A local constraint should not unnecessarily become a system-wide constraint.

---

## 13. Constraint Impact Analysis

Before accepting a significant constraint, analyze its consequences.

At minimum consider:

* Product impact
* Domain impact
* Architecture impact
* Contract impact
* Data impact
* Security impact
* Infrastructure impact
* Operational impact
* Testing impact
* Cost impact
* Maintainability impact
* Future evolution impact

A constraint that materially reduces the solution space should be explicitly analyzed before becoming active.

---

## 14. Constraint and Architecture

Constraints influence architecture but do not automatically determine architecture.

The reasoning flow should be:

```text
Constraints
     +
Requirements
     +
Quality Attributes
     +
Domain Understanding
     +
Known Context
     ↓
Candidate Options
     ↓
Trade-off Analysis
     ↓
Architecture Decision
```

The agent MUST NOT use a constraint as a shortcut for selecting a technology when multiple valid solutions remain.

Example:

```text
Constraint:
The system must operate within an existing managed infrastructure environment.

Incorrect:
Therefore, technology X must be used.

Correct:
The infrastructure constraint reduces the available deployment options.
Candidate solutions are evaluated against that constraint.
```

---

## 15. Constraint vs Requirement

A requirement defines an outcome or capability.

A constraint limits how that outcome may be achieved.

Example:

```text
Requirement:
Users must be able to retrieve their historical information.

Constraint:
Existing historical records must remain readable during migration.
```

The requirement describes what is needed.

The constraint describes a limitation that the solution must respect.

A single statement may contain both and should be decomposed when necessary.

---

## 16. Constraint vs Architecture Decision

A constraint restricts the solution space.

An architecture decision selects an option within that space.

Example:

```text
Constraint:
Existing clients must remain compatible during migration.

Options:
A. Version the interface.
B. Introduce an adapter.
C. Maintain the existing interface temporarily.

Decision:
Introduce an adapter during the migration period.
```

The decision should remain traceable to the constraint that influenced it.

---

## 17. Constraint vs Preference

Preferences are not mandatory constraints.

Examples of preferences:

```text
Prefer technology X.
Prefer a single deployment.
Prefer managed infrastructure.
Prefer a particular programming language.
Prefer a particular vendor.
```

Unless supported by authoritative evidence, these should remain preferences.

The agent MUST NOT present a personal or agent-generated preference as a project constraint.

---

## 18. Constraint Conflicts

Constraints may conflict.

Example:

```text
CON-001:
Existing clients must remain backward compatible.

CON-002:
The new interface must eliminate the existing contract limitations.
```

When constraints conflict, the agent MUST NOT silently prioritize one.

The conflict should be recorded with:

* conflicting constraints,
* source of each constraint,
* relative authority,
* affected scope,
* consequences,
* possible resolutions,
* required decision authority.

Possible outcomes:

```text
One constraint is superseded.
One constraint is relaxed.
Scope is reduced.
A transitional solution is introduced.
A new decision resolves the conflict.
The conflict remains blocking.
```

---

## 19. Constraint Validation

Before a constraint becomes `ACTIVE`, validate:

1. The source is identifiable.
2. The statement is unambiguous.
3. The scope is understood.
4. The strength is explicit.
5. The constraint is still current.
6. Evidence supports the constraint.
7. It does not conflict with higher-authority constraints.
8. Its consequences are understood sufficiently.
9. Required authority has confirmed it when necessary.
10. Traceability is established.

---

## 20. Constraint Lifecycle

The recommended lifecycle is:

```text
OPEN
  ↓
PROPOSED
  ↓
ACCEPTED
  ↓
ACTIVE
  ├──→ SUPERSEDED
  └──→ EXPIRED

PROPOSED
  └──→ REJECTED
```

The lifecycle should preserve history.

An agent MUST NOT silently delete or rewrite a constraint that influenced previous decisions.

---

## 21. Existing Systems

For existing systems, constraints must be analyzed against three states:

```text
DOCUMENTED STATE
ACTUAL STATE
TARGET STATE
```

The agent must distinguish:

* what documentation says,
* what the system actually does,
* what must remain constrained,
* what is merely historical behavior,
* what the target architecture requires.

When documentation and runtime behavior conflict, actual behavior should be treated as evidence of the current system state while the discrepancy is explicitly recorded.

Historical implementation details are not automatically constraints.

---

## 22. System Evolution

For system evolution, constraints should be evaluated against the change boundary.

The agent should identify:

```text
Existing Constraints
        ↓
Change Boundary
        ↓
New / Modified Constraints
        ↓
Affected Options
        ↓
Decision
```

The entire system does not need to be re-constrained when a change is local.

However, a constraint that crosses a domain, contract, data, security, or architecture boundary may require broader analysis.

---

## 23. Constraint Dependencies

Constraints may depend on other constraints.

Example:

```text
CON-001:
Existing clients must remain operational.

CON-002:
The existing public interface cannot be modified incompatibly.

CON-002 supports CON-001.
```

Dependencies should be explicit when they materially affect reasoning.

Recommended relationship types:

```text
DEPENDS_ON
CONFLICTS_WITH
REFINES
CONSTRAINS
SUPERSEDES
MITIGATES
INFLUENCES
```

---

## 24. Constraint-to-Decision Traceability

Significant constraints should be traceable to the decisions they influence.

Example:

```text
CON-001
   ↓ INFLUENCES
ADR-004
   ↓ SELECTS
Architecture Option B
```

The agent should be able to answer:

* Which constraints influenced this decision?
* Which decisions depend on this constraint?
* What happens if this constraint changes?
* Which requirements are affected?
* Which contracts or architecture elements are affected?

A constraint change should trigger impact analysis when it influences consequential decisions.

---

## 25. Constraint Change Impact

When an active constraint changes, evaluate:

```text
Constraint
    ↓
Requirements
    ↓
Domain
    ↓
Architecture
    ↓
Contracts
    ↓
Decisions
    ↓
Specifications
    ↓
Infrastructure
    ↓
Implementation
    ↓
Verification
```

Not every change propagates through every layer.

Propagation should be based on actual dependency relationships.

The agent MUST NOT assume that a changed constraint has no impact merely because implementation has not started.

---

## 26. Constraint Review

Constraints should be reviewed when:

* a related requirement changes,
* a related architecture decision changes,
* a contract changes,
* the deployment environment changes,
* an external dependency changes,
* a regulatory condition changes,
* a migration phase completes,
* a deadline passes,
* a previously assumed limitation is removed,
* evidence contradicts the constraint.

Expired or obsolete constraints should be marked explicitly rather than silently removed.

---

## 27. Constraint Quality Checklist

Before accepting a constraint, verify:

### Definition

* [ ] The constraint is explicitly stated.
* [ ] The constraint is specific enough to evaluate.
* [ ] The constraint is not merely a broad requirement.
* [ ] The constraint is not merely a preference.

### Evidence

* [ ] The source is identifiable.
* [ ] Evidence exists.
* [ ] Inferences are explicitly marked.
* [ ] Confidence is appropriate.

### Scope

* [ ] Scope is defined.
* [ ] Temporal applicability is defined.
* [ ] Affected areas are identified.

### Governance

* [ ] Strength is explicit.
* [ ] Conflicts are identified.
* [ ] Required authority is known.
* [ ] Review or expiration conditions are recorded when applicable.

### Architecture

* [ ] Architectural consequences are understood.
* [ ] The constraint does not silently dictate technology.
* [ ] Influenced decisions are traceable.

### Lifecycle

* [ ] Status is current.
* [ ] Superseded constraints remain traceable.
* [ ] Transitional constraints have an exit condition.

---

## 28. Gate Contribution

Constraints contribute primarily to the **Product Discovery Gate**.

The gate should verify that:

1. Significant constraints have been identified.
2. Mandatory and preferred constraints are distinguished.
3. Important constraints have evidence.
4. Constraints are not being confused with requirements or decisions.
5. Major conflicts are identified.
6. Temporal constraints are explicit where relevant.
7. Constraints that materially influence architecture are traceable.
8. Unknown constraints that could block subsequent phases are visible.

A product discovery gate may pass with unresolved constraints only when those constraints are explicitly classified as non-blocking or intentionally deferred.

---

## 29. Compact Constraint Register

For lightweight projects, the following format may be sufficient:

| ID      | Statement     | Category     | Strength  | Scope     | Status | Source     | Review   |
| ------- | ------------- | ------------ | --------- | --------- | ------ | ---------- | -------- |
| CON-001 | `<statement>` | `<category>` | MANDATORY | `<scope>` | ACTIVE | `<source>` | `<date>` |

The level of detail should scale according to project size, risk, uncertainty, and consequence.

---

## 30. Agent Instructions

When analyzing constraints, the agent MUST:

1. Identify explicit constraints before proposing solutions.
2. Distinguish constraints from requirements, preferences, assumptions, and decisions.
3. Never invent mandatory constraints.
4. Mark inferred constraints as inferred or proposed.
5. Identify the source and evidence of significant constraints.
6. Determine constraint scope.
7. Determine whether the constraint is current, transitional, or target-state.
8. Distinguish mandatory from preferred constraints.
9. Detect conflicts between constraints.
10. Analyze consequences before using a constraint to influence architecture.
11. Preserve constraint history.
12. Revalidate constraints when their context changes.
13. Trace significant constraints to affected decisions.
14. Propagate change impact only through supported relationships.
15. Avoid using constraints as justification for predetermined technologies.
16. Treat legacy behavior as evidence until its mandatory nature is established.
17. Ask for clarification when an unresolved constraint could materially affect domain, architecture, contracts, security, data, or infrastructure.
18. Prefer the smallest sufficient constraint scope.
19. Remove or supersede constraints explicitly rather than silently ignoring them.
20. Never represent an agent preference as a project constraint.

---

## 31. Anti-Patterns

### 31.1 Invented Constraints

Creating mandatory limitations without evidence.

### 31.2 Preference Disguised as Constraint

Presenting an agent or stakeholder preference as an unavoidable limitation.

### 31.3 Legacy Equals Mandatory

Assuming existing behavior must remain forever.

### 31.4 Historical Constraint Drift

Continuing to apply a constraint after its original context has disappeared.

### 31.5 Technology Predetermination

Using a constraint as a superficial justification for a technology that was already selected.

### 31.6 Globalizing Local Constraints

Applying a local limitation to the entire system without evidence.

### 31.7 Ignoring Transitional Constraints

Carrying migration-only constraints into the target architecture.

### 31.8 Constraint Overload

Adding so many constraints that valid solution options are unnecessarily eliminated.

### 31.9 Silent Conflict Resolution

Choosing between conflicting constraints without explicit reasoning or authority.

### 31.10 Constraint Without Evidence

Treating an assumption as a confirmed project limitation.

---

## 32. Final Principle

Constraints define the boundaries within which a solution must operate.

They are not requirements, preferences, or architecture decisions.

A well-governed lifecycle makes constraints explicit, evidence-based, scoped, temporal, traceable, and reviewable.

The agent should continuously ask:

> **What actually limits the solution space, and what evidence proves that limitation exists?**

Only after that question is answered should constraints influence architecture, contracts, infrastructure, or implementation decisions.

