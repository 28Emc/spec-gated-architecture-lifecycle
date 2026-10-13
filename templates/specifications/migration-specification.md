# Migration Specification

## 1. Document Metadata

| Field                 | Value                   |
| --------------------- | ----------------------- |
| Document Type         | Migration Specification |
| Lifecycle Phase       | Specifications / SDD    |
| Specification Type    | `MIGRATION`             |
| Status                | `DRAFT`                 |
| Version               | `0.1`                   |
| System                | `<system>`              |
| Migration             | `<migration>`           |
| Owner                 | `<owner>`               |
| Created               | `<date>`                |
| Last Updated          | `<date>`                |
| Architecture Baseline | `<baseline>`            |
| Contract Baseline     | `<baseline>`            |
| ADR Baseline          | `<baseline>`            |

---

# 2. Purpose

This document specifies how an approved system transition, migration, replacement, coexistence, or compatibility change is to be realized and verified.

It defines:

* migration scope,
* current state,
* target state,
* transition states,
* migration objectives,
* dependencies,
* sequencing,
* data movement,
* compatibility,
* coexistence,
* cutover,
* rollback,
* validation,
* reconciliation,
* failure handling,
* security,
* observability,
* operational controls,
* verification,
* and retirement of legacy elements.

This document does not introduce new architectural decisions.

---

# 3. Core Principle

> **Migration Specification defines how an approved transition is executed and verified while preserving required behavior, data integrity, compatibility, security, and operational safety.**

Migration is not merely:

* moving data,
* deploying a new version,
* changing infrastructure,
* replacing a service,
* or switching an endpoint.

A migration may involve coordinated changes across:

* product behavior,
* domain models,
* contracts,
* data,
* architecture,
* runtime,
* deployment,
* infrastructure,
* security,
* observability,
* and operations.

---

# 4. Fundamental Distinctions

## Current State

The state from which the migration begins.

## Target State

The approved state after migration.

## Transition State

A temporary state required to move safely between current and target states.

## Migration

The controlled transition from current to target state.

## Cutover

The point or process through which responsibility for relevant behavior moves to the target state.

## Rollback

A controlled return to an earlier operational state when supported and safe.

## Reconciliation

The process of identifying and resolving differences between source and target state.

## Compatibility

The ability of relevant participants or versions to continue interacting during transition.

---

# 5. Entry Conditions

Before creating this specification:

* [ ] Current state is sufficiently understood.
* [ ] Target state is approved.
* [ ] Relevant architecture decisions exist.
* [ ] Relevant contracts are known.
* [ ] Data ownership is understood.
* [ ] Migration scope is defined.
* [ ] Migration risks are identified.
* [ ] Compatibility requirements are known.
* [ ] Rollback expectations are known.
* [ ] Security requirements are known.
* [ ] Operational requirements are known.
* [ ] Verification requirements are known.
* [ ] Blocking migration unknowns are identified.

---

# 6. Migration Identity

```text id="r6m8pk"
Migration ID:
<MIG-001>

Name:
<name>

Purpose:
<purpose>

Current State:
<state>

Target State:
<state>

Migration Type:
<DATA | APPLICATION | ARCHITECTURE | DEPLOYMENT | INFRASTRUCTURE | CONTRACT | MIXED>

Status:
<DRAFT>
```

---

# 7. Migration Scope

```text id="v4q9mx"
In Scope:

- <area>
- <area>

Out of Scope:

- <area>
- <area>

Deferred:

- <area>
```

Migration scope must remain aligned with approved system scope and architecture decisions.

---

# 8. Migration Objectives

```text id="k7m3vp"
Objective:
<objective>

Expected Result:
<result>

Evidence:
<evidence>

Source:
<requirement / ADR / contract / specification>
```

---

# 9. Current State

Describe the actual state from which migration begins.

```text id="r8x5mk"
Current State:

Architecture:
<description>

Runtime:
<description>

Deployment:
<description>

Data:
<description>

Contracts:
<description>

Infrastructure:
<description>

Operational State:
<description>
```

