# Deployment Specification

## 1. Document Metadata

| Field                 | Value                    |
| --------------------- | ------------------------ |
| Document Type         | Deployment Specification |
| Lifecycle Phase       | Specifications / SDD     |
| Specification Type    | `DEPLOYMENT`             |
| Status                | `DRAFT`                  |
| Version               | `0.1`                    |
| System                | `<system>`               |
| Deployment Scope      | `<scope>`                |
| Owner                 | `<owner>`                |
| Created               | `<date>`                 |
| Last Updated          | `<date>`                 |
| Architecture Baseline | `<baseline>`             |
| ADR Baseline          | `<baseline>`             |

---

# 2. Purpose

This document specifies implementation-relevant deployment behavior for an approved architecture.

It defines how approved runtime units are:

* packaged,
* provisioned,
* placed into environments,
* configured for deployment,
* started,
* exposed,
* connected,
* upgraded,
* scaled,
* monitored,
* recovered,
* rolled back,
* and retired.

The specification translates approved architecture, runtime behavior, infrastructure expectations, contracts, configuration, and ADRs into actionable deployment guidance.

---

# 3. Core Principle

> **Deployment Specification defines how approved runtime units are delivered and operated within an approved environment without silently redefining architecture, infrastructure strategy, or runtime semantics.**

Deployment is concerned with **where and how software is deployed**.

Runtime is concerned with **how software behaves while executing**.

Infrastructure is concerned with **the underlying resources and platform capabilities supporting deployment and execution**.

---

# 4. Fundamental Distinctions

## Architecture

Defines the approved structural and behavioral architecture.

## Runtime

Defines how the system behaves during execution.

## Deployment

Defines how runtime units are packaged, placed, started, exposed, upgraded, and retired within environments.

## Infrastructure

Defines the resources and platform capabilities available to support deployment.

## Configuration

Defines values controlling approved runtime and deployment behavior.

## Deployment Specification

Defines implementation-relevant deployment behavior derived from those approved decisions.

---

# 5. Entry Conditions

Before creating this specification:

* [ ] Architecture baseline is available.
* [ ] Container/runtime boundaries are understood.
* [ ] Relevant ADRs are available.
* [ ] Runtime Specification is available where required.
* [ ] Configuration Specification is available where relevant.
* [ ] Infrastructure responsibilities are sufficiently understood.
* [ ] Security boundaries are known.
* [ ] Observability expectations are known.
* [ ] Deployment environments are identified.
* [ ] Migration requirements are understood where applicable.
* [ ] Blocking deployment unknowns are identified.

---

# 6. Deployment Identity

```text id="n4x7pm"
Deployment Scope:
<scope>

Deployment Unit:
<unit>

Environment:
<environment>

Owner:
<owner>

Criticality:
<LOW | MEDIUM | HIGH | CRITICAL>

Status:
<DRAFT | ACCEPTED | ACTIVE | SUPERSEDED>
```

---

# 7. Deployment Model

```text id="r8m3vk"
Deployment Model:
<model>

Deployment Units:
<units>

Environments:
<environments>

External Dependencies:
<dependencies>

Network Boundaries:
<boundaries>

Deployment Strategy:
<strategy>
```

The deployment model must remain consistent with approved architecture.

---

# 8. Deployment Unit Catalog

| ID      | Deployment Unit | Runtime Unit | Environment     | Responsibility     |
| ------- | --------------- | ------------ | --------------- | ------------------ |
| DEP-001 | `<unit>`        | `<runtime>`  | `<environment>` | `<responsibility>` |

A deployment unit does not necessarily represent:

* a bounded context,
* a container,
* a microservice,
* a database,
* or a single process.

The relationship must be explicitly established.

---

# 9. Environment Model

Typical environments may include:

* development,
* testing,
* integration,
* staging,
* production,
* disaster recovery,
* migration,
* temporary validation.

Only environments required by the project should be represented.

