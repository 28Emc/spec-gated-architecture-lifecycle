# Infrastructure Readiness Review

## 1. Document Metadata

| Field                        | Value                           |
| ---------------------------- | ------------------------------- |
| Document Type                | Infrastructure Readiness Review |
| Lifecycle Phase              | Infrastructure                  |
| Review Type                  | `INFRASTRUCTURE_READINESS`      |
| Status                       | `DRAFT`                         |
| Version                      | `0.1`                           |
| System                       | `<system>`                      |
| Scope                        | `<scope>`                       |
| Reviewer                     | `<reviewer>`                    |
| Created                      | `<date>`                        |
| Last Updated                 | `<date>`                        |
| Infrastructure Context       | `<document>`                    |
| Infrastructure Specification | `<document>`                    |
| Architecture Baseline        | `<baseline>`                    |
| Specification Baseline       | `<baseline>`                    |

---

# 2. Purpose

This document is the final readiness checkpoint for the Infrastructure phase.

It determines whether the infrastructure baseline is sufficiently:

* defined,
* coherent,
* secure,
* observable,
* recoverable where required,
* compatible with runtime and deployment,
* traceable,
* verifiable,
* operationally viable,
* and aligned with approved architecture, contracts, decisions, and specifications.

This review evaluates the infrastructure baseline as a whole.

It does not replace the Infrastructure Context or Infrastructure Specification.

---

# 3. Core Principle

> **Infrastructure Readiness means that the infrastructure required by the approved system can be provisioned, operated, secured, observed, recovered, changed, and verified without introducing unresolved architectural semantics.**

Infrastructure readiness is not equivalent to:

* infrastructure resources existing,
* a cloud account existing,
* an IaC repository existing,
* deployment succeeding once,
* monitoring dashboards existing,
* backups completing,
* or documentation being complete.

---

# 4. Fundamental Distinctions

## Architecture Readiness

Determines whether the system architecture is sufficiently understood.

## Specification Readiness

Determines whether implementation behavior is sufficiently specified.

## Infrastructure Readiness

Determines whether the execution environment can reliably support the approved system.

## Release Readiness

Determines whether the complete system is ready to be released or promoted.

These are separate gates.

---

# 5. Review Entry Conditions

Before beginning this review:

* [ ] Infrastructure Context is accepted.
* [ ] Infrastructure Specification is accepted.
* [ ] Architecture baseline is available.
* [ ] Specification baseline is available.
* [ ] Runtime requirements are available.
* [ ] Deployment requirements are available.
* [ ] Security requirements are available.
* [ ] Observability requirements are available.
* [ ] Operational requirements are available.
* [ ] Recovery requirements are available where applicable.
* [ ] Infrastructure dependencies are identified.
* [ ] Infrastructure verification strategy exists.

---

# 6. Infrastructure Baseline

```text id="r6m8vp"
Infrastructure Baseline:
<baseline>

Included Resources:
<resources>

Environments:
<environments>

Dependencies:
<dependencies>

Security:
<summary>

Observability:
<summary>

Recovery:
<summary>

Verification:
<summary>
```

---

# 7. Infrastructure Inventory

| Resource     | Capability     | Environment     | Owner     | Criticality     | Status     |
| ------------ | -------------- | --------------- | --------- | --------------- | ---------- |
| `<resource>` | `<capability>` | `<environment>` | `<owner>` | `<criticality>` | `<status>` |

Verify that every critical infrastructure resource has:

* purpose,
* consumer,
* owner,
* lifecycle,
* dependencies,
* failure behavior,
* verification.

---

# 8. Capability Coverage

Evaluate whether all required infrastructure capabilities are provided.