For existing systems, observed behavior takes precedence over undocumented historical assumptions.

---

# 10. Target State

```text id="v6m4pq"
Target State:

Architecture:
<description>

Runtime:
<description>

Deployment:
<description>

Data:
<description>

Contracts:
<description>

Infrastructure:
<description>

Operational State:
<description>
```

The target state must reference approved architecture and specifications.

---

# 11. Transition States

```text id="k9x3vp"
Transition State:
<state>

Purpose:
<purpose>

Duration:
<duration / condition>

Participants:
<participants>

Capabilities:
<capabilities>

Constraints:
<constraints>

Exit Condition:
<condition>
```

Temporary states must be explicit.

---

# 12. Migration State Model

Possible states include:

```text
PLANNED
PREPARING
READY
IN_PROGRESS
CUTOVER
VALIDATING
COMPLETED
ROLLED_BACK
FAILED
PAUSED
ABANDONED
```

Only applicable states should be used.

---

# 13. Migration Preconditions

```text id="r5m8pk"
Precondition:
<condition>

Evidence:
<evidence>

Owner:
<owner>

Blocking:
<YES | NO>
```

Examples may include:

* compatible versions deployed,
* backup completed,
* target environment available,
* data validation completed,
* required contracts compatible,
* rollback capability validated,
* monitoring available.

---

# 14. Migration Dependencies

| Dependency     | Type     | Required Before | Owner     | Status     |
| -------------- | -------- | --------------- | --------- | ---------- |
| `<dependency>` | `<type>` | `<phase>`       | `<owner>` | `<status>` |

Dependencies may include:

* systems,
* services,
* data,
* contracts,
* infrastructure,
* external providers,
* operational capabilities,
* security controls.

---

# 15. Migration Phases

```text id="v7q4mx"
Preparation
    ↓
Validation
    ↓
Data / State Transition
    ↓
Coexistence
    ↓
Cutover
    ↓
Post-Cutover Validation
    ↓
Stabilization
    ↓
Legacy Retirement
```

Not every migration requires every phase.

---

# 16. Migration Strategy

```text id="k6m9vp"
Strategy:
<strategy>

Rationale:
<reason>

Advantages:
<advantages>

Risks:
<risks>

Constraints:
<constraints>
```

Possible strategies include:

* big-bang,
* phased,
* incremental,
* parallel,
* strangler,
* rolling,
* blue-green,
* canary,
* dual operation,
* batch migration.

The strategy must derive from approved architecture and risk analysis.

---

# 17. Migration Decision Boundary

The migration specification must not silently decide:

* new bounded contexts,
* new ownership boundaries,
* new contracts,
* new consistency models,
* new security architecture,
* new deployment architecture,
* or new infrastructure architecture.

If migration requires one of these, escalate to Architecture / ADR governance.

---

# 18. Data Migration Scope

```text id="r8x4pk"
Data Domain:
<data>

Source:
<source>

Target:
<target>

Owner:
<owner>

Migration Required:
<YES | NO>

Historical Data:
<yes/no>

Derived Data:
<yes/no>
```

---

# 19. Data Mapping

| Source    | Target    | Transformation | Validation     |
| --------- | --------- | -------------- | -------------- |
| `<field>` | `<field>` | `<mapping>`    | `<validation>` |

Mappings must preserve approved data semantics.

---

# 20. Data Transformation

```text id="v5m7pq"
Source Representation:
<representation>

Target Representation:
<representation>

Transformation:
<transformation>

Business Meaning:
<meaning>

Validation:
<validation>
```

Do not infer domain meaning solely from storage structure.

---

# 21. Data Completeness

```text id="k9x4vp"
Data Set:
<data>

Completeness Rule:
<rule>

Source Count:
<measurement>

Target Count:
<measurement>

Reconciliation:
<method>
```

---

# 22. Data Integrity

Verification should address relevant:

* identity preservation,
* relationships,
* invariants,
* required values,
* uniqueness,
* consistency,
* historical meaning,
* temporal semantics.

