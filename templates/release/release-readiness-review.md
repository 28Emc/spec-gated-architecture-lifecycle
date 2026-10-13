# Release Readiness Review

## 1. Document Metadata

| Field                     | Value                    |
| ------------------------- | ------------------------ |
| Document Type             | Release Readiness Review |
| Lifecycle Phase           | Release Readiness        |
| Gate                      | Gate 8                   |
| Status                    | `DRAFT`                  |
| Version                   | `0.1`                    |
| System                    | `<system>`               |
| Release                   | `<release>`              |
| Release Type              | `<type>`                 |
| Review Owner              | `<owner>`                |
| Review Date               | `<date>`                 |
| Release Readiness Context | `<document>`             |
| Architecture Baseline     | `<baseline>`             |
| Specification Baseline    | `<baseline>`             |
| Infrastructure Baseline   | `<baseline>`             |

---

# 2. Purpose

This document provides the final readiness assessment for a specific system release.

It evaluates whether the release has sufficient evidence to safely proceed to its intended release action.

Possible release actions include:

* initial launch,
* production deployment,
* incremental release,
* migration,
* replacement,
* hotfix,
* compatibility transition,
* decommissioning,
* or another controlled system transition.

This document is the final lifecycle review before the release decision.

---

# 3. Core Principle

> **Release readiness is an evidence-based decision, not a documentation or checklist completion exercise.**

The review evaluates whether:

* the release scope is understood,
* approved expectations are satisfied,
* important behavior is verified,
* contracts remain compatible,
* security expectations are satisfied,
* data is safe,
* infrastructure is ready,
* operations are prepared,
* migration is controlled,
* recovery is understood,
* risks are governed,
* and release authority can make an informed decision.

The review must not create new architecture or product decisions silently.

---

# 4. Review Outcomes

The overall review outcome is one of:

```text
READY
READY_WITH_RISKS
INCOMPLETE
BLOCKED
NOT_REQUIRED
```

### READY

Required readiness conditions are satisfied and no blocking condition remains.

### READY_WITH_RISKS

The release can proceed with explicitly identified and appropriately accepted non-blocking risks.

### INCOMPLETE

Required evidence or evaluation is missing, but no explicit blocking failure has yet been established.

### BLOCKED

A blocking condition prevents safe progression.

### NOT_REQUIRED

The release does not require this readiness process or a particular readiness dimension.

`NOT_REQUIRED` must be justified.

---

# 5. Final Release Decisions

The final release decision should be expressed separately from the review outcome.

Possible decisions:

```text
GO
GO_WITH_RISKS
NO_GO
DEFERRED
CANCELLED
```

The distinction is intentional:

* **Review Outcome** describes readiness evidence.
* **Release Decision** describes the authorized action.

---

# 6. Review Entry Conditions

The review may begin when:

* [ ] Release Readiness Context exists.
* [ ] Release identity is known.
* [ ] Release scope is defined.
* [ ] Release type is known.
* [ ] Applicable baselines are identified.
* [ ] Relevant architecture is reviewed.
* [ ] Relevant contracts are identified.
* [ ] Relevant specifications are identified.
* [ ] Infrastructure readiness has been evaluated.
* [ ] Required verification evidence is available or explicitly pending.
* [ ] Security implications are identified.
* [ ] Operational implications are identified.
* [ ] Migration implications are identified where applicable.
* [ ] Release risks are known.
* [ ] Release dependencies are known.

Failure to satisfy an entry condition may result in `INCOMPLETE` or `BLOCKED`.

---

# 7. Release Baseline Review

Confirm the release is evaluated against the correct baselines.

| Baseline       | Version / ID | Status     | Applicable | Evidence     |
| -------------- | ------------ | ---------- | ---------- | ------------ |
| Product        | `<id>`       | `<status>` | `<yes/no>` | `<evidence>` |
| Domain         | `<id>`       | `<status>` | `<yes/no>` | `<evidence>` |
| Architecture   | `<id>`       | `<status>` | `<yes/no>` | `<evidence>` |
| Contracts      | `<id>`       | `<status>` | `<yes/no>` | `<evidence>` |
| ADRs           | `<id>`       | `<status>` | `<yes/no>` | `<evidence>` |
| Specifications | `<id>`       | `<status>` | `<yes/no>` | `<evidence>` |
| Infrastructure | `<id>`       | `<status>` | `<yes/no>` | `<evidence>` |
| Tests          | `<id>`       | `<status>` | `<yes/no>` | `<evidence>` |

