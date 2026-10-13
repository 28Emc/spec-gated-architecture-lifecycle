# Release Readiness Context

## 1. Document Metadata

| Field                   | Value                                                  |
| ----------------------- | ------------------------------------------------------ |
| Document Type           | Release Readiness Context                              |
| Lifecycle Phase         | Release Readiness                                      |
| Status                  | `DRAFT`                                                |
| Version                 | `0.1`                                                  |
| System                  | `<system>`                                             |
| Release                 | `<release>`                                            |
| Release Type            | `<initial / incremental / migration / hotfix / other>` |
| Scope                   | `<scope>`                                              |
| Owner                   | `<owner>`                                              |
| Created                 | `<date>`                                               |
| Last Updated            | `<date>`                                               |
| Architecture Baseline   | `<baseline>`                                           |
| Specification Baseline  | `<baseline>`                                           |
| Infrastructure Baseline | `<baseline>`                                           |

---

# 2. Purpose

This document establishes the context, scope, objectives, constraints, evidence expectations, and readiness boundaries for evaluating whether a specific system release can safely progress toward deployment, promotion, or production use.

It establishes the release being evaluated before the final Release Readiness Review.

It answers:

> **What release are we evaluating, what does it contain, what must be true for it to be considered ready, and what evidence is required?**

It does not itself declare the release ready.

---

# 3. Core Principle

> **Release readiness is a decision about whether a specific release can safely progress within its intended context, based on approved scope, requirements, architecture, contracts, specifications, infrastructure, verification evidence, operational preparedness, and explicitly governed risk.**

A release is not ready merely because:

* code compiles,
* tests pass,
* deployment succeeds,
* infrastructure exists,
* documentation is complete,
* or all planned features appear implemented.

Readiness requires evidence that the release satisfies its applicable expectations.

---

# 4. Release Readiness Scope

The release evaluation may consider:

* product scope,
* requirements,
* business rules,
* domain behavior,
* architecture,
* contracts,
* security,
* data,
* implementation,
* tests,
* infrastructure,
* deployment,
* observability,
* operations,
* migration,
* compatibility,
* recovery,
* known risks,
* open issues.

Only applicable areas should be evaluated.

---

# 5. Release Identity

```text id="r6m4vp"
Release ID:
<release-id>

Release Name:
<name>

Release Version:
<version>

Release Type:
<type>

Target Environment:
<environment>

Release Date:
<date>

Release Owner:
<owner>

Release Scope:
<scope>
```

---

# 6. Release Type

Classify the release.

Possible values:

* `INITIAL`
* `FEATURE`
* `ENHANCEMENT`
* `BUG_FIX`
* `SECURITY`
* `MAINTENANCE`
* `MIGRATION`
* `COMPATIBILITY`
* `HOTFIX`
* `ROLLBACK`
* `OTHER`

The release type influences the depth and focus of readiness evaluation.

---

# 7. Release Scope

## Included

```text id="k8m3pq"
<capabilities / requirements / changes included>
```

## Excluded

```text id="v5x9mk"
<explicit exclusions>
```

## Deferred

```text id="r7m4vp"
<deferred items>
```

## Changed

```text id="k6x8pq"
<existing behavior affected by the release>
```

---

# 8. Release Objectives

Define what this release is intended to achieve.

```text id="v8m5pk"
Objective:
<objective>

Expected Outcome:
<outcome>

Evidence:
<evidence>

Status:
<status>
```

Release objectives should trace to approved product or system objectives.

---

# 9. Release Baseline

The release should identify the baselines against which readiness is evaluated.

```text id="r5m9vp"
Product Baseline:
<baseline>

Domain Baseline:
<baseline>

Architecture Baseline:
<baseline>

Contract Baseline:
<baseline>

ADR Baseline:
<baseline>

Specification Baseline:
<baseline>

Infrastructure Baseline:
<baseline>

Test Baseline:
<baseline>
```

A release must not silently evaluate itself against obsolete baselines.

---

# 10. Release Change Summary

Summarize material changes introduced by the release.

| Change ID | Area     | Description     | Impact     | Status     |
| --------- | -------- | --------------- | ---------- | ---------- |
| CHG-001   | `<area>` | `<description>` | `<impact>` | `<status>` |

Areas may include:

* product behavior,
* domain behavior,
* API,
* events,
* data,
* security,
* infrastructure,
* runtime,
* deployment,
* operations,
* migration.

---

