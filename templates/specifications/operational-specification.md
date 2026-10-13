# Operational Specification

## 1. Document Metadata

| Field                  | Value                     |
| ---------------------- | ------------------------- |
| Document Type          | Operational Specification |
| Lifecycle Phase        | Specifications / SDD      |
| Specification Type     | `OPERATIONAL`             |
| Status                 | `DRAFT`                   |
| Version                | `0.1`                     |
| System                 | `<system>`                |
| Operational Scope      | `<scope>`                 |
| Owner                  | `<owner>`                 |
| Created                | `<date>`                  |
| Last Updated           | `<date>`                  |
| Architecture Baseline  | `<baseline>`              |
| Specification Baseline | `<baseline>`              |
| ADR Baseline           | `<baseline>`              |

---

# 2. Purpose

This document specifies how the system is expected to behave and be operated in normal, degraded, failed, recovering, and maintenance conditions.

It defines:

* operational responsibilities,
* operational states,
* health expectations,
* readiness,
* dependency behavior,
* monitoring,
* alerting,
* incident detection,
* incident response expectations,
* recovery,
* maintenance,
* capacity,
* operational controls,
* configuration changes,
* backup and restore expectations,
* disaster recovery behavior,
* service degradation,
* operational verification,
* and operational evidence.

It does not prescribe a specific operations platform, monitoring product, cloud provider, or organizational process unless already established by approved constraints or decisions.

---

# 3. Core Principle

> **Operational Specification defines how the approved system is expected to behave, be observed, maintained, recovered, and governed during real operational conditions without silently introducing new architecture.**

Operational behavior must be treated as part of system behavior, not as an afterthought.

---

# 4. Fundamental Distinctions

## Operational Specification

Defines implementation-relevant operational behavior.

## Observability Contract

Defines what must be observable and why.

## Observability Specification

Defines how approved observability expectations are realized.

## Runtime Specification

Defines how the system executes over time.

## Deployment Specification

Defines how runtime units are deployed and transitioned.

## Infrastructure Specification

Defines the infrastructure capabilities required by the system.

## Operational Procedure

Defines concrete human or automated steps used to operate the system.

Operational procedures may be derived from this specification but should not silently redefine it.

---

# 5. Entry Conditions

Before creating this specification:

* [ ] Runtime behavior is sufficiently specified.
* [ ] Deployment behavior is sufficiently specified.
* [ ] Infrastructure requirements are known.
* [ ] Observability contract exists where required.
* [ ] Observability specification exists where required.
* [ ] Security expectations are known.
* [ ] Availability expectations are known.
* [ ] Recovery expectations are known.
* [ ] Migration requirements are known where applicable.
* [ ] Critical dependencies are identified.
* [ ] Operational unknowns are identified.

---

# 6. Operational Scope

```text id="r7m4pk"
Operational Scope:

Included:

- <capability>
- <runtime>
- <dependency>

Excluded:

- <area>

Reason:
<reason>
```

---

# 7. Operational Objectives

```text id="v5q8mx"
Objective:
<objective>

Operational Question:
<question>

Expected Behavior:
<behavior>

Evidence:
<evidence>
```

Operational objectives should derive from:

* product outcomes,
* quality attributes,
* architecture,
* contracts,
* runtime behavior,
* security,
* and approved operational requirements.

---

# 8. Operational Model

```text id="k8m3vp"
Operational States:

NORMAL
DEGRADED
PARTIALLY_AVAILABLE
UNAVAILABLE
RECOVERING
MAINTENANCE
DRAINING
RETIRED
```

Only states relevant to the system should be defined.

---

# 9. Operational State Definition

```text id="r6x9mk"
State:
<state>

Meaning:
<meaning>

Entry Condition:
<condition>

Expected Behavior:
<behavior>

Allowed Operations:
<operations>

Restricted Operations:
<operations>

Exit Condition:
<condition>

Observability:
<signals>
```

---

# 10. Normal Operation

```text id="v4m7pq"
Normal Operation:

Expected Behavior:
<behavior>

Dependencies:
<dependencies>

Capacity:
<approved expectation>

Security:
<requirements>

Observability:
<signals>
```

---

# 11. Degraded Operation