A stale or superseded baseline must not silently be treated as authoritative.

---

# 8. Release Scope Review

Evaluate whether the release scope is:

* explicit,
* internally consistent,
* approved,
* traceable,
* and aligned with the actual release candidate.

```text id="r6m8vp"
Scope Area:
<area>

Expected:
<expected>

Actual:
<actual>

Difference:
<difference>

Status:
<status>
```

Material unexplained differences require investigation.

---

# 9. Release Candidate Review

Identify the exact candidate being evaluated.

```text
Release Candidate:
<artifact / version / identifier>

Build:
<identifier>

Source Baseline:
<identifier>

Configuration Baseline:
<identifier>

Infrastructure Baseline:
<identifier>

Deployment Target:
<target>
```

The candidate under review must be identifiable and reproducible to the extent required by the system.

---

# 10. Product Readiness Review

Evaluate whether the release satisfies applicable product expectations.

Review:

* intended outcomes,
* requirements,
* scope,
* acceptance criteria,
* user-visible behavior,
* business rules,
* release-specific exclusions.

```text id="k5x7pq"
Product Area:
<area>

Expectation:
<expectation>

Evidence:
<evidence>

Status:
<READY / INCOMPLETE / BLOCKED>
```

---

# 11. Requirement Verification Review

For every release-critical requirement:

| Requirement | Applicable | Verified   | Evidence     | Finding     |
| ----------- | ---------- | ---------- | ------------ | ----------- |
| `<REQ>`     | `<yes>`    | `<yes/no>` | `<evidence>` | `<finding>` |

A requirement is not considered verified solely because an implementation exists.

---

# 12. Business Rule Verification Review

Evaluate affected business rules.

```text
Rule:
<rule>

Expected Behavior:
<behavior>

Observed Behavior:
<behavior>

Evidence:
<evidence>

Status:
<status>
```

Critical domain rules must have sufficient verification evidence.

---

# 13. Domain Behavior Review

Evaluate release impact on:

* domain processes,
* aggregates,
* invariants,
* state transitions,
* domain events,
* policies,
* business decisions.

Review whether:

* expected behavior is preserved,
* changed behavior is intentional,
* invariants remain protected,
* state transitions remain valid.

---

# 14. Architecture Conformance Review

Verify that the release conforms to the approved architecture.

Review:

* system boundaries,
* container boundaries,
* relevant components,
* architecture views,
* data ownership,
* integration boundaries,
* security boundaries,
* runtime expectations,
* operational architecture.

```text id="v8m4pk"
Architecture Element:
<element>

Expected:
<expected>

Observed:
<observed>

Deviation:
<deviation>

Governed:
<yes/no>
```

Unapproved architectural drift is a release concern.

---

# 15. Architecture Decision Conformance

Verify that implementation and release behavior conform to applicable ADRs.

```text id="r7x5mk"
ADR:
<ADR>

Decision:
<decision>

Release Impact:
<impact>

Conformance:
<yes/no>

Deviation:
<deviation>
```

A deviation may require:

* explicit justification,
* ADR review,
* decision supersession,
* or release blocking.

---

# 16. Contract Readiness Review

Review all affected contracts:

* API,
* Event,
* Data,
* Security,
* Observability.

Evaluate:

* semantic compatibility,
* structural compatibility,
* behavioral compatibility,
* consumer impact,
* provider responsibility,
* failure behavior,
* security expectations,
* evolution requirements.

---

# 17. API Contract Review

For each affected API:

```text id="k6m9vp"
API:
<API>

Consumers:
<consumers>

Compatibility:
<compatible / incompatible / unknown>

Breaking Change:
<yes/no>

Verification:
<evidence>

Status:
<status>
```

Do not classify compatibility using schema comparison alone.

---

# 18. Event Contract Review

For each affected event:

```text
Event:
<event>

Publisher:
<publisher>

Consumers:
<consumers>

Semantic Compatibility:
<status>

Delivery Expectations:
<status>

Consumer Impact:
<impact>

Verification:
<evidence>
```

Do not invent delivery guarantees that are not part of the approved contract.

---

# 19. Data Contract Review

Evaluate:

* meaning,
* ownership,
* source of truth,
* compatibility,
* integrity,
* migration,
* synchronization,
* retention,
* privacy.