# 11. Change Impact Classification

Each significant change should be classified.

Possible values:

* `LOCAL`
* `DOMAIN_AFFECTING`
* `CONTRACT_AFFECTING`
* `DATA_AFFECTING`
* `SECURITY_AFFECTING`
* `OPERATIONAL_AFFECTING`
* `ARCHITECTURE_AFFECTING`
* `SYSTEM_WIDE`

```text id="k7m4pq"
Change:
<change>

Impact Class:
<classification>

Reason:
<reason>

Affected Areas:
<areas>
```

The classification determines how much readiness evidence is required.

---

# 12. Release Entry Conditions

Before Release Readiness begins:

* [ ] Release scope is known.
* [ ] Release identity is known.
* [ ] Target environment is known.
* [ ] Applicable product requirements are identified.
* [ ] Applicable domain behavior is identified.
* [ ] Architecture baseline is available.
* [ ] Relevant contracts are available.
* [ ] Relevant ADRs are available.
* [ ] Relevant specifications are available.
* [ ] Infrastructure readiness is available.
* [ ] Test evidence is available or scheduled.
* [ ] Operational expectations are known.
* [ ] Migration requirements are known where applicable.
* [ ] Security requirements are known.
* [ ] Release-specific risks are identified.

---

# 13. Release Readiness Drivers

Identify the factors that determine release readiness.

Possible drivers:

* business outcome,
* functional correctness,
* domain correctness,
* security,
* data integrity,
* compatibility,
* availability,
* reliability,
* resilience,
* observability,
* operational capability,
* compliance,
* migration safety,
* rollback capability.

```text id="v6x5mk"
Driver:
<driver>

Importance:
<criticality>

Release Impact:
<impact>

Evidence Required:
<evidence>
```

---

# 14. Release Constraints

Record constraints affecting the release.

Examples:

* required deployment window,
* compatibility requirements,
* regulatory requirements,
* migration sequencing,
* infrastructure limitations,
* external dependency constraints,
* data constraints,
* rollback limitations.

```text id="r8m3vp"
Constraint:
<constraint>

Strength:
<MANDATORY / PREFERRED / INFORMATIONAL>

Scope:
<scope>

Impact:
<impact>

Evidence:
<evidence>
```

Do not invent constraints.

---

# 15. Release Assumptions

```text id="k5x9pq"
Assumption:
<assumption>

Evidence:
<evidence>

Confidence:
<HIGH / MEDIUM / LOW>

Impact:
<impact>

Validation:
<validation>
```

Critical assumptions should be validated before the final readiness decision.

---

# 16. Release Unknowns

```text id="v7m4pk"
Unknown:
<unknown>

Impact:
<impact>

Blocking:
<yes/no>

Resolution:
<resolution>

Owner:
<owner>
```

Release Readiness does not require zero unknowns.

It requires sufficient reduction of decision-relevant uncertainty.

---

# 17. Release Risks

```text id="r6m8vp"
Risk:
<risk>

Source:
<source>

Impact:
<impact>

Likelihood:
<likelihood>

Mitigation:
<mitigation>

Accepted:
<yes/no>
```

Risks must be evaluated according to release consequence, not merely technical inconvenience.

---

# 18. Release Risk Classification

Possible severity:

* `INFO`
* `WARNING`
* `SIGNIFICANT`
* `BLOCKING`

A risk becomes blocking when it prevents the release from safely satisfying a critical expectation.

---

# 19. Requirement Readiness

Identify requirements affected by the release.

| Requirement | Applicable | Implemented | Verified   | Evidence     | Status     |
| ----------- | ---------- | ----------- | ---------- | ------------ | ---------- |
| REQ-001     | `<yes/no>` | `<yes/no>`  | `<yes/no>` | `<evidence>` | `<status>` |

The release must not silently omit an applicable critical requirement.

---

# 20. Business Rule Readiness

Review affected business rules.

```text id="k8m5pq"
Business Rule:
<rule>

Affected:
<yes/no>

Verified:
<yes/no>

Evidence:
<evidence>

Status:
<status>
```

Business behavior must be verified independently of implementation structure.

---

# 21. Domain Behavior Readiness

Review affected:

* aggregates,
* invariants,
* domain services,
* domain events,
* state transitions,
* business processes.

```text id="v5m9pk"
Domain Behavior:
<behavior>

Affected:
<yes/no>

Verified:
<yes/no>

Evidence:
<evidence>
```

---