| Capability    | Required   | Provided   | Verified   | Gap     |
| ------------- | ---------- | ---------- | ---------- | ------- |
| Compute       | `<yes/no>` | `<yes/no>` | `<yes/no>` | `<gap>` |
| Storage       | `<yes/no>` | `<yes/no>` | `<yes/no>` | `<gap>` |
| Networking    | `<yes/no>` | `<yes/no>` | `<yes/no>` | `<gap>` |
| Identity      | `<yes/no>` | `<yes/no>` | `<yes/no>` | `<gap>` |
| Secrets       | `<yes/no>` | `<yes/no>` | `<yes/no>` | `<gap>` |
| Observability | `<yes/no>` | `<yes/no>` | `<yes/no>` | `<gap>` |
| Backup        | `<yes/no>` | `<yes/no>` | `<yes/no>` | `<gap>` |
| Recovery      | `<yes/no>` | `<yes/no>` | `<yes/no>` | `<gap>` |

---

# 9. Architecture Alignment

Verify infrastructure alignment with:

* system boundaries,
* containers,
* components,
* data ownership,
* integration boundaries,
* runtime architecture,
* security boundaries,
* operational responsibilities.

```text id="k8m4pq"
Architecture Element:
<element>

Infrastructure Resource:
<resource>

Relationship:
<supports / constrains / hosts / connects / protects>

Aligned:
<yes/no>

Finding:
<finding>
```

Infrastructure must not create architectural boundaries merely because they are convenient to deploy.

---

# 10. Domain Preservation

Verify that infrastructure does not redefine:

* domain ownership,
* bounded contexts,
* business rules,
* aggregates,
* invariants,
* domain events,
* semantic ownership.

```text id="r7x3mk"
Domain Concept:
<concept>

Infrastructure Influence:
<influence>

Semantic Integrity:
<preserved / affected / unclear>

Action:
<action>
```

---

# 11. Contract Alignment

Verify compatibility with:

* API Contracts,
* Event Contracts,
* Data Contracts,
* Security Contracts,
* Observability Contracts.

```text id="v5m9pq"
Contract:
<contract>

Infrastructure Dependency:
<dependency>

Expected Behavior:
<behavior>

Compatible:
<yes/no>

Finding:
<finding>
```

---

# 12. Specification Alignment

Review infrastructure against:

* Runtime Specification,
* Deployment Specification,
* Data/Persistence Specification,
* Security Specification,
* Observability Specification,
* Integration Specification,
* Configuration Specification,
* Migration Specification,
* Operational Specification.

```text id="k6x4vp"
Specification:
<specification>

Infrastructure Requirement:
<requirement>

Implemented:
<yes/no>

Verified:
<yes/no>

Gap:
<gap>
```

---

# 13. Architecture Decision Alignment

Verify that infrastructure preserves accepted ADRs.

```text id="r8m5pk"
ADR:
<ADR>

Infrastructure Impact:
<impact>

Decision Preserved:
<yes/no>

Conflict:
<conflict>

Action:
<action>
```

Infrastructure must not silently reverse accepted architecture decisions.

---

# 14. Infrastructure Decision Review

Identify decisions introduced during infrastructure work.

```text id="v7q4mx"
Decision:
<decision>

Impact:
<impact>

Existing ADR:
<ADR>

New ADR Required:
<yes/no>

Status:
<status>
```

Infrastructure decisions that materially affect architecture must return through architecture decision governance.

---

# 15. Environment Review

For every environment:

* [ ] Purpose is clear.
* [ ] Required resources exist.
* [ ] Security boundaries are defined.
* [ ] Dependencies are known.
* [ ] Observability exists.
* [ ] Configuration is controlled.
* [ ] Differences from other environments are understood.
* [ ] Differences that affect behavior are explicit.

```text id="k9m3vp"
Environment:
<environment>

Readiness:
<READY / NOT_READY / READY_WITH_RISKS>

Finding:
<finding>
```

---

# 16. Environment Parity

Environment differences should be intentional.

Review:

* runtime,
* network,
* identity,
* storage,
* dependencies,
* observability,
* configuration,
* resource characteristics.

```text id="r5x8mk"
Difference:
<difference>

Expected:
<yes/no>

Behavioral Impact:
<impact>

Risk:
<risk>
```