```text id="v6q2mx"
Environment:
<environment>

Purpose:
<purpose>

Deployment Units:
<units>

External Dependencies:
<dependencies>

Configuration Profile:
<configuration>

Security Context:
<context>

Operational Constraints:
<constraints>
```

---

# 10. Environment Differences

```text id="k8m4vp"
Aspect:
<aspect>

Environment A:
<behavior>

Environment B:
<behavior>

Reason:
<reason>

Compatibility:
<impact>
```

Environment differences must be explicit.

Avoid undocumented environment-specific behavior.

---

# 11. Deployment Target

```text id="r5x9mk"
Deployment Target:
<target>

Target Type:
<type>

Runtime Support:
<support>

Required Capabilities:
<capabilities>

Constraints:
<constraints>
```

Do not select a deployment platform solely because it is familiar.

---

# 12. Packaging

```text id="v3m8pq"
Deployment Unit:
<unit>

Package Type:
<package>

Contents:
<contents>

Required Metadata:
<metadata>

Runtime Dependency:
<dependency>

Configuration:
<configuration>
```

Packaging should contain only what the deployment unit requires.

---

# 13. Artifact Identity

```text id="n7x4vm"
Artifact:
<artifact>

Version:
<version>

Source Revision:
<revision>

Build Identifier:
<identifier>

Integrity:
<verification>

Compatibility:
<requirements>
```

Artifact identity must be traceable to the source and build process.

---

# 14. Artifact Promotion

```text id="r9m5pk"
Source Environment:
<environment>

Target Environment:
<environment>

Artifact:
<artifact>

Promotion Condition:
<condition>

Verification:
<verification>
```

Promotion should preserve artifact identity when the deployment process requires immutable promotion.

---

# 15. Deployment Configuration

Deployment configuration must be separated from application/runtime configuration.

```text id="v8q3mx"
Deployment Configuration:
<configuration>

Purpose:
<purpose>

Owner:
<owner>

Environment:
<environment>

Source:
<source>

Precedence:
<precedence>
```

Examples may include:

* deployment replicas,
* resource assignments,
* environment references,
* exposed ports,
* deployment metadata,
* placement constraints,
* runtime startup parameters.

Only approved configuration categories should be included.

---

# 16. Configuration Relationship

```text id="k5m9vp"
Deployment Configuration
          ↓
Runtime Configuration
          ↓
Runtime Behavior
```

Deployment configuration must not silently override approved runtime semantics.

---

# 17. Environment Configuration Matrix

| Configuration | Development         | Testing             | Staging             | Production          |
| ------------- | ------------------- | ------------------- | ------------------- | ------------------- |
| `<item>`      | `<value/reference>` | `<value/reference>` | `<value/reference>` | `<value/reference>` |

Do not place sensitive values directly in this document.

---

# 18. Secret References

```text id="r7x4mk"
Secret:
<secret>

Purpose:
<purpose>

Owner:
<owner>

Source:
<secret-management mechanism>

Consumer:
<deployment unit>

Rotation:
<requirement>
```

Secret values must never be stored in the specification.

---

# 19. Deployment Dependencies

| ID          | Dependency     | Type     | Required   | Environment     | Failure Impact |
| ----------- | -------------- | -------- | ---------- | --------------- | -------------- |
| DEP-EXT-001 | `<dependency>` | `<type>` | `<yes/no>` | `<environment>` | `<impact>`     |

Deployment dependencies may include:

* infrastructure services,
* identity services,
* network capabilities,
* storage,
* databases,
* messaging systems,
* external services,
* secret/configuration providers.

---

# 20. Network Exposure

```text id="v3m8pq"
Deployment Unit:
<unit>

Exposure:
<internal | external | restricted>

Entry Point:
<entry point>

Consumers:
<consumers>

Protocol:
<approved protocol>

Security Boundary:
<boundary>
```

Network exposure must align with approved API and Security Contracts.

---

# 21. Network Connectivity

```text id="n7x4vm"
Source:
<deployment unit>

Destination:
<deployment unit>

Purpose:
<purpose>

Protocol:
<protocol>

Direction:
<direction>

Security Requirement:
<requirement>

Failure Behavior:
<behavior>
```