# 22. Architecture Readiness Baseline

Release Readiness may assume only architecture that is:

* accepted,
* current,
* applicable to the release,
* not superseded.

```text id="r7x4vp"
Architecture Baseline:
<baseline>

Status:
<status>

Release Impact:
<impact>

Open Architectural Risk:
<risk>
```

---

# 23. Contract Readiness Baseline

Review applicable:

* API Contracts,
* Event Contracts,
* Data Contracts,
* Security Contracts,
* Observability Contracts.

```text id="k6m8pq"
Contract:
<contract>

Affected:
<yes/no>

Compatible:
<yes/no>

Verified:
<yes/no>

Migration Required:
<yes/no>
```

---

# 24. Compatibility Context

Evaluate:

* backward compatibility,
* forward compatibility,
* client compatibility,
* event compatibility,
* data compatibility,
* deployment compatibility,
* runtime compatibility.

```text id="v8x3mk"
Compatibility Area:
<area>

Current:
<current>

Release:
<release>

Expected:
<expected>

Verified:
<yes/no>
```

---

# 25. Breaking Change Assessment

A change may be breaking because of:

* semantics,
* data meaning,
* behavior,
* security,
* availability,
* ordering,
* error behavior,
* compatibility,
* ownership,
* timing.

Syntactic compatibility alone is insufficient.

```text id="r5m4vp"
Change:
<change>

Breaking:
<yes/no>

Affected Consumers:
<consumers>

Mitigation:
<mitigation>
```

---

# 26. Data Readiness

Review:

* data integrity,
* data ownership,
* schema compatibility,
* migration,
* retention,
* deletion,
* synchronization,
* historical data,
* backup,
* recovery.

```text id="k7x9pq"
Data Area:
<data>

Release Impact:
<impact>

Verification:
<verification>

Status:
<status>
```

---

# 27. Security Readiness Context

Review affected:

* identity,
* authentication,
* authorization,
* sensitive data,
* secrets,
* trust boundaries,
* security logging,
* auditability,
* security failure behavior.

```text id="v6m5pk"
Security Area:
<area>

Affected:
<yes/no>

Verified:
<yes/no>

Evidence:
<evidence>
```

---

# 28. Security Change Impact

Security-sensitive changes require explicit assessment.

Examples:

* new trust boundary,
* new permission,
* changed authorization,
* new sensitive data,
* new external integration,
* credential changes,
* security policy changes.

Do not treat security as a generic checklist.

---

# 29. Observability Readiness Context

The release must preserve the ability to answer relevant:

* operational questions,
* business questions,
* security questions,
* failure questions,
* recovery questions.

```text id="r8m4vp"
Question:
<question>

Required Signal:
<signal>

Available:
<yes/no>

Verified:
<yes/no>
```

---

# 30. Operational Readiness Context

Identify operational capabilities required by the release:

* monitoring,
* alerting,
* diagnosis,
* incident handling,
* maintenance,
* rollback,
* recovery,
* privileged access,
* reconciliation.

```text id="k5x8pq"
Operational Capability:
<capability>

Required:
<yes/no>

Available:
<yes/no>

Verified:
<yes/no>
```

---

# 31. Infrastructure Readiness Dependency

Release Readiness depends on the Infrastructure Readiness outcome.

```text id="v7m3pk"
Infrastructure Baseline:
<baseline>

Outcome:
<READY / READY_WITH_RISKS / INCOMPLETE / BLOCKED>

Release Impact:
<impact>

Open Infrastructure Risks:
<risks>
```

Infrastructure readiness does not automatically imply release readiness.

---

# 32. Deployment Context

Define:

* deployment target,
* deployment sequence,
* promotion path,
* compatibility requirements,
* configuration,
* secrets,
* validation,
* rollback.

```text id="r6m9vp"
Deployment Target:
<target>

Promotion Path:
<path>

Deployment Strategy:
<strategy>

Validation:
<validation>

Rollback:
<rollback>
```

---

# 33. Migration Context

If the release includes migration:

```text id="k8x4pq"
Migration:
<migration>

Current State:
<current>

Target State:
<target>

Transition:
<transition>

Cutover:
<cutover>

Rollback:
<rollback>

Verification:
<verification>
```

---

# 34. Release Data Migration Safety

Where applicable, verify:

* data completeness,
* transformation correctness,
* reconciliation,
* duplicate handling,
* synchronization,
* compatibility,
* rollback limitations.