---

# 17. Compute Readiness

Verify:

* runtime can execute,
* lifecycle behavior is supported,
* required resources exist,
* failure behavior is understood,
* scaling behavior is supported where required,
* isolation is sufficient,
* recovery is possible where required.

---

# 18. Storage Readiness

Verify:

* storage exists,
* data ownership is preserved,
* durability requirements are supported,
* access is controlled,
* lifecycle is supported,
* backup is available where required,
* restore is verifiable where required.

---

# 19. Database Readiness

Where databases are required:

* [ ] Database infrastructure exists.
* [ ] Connectivity works.
* [ ] Security is configured.
* [ ] Data ownership is clear.
* [ ] Backup exists where required.
* [ ] Restore is tested where required.
* [ ] Migration strategy is supported.
* [ ] Failure behavior is understood.
* [ ] Observability exists.

---

# 20. Messaging Readiness

Where messaging infrastructure is required:

* [ ] Messaging capability exists.
* [ ] Publishers can connect.
* [ ] Consumers can connect.
* [ ] Security is configured.
* [ ] Required persistence is supported.
* [ ] Failure behavior is understood.
* [ ] Observability exists.
* [ ] Recovery is understood.

Do not infer delivery guarantees that were never approved.

---

# 21. Networking Readiness

Verify:

* connectivity,
* routing,
* ingress,
* egress,
* DNS,
* service discovery where applicable,
* segmentation,
* certificates,
* required external connectivity.

```text id="v6m4pq"
Network Dependency:
<dependency>

Expected:
<behavior>

Observed:
<behavior>

Status:
<status>
```

---

# 22. Security Infrastructure Readiness

Verify:

* identity infrastructure,
* workload/service identity,
* authentication dependencies,
* authorization support,
* secret management,
* certificate management,
* privileged access,
* network controls,
* infrastructure audit.

Security readiness must be evaluated against approved security expectations.

---

# 23. Secret Management Readiness

Verify:

* secrets are not embedded in source,
* secrets are not exposed in logs,
* access is restricted,
* lifecycle is defined,
* rotation is supported where required,
* failure behavior is understood.

```text id="k7m5vp"
Secret Category:
<secret>

Storage:
<storage>

Access:
<access>

Rotation:
<requirement>

Verified:
<yes/no>
```

---

# 24. Certificate Readiness

Where certificates are required:

* [ ] Certificates can be issued.
* [ ] Certificates can be distributed.
* [ ] Renewal is defined.
* [ ] Expiration is observable.
* [ ] Revocation is supported where required.
* [ ] Failure behavior is understood.

---

# 25. Observability Readiness

Verify infrastructure can provide required:

* metrics,
* logs,
* traces,
* health signals,
* resource signals,
* dependency signals,
* security signals,
* recovery signals.

```text id="r8m3pq"
Operational Question:
<question>

Infrastructure Signal:
<signal>

Available:
<yes/no>

Verified:
<yes/no>
```

---

# 26. Backup Readiness

Backup readiness requires more than backup existence.

Verify:

* backup scope,
* scheduling,
* protection,
* retention,
* monitoring,
* failure detection,
* access control,
* restore capability.

---

# 27. Restore Readiness

Where recovery depends on restore:

```text id="v5x9mk"
Restore Scenario:
<scenario>

Backup Source:
<source>

Restore Target:
<target>

Validation:
<validation>

Evidence:
<evidence>

Status:
<status>
```

A backup that cannot be restored reliably is not sufficient recovery evidence.

---

# 28. Recovery Readiness

Verify applicable recovery scenarios:

* resource failure,
* workload failure,
* storage failure,
* network failure,
* dependency failure,
* infrastructure replacement,
* environment recovery,
* migration failure.

```text id="k6m4vp"
Failure:
<failure>

Recovery Capability:
<capability>

Verified:
<yes/no>

Evidence:
<evidence>
```

---

# 29. Failure Domain Review

Identify whether infrastructure failure domains are understood.