```text id="r6m8pk"
Integrity Requirement:
<requirement>

Verification:
<method>

Evidence:
<evidence>
```

---

# 23. Data Reconciliation

```text id="v3q9mx"
Reconciliation Scope:
<scope>

Comparison:
<comparison>

Allowed Difference:
<approved condition>

Mismatch Handling:
<handling>

Resolution:
<resolution>
```

Do not invent acceptable differences.

---

# 24. Incremental Data Migration

When data is migrated in batches:

```text id="k7m4vp"
Batch:
<batch>

Selection:
<criteria>

Processing:
<process>

Validation:
<validation>

Retry:
<behavior>

Failure:
<behavior>

Reconciliation:
<method>
```

---

# 25. Dual Read

If approved:

```text id="r8x5mk"
Source:
<source>

Secondary Source:
<source>

Read Selection:
<rule>

Comparison:
<method>

Mismatch:
<handling>
```

Dual-read behavior must be explicitly specified.

---

# 26. Dual Write

If approved:

```text id="v6m3pq"
Primary Write:
<system>

Secondary Write:
<system>

Consistency Requirement:
<requirement>

Failure:
<behavior>

Reconciliation:
<method>

Retirement Condition:
<condition>
```

Dual write must not be introduced merely because it appears convenient.

---

# 27. Synchronization

```text id="k5x9vp"
Synchronization Mechanism:
<mechanism>

Source:
<source>

Target:
<target>

Ordering:
<requirement>

Consistency:
<requirement>

Lag:
<approved expectation>

Failure:
<behavior>
```

Do not invent synchronization guarantees.

---

# 28. Application Migration

```text id="r4m8pk"
Application:
<application>

Current Version:
<version>

Target Version:
<version>

Behavioral Compatibility:
<requirements>

Dependencies:
<dependencies>

Validation:
<validation>
```

---

# 29. Contract Migration

For API, event, data, security, or observability contract changes:

```text id="v7q3mx"
Contract:
<contract>

Current Version:
<version>

Target Version:
<version>

Compatibility:
<requirements>

Consumers:
<consumers>

Transition:
<transition>

Retirement:
<condition>
```

---

# 30. Backward Compatibility

```text id="k8m5vp"
Compatibility Requirement:
<requirement>

Supported Versions:
<versions>

Compatibility Period:
<period / condition>

Verification:
<verification>
```

Compatibility duration must be based on an approved requirement or migration decision.

---

# 31. Forward Compatibility

Where applicable:

```text id="r5x9mk"
Future Consumer / Provider:
<participant>

Compatibility Requirement:
<requirement>

Expected Behavior:
<behavior>

Verification:
<verification>
```

---

# 32. Coexistence

```text id="v8m4pq"
Legacy:
<legacy>

Target:
<target>

Coexistence Scope:
<scope>

Shared Responsibilities:
<responsibilities>

Consistency:
<requirement>

Routing:
<routing>

Failure:
<failure behavior>
```

---

# 33. Responsibility Transition

```text id="k6m3vp"
Capability:
<capability>

Current Owner:
<owner>

Transition Owner:
<owner>

Target Owner:
<owner>

Transfer Condition:
<condition>

Verification:
<verification>
```

Ownership must never be inferred merely from deployment.

---

# 34. Traffic / Request Transition

```text id="r9x5mk"
Traffic:
<traffic>

Current Destination:
<destination>

Target Destination:
<destination>

Transition:
<method>

Validation:
<validation>

Rollback:
<rollback>
```

---

# 35. Event Consumer Migration

```text id="v4m8pq"
Event:
<event>

Current Consumer:
<consumer>

Target Consumer:
<consumer>

Transition:
<transition>

Duplicate Handling:
<behavior>

Compatibility:
<requirement>
```

---

# 36. Event Producer Migration

```text id="k7x3vp"
Event:
<event>

Current Producer:
<producer>

Target Producer:
<producer>

Publication Compatibility:
<requirement>

Ordering:
<requirement>

Consumer Impact:
<impact>
```

---