Migration readiness must not be inferred from migration execution alone.

---

# 35. Verification Context

Identify the evidence required for the release.

Possible evidence:

* unit verification,
* component verification,
* integration verification,
* contract verification,
* system verification,
* acceptance verification,
* security verification,
* performance verification,
* resilience verification,
* deployment verification,
* infrastructure verification,
* migration verification,
* operational verification.

---

# 36. Verification Evidence Baseline

```text id="v5m8pk"
Verification Area:
<area>

Required Evidence:
<evidence>

Available:
<yes/no>

Quality:
<quality>

Status:
<status>
```

Evidence must be relevant to the release, not merely historical.

---

# 37. Release-Specific Test Scope

Identify what must be retested because of this release.

```text id="r7x5pq"
Change:
<change>

Affected Behavior:
<behavior>

Required Test Level:
<level>

Reason:
<reason>

Status:
<status>
```

Testing depth should follow change impact and risk.

---

# 38. Regression Context

Identify behavior that must remain unchanged.

```text id="k6m3vp"
Existing Behavior:
<behavior>

Release Risk:
<risk>

Regression Verification:
<verification>

Status:
<status>
```

---

# 39. Performance Context

Where performance is relevant:

* identify affected behavior,
* identify approved targets,
* identify evidence required.

Do not invent numerical thresholds.

```text id="v8m4pk"
Performance Area:
<area>

Approved Expectation:
<expectation>

Evidence:
<evidence>

Status:
<status>
```

---

# 40. Resilience Context

Where resilience matters:

* dependency failure,
* infrastructure failure,
* partial availability,
* retry behavior,
* recovery,
* degradation.

```text id="r5x9mk"
Scenario:
<scenario>

Expected Behavior:
<behavior>

Verification:
<verification>
```

---

# 41. Rollback Context

Define whether rollback is:

* available,
* partially available,
* difficult,
* impossible.

```text id="k7m5vp"
Release:
<release>

Rollback Capability:
<capability>

Rollback Trigger:
<trigger>

Rollback Scope:
<scope>

Limitations:
<limitations>

Verification:
<verification>
```

Rollback is not assumed to be possible.

---

# 42. Forward Recovery

Where rollback is not viable, define forward recovery.

```text id="v6m4pq"
Failure:
<failure>

Recovery Strategy:
<strategy>

Required Evidence:
<evidence>

Data Implications:
<implications>
```

---

# 43. Release Stop Conditions

Define conditions under which release progression must stop.

Examples:

* critical verification failure,
* unresolved security vulnerability,
* data integrity risk,
* incompatible contract,
* failed migration validation,
* unavailable critical dependency,
* unverified recovery path,
* infrastructure blocker,
* unauthorized architectural change.

```text id="r8m3pk"
Stop Condition:
<condition>

Severity:
<severity>

Detection:
<detection>

Required Action:
<action>
```

---

# 44. Release Go / No-Go Criteria

## Go Criteria

```text id="k5x7vp"
<criterion>
```

## No-Go Criteria

```text id="v7m4pk"
<criterion>
```

Criteria must be evidence-based.

---

# 45. Release Approval Context

Release approval authority must be explicit.

```text id="r6m8pq"
Decision:
<release decision>

Authority:
<authority>

Evidence:
<evidence>

Risks Accepted:
<risks>

Date:
<date>
```

Do not invent approval authority.

---

# 46. Risk Acceptance

A release may proceed with risks only when:

* risk is explicit,
* impact is understood,
* mitigation is known,
* appropriate authority accepts it,
* no blocking condition is violated.

```text id="k8x3vp"
Risk:
<risk>

Impact:
<impact>

Mitigation:
<mitigation>

Authority:
<authority>

Accepted:
<yes/no>
```

---

# 47. Open Decisions

```text id="v5m9pq"
Decision:
<decision>

Impact:
<impact>

Blocking:
<yes/no>

Authority:
<authority>

Status:
<status>
```

Release Readiness must not silently resolve architecture or product decisions.

---

# 48. Release Unknowns

Prioritize unknowns according to:

```text id="r7m4pk"
Impact
    ×
Decision Consequence
    ×
Irreversibility
```

High-consequence unknowns require resolution or explicit governance.

---

# 49. Release Dependencies

```text id="k6m8vp"
Dependency:
<dependency>

Type:
<internal / external / infrastructure / organizational / other>

Required:
<yes/no>

Available:
<yes/no>

Verified:
<yes/no>

Failure Impact:
<impact>
```