```text id="r7x5pq"
Failure Domain:
<domain>

Resources:
<resources>

Failure Impact:
<impact>

Isolation:
<verified / unverified>

Recovery:
<behavior>
```

---

# 30. Resilience Readiness

Evaluate whether required resilience behavior is actually supported.

Do not assume:

* replication = resilience,
* redundancy = failover,
* failover = recovery,
* backup = resilience,
* autoscaling = availability.

Each property requires evidence.

---

# 31. Capacity Readiness

Verify that capacity expectations are:

* requirement-based,
* measurable,
* monitored,
* compatible with infrastructure,
* reviewed for exhaustion behavior.

Do not invent thresholds during the review.

---

# 32. Resource Exhaustion Readiness

Verify expected behavior when resources become constrained.

Consider:

* compute,
* memory,
* storage,
* connections,
* network,
* queues,
* external dependencies.

```text id="v8m3pk"
Resource:
<resource>

Exhaustion:
<condition>

Detection:
<signal>

Behavior:
<behavior>

Recovery:
<recovery>

Verified:
<yes/no>
```

---

# 33. Deployment Compatibility

Verify compatibility between infrastructure and deployment.

Review:

* startup,
* readiness,
* shutdown,
* deployment ordering,
* connectivity,
* artifact compatibility,
* configuration,
* secrets,
* rollback.

```text id="k5x9vp"
Deployment Requirement:
<requirement>

Infrastructure Support:
<support>

Verified:
<yes/no>

Finding:
<finding>
```

---

# 34. Runtime Compatibility

Verify infrastructure supports:

* runtime lifecycle,
* concurrency,
* resource requirements,
* dependency behavior,
* graceful shutdown,
* recovery,
* observability.

---

# 35. Configuration Readiness

Verify:

* required configuration exists,
* defaults are known,
* environment-specific configuration is controlled,
* secrets are protected,
* configuration validation exists,
* configuration changes are governed.

---

# 36. Operational Readiness

Verify infrastructure supports:

* monitoring,
* alerting,
* incident diagnosis,
* maintenance,
* upgrades,
* privileged operations,
* backup,
* restore,
* recovery,
* infrastructure changes.

---

# 37. Infrastructure Change Readiness

Infrastructure changes should have:

* ownership,
* impact assessment,
* validation,
* rollback or recovery strategy,
* observability,
* authorization.

```text id="r6m8pq"
Change:
<change>

Impact:
<impact>

Validation:
<validation>

Rollback:
<rollback>

Owner:
<owner>
```

---

# 38. Infrastructure Drift

Compare:

```text id="v7x4mk"
Approved Infrastructure
        ↓
Provisioned Infrastructure
        ↓
Observed Infrastructure
```

Identify:

* configuration drift,
* resource drift,
* network drift,
* security drift,
* environment drift.

---

# 39. Existing System Review

For existing systems:

```text id="k8m3vp"
Documented State:
<state>

Observed State:
<state>

Target State:
<state>

Critical Difference:
<difference>

Action:
<action>
```

Observed infrastructure has priority over outdated historical documentation when determining actual state.

---

# 40. Migration Infrastructure Readiness

Where migration exists:

* [ ] Current infrastructure understood.
* [ ] Target infrastructure understood.
* [ ] Coexistence supported.
* [ ] Connectivity transition supported.
* [ ] Data transition supported.
* [ ] Identity transition supported.
* [ ] Observability preserved.
* [ ] Cutover supported.
* [ ] Rollback/recovery understood.
* [ ] Legacy retirement addressed.

---

# 41. Infrastructure Verification

Every critical infrastructure requirement should have verification evidence.

```text id="r5m9pq"
Requirement:
<requirement>

Verification:
<verification>

Evidence:
<evidence>

Status:
<PASSED / FAILED / NOT_EXECUTED>
```

---

# 42. Verification Evidence Quality

Evidence should be:

* relevant,
* reproducible,
* attributable,
* recent enough for the decision,
* representative,
* traceable.