```text id="k9m5vp"
Degraded Condition:
<condition>

Affected Capability:
<capability>

Available Capability:
<capability>

Unavailable Capability:
<capability>

User / Consumer Impact:
<impact>

Recovery:
<recovery>

Observability:
<signals>
```

Degraded behavior must be explicitly supported or explicitly prohibited.

---

# 12. Partial Availability

```text id="r8x4mk"
Capability:
<capability>

Available:
<YES/NO>

Dependency:
<dependency>

Expected Behavior:
<behavior>

Operational Impact:
<impact>
```

---

# 13. Unavailability

```text id="v7m3pq"
Capability:
<capability>

Unavailable Condition:
<condition>

Detection:
<signal>

Expected Consumer Behavior:
<behavior>

Recovery:
<recovery>
```

---

# 14. Operational Responsibilities

| Capability     | Operational Responsibility | Owner     | Backup Owner |
| -------------- | -------------------------- | --------- | ------------ |
| `<capability>` | `<responsibility>`         | `<owner>` | `<owner>`    |

Ownership must be explicit.

Technical access does not automatically imply operational ownership.

---

# 15. Operational Boundaries

```text id="k6m9vp"
Boundary:
<boundary>

Inside Operational Responsibility:
<scope>

Outside Responsibility:
<scope>

External Owner:
<owner>

Escalation:
<mechanism>
```

---

# 16. Dependency Operations

```text id="r5x8mk"
Dependency:
<dependency>

Purpose:
<purpose>

Operational Dependency:
<dependency>

Health Signal:
<signal>

Failure:
<expected behavior>

Recovery:
<recovery>

Owner:
<owner>
```

---

# 17. Dependency Failure Policy

Possible behaviors:

* fail fast,
* retry,
* degrade,
* queue,
* defer,
* compensate,
* reject,
* isolate,
* recover.

```text id="v8q4mx"
Dependency:
<dependency>

Failure:
<failure>

Behavior:
<behavior>

Reason:
<reason>
```

The selected behavior must derive from approved runtime, integration, and architecture decisions.

---

# 18. Health Model

Health must be defined according to operational meaning.

```text id="k7m3vp"
Health State:
<state>

Meaning:
<meaning>

Evidence:
<evidence>

Consumer:
<consumer>
```

---

# 19. Liveness

```text id="r9x5mk"
Liveness Question:
<question>

Condition:
<condition>

Expected Result:
<result>

Failure Interpretation:
<interpretation>
```

Liveness must not be confused with dependency health.

---

# 20. Readiness

```text id="v4m8pq"
Readiness Question:
<question>

Conditions:
<conditions>

Expected Result:
<result>

Transition:
<transition>
```

Readiness should represent whether the system is prepared to perform its intended responsibility.

---

# 21. Startup Operations

```text id="k5m9vp"
Startup:

Preconditions:
<conditions>

Initialization:
<steps>

Dependencies:
<dependencies>

Validation:
<validation>

Ready Condition:
<condition>

Failure:
<behavior>
```

---

# 22. Shutdown Operations

```text id="r6x4mk"
Shutdown:

Trigger:
<trigger>

Drain:
<behavior>

Active Work:
<handling>

New Requests:
<handling>

Persistence:
<handling>

Completion:
<condition>

Forced Termination:
<behavior>
```

---

# 23. Graceful Degradation

```text id="v7m3pq"
Degradation:
<scenario>

Trigger:
<trigger>

Preserved Capability:
<capability>

Removed Capability:
<capability>

Consumer Impact:
<impact>

Recovery:
<recovery>
```

---

# 24. Recovery

```text id="k8m5vp"
Failure:
<failure>

Recovery Condition:
<condition>

Recovery Action:
<action>

Validation:
<validation>

Completion:
<condition>
```

---

# 25. Recovery Verification

Recovery must demonstrate that:

* required services become available,
* critical data remains consistent,
* contracts remain valid,
* security remains active,
* observability remains functional,
* and the system reaches an approved operational state.

```text id="r5x9mk"
Recovery Scenario:
<scenario>

Expected State:
<state>

Evidence:
<evidence>
```

---

# 26. Incident Detection

```text id="v8m4pq"
Operational Failure:
<failure>

Detection Signal:
<signal>

Detection Condition:
<condition>

Severity:
<severity>

Expected Action:
<action>
```

Do not create alerts without a meaningful operational response.

---

# 27. Incident Classification

Possible categories:

* availability,
* reliability,
* performance,
* security,
* data integrity,
* integration,
* infrastructure,
* deployment,
* capacity,
* configuration,
* dependency,
* migration.

```text id="k6m3vp"
Incident:
<incident>

Category:
<category>

Severity:
<severity>

Impact:
<impact>

Owner:
<owner>
```

---

# 28. Incident Severity

Use project-defined severity where available.

If not defined:

```text id="r9x5mk"
Severity:
<severity>

Impact:
<impact>

Affected Users:
<scope>

Affected Capabilities:
<scope>

Operational Consequence:
<consequence>
```

Do not invent organizational severity policies.

---

# 29. Alerting Contract Alignment

Alerts must derive from approved observability expectations.

```text id="v4m8pq"
Operational Question:
<question>

Signal:
<signal>

Alert Condition:
<condition>

Action:
<action>

Owner:
<owner>
```

---

# 30. Alert Actionability

Every important alert should answer:

1. What happened?
2. Why does it matter?
3. Who owns it?
4. What should happen next?

```text id="k7m3vp"
Alert:
<alert>

Meaning:
<meaning>

Owner:
<owner>

Expected Action:
<action>

Escalation:
<escalation>
```

---

# 31. Alert Suppression

```text id="r8x5mk"
Alert:
<alert>

Suppression Condition:
<condition>

Reason:
<reason>

Maximum Duration:
<approved condition>

Recovery:
<condition>
```

Alert suppression must not hide real failures indefinitely.

---

# 32. Operational Dashboards

Dashboards should support explicit operational questions.

```text id="v6m4pq"
Dashboard:
<dashboard>

Operational Questions:
<questions>

Signals:
<signals>

Consumers:
<consumers>
```

A dashboard is not itself an operational contract.

---

# 33. Operational Metrics

Metrics may include:

* availability,
* throughput,
* error rate,
* latency,
* queue/backlog,
* dependency health,
* resource consumption,
* business activity,
* recovery behavior.

```text id="k5x9vp"
Metric:
<metric>

Meaning:
<meaning>

Consumer:
<consumer>

Decision Supported:
<decision>
```

Do not define metrics merely because a monitoring tool can collect them.

---

# 34. Business Operational Metrics

```text id="r4m8pk"
Business Metric:
<metric>

Business Meaning:
<meaning>

Source:
<source>

Consumer:
<consumer>

Action:
<action>
```

Business metrics must not be confused with technical metrics.

---

# 35. Operational Logs

```text id="v7q3mx"
Log Category:
<category>

Purpose:
<purpose>

Required Context:
<context>

Sensitive Data:
<handling>

Consumer:
<consumer>
```

Logging should remain aligned with the Observability Specification.

---

# 36. Operational Tracing

```text id="k9m4vp"
Trace Scope:
<scope>

Operational Question:
<question>

Required Context:
<context>

Failure Analysis:
<requirement>
```

Tracing should be used where it answers meaningful operational questions.

---

# 37. Correlation

```text id="r8x5mk"
Correlation Context:
<context>

Purpose:
<purpose>

Propagation:
<scope>

Security:
<requirements>
```

Correlation does not automatically establish causality.

---

# 38. Audit Operations

```text id="v6m3pq"
Auditable Action:
<action>

Reason:
<reason>

Actor:
<actor>

Evidence:
<evidence>

Retention:
<requirement>
```

Operational logging and audit evidence must remain distinct where required.

---

# 39. Configuration Operations

```text id="k5m9vp"
Configuration:
<configuration>

Owner:
<owner>

Change Method:
<method>

Validation:
<validation>

Rollback:
<rollback>

Audit:
<audit>
```

---

# 40. Configuration Change Safety

Configuration changes should define:

* validation,
* authorization,
* impact,
* observability,
* rollback,
* and compatibility.

```text id="r4x8mk"
Change:
<change>

Risk:
<risk>

Validation:
<validation>

Rollback:
<rollback>
```

---

# 41. Feature Configuration

```text id="v7m3pq"
Feature:
<feature>

Operational Control:
<control>

Default:
<default>

Enable Condition:
<condition>

Disable Condition:
<condition>

Risk:
<risk>
```

Feature flags must not become hidden architecture or uncontrolled product governance.

---

# 42. Capacity Model