```text
Data Contract:
<contract>

Affected:
<yes/no>

Compatibility:
<status>

Integrity Evidence:
<evidence>

Status:
<status>
```

---

# 20. Security Contract Review

Evaluate:

* authentication,
* authorization,
* trust boundaries,
* protected resources,
* sensitive data,
* secrets,
* security failure behavior,
* audit expectations.

Security readiness must be based on applicable requirements and evidence.

---

# 21. Observability Contract Review

Verify that release changes preserve required observability.

Evaluate whether relevant:

* operational questions,
* business questions,
* security questions,
* failure questions,
* recovery questions

can still be answered.

---

# 22. Specification Conformance Review

Review applicable specifications against the release candidate.

| Specification | Applicable | Conforms   | Evidence     | Finding     |
| ------------- | ---------- | ---------- | ------------ | ----------- |
| `<spec>`      | `<yes/no>` | `<yes/no>` | `<evidence>` | `<finding>` |

Specifications must not be silently contradicted by implementation.

---

# 23. Specification Drift

Identify differences between approved specifications and actual behavior.

```text id="v5m8pq"
Specification:
<spec>

Expected:
<expected>

Actual:
<actual>

Drift:
<drift>

Severity:
<severity>

Action:
<action>
```

Not every difference is a defect; every material difference requires evaluation.

---

# 24. Test Evidence Review

Evaluate evidence by risk and change impact.

Possible evidence:

* unit tests,
* component tests,
* integration tests,
* contract tests,
* system tests,
* acceptance tests,
* security tests,
* performance tests,
* resilience tests,
* deployment tests,
* migration tests,
* operational tests.

The existence of tests is insufficient without relevant evidence.

---

# 25. Verification Evidence Quality

Evaluate evidence for:

* relevance,
* recency,
* reproducibility,
* determinism,
* environment fidelity,
* traceability,
* completeness,
* failure visibility.

```text id="r8m5vp"
Evidence:
<evidence>

Relevant:
<yes/no>

Recent:
<yes/no>

Reproducible:
<yes/no>

Traceable:
<yes/no>

Quality:
<HIGH / MEDIUM / LOW>
```

---

# 26. Regression Readiness

Verify behavior that should remain unchanged.

```text
Behavior:
<behavior>

Regression Risk:
<risk>

Verification:
<evidence>

Result:
<PASS / FAIL / NOT_VERIFIED>
```

Regression scope should reflect actual change impact.

---

# 27. Security Verification Review

Review available evidence for:

* authorization behavior,
* authentication behavior,
* sensitive data protection,
* security boundaries,
* security failure behavior,
* secrets handling,
* relevant abuse cases.

Security evidence must correspond to actual release changes.

---

# 28. Data Integrity Review

Evaluate:

* data correctness,
* data completeness,
* consistency,
* transformation correctness,
* duplicate handling,
* synchronization,
* historical data,
* deletion/retention behavior.

```text id="k7x4pq"
Data Area:
<area>

Expected:
<expected>

Evidence:
<evidence>

Finding:
<finding>

Status:
<status>
```

---

# 29. Migration Readiness Review

If applicable, evaluate:

* migration preparation,
* compatibility,
* data migration,
* reconciliation,
* synchronization,
* cutover,
* rollback,
* recovery,
* legacy coexistence,
* retirement.

Migration must be evaluated as a controlled transition rather than simply a deployment step.

---

# 30. Cutover Readiness

```text
Cutover:
<cutover>

Preconditions:
<conditions>

Validation:
<validation>

Go Criteria:
<criteria>

No-Go Criteria:
<criteria>

Rollback:
<rollback>

Status:
<status>
```

---

# 31. Rollback Readiness

Determine whether rollback is:

* verified,
* partially verified,
* conditionally available,
* unavailable.

```text id="v6m9pk"
Rollback Capability:
<capability>

Evidence:
<evidence>

Limitations:
<limitations>

Status:
<status>
```

Rollback limitations must be visible to the decision authority.

---

# 32. Forward Recovery Readiness

Where rollback is unavailable or insufficient:

```text
Failure:
<failure>

Recovery:
<recovery>

Evidence:
<evidence>

Data Impact:
<impact>

Status:
<status>
```

---

# 33. Infrastructure Readiness Review

Confirm the Infrastructure Readiness outcome.