A successful one-time deployment does not prove long-term infrastructure readiness.

---

# 43. Infrastructure Test Coverage

Evaluate coverage of:

| Area          | Specified  | Tested     | Evidence     | Gap     |
| ------------- | ---------- | ---------- | ------------ | ------- |
| Compute       | `<yes/no>` | `<yes/no>` | `<evidence>` | `<gap>` |
| Storage       | `<yes/no>` | `<yes/no>` | `<evidence>` | `<gap>` |
| Network       | `<yes/no>` | `<yes/no>` | `<evidence>` | `<gap>` |
| Security      | `<yes/no>` | `<yes/no>` | `<evidence>` | `<gap>` |
| Backup        | `<yes/no>` | `<yes/no>` | `<evidence>` | `<gap>` |
| Recovery      | `<yes/no>` | `<yes/no>` | `<evidence>` | `<gap>` |
| Observability | `<yes/no>` | `<yes/no>` | `<evidence>` | `<gap>` |

---

# 44. Infrastructure Risks

```text id="v6m4pk"
Risk:
<risk>

Severity:
<INFO / WARNING / SIGNIFICANT / BLOCKING>

Impact:
<impact>

Mitigation:
<mitigation>

Accepted:
<yes/no>
```

---

# 45. Infrastructure Unknowns

```text id="k7m5vp"
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

---

# 46. Infrastructure Assumptions

```text id="r8x3mk"
Assumption:
<assumption>

Evidence:
<evidence>

Confidence:
<confidence>

Impact:
<impact>

Validated:
<yes/no>
```

---

# 47. Infrastructure Contradictions

Review contradictions between:

* architecture,
* specifications,
* infrastructure context,
* infrastructure specification,
* actual infrastructure,
* operational behavior.

```text id="v5m9pq"
Contradiction:
<contradiction>

Sources:
<sources>

Severity:
<severity>

Resolution:
<resolution>
```

---

# 48. Infrastructure Gaps

Classification:

* `MISSING`
* `INCOMPLETE`
* `CONFLICTING`
* `STALE`
* `UNSUPPORTED`
* `OVER-SPECIFIED`
* `UNDER-SPECIFIED`
* `DUPLICATED`
* `ORPHANED`

```text id="k6x4vp"
Gap:
<gap>

Classification:
<classification>

Severity:
<severity>

Action:
<action>
```

---

# 49. Infrastructure Debt

Infrastructure debt may include:

* undocumented resources,
* manual provisioning,
* environment drift,
* untested recovery,
* missing observability,
* unsupported dependencies,
* obsolete infrastructure,
* unclear ownership,
* undocumented security boundaries.

```text id="r7m8pq"
Debt:
<debt>

Impact:
<impact>

Priority:
<priority>

Remediation:
<remediation>
```

---

# 50. Infrastructure Ownership Review

Every critical infrastructure capability should have a known responsibility boundary.

```text id="v8m3pk"
Capability:
<capability>

Owner:
<owner>

Operational Responsibility:
<responsibility>

Escalation:
<path>

Known:
<yes/no>
```

Do not invent organizational ownership.

---

# 51. Provider Dependency Review

Where external infrastructure providers are used:

* [ ] Dependency is explicit.
* [ ] Provider responsibility is known.
* [ ] Failure behavior is understood.
* [ ] Security implications are understood.
* [ ] Data implications are understood.
* [ ] Operational dependency is understood.
* [ ] Exit or migration implications are known where material.

---

# 52. Vendor / Platform Lock-In Review

Identify whether infrastructure choices create material lock-in.

```text id="k5x8vp"
Dependency:
<dependency>

Lock-In:
<LOW / MEDIUM / HIGH>

Reason:
<reason>

Reversibility:
<reversibility>