---

# 50. External Dependency Readiness

For external systems/providers:

* connectivity,
* credentials,
* compatibility,
* availability,
* failure behavior,
* rate or capacity constraints,
* support,
* operational dependency.

Do not assume external systems behave according to undocumented expectations.

---

# 51. Release Scope Integrity

Verify that the release does not contain:

* undocumented material changes,
* unapproved architecture,
* unreviewed contracts,
* ungoverned migrations,
* hidden configuration changes,
* unrelated high-risk changes.

```text id="v8m3pk"
Detected Difference:
<difference>

Expected:
<yes/no>

Governed:
<yes/no>

Action:
<action>
```

---

# 52. Release Traceability Context

The release should support:

```text id="r5x8mk"
Product Intent
      ↓
Requirement
      ↓
Domain Behavior
      ↓
Architecture
      ↓
Contract
      ↓
Decision
      ↓
Specification
      ↓
Implementation
      ↓
Verification
      ↓
Release
```

Not every release item requires every relationship, but consequential changes must remain traceable.

---

# 53. Release Traceability Health

| Relationship            | Status     | Evidence     |
| ----------------------- | ---------- | ------------ |
| Release → Requirement   | `<status>` | `<evidence>` |
| Release → Domain        | `<status>` | `<evidence>` |
| Release → Architecture  | `<status>` | `<evidence>` |
| Release → Contract      | `<status>` | `<evidence>` |
| Release → ADR           | `<status>` | `<evidence>` |
| Release → Specification | `<status>` | `<evidence>` |
| Release → Verification  | `<status>` | `<evidence>` |

---

# 54. Existing System Release Context

For existing systems distinguish:

```text id="k7m5pq"
Documented State:
<state>

Observed Actual State:
<state>

Release Target State:
<state>

Difference:
<difference>
```

Historical documentation must not override observed behavior without explicit justification.

---

# 55. System Evolution Release Context

For evolution releases:

* identify the smallest affected boundary,
* identify preserved behavior,
* identify changed behavior,
* identify migration requirements,
* identify compatibility requirements,
* identify affected contracts,
* identify affected infrastructure.

The review scope should scale with change impact.

---

# 56. Release Communication Context

Where operationally relevant, identify required communication concerning:

* behavior changes,
* compatibility,
* maintenance,
* migration,
* operational impact,
* known limitations,
* consumer impact.

Do not invent organizational procedures.

---

# 57. Release Documentation Context

Identify release-relevant documentation that must be updated.

Possible artifacts:

* API documentation,
* operational documentation,
* migration documentation,
* configuration documentation,
* security documentation,
* troubleshooting information,
* user-facing behavior documentation.

Documentation is an output of release readiness, not proof of readiness.

---

# 58. Release Known Limitations

```text id="v6m4pk"
Limitation:
<limitation>

Impact:
<impact>

Accepted:
<yes/no>

Authority:
<authority>

Mitigation:
<mitigation>
```

---

# 59. Release Readiness Questions

The following questions establish the final evaluation context:

1. What exactly is being released?
2. What approved behavior changes?
3. What behavior must remain unchanged?
4. Which requirements are affected?
5. Which domain rules are affected?
6. Which contracts are affected?
7. Which architecture elements are affected?
8. Which ADRs are affected?
9. Which specifications are affected?
10. Which data is affected?
11. Which security boundaries are affected?
12. Which infrastructure is affected?
13. Which operational behavior is affected?
14. Which migrations are required?
15. Which verification evidence is required?
16. What can cause the release to stop?
17. What risks may be accepted?
18. Who has authority to accept those risks?
19. What remains unknown?
20. What evidence is required before a final Go decision?

---

# 60. Release Readiness Baseline

```text id="r8m5vp"
Release:
<release>

Scope:
<scope>

Objectives:
<objectives>

Affected Areas:
<areas>

Required Evidence:
<evidence>

Critical Dependencies:
<dependencies>

Known Risks:
<risks>

Known Limitations:
<limitations>

Stop Conditions:
<conditions>

Rollback / Recovery:
<strategy>

Approval Authority:
<authority>
```

---

# 61. Handoff to Release Readiness Review

### Review May Assume

* approved architecture baseline,
* approved contracts,
* approved ADR baseline,
* applicable specifications,
* infrastructure readiness outcome,
* available verification evidence,
* identified release scope.