```text
Infrastructure Review:
<reference>

Outcome:
<READY / READY_WITH_RISKS / INCOMPLETE / BLOCKED>

Release Impact:
<impact>

Open Findings:
<findings>
```

Infrastructure readiness is necessary where infrastructure is release-critical, but does not by itself establish release readiness.

---

# 34. Deployment Readiness

Evaluate:

* artifact availability,
* deployment sequence,
* configuration,
* secrets,
* environment,
* health checks,
* compatibility,
* validation,
* rollback,
* deployment observability.

```text id="r5x8vp"
Deployment Area:
<area>

Expected:
<expected>

Evidence:
<evidence>

Status:
<status>
```

---

# 35. Runtime Readiness

Verify relevant:

* startup,
* readiness,
* shutdown,
* dependency behavior,
* resource handling,
* concurrency,
* cancellation,
* failure handling,
* recovery.

---

# 36. Operational Readiness

Evaluate whether the system can be:

* operated,
* observed,
* diagnosed,
* maintained,
* secured,
* recovered.

Review:

* operational ownership,
* monitoring,
* alerting,
* incident handling,
* privileged access,
* maintenance,
* recovery,
* reconciliation.

---

# 37. Observability Readiness

Verify that release-specific behavior remains observable enough to support:

* detection,
* diagnosis,
* verification,
* incident response,
* security investigation,
* recovery.

Avoid equating telemetry volume with observability quality.

---

# 38. Dependency Readiness

Review critical dependencies.

```text id="k8m5pq"
Dependency:
<dependency>

Required:
<yes/no>

Available:
<yes/no>

Compatible:
<yes/no>

Failure Behavior:
<behavior>

Evidence:
<evidence>
```

---

# 39. External Dependency Readiness

For external systems verify, where applicable:

* connectivity,
* compatibility,
* authentication,
* authorization,
* availability,
* failure handling,
* contractual expectations,
* operational dependency.

Undocumented external behavior must not be treated as guaranteed.

---

# 40. Environment Readiness

Evaluate the target environment for:

* required infrastructure,
* configuration,
* secrets,
* certificates,
* connectivity,
* dependencies,
* observability,
* security controls,
* compatibility.

Do not assume environment equivalence without evidence.

---

# 41. Configuration Readiness

Verify:

* required configuration,
* defaults,
* precedence,
* secrets,
* environment differences,
* validation,
* runtime behavior.

Hidden configuration differences are release risks.

---

# 42. Release Risk Review

Create the release risk register.

| ID    | Risk     | Severity     | Mitigation     | Accepted   | Authority     | Status     |
| ----- | -------- | ------------ | -------------- | ---------- | ------------- | ---------- |
| R-001 | `<risk>` | `<severity>` | `<mitigation>` | `<yes/no>` | `<authority>` | `<status>` |

---

# 43. Blocking Conditions

A blocking condition prevents `GO`.

Possible examples:

* critical requirement not satisfied,
* critical security expectation not satisfied,
* unacceptable data integrity risk,
* incompatible critical contract,
* failed migration validation,
* unavailable critical dependency,
* unverified critical recovery path,
* infrastructure blocker,
* unauthorized architecture change,
* missing mandatory approval.

```text id="v7m3pk"
Blocking Condition:
<condition>

Evidence:
<evidence>

Impact:
<impact>

Required Resolution:
<resolution>

Status:
<OPEN / RESOLVED>
```

---

# 44. Non-Blocking Findings

```text id="r6x9pq"
Finding:
<finding>

Severity:
<INFO / WARNING / SIGNIFICANT>

Impact:
<impact>

Mitigation:
<mitigation>

Accepted:
<yes/no>

Authority:
<authority>
```

Non-blocking must never mean “ignored”.

---

# 45. Release Unknowns Review

Evaluate remaining unknowns.

```text
Unknown:
<unknown>

Impact:
<impact>

Decision Consequence:
<consequence>

Irreversibility:
<level>

Blocking:
<yes/no>

Resolution:
<resolution>
```

Unknowns with high consequence and low reversibility should generally prevent progression until appropriately resolved or governed.

---

# 46. Release Assumption Review

Review assumptions that materially affect the release.

```text id="k5m7vp"
Assumption:
<assumption>

Validated:
<yes/no>

Evidence:
<evidence>

Impact if False:
<impact>

Status:
<status>
```

---

# 47. Release Dependency Graph

Identify dependencies among:

```text
Release
 ├── Product
 ├── Domain
 ├── Architecture
 ├── Contracts
 ├── ADRs
 ├── Specifications
 ├── Infrastructure
 ├── External Systems
 ├── Data
 ├── Security
 └── Operations
```

A dependency that is not ready may block the release even when the release candidate itself is technically complete.

---

# 48. Traceability Review

Verify critical relationships:

```text
Release
  ↓
Change
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
```

---

# 49. Traceability Findings

| Relationship            | Status     | Finding     | Action     |
| ----------------------- | ---------- | ----------- | ---------- |
| Release → Requirement   | `<status>` | `<finding>` | `<action>` |
| Release → Architecture  | `<status>` | `<finding>` | `<action>` |
| Release → Contract      | `<status>` | `<finding>` | `<action>` |
| Release → Specification | `<status>` | `<finding>` | `<action>` |
| Release → Verification  | `<status>` | `<finding>` | `<action>` |

---

# 50. Current / Target / Transition Review

For existing systems:

```text
Current:
<current state>

Transition:
<transition state>

Target:
<target state>
```

Verify that the release does not accidentally confuse:

* current behavior,
* transitional behavior,
* target behavior.

---

# 51. Release Architecture Drift

Identify architectural behavior introduced by the release that was not part of the approved baseline.

```text id="v8m4pq"
Observed Drift:
<drift>

Architectural Impact:
<impact>

Governed:
<yes/no>

Required Action:
<action>
```

Unreviewed architecture changes must trigger feedback to Architecture / ADR governance.

---

# 52. Release Contract Drift

Identify contract behavior that differs from approved contracts.

```text
Contract:
<contract>

Expected:
<expected>

Actual:
<actual>

Impact:
<impact>

Action:
<action>
```

---

# 53. Release Specification Drift

Identify material differences between approved specifications and implementation.

```text
Specification:
<specification>

Expected:
<expected>

Actual:
<actual>

Severity:
<severity>

Action:
<action>
```

---

# 54. Release Evidence Matrix

| Readiness Area | Required   | Evidence     | Result     | Blocking   |
| -------------- | ---------- | ------------ | ---------- | ---------- |
| Product        | `<yes/no>` | `<evidence>` | `<result>` | `<yes/no>` |
| Domain         | `<yes/no>` | `<evidence>` | `<result>` | `<yes/no>` |
| Architecture   | `<yes/no>` | `<evidence>` | `<result>` | `<yes/no>` |
| Contracts      | `<yes/no>` | `<evidence>` | `<result>` | `<yes/no>` |
| Security       | `<yes/no>` | `<evidence>` | `<result>` | `<yes/no>` |
| Data           | `<yes/no>` | `<evidence>` | `<result>` | `<yes/no>` |
| Verification   | `<yes/no>` | `<evidence>` | `<result>` | `<yes/no>` |
| Infrastructure | `<yes/no>` | `<evidence>` | `<result>` | `<yes/no>` |
| Deployment     | `<yes/no>` | `<evidence>` | `<result>` | `<yes/no>` |
| Operations     | `<yes/no>` | `<evidence>` | `<result>` | `<yes/no>` |
| Migration      | `<yes/no>` | `<evidence>` | `<result>` | `<yes/no>` |
| Recovery       | `<yes/no>` | `<evidence>` | `<result>` | `<yes/no>` |

---

# 55. Readiness Dimensions

Evaluate readiness across the following dimensions:

| Dimension      | Result     | Evidence     | Findings     |
| -------------- | ---------- | ------------ | ------------ |
| Product        | `<result>` | `<evidence>` | `<findings>` |
| Domain         | `<result>` | `<evidence>` | `<findings>` |
| Architecture   | `<result>` | `<evidence>` | `<findings>` |
| Contracts      | `<result>` | `<evidence>` | `<findings>` |
| Security       | `<result>` | `<evidence>` | `<findings>` |
| Data           | `<result>` | `<evidence>` | `<findings>` |
| Verification   | `<result>` | `<evidence>` | `<findings>` |
| Infrastructure | `<result>` | `<evidence>` | `<findings>` |
| Deployment     | `<result>` | `<evidence>` | `<findings>` |
| Operations     | `<result>` | `<evidence>` | `<findings>` |
| Migration      | `<result>` | `<evidence>` | `<findings>` |
| Recovery       | `<result>` | `<evidence>` | `<findings>` |

Not every dimension is mandatory for every release.