Accepted:
<yes/no>
```

Lock-in is not automatically a defect.

It must be intentional when consequential.

---

# 53. Infrastructure Cost Readiness

Where cost is a material constraint:

* [ ] Cost drivers are understood.
* [ ] Infrastructure choices respect approved constraints.
* [ ] Scaling behavior is understood.
* [ ] Shared-resource implications are understood.
* [ ] Cost risks are visible.

Do not invent cost estimates without evidence.

---

# 54. Infrastructure Compliance Readiness

Where compliance applies:

* [ ] Data requirements are satisfied.
* [ ] Access requirements are satisfied.
* [ ] Retention requirements are supported.
* [ ] Audit requirements are supported.
* [ ] Residency requirements are supported.
* [ ] Required evidence exists.

---

# 55. Security Failure Readiness

Verify infrastructure behavior for:

* invalid credentials,
* unauthorized access,
* secret access failure,
* certificate failure,
* network isolation failure,
* privileged operation failure.

Security failure behavior must remain observable without leaking sensitive information.

---

# 56. Operational Failure Readiness

Verify:

* infrastructure failures are detectable,
* alerts are actionable,
* recovery paths are known,
* operational ownership exists,
* infrastructure changes are controlled.

---

# 57. Infrastructure Baseline Stability

```text id="r6m9pq"
Baseline:
<baseline>

Stability:
<STABLE / CHANGING / UNSTABLE>

Reason:
<reason>

Impact:
<impact>
```

Infrastructure does not need to be permanently frozen.

It must be sufficiently stable for the next lifecycle phase.

---

# 58. Infrastructure Readiness Dimensions

| Dimension                | Status     | Evidence     |
| ------------------------ | ---------- | ------------ |
| Capability               | `<status>` | `<evidence>` |
| Architecture Alignment   | `<status>` | `<evidence>` |
| Runtime Compatibility    | `<status>` | `<evidence>` |
| Deployment Compatibility | `<status>` | `<evidence>` |
| Security                 | `<status>` | `<evidence>` |
| Data                     | `<status>` | `<evidence>` |
| Networking               | `<status>` | `<evidence>` |
| Availability             | `<status>` | `<evidence>` |
| Resilience               | `<status>` | `<evidence>` |
| Recovery                 | `<status>` | `<evidence>` |
| Observability            | `<status>` | `<evidence>` |
| Operations               | `<status>` | `<evidence>` |
| Verification             | `<status>` | `<evidence>` |
| Migration                | `<status>` | `<evidence>` |
| Traceability             | `<status>` | `<evidence>` |

---

# 59. Findings

| ID          | Finding     | Severity     | Source     | Action     | Status     |
| ----------- | ----------- | ------------ | ---------- | ---------- | ---------- |
| INFRA-F-001 | `<finding>` | `<severity>` | `<source>` | `<action>` | `<status>` |

Severity:

* `INFO`
* `WARNING`
* `SIGNIFICANT`
* `BLOCKING`

---

# 60. Finding Resolution

```text id="v7m4pk"
Finding:
<INFRA-F-001>

Resolution:
<resolution>

Evidence:
<evidence>

Resolved:
<yes/no>

Reviewer:
<reviewer>
```

---

# 61. Blocking Conditions

Examples:

* required infrastructure capability missing,
* critical security boundary unresolved,
* required data storage unavailable,
* required connectivity unavailable,
* critical recovery path unverified,
* deployment incompatible with infrastructure,
* infrastructure introduces unauthorized architecture,
* critical dependency unmanaged,
* infrastructure state materially differs from approved baseline.

```text id="k8x5vp"
Condition:
<condition>

Evidence:
<evidence>

Impact:
<impact>

Required Action:
<action>
```

---

# 62. Non-Blocking Risks

```text id="r5m3pq"
Risk:
<risk>

Impact:
<impact>

Mitigation:
<mitigation>

Owner:
<owner>

Review Point:
<review>
```

---

# 63. Waivers

A readiness gap may be waived only through explicit authorization.

```text id="v6m8pk"
Waiver:

Area:
<area>

Gap:
<gap>

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