```text id="k8m5vp"
Resource / Capability:
<resource>

Capacity Question:
<question>

Measurement:
<measurement>

Expected Behavior:
<approved expectation>

Evidence:
<evidence>
```

Capacity expectations must be evidence-based.

---

# 43. Resource Monitoring

Relevant resources may include:

* compute,
* memory,
* storage,
* network,
* connection pools,
* queues,
* external service quotas,
* concurrency,
* application-level capacity.

```text id="r5x9mk"
Resource:
<resource>

Operational Risk:
<risk>

Signal:
<signal>

Action:
<action>
```

---

# 44. Capacity Exhaustion

```text id="v8m4pq"
Resource:
<resource>

Exhaustion Condition:
<condition>

Expected Behavior:
<behavior>

Protection:
<mechanism>

Recovery:
<recovery>
```

---

# 45. Backup

```text id="k6m3vp"
Data / Resource:
<resource>

Backup Requirement:
<requirement>

Frequency:
<approved requirement>

Retention:
<approved requirement>

Verification:
<verification>
```

Do not invent backup frequency or retention.

---

# 46. Backup Verification

A backup requirement is incomplete without a way to verify that backups are usable.

```text id="r9x5mk"
Backup:
<backup>

Verification:
<method>

Restore Test:
<method>

Evidence:
<evidence>
```

---

# 47. Restore

```text id="v4m8pq"
Restore Scenario:
<scenario>

Source:
<backup>

Target:
<target>

Expected Result:
<result>

Validation:
<validation>
```

---

# 48. Recovery Objectives

Where approved:

```text id="k7m3vp"
Recovery Objective:
<objective>

Scope:
<scope>

Expected Target:
<approved value>

Verification:
<verification>
```

Do not invent RPO/RTO values.

---

# 49. Disaster Recovery

```text id="r8x5mk"
Scenario:
<disaster scenario>

Affected Resources:
<resources>

Recovery Strategy:
<strategy>

Dependencies:
<dependencies>

Expected Operational State:
<state>

Verification:
<test>
```

Disaster recovery must reflect approved resilience and infrastructure decisions.

---

# 50. Disaster Recovery Limitations

```text id="v6m4pq"
Limitation:
<limitation>

Impact:
<impact>

Accepted Risk:
<risk>

Alternative:
<alternative>
```

---

# 51. Dependency Recovery

```text id="k5x9vp"
Dependency:
<dependency>

Failure:
<failure>

Recovery:
<recovery>

System Behavior During Recovery:
<behavior>

Validation:
<validation>
```

---

# 52. Operational Maintenance

```text id="r4m8pk"
Maintenance Activity:
<activity>

Purpose:
<purpose>

Preconditions:
<conditions>

Expected Impact:
<impact>

Validation:
<validation>

Rollback:
<rollback>
```

---

# 53. Maintenance Windows

```text id="v7q3mx"
Maintenance:
<maintenance>

Allowed Window:
<approved window>

Affected Capabilities:
<capabilities>

Required Safeguards:
<safeguards>

Completion:
<condition>
```

Do not invent maintenance windows.

---

# 54. Upgrade Operations

```text id="k9m4vp"
Upgrade:
<upgrade>

Current:
<current>

Target:
<target>

Compatibility:
<requirements>

Validation:
<validation>

Rollback:
<rollback>
```

---

# 55. Operational Change Management

```text id="r8x5mk"
Change:
<change>

Reason:
<reason>

Affected Components:
<components>

Risk:
<risk>

Approval:
<authority>

Verification:
<verification>
```

---

# 56. Operational Access

```text id="v6m3pq"
Operational Capability:
<capability>

Required Access:
<access>

Owner:
<owner>

Authorization:
<authorization>

Audit:
<audit>
```

Operational access must follow approved security requirements.

---

# 57. Privileged Operations

```text id="k5m9vp"
Privileged Operation:
<operation>

Authorization:
<authorization>

Required Evidence:
<evidence>

Rollback:
<rollback>

Audit:
<audit>
```

---

# 58. Secret Operations

```text id="r4x8mk"
Secret:
<secret>

Purpose:
<purpose>

Owner:
<owner>

Storage:
<approved mechanism>

Rotation:
<approved requirement>

Exposure Prevention:
<controls>
```

Never expose secrets through operational procedures, logs, test evidence, or documentation.