Connectivity does not automatically imply trust.

---

# 22. Service Discovery

When service discovery is required:

```text id="r9m5pk"
Service:
<service>

Discovery Mechanism:
<mechanism>

Identity:
<identity>

Resolution:
<behavior>

Failure:
<behavior>
```

Do not introduce a service-discovery mechanism unless the architecture requires one.

---

# 23. Ingress / Entry Boundary

```text id="v8q3mx"
Entry Boundary:
<boundary>

Consumers:
<consumers>

Routing:
<routing>

Security:
<security>

Failure:
<failure>

Observability:
<observability>
```

The specification should preserve approved API and security semantics.

---

# 24. Deployment Health

Deployment health should distinguish:

* deployment availability,
* runtime readiness,
* runtime liveness,
* dependency health,
* infrastructure health.

These are not interchangeable.

```text id="k5m9vp"
Deployment Health:
<condition>

Runtime Health:
<condition>

Dependency Health:
<condition>

Infrastructure Health:
<condition>
```

---

# 25. Startup During Deployment

```text id="r7x4mk"
Deployment Trigger:
<trigger>

Deployment Sequence:
<sequence>

Runtime Startup:
<behavior>

Readiness:
<condition>

Traffic Admission:
<condition>
```

Deployment must not route traffic to a runtime instance before its approved readiness condition is satisfied.

---

# 26. Deployment Ordering

When ordering matters:

```text id="v3m8pq"
Deployment Unit:
<unit>

Depends On:
<unit>

Reason:
<reason>

Required Ordering:
<ordering>

Failure:
<behavior>
```

Do not impose deployment ordering when units can safely operate independently.

---

# 27. Parallel Deployment

When units may be deployed concurrently:

```text id="n7x4vm"
Units:
<units>

Parallel Deployment:
<YES>

Compatibility Requirement:
<requirement>

Shared Dependency:
<dependency>

Failure Handling:
<behavior>
```

---

# 28. Rolling Deployment

When rolling deployment is approved:

```text id="r9m5pk"
Deployment Unit:
<unit>

Strategy:
<rolling>

Compatibility:
<requirement>

Traffic Transition:
<behavior>

Failure Detection:
<condition>

Rollback:
<behavior>
```

The strategy must preserve contract and runtime compatibility.

---

# 29. Blue-Green Deployment

When approved:

```text id="v8q3mx"
Current Environment:
<environment>

Target Environment:
<environment>

Traffic Switch:
<condition>

Validation:
<validation>

Rollback:
<condition>
```

---

# 30. Canary Deployment

When approved:

```text id="k5m9vp"
Deployment:
<deployment>

Initial Traffic:
<approved condition>

Expansion:
<condition>

Success Criteria:
<criteria>

Abort Condition:
<condition>

Rollback:
<behavior>
```

Do not invent traffic percentages or thresholds.

---

# 31. Deployment Validation

```text id="r7x4mk"
Deployment:
<deployment>

Validation Conditions:

- <condition>
- <condition>
- <condition>

Verification:
<verification>
```

Validation should include only meaningful conditions.

---

# 32. Deployment Failure

```text id="v3m8pq"
Failure:
<failure>

Detection:
<method>

Deployment State:
<state>

Runtime Impact:
<impact>

Recovery:
<recovery>

Rollback:
<rollback>
```

---

# 33. Rollback

```text id="n7x4vm"
Rollback Trigger:
<trigger>

Rollback Target:
<version>

Preconditions:
<conditions>

Procedure:
<procedure>

Data Considerations:
<considerations>

Verification:
<verification>
```

Rollback must consider schema, data, contracts, configuration, and compatibility.

---

# 34. Rollback Safety

```text id="r9m5pk"
Rollback:
<rollback>

Safe:
<YES | NO | CONDITIONAL>

Reason:
<reason>

Known Irreversible Changes:
<changes>

Mitigation:
<mitigation>
```

A deployment must not claim rollback safety when irreversible data or contract changes exist.

---