Expiration / Review:
<date or condition>
```

No silent infrastructure waivers.

---

# 64. Infrastructure Traceability

Verify:

```text id="k7x4vp"
Requirement
    ↓
Architecture
    ↓
Specification
    ↓
Infrastructure Capability
    ↓
Infrastructure Resource
    ↓
Verification
    ↓
Evidence
```

Critical infrastructure behavior should have this traceability.

---

# 65. Traceability Health

| Relationship                   | Status     | Finding     |
| ------------------------------ | ---------- | ----------- |
| Requirement → Infrastructure   | `<status>` | `<finding>` |
| Architecture → Infrastructure  | `<status>` | `<finding>` |
| Specification → Infrastructure | `<status>` | `<finding>` |
| Security → Infrastructure      | `<status>` | `<finding>` |
| Infrastructure → Verification  | `<status>` | `<finding>` |
| Infrastructure → Evidence      | `<status>` | `<finding>` |

Possible states:

* `VALID`
* `INFERRED`
* `MISSING`
* `STALE`
* `CONFLICTING`
* `SUPERSEDED`
* `UNKNOWN`

---

# 66. Infrastructure Handoff to Release Readiness

### Release Readiness May Assume

* required infrastructure exists,
* critical infrastructure behavior is verified,
* deployment dependencies are understood,
* security infrastructure is ready,
* observability is ready,
* recovery requirements are understood,
* critical operational dependencies are known.

### Release Readiness Must Preserve

* architecture,
* contracts,
* security expectations,
* operational expectations,
* data integrity,
* recovery requirements.

### Release Readiness Must Not Assume

* infrastructure availability that was never verified,
* recovery capability that was never tested,
* security guarantees that were never validated,
* capacity that was never evidenced.

---

# 67. Infrastructure-to-Release Handoff Contract

```text id="r8m5pq"
Infrastructure Baseline:
<baseline>

Verified Capabilities:
<list>

Known Limitations:
<list>

Accepted Risks:
<list>

Open Questions:
<list>

Required Operational Controls:
<list>

Required Release Verification:
<list>
```

---

# 68. Feedback to Previous Phases

Infrastructure findings may trigger feedback to:

* Specifications,
* Architecture Decisions,
* Architecture,
* Contracts,
* Domain Discovery,
* Product Discovery.

```text id="v5x9mk"
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

The lifecycle remains iterative.

---

# 69. Infrastructure Readiness Outcome

```text id="k6m4vp"
Outcome:

READY
READY_WITH_RISKS
INCOMPLETE
BLOCKED
NOT_REQUIRED
```

## READY

Infrastructure satisfies the readiness conditions.

## READY_WITH_RISKS

Infrastructure can support progression with explicitly accepted risks.

## INCOMPLETE

Important infrastructure work remains, but no critical blocker prevents continued preparation.

## BLOCKED

A critical infrastructure issue prevents safe progression.

## NOT_REQUIRED

No independent infrastructure readiness review is required for the defined scope.

---

# 70. Infrastructure Gate Decision

```text id="r7x3pq"
Gate:

PASSED
PASSED_WITH_RISKS
BLOCKED
WAIVED
```

---

# 71. Gate Criteria

The Infrastructure phase may pass when:

* [ ] Required infrastructure capabilities exist.
* [ ] Infrastructure responsibilities are clear.
* [ ] Critical resources are available.
* [ ] Runtime requirements are supported.
* [ ] Deployment requirements are supported.
* [ ] Security requirements are supported.
* [ ] Data requirements are supported.
* [ ] Networking requirements are supported.
* [ ] Observability requirements are supported.
* [ ] Backup requirements are supported where applicable.
* [ ] Recovery requirements are supported where applicable.
* [ ] Critical failure behavior is understood.
* [ ] Critical infrastructure behavior is verified.
* [ ] Environment differences are understood.
* [ ] Infrastructure dependencies are explicit.
* [ ] Infrastructure risks are visible.
* [ ] Critical unknowns are resolved or governed.
* [ ] No unauthorized architectural decisions were introduced.
* [ ] Traceability is sufficient.
* [ ] Release Readiness has enough reliable infrastructure evidence to proceed.