### Review Must Verify

* release scope,
* requirement satisfaction,
* domain behavior,
* contract compatibility,
* security,
* data integrity,
* verification evidence,
* infrastructure readiness,
* deployment readiness,
* operational readiness,
* migration readiness,
* recovery capability,
* accepted risks.

### Review Must Not Invent

* requirements,
* product decisions,
* architecture decisions,
* security guarantees,
* recovery guarantees,
* performance targets,
* approval authority.

---

# 62. Feedback to Previous Phases

Release Readiness may reveal issues requiring feedback to:

* Product Discovery,
* Domain Discovery,
* Architecture,
* Contracts,
* ADRs,
* Specifications,
* Infrastructure.

```text id="k6x9pq"
Finding:
<finding>

Target Phase:
<phase>

Reason:
<reason>

Impact:
<impact>

Required Action:
<action>
```

The lifecycle remains iterative until the release decision is sufficiently supported.

---

# 63. Agent Instructions

When creating Release Readiness Context:

1. Identify the exact release.
2. Establish release scope.
3. Establish release objectives.
4. Identify affected behavior.
5. Identify affected requirements.
6. Identify affected domain behavior.
7. Identify affected architecture.
8. Identify affected contracts.
9. Identify affected ADRs.
10. Identify affected specifications.
11. Identify affected data.
12. Identify security implications.
13. Identify infrastructure dependencies.
14. Identify operational implications.
15. Identify migration requirements.
16. Identify required verification evidence.
17. Identify stop conditions.
18. Identify rollback or forward-recovery capabilities.
19. Identify risks and unknowns.
20. Identify release dependencies.
21. Establish traceability.
22. Preserve current/target/transition distinctions.
23. Do not declare readiness prematurely.
24. Do not invent approval authority.
25. Do not silently resolve unresolved decisions.
26. Scale review depth according to release impact and risk.
27. Preserve evidence from previous lifecycle phases.
28. Trigger feedback loops when release analysis invalidates earlier assumptions.

---

# 64. Anti-Patterns

## Release Scope by Commit List

A list of commits does not define business or architectural release scope.

## Tests Pass = Release Ready

Passing tests alone do not establish operational, security, migration, or recovery readiness.

## Deployment Succeeds = Release Ready

Successful deployment does not prove system behavior under realistic conditions.

## Documentation Complete = Release Ready

Documentation does not replace evidence.

## No Open Issues = Release Ready

A release may legitimately proceed with governed non-blocking issues.

## Zero Unknowns

Release readiness does not require eliminating every unknown.

## Silent Risk Acceptance

Risks must be explicitly accepted by appropriate authority.

## Hidden Breaking Changes

Semantic changes may be breaking even when schemas remain compatible.

## Rollback Assumption

Rollback must be demonstrated or explicitly known to be unavailable.

## Happy-Path Readiness

Readiness must include important failure, degradation, security, migration, and recovery scenarios.

## Legacy Behavior = Requirement

Existing behavior is evidence unless explicitly adopted as required target behavior.

## Environment Equivalence

Different environments may have materially different behavior.

## Checklist Theater

Completing checklist fields does not establish evidence.

## Release as Architecture

Release preparation must not silently redefine architecture.

## Release as Product Discovery

Release Readiness should not invent new product requirements.

---

# 65. Safe Progression Question

Before proceeding to the final Release Readiness Review:

> **Is the release scope explicit, are its consequential changes understood, are the relevant requirements, domain behavior, contracts, architecture, specifications, infrastructure, security, operational, migration, and verification expectations identified, and is sufficient evidence available to evaluate whether the release can safely proceed without inventing unresolved system semantics?**

If the answer is no, identify the smallest lifecycle artifact or phase that must be revisited.

---

# 66. Final Principle

> **Release Readiness Context establishes what must be evaluated and what evidence is required; it does not replace the final release decision.**

The progression is:

```text
Product
   ↓
Domain
   ↓
Architecture
   ↓
Contracts
   ↓
Architecture Decisions
   ↓
Specifications
   ↓
Infrastructure
   ↓
Release Readiness Context
   ↓
Release Readiness Review
   ↓
Go / Go With Risks / No-Go
```

The final release decision must be based on:

* approved scope,
* explicit expectations,
* traceable evidence,
* known limitations,
* governed risks,
* operational capability,
* and appropriate authority.

Release readiness therefore represents the final convergence of the lifecycle rather than a simple deployment checklist.