# 35. Database / Schema Deployment

When schema changes are part of deployment:

```text id="v8q3mx"
Schema Change:
<change>

Application Compatibility:
<compatibility>

Migration:
<migration>

Rollback:
<rollback>

Data Risk:
<risk>
```

Database changes must align with the Data/Persistence Specification.

---

# 36. Expand / Migrate / Contract

For compatibility-sensitive schema evolution:

```text id="k5m9vp"
Phase 1 — Expand:
<change>

Phase 2 — Migrate:
<change>

Phase 3 — Contract:
<change>
```

This pattern should only be used when justified by the migration strategy.

---

# 37. Contract Compatibility During Deployment

```text id="r7x4mk"
Provider:
<provider>

Consumer:
<consumer>

Old Contract:
<contract>

New Contract:
<contract>

Compatibility:
<requirement>

Deployment Sequence:
<sequence>
```

Deployment must not create transient contract incompatibility unless explicitly designed.

---

# 38. Runtime Version Compatibility

```text id="v3m8pq"
Runtime Version A:
<version>

Runtime Version B:
<version>

Compatibility:
<requirement>

Coexistence:
<YES | NO>

Migration:
<behavior>
```

---

# 39. Deployment State

```text id="n7x4vm"
Deployment State:

PLANNED
READY
IN_PROGRESS
VALIDATING
ACTIVE
DEGRADED
FAILED
ROLLING_BACK
ROLLED_BACK
RETIRED
```

Only relevant states should be retained.

---

# 40. Deployment State Transitions

```text id="r9m5pk"
PLANNED
   ↓
READY
   ↓
IN_PROGRESS
   ↓
VALIDATING
   ↓
ACTIVE
```

Failure paths:

```text id="v8q3mx"
IN_PROGRESS → FAILED
VALIDATING → FAILED
FAILED → ROLLING_BACK
ROLLING_BACK → ROLLED_BACK
```

Actual transitions depend on deployment strategy.

---

# 41. Deployment Scaling

When deployment scaling is part of the approved architecture:

```text id="k5m9vp"
Deployment Unit:
<unit>

Scaling Model:
<model>

Trigger:
<trigger>

Constraints:
<constraints>

State:
<state>

Verification:
<verification>
```

Do not confuse deployment scaling with runtime concurrency.

---

# 42. Placement Constraints

When relevant:

```text id="r7x4mk"
Deployment Unit:
<unit>

Placement Requirement:
<requirement>

Reason:
<reason>

Failure:
<behavior>
```

Examples may include:

* geographic placement,
* data locality,
* hardware capability,
* isolation,
* compliance,
* dependency locality.

---

# 43. Availability Zones / Failure Domains

When applicable:

```text id="v3m8pq"
Deployment Unit:
<unit>

Failure Domain:
<domain>

Distribution Requirement:
<requirement>

Reason:
<reason>

Failure Behavior:
<behavior>
```

Do not claim fault tolerance merely because multiple instances exist.

---

# 44. Deployment Resource Requirements

```text id="n7x4vm"
Resource:
<resource>

Deployment Requirement:
<requirement>

Reason:
<reason>

Constraint Source:
<requirement / ADR / infrastructure baseline>
```

Numerical values must be evidence-based.

---

# 45. Resource Limits

```text id="r9m5pk"
Resource:
<resource>

Requested:
<value>

Limit:
<value>

Source:
<evidence>

Behavior at Limit:
<behavior>
```

If limits are not known, record them as unknown rather than inventing values.

---

# 46. Infrastructure Dependency

```text id="v8q3mx"
Infrastructure Capability:
<capability>

Deployment Dependency:
<dependency>

Required:
<YES | NO | CONDITIONAL>

Failure Impact:
<impact>
```

Infrastructure details should be expanded in the Infrastructure Specification.

---

# 47. Deployment Security

Deployment security should define:

* deployment authority,
* artifact integrity,
* environment access,
* secret access,
* privileged operations,
* deployment isolation,
* audit expectations.