---

# 56. Readiness Classification

Use:

```text
READY
READY_WITH_RISKS
INCOMPLETE
BLOCKED
NOT_REQUIRED
```

```text
Overall Review Outcome:
<outcome>

Reason:
<reason>

Critical Findings:
<findings>

Evidence:
<evidence>
```

---

# 57. Release Decision

```text
Release Decision:
<GO / GO_WITH_RISKS / NO_GO / DEFERRED / CANCELLED>

Decision Authority:
<authority>

Decision Date:
<date>

Rationale:
<rationale>
```

The decision authority must be explicitly identified.

---

# 58. Go Criteria

A `GO` decision requires, at minimum:

* applicable critical requirements satisfied,
* critical domain behavior verified,
* architecture baseline respected,
* critical contracts compatible,
* security expectations satisfied,
* critical data risks controlled,
* required infrastructure ready,
* required operational capabilities available,
* required verification evidence available,
* no unresolved blocking condition,
* required approvals obtained.

The exact criteria must be adapted to the release.

---

# 59. Go With Risks Criteria

`GO_WITH_RISKS` requires:

* risks explicitly identified,
* risks are non-blocking,
* impact understood,
* mitigation available where appropriate,
* residual risk explicitly accepted,
* acceptance authority identified,
* no critical requirement is silently waived.

---

# 60. No-Go Criteria

`NO_GO` should be selected when one or more conditions make progression unsafe or unauthorized.

Examples:

* unresolved blocking condition,
* insufficient critical evidence,
* unacceptable security exposure,
* unacceptable data integrity risk,
* critical incompatibility,
* failed migration,
* unavailable critical dependency,
* unverified critical recovery capability,
* unauthorized architectural change,
* missing required authority.

---

# 61. Deferred Decision

A release may be deferred when:

* evidence is incomplete,
* dependencies are not ready,
* required approval is pending,
* a non-critical issue requires additional analysis,
* release timing must change.

```text
Deferred Reason:
<reason>

Required Before Reassessment:
<conditions>

Reassessment Point:
<date / event>
```

---

# 62. Release Waivers

A waiver must be explicit.

```text
Waiver ID:
<id>

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

Expiration / Review Point:
<point>
```

No waiver should silently override a blocking requirement.

---

# 63. Final Findings

### Blocking Findings

```text
<findings>
```

### Significant Findings

```text
<findings>
```

### Non-Blocking Findings

```text
<findings>
```

### Accepted Risks

```text
<risks>
```

### Open Unknowns

```text
<unknowns>
```

---

# 64. Post-Decision Actions

```text
Action:
<action>

Owner:
<owner>

Due:
<date>

Reason:
<reason>

Related Finding:
<finding>
```

A `GO` decision does not eliminate post-release responsibilities.

---

# 65. Release Handoff

### If GO

Handoff to:

* deployment execution,
* release communication,
* operational monitoring,
* post-release validation,
* incident readiness,
* release evidence retention.

### If GO_WITH_RISKS

Additionally hand off:

* accepted risks,
* mitigations,
* monitoring requirements,
* risk owners,
* review dates.

### If NO_GO

Handoff to:

* blocking issue resolution,
* affected lifecycle phase,
* reassessment.

---

# 66. Feedback to Previous Lifecycle Phases

Release review may identify issues that invalidate earlier artifacts.

```text
Finding:
<finding>

Affected Phase:
<phase>

Affected Artifact:
<artifact>

Reason:
<reason>

Required Action:
<action>
```

Possible targets:

* Product Discovery
* Domain Discovery
* Architecture
* Contracts
* Architecture Decisions
* Specifications
* Infrastructure

The lifecycle must be allowed to move backward when evidence requires it.

---

# 67. Lifecycle Completion

The lifecycle is considered complete for the release when:

* release scope is evaluated,
* applicable expectations are verified,
* relevant contracts are compatible,
* architecture remains governed,
* required specifications are satisfied,
* infrastructure is ready,
* operational requirements are satisfied,
* migration requirements are satisfied where applicable,
* release risks are governed,
* evidence is traceable,
* release authority has made the decision,
* final findings and actions are recorded.

Lifecycle completion does not mean the system stops evolving.

---

# 68. Post-Release Feedback

After release, collect evidence concerning:

* actual behavior,
* operational behavior,
* incidents,
* performance,
* reliability,
* user outcomes,
* data quality,
* security,
* contract behavior,
* migration results.