# 37. Security Migration

Security migration must preserve required protection throughout transition.

```text id="r8m5pk"
Security Capability:
<capability>

Current Protection:
<protection>

Target Protection:
<protection>

Transition:
<transition>

Security Risk:
<risk>

Verification:
<verification>
```

---

# 38. Identity Migration

When identity or authentication changes:

```text id="v6q4mx"
Identity Source:
<source>

Target Identity Source:
<source>

Identity Mapping:
<mapping>

Authorization Preservation:
<requirement>

Session Impact:
<impact>

Verification:
<verification>
```

---

# 39. Observability Migration

```text id="k5m9vp"
Observability Capability:
<capability>

Current Signals:
<signals>

Target Signals:
<signals>

Transition:
<transition>

Operational Coverage:
<requirement>

Gap:
<gap>
```

Observability must not disappear during migration unless explicitly accepted.

---

# 40. Runtime Migration

```text id="r4x8mk"
Runtime:
<runtime>

Current Behavior:
<behavior>

Target Behavior:
<behavior>

Compatibility:
<requirement>

Failure Handling:
<behavior>

Verification:
<test>
```

---

# 41. Deployment Migration

```text id="v7m3pq"
Deployment:
<deployment>

Current:
<current>

Target:
<target>

Strategy:
<strategy>

Validation:
<validation>

Rollback:
<rollback>
```

---

# 42. Infrastructure Migration

```text id="k9m4vp"
Infrastructure Capability:
<capability>

Current:
<current>

Target:
<target>

Migration:
<migration>

Dependencies:
<dependencies>

Validation:
<validation>
```

Infrastructure migration must preserve approved architecture and operational requirements.

---

# 43. Cutover Definition

```text id="r8x5mk"
Cutover:
<CUT-001>

Trigger:
<trigger>

Preconditions:
<conditions>

Action:
<action>

Expected State:
<state>

Validation:
<validation>

Completion:
<condition>
```

---

# 44. Cutover Criteria

Cutover may proceed only when defined preconditions are satisfied.

```text id="v6m3pq"
Criterion:
<criterion>

Evidence:
<evidence>

Blocking:
<YES | NO>

Owner:
<owner>
```

---

# 45. Cutover Verification

```text id="k5x9vp"
Verification:

- Traffic reaches target.
- Target behavior is correct.
- Data integrity is preserved.
- Contracts remain compatible.
- Security remains valid.
- Observability is available.
- Critical dependencies operate.
- Failure behavior remains acceptable.
```

Only applicable criteria should be included.

---

# 46. Rollback Strategy

```text id="r4m8pk"
Rollback:
<rollback>

Trigger:
<trigger>

Preconditions:
<conditions>

Actions:
<actions>

Expected Result:
<result>

Validation:
<validation>
```

---

# 47. Rollback Limitations

Rollback may be impossible or unsafe after certain irreversible operations.

```text id="v7q3mx"
Irreversible Operation:
<operation>

Point of No Return:
<condition>

Reason:
<reason>

Alternative Recovery:
<recovery>
```

Do not claim rollback capability when migration semantics make it impossible.

---

# 48. Rollback Verification

```text id="k8m5vp"
Scenario:
<scenario>

Rollback Trigger:
<trigger>

Expected State:
<state>

Data Integrity:
<requirement>

Contract Compatibility:
<requirement>

Evidence:
<evidence>
```

---

# 49. Recovery Strategy

Recovery is distinct from rollback.

```text id="r5x9mk"
Failure:
<failure>

Recovery:
<recovery>

Expected State:
<state>

Data Reconciliation:
<method>

Operational Validation:
<validation>
```

---

# 50. Migration Failure Handling

```text id="v8m4pq"
Failure:
<failure>

Detection:
<detection>

Containment:
<containment>

Recovery:
<recovery>

Escalation:
<escalation>

Evidence:
<evidence>
```

---

# 51. Partial Migration

```text id="k6m3vp"
Partially Migrated State:
<state>

Supported:
<YES | NO>

Detection:
<method>

Recovery:
<method>

Reconciliation:
<method>
```