```text id="k5m9vp"
Security Boundary:
<boundary>

Deployment Authority:
<authority>

Required Privileges:
<privileges>

Protected Resources:
<resources>

Audit:
<requirement>
```

---

# 48. Artifact Integrity

```text id="r7x4mk"
Artifact:
<artifact>

Integrity Mechanism:
<mechanism>

Verification:
<verification>

Failure:
<behavior>
```

Do not prescribe a specific signing or verification technology unless already approved.

---

# 49. Deployment Observability

Deployment observability should support questions such as:

* Did the deployment complete?
* Which artifact is active?
* Which version is running?
* Did instances become ready?
* Did dependency connectivity succeed?
* Did error rates or failures change?
* Was rollback triggered?
* Is the deployment degraded?

Deployment observability must align with the Observability Contract.

---

# 50. Deployment Audit

```text id="v3m8pq"
Audited Action:
<action>

Actor:
<actor>

Artifact:
<artifact>

Environment:
<environment>

Timestamp:
<timestamp>

Result:
<result>
```

Audit requirements must originate from security, compliance, operational, or governance requirements.

---

# 51. Deployment Access Control

```text id="n7x4vm"
Action:
<deployment action>

Actor:
<actor>

Required Authority:
<authority>

Allowed:
<condition>

Denied:
<behavior>

Audit:
<requirement>
```

Business authorization and deployment authorization must remain distinct.

---

# 52. Deployment Secrets

Deployment mechanisms may require access to:

* credentials,
* certificates,
* keys,
* tokens,
* configuration secrets.

The specification must describe their use and ownership without exposing secret values.

---

# 53. Deployment Scheduling

When deployment timing is constrained:

```text id="r9m5pk"
Deployment:
<deployment>

Schedule:
<schedule>

Reason:
<reason>

Preconditions:
<conditions>

Rollback Window:
<window>
```

Do not invent maintenance windows.

---

# 54. Scheduled Deployment

```text id="v8q3mx"
Trigger:
<trigger>

Preconditions:
<conditions>

Deployment:
<deployment>

Validation:
<validation>

Failure:
<behavior>
```

---

# 55. Deployment Freeze

When applicable:

```text id="k5m9vp"
Freeze Condition:
<condition>

Affected Environments:
<environments>

Exceptions:
<exceptions>

Authority:
<authority>
```

---

# 56. Deployment Dependencies and Ordering

Deployment dependencies must be represented explicitly:

```text id="r7x4mk"
Artifact A
    ↓
Dependency B
    ↓
Runtime Readiness
    ↓
Traffic Admission
```

The exact sequence depends on the approved architecture and deployment strategy.

---

# 57. Deployment Recovery

```text id="v3m8pq"
Failure:
<failure>

Detection:
<detection>

Immediate Action:
<action>

Recovery:
<recovery>

Verification:
<verification>
```

---

# 58. Disaster Recovery Deployment

When applicable:

```text id="n7x4vm"
Recovery Environment:
<environment>

Trigger:
<trigger>

Required Artifacts:
<artifacts>

Required Data:
<data>

Dependencies:
<dependencies>

Validation:
<validation>

Return to Normal:
<procedure>
```

Disaster recovery behavior must align with approved resilience and recoverability requirements.

---

# 59. Deployment Migration

For system evolution:

```text id="r9m5pk"
Current Deployment:
<current>

Target Deployment:
<target>

Transition:
<transition>

Parallel Operation:
<condition>

Cutover:
<condition>

Rollback:
<condition>
```

---

# 60. Coexistence

```text id="v8q3mx"
Old Deployment:
<old>

New Deployment:
<new>

Shared Contracts:
<contracts>

Shared Data:
<data>

Compatibility:
<requirement>

Retirement:
<condition>
```

---

# 61. Deployment Retirement

```text id="k5m9vp"
Deployment Unit:
<unit>

Retirement Trigger:
<trigger>

Consumers:
<consumers>

Dependencies:
<dependencies>

Data:
<data>

Verification:
<verification>
```

Retirement must not occur while active consumers or required dependencies remain undocumented.