Post-release evidence may trigger a new lifecycle iteration.

---

# 69. Release Traceability Closure

Record the final release relationship:

```text
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
ADR
      ↓
Specification
      ↓
Implementation
      ↓
Verification
      ↓
Release Decision
      ↓
Post-Release Evidence
```

Any unresolved critical traceability gap must be explicitly recorded.

---

# 70. Agent Instructions

When performing Release Readiness Review:

1. Identify the exact release candidate.
2. Validate the release scope.
3. Validate applicable baselines.
4. Review affected requirements.
5. Review affected domain behavior.
6. Review architecture conformance.
7. Review applicable ADRs.
8. Review contract compatibility.
9. Review specification conformance.
10. Review verification evidence.
11. Review security readiness.
12. Review data readiness.
13. Review infrastructure readiness.
14. Review deployment readiness.
15. Review runtime readiness.
16. Review operational readiness.
17. Review migration readiness where applicable.
18. Review rollback and recovery.
19. Review external dependencies.
20. Identify blocking conditions.
21. Identify non-blocking findings.
22. Identify remaining unknowns.
23. Evaluate accepted risks.
24. Verify traceability.
25. Distinguish current, transition, and target states.
26. Detect architecture, contract, and specification drift.
27. Do not invent missing evidence.
28. Do not convert recommendations into decisions.
29. Do not silently accept risks.
30. Do not invent approval authority.
31. Do not create new architecture decisions inside the release review.
32. Trigger feedback when evidence invalidates previous lifecycle assumptions.
33. Produce an explicit review outcome.
34. Keep the final release decision separate from the evidence assessment.

---

# 71. Anti-Patterns

## Checklist Completion = Readiness

A completed checklist is not evidence of readiness.

## Tests Pass = GO

Tests are one evidence source among several.

## Deployment Success = GO

A deployment can succeed while the release remains operationally unsafe.

## No Critical Errors = GO

Absence of observed errors does not establish correctness.

## Risk Suppression

Hiding or minimizing known risks invalidates the review.

## Silent Waiver

A waiver without authority is not a valid waiver.

## Silent Decision Creation

The release review must not invent architecture, product, security, or operational policy.

## Latest Code = Truth

Current implementation is evidence, but not automatically the approved target.

## Documentation = Evidence

A document claiming readiness is not itself proof of readiness.

## Historical Test Evidence

Old evidence may not represent the current release candidate.

## Environment Assumption

Evidence from one environment does not automatically prove readiness in another.

## Rollback Myth

Rollback must be understood and verified according to its actual limitations.

## Happy-Path Release

Important failure, recovery, security, migration, and compatibility behavior must be considered.

## Architecture by Release

Release constraints must not silently become permanent architecture.

## Scope Creep

Unrelated changes must not enter release readiness merely because they exist in the candidate.

## Risk by Number

A numeric score must not replace qualitative judgment.

## Gate by Ceremony

The gate exists to reduce release uncertainty, not to generate paperwork.

## Forced GO

The agent must never optimize for release progression at the expense of evidence quality.

---

# 72. Safe Progression Question

Before finalizing the release decision:

> **Is the release sufficiently verified, traceable, secure, compatible, operationally prepared, infrastructure-ready, and governed by explicit evidence and risk acceptance that the authorized decision maker can safely choose GO, GO_WITH_RISKS, or NO_GO without relying on invented or unresolved system semantics?**

If not, identify the smallest unresolved issue or lifecycle phase that must be revisited.

---

# 73. Final Principle

> **Release Readiness Review is the final evidence-based gate of the Spec-Gated Architecture Lifecycle. It does not prove that a system is perfect; it establishes whether the known system state, approved expectations, available evidence, operational capability, and governed risks are sufficient for an authorized release decision.**

The complete lifecycle is:

```text
Product Discovery
       ↓
Domain Discovery / DDD
       ↓
Architecture / C4
       ↓
Contracts
       ↓
Architecture Decisions / ADR
       ↓
Specifications / SDD
       ↓
Infrastructure
       ↓
Release Readiness Context
       ↓
Release Readiness Review
       ↓
GO / GO_WITH_RISKS / NO_GO
       ↓
Post-Release Evidence
       ↺
Continuous Architecture Evolution
```

The lifecycle therefore ends not with deployment, but with a governed decision and a traceable feedback loop into future evolution.