Partial migration must be explicitly handled where it is possible.

---

# 52. Idempotent Migration Operations

Where repeated execution is possible:

```text id="r9x5mk"
Operation:
<operation>

Repeat Condition:
<condition>

Expected Result:
<result>

Duplicate Handling:
<behavior>
```

---

# 53. Migration Ordering

```text id="v4m8pq"
Step:
<step>

Depends On:
<step>

Ordering Requirement:
<requirement>

Reason:
<reason>
```

Do not assume ordering where no semantic dependency exists.

---

# 54. Migration Concurrency

```text id="k7x3vp"
Concurrent Operation:
<operation>

Migration Interaction:
<interaction>

Consistency Requirement:
<requirement>

Conflict:
<behavior>

Verification:
<test>
```

---

# 55. Schema Migration

```text id="r8m5pk"
Schema:
<schema>

Current:
<current>

Target:
<target>

Compatibility:
<requirement>

Deployment Sequence:
<sequence>

Rollback:
<behavior>
```

Schema migration must remain aligned with approved Data Contract and Persistence Specification.

---

# 56. Expand / Transition / Contract

Where applicable:

```text
Expand
  ↓
Transition
  ↓
Contract
```

Each stage must define:

* compatibility,
* validation,
* failure handling,
* rollback/recovery,
* retirement conditions.

---

# 57. Legacy Retirement

```text id="v6q4mx"
Legacy Element:
<element>

Retirement Condition:
<condition>

Dependencies Removed:
<dependencies>

Data Retained:
<data>

Operational Validation:
<validation>

Retirement Evidence:
<evidence>
```

Legacy retirement must not occur merely because the target system is deployed.

---

# 58. Legacy Decommissioning

```text id="k5m9vp"
Component:
<component>

Decommissioning Actions:
<actions>

Data:
<data>

Access:
<access>

Secrets:
<secrets>

Monitoring:
<monitoring>

Infrastructure:
<infrastructure>

Verification:
<verification>
```

---

# 59. Migration Observability

Migration observability should answer:

* Is migration progressing?
* Is data being transferred correctly?
* Are failures occurring?
* Are systems synchronized?
* Is target behavior correct?
* Are consumers compatible?
* Is rollback still possible?
* Has the migration reached a point of no return?

```text id="r4x8mk"
Operational Question:
<question>

Signal:
<signal>

Expected Evidence:
<evidence>
```

---

# 60. Migration Audit Evidence

```text id="v7m3pq"
Migration Action:
<action>

Actor:
<actor>

Time:
<time>

Result:
<result>

Evidence:
<evidence>
```

Audit requirements must follow approved security and compliance expectations.

---

# 61. Performance During Migration

If migration affects performance:

```text id="k9m4vp"
Scenario:
<scenario>

Expected Behavior:
<approved expectation>

Measurement:
<measurement>

Evidence:
<evidence>
```

Do not invent migration performance thresholds.

---

# 62. Availability During Migration

```text id="r8x5mk"
Capability:
<capability>

Availability Requirement:
<requirement>

Transition:
<transition>

Expected Behavior:
<behavior>

Evidence:
<evidence>
```

---

# 63. Data Loss Protection

```text id="v6m3pq"
Risk:
<data loss>

Protection:
<mechanism>

Detection:
<method>

Recovery:
<method>

Verification:
<test>
```

---

# 64. Duplicate Protection

```text id="k5x9vp"
Risk:
<duplicate>

Affected Data / Operation:
<scope>

Detection:
<method>

Handling:
<behavior>

Verification:
<test>
```

---

# 65. Reconciliation Process

```text id="r4m8pk"
Source:
<source>

Target:
<target>

Comparison:
<method>

Mismatch:
<handling>

Resolution:
<resolution>

Final Evidence:
<evidence>
```

---

# 66. Migration Verification

Verification must cover relevant:

* preconditions,
* data integrity,
* business behavior,
* contracts,
* compatibility,
* security,
* observability,
* runtime behavior,
* deployment,
* failure,
* recovery,
* rollback,
* retirement.