---

# 62. Deployment Cleanup

Cleanup may include:

* obsolete artifacts,
* obsolete configuration,
* obsolete credentials,
* obsolete routing,
* obsolete deployment resources,
* deprecated runtime versions.

Cleanup must be verified before destructive actions.

---

# 63. Existing System Deployment Analysis

For existing systems:

```text id="r7x4mk"
Documented Deployment:
<documentation>

Observed Deployment:
<actual>

Known Constraints:
<constraints>

Target Deployment:
<target>

Difference:
<difference>

Risk:
<risk>
```

Observed deployment behavior should take precedence over obsolete documentation when evidence conflicts.

---

# 64. Legacy Deployment

Legacy deployment behavior should be classified as:

* required,
* transitional,
* tolerated,
* obsolete,
* unknown.

Legacy behavior must not automatically become a target-state requirement.

---

# 65. Deployment Compatibility Matrix

| Deployment Version | Runtime Version | Contract Version | Data Version | Compatible |
| ------------------ | --------------- | ---------------- | ------------ | ---------- |
| `<version>`        | `<version>`     | `<version>`      | `<version>`  | `<yes/no>` |

---

# 66. Deployment Verification

Verification should cover:

### Artifact

* [ ] Correct artifact deployed.
* [ ] Artifact identity verified.
* [ ] Artifact integrity verified.

### Runtime

* [ ] Runtime starts.
* [ ] Runtime becomes ready.
* [ ] Runtime health is valid.
* [ ] Dependencies are available.

### Contracts

* [ ] API compatibility verified.
* [ ] Event compatibility verified where applicable.
* [ ] Data compatibility verified.
* [ ] Security behavior verified.

### Operations

* [ ] Observability available.
* [ ] Deployment status visible.
* [ ] Failure behavior verified.
* [ ] Rollback behavior verified where required.

---

# 67. Deployment Test Scenario

```text id="v3m8pq"
Scenario ID:
<DEP-TEST-001>

Given:
<initial environment>

When:
<deployment action>

Then:
<expected result>

And:
<runtime verification>

And:
<contract verification>

And:
<observability verification>
```

---

# 68. Failure Test Scenario

```text id="n7x4vm"
Scenario ID:
<DEP-FAIL-001>

Given:
<deployment state>

When:
<failure>

Then:
<expected deployment behavior>

And:
<runtime impact>

And:
<recovery or rollback>
```

---

# 69. Rollback Test Scenario

```text id="r9m5pk"
Scenario ID:
<DEP-ROLLBACK-001>

Given:
<deployment state>

When:
<rollback trigger>

Then:
<rollback result>

And:
<compatibility result>

And:
<data result>
```

---

# 70. Migration Test Scenario

```text id="v8q3mx"
Scenario ID:
<DEP-MIGRATION-001>

Given:
<current deployment>

When:
<migration step>

Then:
<expected state>

And:
<compatibility>

And:
<rollback condition>
```

---

# 71. Deployment Risks

| ID        | Risk     | Severity     | Impact     | Mitigation     |
| --------- | -------- | ------------ | ---------- | -------------- |
| DEP-R-001 | `<risk>` | `<severity>` | `<impact>` | `<mitigation>` |

---

# 72. Deployment Unknowns

| ID        | Unknown     | Impact     | Blocking   | Resolution |
| --------- | ----------- | ---------- | ---------- | ---------- |
| DEP-U-001 | `<unknown>` | `<impact>` | `<yes/no>` | `<method>` |

---

# 73. Deployment Assumptions

| ID        | Assumption     | Evidence     | Confidence     | Validation |
| --------- | -------------- | ------------ | -------------- | ---------- |
| DEP-A-001 | `<assumption>` | `<evidence>` | `<confidence>` | `<method>` |

---

# 74. Architecture Escalation Triggers

Escalate to Architecture / ADR governance when deployment analysis introduces or reveals:

* a new deployment topology,
* a new trust boundary,
* a new network boundary,
* a new runtime dependency,
* a new availability strategy,
* a new scaling model,
* a new data locality requirement,
* a new consistency requirement,
* a new cross-system dependency,
* a new contract compatibility requirement,
* a new migration strategy,
* a new failure-isolation boundary,
* or a new infrastructure architectural decision.

Deployment Specification must not silently become Infrastructure Architecture.

---

# 75. Traceability

| Deployment Element | Upstream Artifact | Relationship | Verification     |
| ------------------ | ----------------- | ------------ | ---------------- |
| `<element>`        | `<artifact>`      | `REFINES`    | `<verification>` |

Typical relationship:

```text id="k5m9vp"
Architecture
      ↓
ADR
      ↓
Runtime / Contracts / Configuration
      ↓
Deployment Specification
      ↓
Deployment Implementation
      ↓
Deployment Verification
```

---

# 76. Specification Review Checklist

### Architecture

* [ ] Deployment units are aligned with approved architecture.
* [ ] No new architectural boundary was introduced silently.
* [ ] Deployment topology is justified.
* [ ] Current and target deployment are distinguishable.

### Environments

* [ ] Relevant environments are identified.
* [ ] Environment differences are explicit.
* [ ] Environment-specific assumptions are documented.

### Artifacts

* [ ] Artifact identity is traceable.
* [ ] Artifact integrity is addressed.
* [ ] Promotion behavior is defined where relevant.

### Configuration

* [ ] Deployment configuration is separated from runtime configuration.
* [ ] Secrets are referenced securely.
* [ ] Configuration precedence is understood.

### Networking

* [ ] Network exposure is explicit.
* [ ] Connectivity is explicit.
* [ ] Trust is not inferred from network location.

### Deployment Strategy

* [ ] Deployment strategy is defined where necessary.
* [ ] Compatibility is addressed.
* [ ] Validation is defined.
* [ ] Rollback is addressed.
* [ ] Irreversible changes are identified.

### Runtime

* [ ] Startup behavior is aligned with Runtime Specification.
* [ ] Readiness is respected.
* [ ] Runtime dependencies are available.
* [ ] Runtime state implications are understood.

### Data

* [ ] Schema changes are aligned with Data/Persistence Specification.
* [ ] Migration compatibility is addressed.
* [ ] Rollback limitations are explicit.

### Security

* [ ] Deployment authorization is defined.
* [ ] Artifact integrity is addressed.
* [ ] Secret handling is safe.
* [ ] Privileged operations are controlled.

### Observability

* [ ] Deployment state is observable.
* [ ] Deployment failures are observable.
* [ ] Runtime readiness is observable.
* [ ] Rollback is observable where relevant.

### Verification

* [ ] Successful deployment is testable.
* [ ] Failure is testable.
* [ ] Rollback is testable where required.
* [ ] Migration is testable where required.

---

# 77. Specification Outcome

```text id="r7x4mk"
Outcome:

READY
READY_WITH_RISKS
INCOMPLETE
BLOCKED
NOT_REQUIRED
```

## READY

Deployment behavior is sufficiently specified for implementation and verification.

## READY_WITH_RISKS

Deployment may proceed with explicit non-blocking risks.

## INCOMPLETE

Important deployment behavior remains unspecified.

## BLOCKED

An unresolved architectural, infrastructure, security, compatibility, migration, or operational issue prevents safe progression.

## NOT_REQUIRED

An independent Deployment Specification is unnecessary for the relevant scope.

---

# 78. Handoff

### Implementation Must Preserve

* deployment boundaries,
* artifact identity,
* environment semantics,
* compatibility requirements,
* deployment ordering,
* readiness requirements,
* security boundaries,
* configuration relationships,
* migration behavior,
* rollback constraints,
* observability expectations.

### Implementation May Choose

* deployment tooling,
* packaging mechanisms,
* automation implementation,
* internal deployment scripts,
* platform-specific syntax,

provided approved deployment semantics remain unchanged.

### Implementation Must Not Introduce