---

# 72. Agent Instructions

When performing an Infrastructure Readiness Review:

1. Start from the approved Infrastructure Specification.
2. Verify required capabilities.
3. Verify resource availability.
4. Verify architecture alignment.
5. Verify runtime compatibility.
6. Verify deployment compatibility.
7. Verify security.
8. Verify data infrastructure.
9. Verify networking.
10. Verify observability.
11. Verify backup and restore where required.
12. Verify recovery where required.
13. Verify failure domains.
14. Verify capacity assumptions.
15. Verify operational behavior.
16. Verify infrastructure dependencies.
17. Compare approved, provisioned, and observed states.
18. Detect infrastructure drift.
19. Detect unauthorized architecture decisions.
20. Detect unsupported guarantees.
21. Review verification evidence.
22. Review traceability.
23. Classify findings.
24. Resolve or govern blocking conditions.
25. Produce the readiness outcome.
26. Produce the Release Readiness handoff.
27. Do not equate infrastructure existence with readiness.
28. Do not invent missing evidence.
29. Do not silently accept drift.
30. Trigger feedback loops when infrastructure evidence invalidates earlier assumptions.

---

# 73. Anti-Patterns

## Infrastructure Exists = Ready

A resource existing does not prove it supports required behavior.

## Deployment Success = Infrastructure Readiness

A successful deployment does not validate recovery, security, capacity, or failure behavior.

## Backup = Recovery

A backup is not evidence of successful restoration.

## Replication = Resilience

Replication does not automatically establish resilience.

## Redundancy = Availability

Redundancy does not prove availability behavior.

## Dashboard = Observability

A dashboard does not prove that operational questions can be answered.

## Network = Security

Network placement does not establish trust.

## Cloud Provider Guarantee = System Guarantee

Provider capabilities do not automatically satisfy application requirements.

## Checklist Gate

Checking every item does not replace evidence-based review.

## Hidden Architecture

Allowing infrastructure choices to silently redefine architecture.

## Legacy Infrastructure Worship

Treating historical infrastructure as automatically correct.

## Environment Illusion

Assuming environments are equivalent when material differences exist.

## Capacity Guessing

Inventing resource requirements without evidence.

## Recovery Theater

Documenting recovery without testing it.

## Security Theater

Documenting controls without verifying their behavior.

## Infrastructure Drift Normalization

Treating differences between approved and actual infrastructure as harmless without analysis.

## Infrastructure Lock-In by Accident

Allowing provider-specific behavior to become a hidden architectural dependency.

---

# 74. Safe Progression Question

Before passing the Infrastructure phase:

> **Can the approved system be deployed, operated, secured, observed, recovered, changed, and verified on the available infrastructure with sufficient evidence, while preserving architecture, contracts, data ownership, operational expectations, and security boundaries without introducing unsupported guarantees?**

If the answer is no, identify the smallest artifact or lifecycle phase that must be revisited.

---

# 75. Final Principle

> **Infrastructure Readiness is achieved when the infrastructure baseline is not merely provisioned, but sufficiently verified to support the approved system safely and predictably through deployment, operation, failure, recovery, and change.**

The progression is:

```text
Architecture
      ↓
Specifications
      ↓
Infrastructure Context
      ↓
Infrastructure Specification
      ↓
Infrastructure Implementation
      ↓
Infrastructure Verification
      ↓
Infrastructure Readiness Review
      ↓
Release Readiness
```

The purpose of this gate is not to guarantee that infrastructure will never fail.

It establishes that:

* required capabilities exist,
* important failure modes are understood,
* security boundaries are enforced,
* critical recovery paths are known,
* observability exists,
* infrastructure behavior is verifiable,
* limitations are explicit,
* and remaining risks are governed.

Infrastructure therefore becomes a trustworthy foundation for the final **Release Readiness** phase.