```text id="v7q3mx"
Migration Verification:
<verification>

Expected Evidence:
<evidence>

Status:
<status>
```

---

# 67. Migration Test Scenarios

| ID           | Scenario     | Expected Result | Evidence     | Status     |
| ------------ | ------------ | --------------- | ------------ | ---------- |
| MIG-TEST-001 | `<scenario>` | `<result>`      | `<evidence>` | `<status>` |

---

# 68. Compatibility Matrix

| Participant     | Current     | Target      | Compatible | Verification |
| --------------- | ----------- | ----------- | ---------- | ------------ |
| `<participant>` | `<version>` | `<version>` | `<yes/no>` | `<test>`     |

---

# 69. Migration Risk Register

| ID        | Risk     | Severity     | Probability     | Mitigation     | Status     |
| --------- | -------- | ------------ | --------------- | -------------- | ---------- |
| MIG-R-001 | `<risk>` | `<severity>` | `<probability>` | `<mitigation>` | `<status>` |

---

# 70. Migration Unknowns

| ID        | Unknown     | Impact     | Blocking   | Resolution |
| --------- | ----------- | ---------- | ---------- | ---------- |
| MIG-U-001 | `<unknown>` | `<impact>` | `<yes/no>` | `<method>` |

---

# 71. Migration Assumptions

| ID        | Assumption     | Evidence     | Confidence     | Validation |
| --------- | -------------- | ------------ | -------------- | ---------- |
| MIG-A-001 | `<assumption>` | `<evidence>` | `<confidence>` | `<method>` |

---

# 72. Migration Constraints

```text id="k8m5vp"
Constraint:
<constraint>

Source:
<source>

Strength:
<MANDATORY | PREFERRED>

Impact:
<impact>

Validation:
<validation>
```

---

# 73. Migration Stop Conditions

Migration must stop or pause when a defined blocking condition occurs.

```text id="r5x9mk"
Stop Condition:
<condition>

Detection:
<method>

Action:
<pause / rollback / recovery / escalation>

Authority:
<authority>
```

---

# 74. Migration Go / No-Go

```text id="v8m4pq"
Decision:

GO
NO-GO
PAUSE
ROLLBACK
```

### GO

All mandatory preconditions are satisfied.

### NO-GO

Migration must not begin.

### PAUSE

Migration may continue only after a defined blocking condition is resolved.

### ROLLBACK

Migration must return to the supported prior state.

---

# 75. Migration Completion Criteria

Migration is complete only when:

* [ ] Target state is operational.
* [ ] Required data is migrated.
* [ ] Data integrity is verified.
* [ ] Required contracts are compatible.
* [ ] Security controls are verified.
* [ ] Observability is operational.
* [ ] Critical business behavior is verified.
* [ ] Migration-specific risks are resolved or accepted.
* [ ] Legacy responsibilities are retired where applicable.
* [ ] Reconciliation is complete.
* [ ] Evidence is retained.
* [ ] Traceability is updated.

---

# 76. Migration Completion Evidence

```text id="k6m3vp"
Evidence:

Target State:
<evidence>

Data:
<evidence>

Contracts:
<evidence>

Security:
<evidence>

Operations:
<evidence>

Retirement:
<evidence>
```

---

# 77. Post-Migration Validation

```text id="r9x5mk"
Validation Window:
<window>

Behavior:
<validation>

Data:
<validation>

Performance:
<validation>

Security:
<validation>

Observability:
<validation>

Operational Stability:
<validation>
```

The validation window must be defined by the relevant operational or product requirements.

---

# 78. Migration Handoff

### Architecture Must Provide

* approved target architecture,
* relevant decisions,
* boundary ownership,
* contract expectations,
* constraints,
* accepted risks.

### Specifications Must Provide

* implementation behavior,
* compatibility behavior,
* data mappings,
* failure behavior,
* validation criteria.

### Migration Must Provide