* undocumented deployment dependencies,
* new trust boundaries,
* hidden network exposure,
* unsupported scaling assumptions,
* incompatible contract changes,
* unsafe schema transitions,
* secret leakage,
* undocumented rollback assumptions,
* or architecture decisions disguised as deployment configuration.

---

# 79. Agent Instructions

When producing a Deployment Specification:

1. Start from approved architecture.
2. Read relevant ADRs.
3. Read the Runtime Specification.
4. Read the Configuration Specification.
5. Identify deployment units.
6. Identify environments.
7. Identify deployment dependencies.
8. Define artifact identity.
9. Define packaging requirements.
10. Define environment-specific behavior.
11. Define configuration relationships.
12. Define network exposure.
13. Define deployment ordering where required.
14. Define deployment strategy where necessary.
15. Define validation.
16. Define failure handling.
17. Define rollback.
18. Define migration and compatibility where relevant.
19. Define security requirements.
20. Define deployment observability.
21. Define verification scenarios.
22. Never invent infrastructure capabilities.
23. Never invent resource limits.
24. Never invent traffic percentages or rollout thresholds.
25. Never assume rollback is safe.
26. Never confuse deployment with runtime.
27. Never confuse deployment with infrastructure architecture.
28. Escalate new architectural decisions.
29. Preserve traceability.
30. Keep implementation freedom where architecture does not constrain it.

---

# 80. Anti-Patterns

## Deployment as Architecture

Using deployment details to introduce architectural structure that was never approved.

## Platform-First Design

Selecting deployment architecture solely from familiarity with a platform.

## Environment Drift

Allowing environments to differ without explicit justification.

## Configuration as Deployment Architecture

Hiding architectural decisions inside deployment variables.

## Artifact Ambiguity

Deploying artifacts whose identity cannot be traced.

## Mutable Artifact Promotion

Rebuilding or silently changing artifacts between environments when immutable promotion is required.

## Readiness Ignorance

Routing traffic to instances before approved readiness conditions are satisfied.

## Rollback Illusion

Claiming rollback is possible despite irreversible data or contract changes.

## Database Deployment Blindness

Changing schema without considering application and consumer compatibility.

## Network Equals Trust

Assuming network placement establishes authorization.

## Secret Exposure

Embedding credentials, keys, or tokens in deployment artifacts or documentation.

## Scaling by Guess

Inventing replicas, resource limits, or scaling thresholds.

## Deployment Strategy by Habit

Using rolling, blue-green, or canary deployment without a requirement or architectural reason.

## Infrastructure Leakage

Turning a deployment specification into an uncontrolled infrastructure design.

## Legacy Deployment Worship

Preserving historical deployment behavior without evaluating whether it remains necessary.

## Deployment Theater

Documenting deployment commands while leaving compatibility, validation, failure, migration, and rollback semantics undefined.

---

# 81. Safe Progression Question

Before accepting this specification:

> **Can the approved runtime units be deployed, validated, upgraded, recovered, and retired with clear environment, artifact, compatibility, security, configuration, networking, migration, rollback, and observability semantics without introducing unsupported architectural decisions?**

If not, identify whether the missing information belongs to:

```text
Product
Domain
Architecture
Contract
ADR
Configuration
Runtime
Infrastructure
Specification
Implementation
```

---

# 82. Final Principle

> **A Deployment Specification turns approved architecture and runtime behavior into explicit, reproducible, secure, compatible, and verifiable deployment behavior without allowing deployment details to become hidden architecture or infrastructure strategy.**

The intended relationship is:

```text
Architecture / ADR
        ↓
Contracts
        ↓
Runtime Specification
        ↓
Configuration Specification
        ↓
Deployment Specification
        ↓
Infrastructure Specification
        ↓
Deployment Implementation
        ↓
Deployment Verification
```

A healthy Deployment Specification makes clear **what is deployed, where it is deployed, how artifacts are promoted, how environments differ, how traffic and dependencies are connected, how deployments are validated, how failures are handled, how rollback works, and how migration is performed**, while preserving all upstream architectural, contractual, security, runtime, and data decisions.