---

# 59. Operational Security

Operational security should cover relevant:

* privileged access,
* secret management,
* administrative actions,
* auditability,
* security monitoring,
* incident response,
* data protection,
* configuration changes.

```text id="v7m3pq"
Security Operational Requirement:
<requirement>

Verification:
<verification>

Evidence:
<evidence>
```

---

# 60. Operational Incident Response

```text id="k8m5vp"
Incident:
<incident>

Detection:
<detection>

Classification:
<classification>

Containment:
<containment>

Recovery:
<recovery>

Validation:
<validation>

Closure:
<condition>
```

Concrete organizational procedures may be maintained separately.

---

# 61. Incident Containment

```text id="r5x9mk"
Incident:
<incident>

Containment Objective:
<objective>

Allowed Action:
<action>

Expected Impact:
<impact>

Recovery:
<recovery>
```

Containment must not silently violate domain, security, or data invariants.

---

# 62. Operational Reconciliation

When operational state can diverge:

```text id="v8m4pq"
State:
<state>

Expected:
<expected>

Observed:
<observed>

Difference:
<difference>

Resolution:
<resolution>

Evidence:
<evidence>
```

---

# 63. Operational Runbook Boundary

A runbook may define:

* commands,
* concrete procedures,
* decision trees,
* operational checklists,
* escalation contacts,
* tool-specific actions.

However:

> Runbooks should implement approved operational semantics rather than invent them.

---

# 64. Runbook Reference

```text id="k6m3vp"
Runbook:
<runbook>

Purpose:
<purpose>

Trigger:
<trigger>

Operational Specification:
<reference>

Owner:
<owner>

Last Validated:
<date>
```

---

# 65. Operational Automation

```text id="r9x5mk"
Automation:
<automation>

Purpose:
<purpose>

Trigger:
<trigger>

Expected Result:
<result>

Failure:
<behavior>

Rollback:
<rollback>

Audit:
<audit>
```

Automation must remain observable and controllable.

---

# 66. Automation Failure

```text id="v4m8pq"
Automation:
<automation>

Failure:
<failure>

Detection:
<detection>

Fallback:
<fallback>

Manual Intervention:
<condition>

Recovery:
<recovery>
```

---

# 67. Operational Testing

Operational verification should include relevant:

* startup,
* shutdown,
* health,
* readiness,
* dependency failure,
* recovery,
* backup,
* restore,
* deployment,
* rollback,
* capacity,
* security,
* observability,
* migration.

```text id="k7m3vp"
Operational Scenario:
<scenario>

Expected Result:
<result>

Evidence:
<evidence>
```

---

# 68. Operational Acceptance

```text id="r8x5mk"
Operational Requirement:
<requirement>

Verification:
<verification>

Evidence:
<evidence>

Status:
<PASS | FAIL | BLOCKED>
```

---

# 69. Operational Risks

| ID        | Risk     | Severity     | Impact     | Mitigation     | Status     |
| --------- | -------- | ------------ | ---------- | -------------- | ---------- |
| OPS-R-001 | `<risk>` | `<severity>` | `<impact>` | `<mitigation>` | `<status>` |

---

# 70. Operational Unknowns

| ID        | Unknown     | Impact     | Blocking   | Resolution |
| --------- | ----------- | ---------- | ---------- | ---------- |
| OPS-U-001 | `<unknown>` | `<impact>` | `<yes/no>` | `<method>` |

---

# 71. Operational Assumptions

| ID        | Assumption     | Evidence     | Confidence     | Validation |
| --------- | -------------- | ------------ | -------------- | ---------- |
| OPS-A-001 | `<assumption>` | `<evidence>` | `<confidence>` | `<method>` |

---

# 72. Operational Constraints

```text id="v6m4pq"
Constraint:
<constraint>

Source:
<source>

Strength:
<MANDATORY | PREFERRED>

Operational Impact:
<impact>
```

---

# 73. Operational Escalation

Escalate when operations reveal:

* architectural inconsistency,
* missing contract behavior,
* insufficient observability,
* impossible recovery,
* inadequate security boundaries,
* unsupported runtime behavior,
* infrastructure limitations,
* unresolved quality attribute conflicts,
* or a new consequential architectural decision.

---

# 74. Architecture Escalation Triggers

Operational work must not silently introduce:

* new architecture boundaries,
* new data ownership,
* new consistency models,
* new trust boundaries,
* new availability models,
* new integration semantics,
* or new deployment architecture.

Such changes require appropriate architecture governance.

---

# 75. Specification Escalation Triggers

Escalate when operational behavior is undefined for:

* failure,
* recovery,
* health,
* shutdown,
* dependency loss,
* capacity exhaustion,
* security incidents,
* migration,
* configuration changes,
* or deployment transitions.

---

# 76. Traceability

```text id="k5x9vp"
Requirement
      ↓
Quality Attribute
      ↓
Architecture / ADR
      ↓
Contract
      ↓
Runtime / Deployment / Infrastructure Specification
      ↓
Operational Specification
      ↓
Operational Implementation
      ↓
Operational Evidence
```

Relevant relationships include:

* `OPERATES`
* `OBSERVES`
* `RECOVERS`
* `MAINTAINS`
* `PROTECTS`
* `VALIDATES`
* `ESCALATES`
* `VERIFIES`

---

# 77. Operational Evidence

```text id="r4m8pk"
Evidence:
<evidence>

Source:
<source>

Owner:
<owner>

Retention:
<requirement>

Consumer:
<consumer>
```

---

# 78. Operational Readiness

Before the system is considered operationally ready:

* [ ] Operational ownership is defined.
* [ ] Critical dependencies are known.
* [ ] Health behavior is defined.
* [ ] Readiness behavior is defined.
* [ ] Failure behavior is defined.
* [ ] Recovery is defined.
* [ ] Observability is available.
* [ ] Important alerts are actionable.
* [ ] Backup requirements are defined where applicable.
* [ ] Restore verification exists where applicable.
* [ ] Security operations are defined.
* [ ] Operational access is controlled.
* [ ] Deployment behavior is understood.
* [ ] Migration behavior is understood.
* [ ] Operational tests are defined.
* [ ] Known risks are explicit.

---

# 79. Operational Specification Outcome

```text id="v7q3mx"
Outcome:

READY
READY_WITH_RISKS
INCOMPLETE
BLOCKED
NOT_REQUIRED
```

## READY

Operational behavior is sufficiently specified for implementation and verification.

## READY_WITH_RISKS

Operational behavior is sufficiently specified with explicit non-blocking risks.

## INCOMPLETE

Important operational behavior remains unspecified.

## BLOCKED

A critical operational, architectural, security, infrastructure, or recovery dependency remains unresolved.

## NOT_REQUIRED

An independent Operational Specification is unnecessary for the relevant scope.

---

# 80. Review Checklist

### Runtime

* [ ] Normal operation is defined.
* [ ] Degraded behavior is defined.
* [ ] Failure behavior is defined.
* [ ] Recovery is defined.
* [ ] Startup is defined.
* [ ] Shutdown is defined.

### Observability

* [ ] Operational questions are explicit.
* [ ] Required signals exist.
* [ ] Alerts are actionable.
* [ ] Failure observability is covered.
* [ ] Sensitive telemetry is protected.

### Security

* [ ] Operational access is controlled.
* [ ] Privileged actions are auditable.
* [ ] Secrets are protected.
* [ ] Security incidents have operational behavior.

### Reliability

* [ ] Dependencies are identified.
* [ ] Recovery is defined.
* [ ] Backup requirements are defined.
* [ ] Restore is verifiable.
* [ ] Disaster recovery is addressed where required.

### Operations

* [ ] Ownership is explicit.
* [ ] Configuration changes are controlled.
* [ ] Maintenance behavior is defined.
* [ ] Capacity risks are visible.
* [ ] Operational automation is observable.
* [ ] Runbook boundaries are clear.

### Governance

* [ ] Architecture is not silently changed.
* [ ] Risks are explicit.
* [ ] Unknowns are explicit.
* [ ] Traceability is maintained.
* [ ] Operational evidence is defined.

---

# 81. Handoff

### Architecture Provides

* architectural boundaries,
* quality attributes,
* resilience expectations,
* security boundaries,
* ownership,
* approved decisions.

### Runtime / Deployment / Infrastructure Specifications Provide

* execution behavior,
* deployment behavior,
* infrastructure capabilities,
* resource expectations.

### Operational Specification Provides