* transition procedure,
* sequencing,
* cutover criteria,
* rollback/recovery behavior,
* reconciliation,
* verification evidence,
* retirement criteria.

---

# 79. Architecture Escalation Triggers

Escalate when migration requires:

* a new architectural boundary,
* a new bounded context,
* changed data ownership,
* changed source of truth,
* new integration semantics,
* changed consistency model,
* new security trust boundary,
* changed contract semantics,
* unsupported runtime behavior,
* new infrastructure architecture,
* or a new consequential architectural decision.

---

# 80. Contract Escalation Triggers

Escalate when migration:

* breaks an API contract,
* changes event semantics,
* changes data meaning,
* changes security expectations,
* removes required observability,
* changes compatibility guarantees,
* or introduces transitional behavior not represented in the approved contract.

---

# 81. Test Escalation Triggers

Escalate when:

* migration cannot be verified,
* rollback cannot be verified,
* reconciliation cannot be performed,
* data integrity cannot be demonstrated,
* compatibility cannot be demonstrated,
* failure behavior is unknown,
* or critical migration evidence is unavailable.

---

# 82. Traceability

```text
Migration Requirement
        ↓
Architecture Decision
        ↓
Target Architecture
        ↓
Contract
        ↓
Migration Specification
        ↓
Migration Implementation
        ↓
Verification
        ↓
Migration Evidence
```

Relationships may include:

* `MIGRATES`
* `TRANSITIONS_TO`
* `PRESERVES`
* `VALIDATES`
* `RECONCILES`
* `RETIRES`
* `DEPENDS_ON`
* `VERIFIES`
* `SUPERSEDES`

---

# 83. Existing System Representation

For existing systems, distinguish:

```text
Documented State
      ↓
Observed / Actual State
      ↓
Target State
```

Differences must be explicitly recorded.

Historical documentation must not be treated as authoritative when observed behavior contradicts it.

---

# 84. System Evolution

For evolutionary changes:

```text
Current Capability
        ↓
Transition Boundary
        ↓
Target Capability
```

The specification should focus on the smallest transition scope necessary to safely realize the approved change.

---

# 85. Migration Findings

| ID        | Finding     | Severity     | Impact     | Action     | Status     |
| --------- | ----------- | ------------ | ---------- | ---------- | ---------- |
| MIG-F-001 | `<finding>` | `<severity>` | `<impact>` | `<action>` | `<status>` |

---

# 86. Migration Specification Outcome

```text id="v4m8pq"
Outcome:

READY
READY_WITH_RISKS
INCOMPLETE
BLOCKED
NOT_REQUIRED
```

## READY

The migration can be implemented and verified from sufficiently precise specifications.

## READY_WITH_RISKS

Migration can proceed with explicitly accepted non-blocking risks.

## INCOMPLETE

Important migration behavior remains unspecified.

## BLOCKED

A critical architectural, contractual, data, security, operational, or verification dependency remains unresolved.

## NOT_REQUIRED

No migration specification is required for the relevant scope.

---

# 87. Review Checklist

### Context

* [ ] Current state is evidence-based.
* [ ] Target state is approved.
* [ ] Transition states are explicit.

### Data

* [ ] Ownership is known.
* [ ] Mappings are defined.
* [ ] Integrity is verifiable.
* [ ] Reconciliation is defined.
* [ ] Historical data behavior is defined.

### Contracts

* [ ] API compatibility is defined.
* [ ] Event compatibility is defined.
* [ ] Data compatibility is defined.
* [ ] Security compatibility is defined.
* [ ] Observability continuity is defined.

### Operations

* [ ] Preconditions are defined.
* [ ] Cutover is defined.
* [ ] Rollback limitations are known.
* [ ] Recovery is defined.
* [ ] Stop conditions are defined.
* [ ] Observability is available.

### Verification

* [ ] Migration tests are defined.
* [ ] Data validation is defined.
* [ ] Compatibility is tested.
* [ ] Failure behavior is tested.
* [ ] Rollback/recovery is tested where applicable.
* [ ] Completion evidence is defined.

### Governance