* operational states,
* ownership,
* health,
* recovery,
* maintenance,
* monitoring expectations,
* incident behavior,
* backup/recovery expectations,
* operational verification.

### Runbooks Provide

* concrete operational procedures,
* commands,
* decision trees,
* tool-specific instructions,
* escalation procedures.

---

# 82. Agent Instructions

When producing an Operational Specification:

1. Start from approved architecture.
2. Read Runtime, Deployment, Infrastructure, Observability, Security, and Migration Specifications.
3. Identify operational responsibilities.
4. Identify critical dependencies.
5. Define normal behavior.
6. Define degraded behavior.
7. Define failure behavior.
8. Define recovery behavior.
9. Define startup and shutdown behavior.
10. Define health and readiness semantics.
11. Identify operational questions.
12. Map questions to observable signals.
13. Define actionable alerts.
14. Define backup and restore requirements where applicable.
15. Define maintenance behavior.
16. Define capacity concerns.
17. Define privileged operations.
18. Define operational security.
19. Define operational verification.
20. Preserve architecture and contract semantics.
21. Do not invent organizational policies.
22. Do not invent SLOs, RPOs, RTOs, thresholds, retention periods, or maintenance windows.
23. Do not confuse observability with operations.
24. Do not confuse infrastructure capability with operational responsibility.
25. Do not make operational convenience an architecture decision.
26. Escalate consequential changes.
27. Keep operational detail proportional to system risk.
28. Preserve traceability.

---

# 83. Anti-Patterns

## Operations as Afterthought

Defining operations only after implementation is complete.

## Tool-First Operations

Choosing a monitoring or infrastructure tool before understanding the operational question.

## Alert Everything

Creating alerts without clear ownership or action.

## Dashboard Theater

Creating dashboards that do not answer meaningful operational questions.

## Logging Everything

Producing excessive logs without operational value or data protection.

## Health Theater

Providing health endpoints that do not represent meaningful health semantics.

## Readiness Equals Process Alive

Treating process existence as proof that the system can perform its responsibility.

## Retry Everything

Using retries without considering idempotency, load, failure propagation, or domain semantics.

## Backup Equals Recovery

Assuming a successful backup proves recoverability.

## Infrastructure Equals Operations

Assuming infrastructure provisioning automatically defines operational responsibility.

## Security Through Access

Assuming restricted operational access alone guarantees security.

## Manual Dependency

Making critical behavior dependent on undocumented human intervention.

## Infinite Degradation

Allowing degraded states without explicit recovery or retirement conditions.

## Hidden Operational Architecture

Introducing new architecture through operational procedures.

## Legacy Operations Worship

Preserving obsolete procedures merely because they exist.

## Unbounded Automation

Automating consequential actions without safeguards, observability, authorization, or rollback.

## Threshold Guessing

Inventing operational thresholds without approved requirements or evidence.

## Runbook as Specification

Using tool-specific runbooks as the only definition of operational behavior.

## Operational Theater

Producing elaborate operational documentation without demonstrating that the system can actually be operated, diagnosed, recovered, and maintained.

---

# 84. Safe Progression Question

Before accepting this specification:

> **Can the approved system be operated, observed, diagnosed, maintained, degraded, recovered, secured, and verified with explicit operational behavior and ownership without inventing unsupported architectural, organizational, security, or reliability assumptions?**

If not, identify whether the missing information belongs to:

```text
Product
Domain
Architecture
Contract
ADR
Runtime
Deployment
Infrastructure
Security
Observability
Migration
Operations
```

---

# 85. Final Principle

> **An Operational Specification turns approved system behavior into explicit operational expectations for normal operation, degradation, failure, recovery, maintenance, security, observability, and governance. It defines how the system can be safely operated without silently becoming a new architecture.**

The intended relationship is:

```text
Architecture
      ↓
Contracts / ADRs
      ↓
Runtime
      ↓
Deployment
      ↓
Infrastructure
      ↓
Observability / Security
      ↓
Migration
      ↓
Operational Specification
      ↓
Operational Implementation
      ↓
Runbooks / Automation
      ↓
Operational Evidence
```

A healthy Operational Specification makes clear **who operates what, how health is understood, how failures are detected and contained, how recovery works, how configuration and privileged operations are controlled, how backups are verified, how maintenance is performed, how operational questions are answered, and how the system remains safe throughout its operational lifecycle.**