* [ ] Architecture decisions are not silently changed.
* [ ] Risks are explicit.
* [ ] Unknowns are explicit.
* [ ] Traceability is maintained.
* [ ] Legacy retirement is evidence-based.

---

# 88. Agent Instructions

When producing a Migration Specification:

1. Establish the actual current state.
2. Establish the approved target state.
3. Identify transition states.
4. Identify migration boundaries.
5. Identify affected contracts.
6. Identify affected data.
7. Identify ownership transitions.
8. Identify compatibility requirements.
9. Define migration sequencing.
10. Define preconditions.
11. Define cutover behavior.
12. Define failure behavior.
13. Define rollback limitations.
14. Define recovery behavior.
15. Define reconciliation.
16. Define verification.
17. Define observability.
18. Define security preservation.
19. Define legacy retirement.
20. Preserve historical state.
21. Do not invent migration guarantees.
22. Do not assume rollback is always possible.
23. Do not introduce architecture through migration mechanics.
24. Escalate architectural consequences to ADR governance.
25. Keep migration scope proportional to the actual change.
26. Preserve traceability throughout the transition.
27. Treat irreversible operations explicitly.
28. Verify the target state rather than merely verifying migration execution.

---

# 89. Anti-Patterns

## Migration as Deployment

Treating deployment of the new version as proof that migration is complete.

## Big-Bang by Default

Choosing a single cutover merely because it is simpler to describe.

## Rollback Illusion

Claiming rollback capability after irreversible data or contract changes.

## Data Copy Equals Migration

Assuming copied data automatically preserves semantics and integrity.

## Schema-Driven Migration

Treating database structure as the authoritative representation of domain meaning.

## Dual-Write by Convenience

Introducing dual writes without explicit consistency, failure, reconciliation, and retirement semantics.

## Legacy Worship

Preserving legacy behavior merely because it already exists.

## Legacy Erasure

Ignoring actual legacy behavior because documentation describes an intended state.

## Silent Contract Change

Changing API, event, data, security, or observability semantics during migration without contract governance.

## Unbounded Coexistence

Allowing transitional systems to coexist indefinitely without retirement criteria.

## Unverified Cutover

Switching responsibility without explicit validation.

## Reconciliation Blindness

Assuming source and target are equivalent without comparison.

## Data Loss Blindness

Failing to define how missing or duplicated data is detected.

## Compatibility by Hope

Assuming versions will interoperate without verification.

## Migration Without Observability

Executing a migration without the signals necessary to determine its state.

## Migration as Architecture

Using migration mechanics to introduce architecture that was never explicitly decided.

## Irreversibility Blindness

Failing to identify the point after which rollback is no longer possible.

## Migration Theater

Producing elaborate migration procedures without evidence that the actual transition risks are controlled.

---

# 90. Safe Progression Question

Before accepting this specification:

> **Can the approved current-to-target transition be implemented and verified with explicit data, compatibility, sequencing, cutover, failure, recovery, security, observability, rollback, reconciliation, and retirement semantics without introducing unsupported architectural assumptions?**

If not, determine whether the missing decision belongs to:

```text
Product
Domain
Architecture
Contract
ADR
Specification
Data
Security
Operations
Infrastructure
Migration
```

---

# 91. Final Principle

> **A Migration Specification turns an approved system transition into a controlled, observable, verifiable, and reversible-where-possible operational process. It preserves the meaning and guarantees of the approved system while making transitional behavior explicit.**

The intended relationship is:

```text
Current State
      ↓
Approved Target State
      ↓
Architecture / Contracts / ADRs
      ↓
Migration Specification
      ↓
Migration Implementation
      ↓
Cutover / Transition
      ↓
Validation / Reconciliation
      ↓
Target State
      ↓
Legacy Retirement
```

A healthy Migration Specification makes clear **what changes, what must remain compatible, what data and responsibilities move, what happens during coexistence, how cutover is validated, where rollback stops being possible, how failures are recovered, how reconciliation is performed, and what evidence proves that the target state has actually been reached.**
