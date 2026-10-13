# Infrastructure Specification

## 1. Document Metadata

| Field                  | Value                        |
| ---------------------- | ---------------------------- |
| Document Type          | Infrastructure Specification |
| Lifecycle Phase        | Infrastructure               |
| Status                 | `DRAFT`                      |
| Version                | `0.1`                        |
| System                 | `<system>`                   |
| Scope                  | `<scope>`                    |
| Owner                  | `<owner>`                    |
| Created                | `<date>`                     |
| Last Updated           | `<date>`                     |
| Infrastructure Context | `<document>`                 |
| Architecture Baseline  | `<baseline>`                 |
| Specification Baseline | `<baseline>`                 |

---

# 2. Purpose

This document defines the implementation-relevant infrastructure behavior and requirements required to realize the approved architecture, runtime model, deployment model, security expectations, operational model, and infrastructure context.

This is the **Infrastructure phase** specification. It defines how infrastructure is realized, provisioned, operated, secured, observed, recovered, changed, and retired. It does not define what infrastructure capabilities the approved design requires — that is the responsibility of the Specifications phase infrastructure specification (`templates/specifications/infrastructure-specification.md`).

It specifies:

* infrastructure resources,
* required capabilities,
* resource behavior,
* storage,
* networking,
* identity,
* secrets,
* certificates,
* observability,
* availability,
* resilience,
* recovery,
* capacity,
* infrastructure dependencies,
* lifecycle,
* infrastructure security,
* verification.

This document must remain aligned with the approved architecture and infrastructure context.

---

# 3. Core Principle

> **Infrastructure Specification defines how approved infrastructure capabilities are realized and verified without silently introducing new architectural decisions.**

Infrastructure Specification answers:

> **What infrastructure behavior must exist for the approved system to operate correctly and safely?**

It does not answer:

> **Which infrastructure technology should be used?**

unless that choice has already been explicitly decided or is required by an accepted constraint.

---

# 4. Fundamental Distinctions

## Architecture

Defines system structure and architectural boundaries.

## Runtime Specification

Defines how the system executes.

## Deployment Specification

Defines how runtime units are deployed.

## Infrastructure Context

Defines required infrastructure capabilities and boundaries.

## Infrastructure Specification

Defines implementation-relevant infrastructure behavior.

## Configuration Specification

Defines configuration behavior.

## Operational Specification

Defines operational expectations.

## Infrastructure Implementation

Realizes the approved infrastructure specification.

---

# 5. Entry Conditions

Before this specification is created:

* [ ] Infrastructure Context is accepted.
* [ ] Architecture baseline is available.
* [ ] Specification baseline is available.
* [ ] Runtime Specification is available where applicable.
* [ ] Deployment Specification is available where applicable.
* [ ] Security requirements are available.
* [ ] Observability requirements are available.
* [ ] Operational requirements are available.
* [ ] Recovery requirements are known where applicable.
* [ ] Infrastructure-specific decisions are identified.

---

# 6. Specification Scope

## In Scope

```text id="r8m4vp"
<infrastructure behavior covered>
```

## Out of Scope

```text id="k6x9mp"
<excluded infrastructure behavior>
```

## Deferred

```text id="v5q3mk"
<deferred infrastructure behavior>
```

---

# 7. Infrastructure Model

```text id="r7m5pq"
Infrastructure Capability
        ↓
Infrastructure Resource
        ↓
Resource Configuration
        ↓
Runtime / Deployment Dependency
        ↓
Operational Behavior
        ↓
Verification
```

Each infrastructure requirement should have a clear relationship with the system behavior it supports.

---

# 8. Infrastructure Resource Catalog

| ID      | Resource     | Capability     | Consumer     | Environment     | Criticality     | Status     |
| ------- | ------------ | -------------- | ------------ | --------------- | --------------- | ---------- |
| INF-001 | `<resource>` | `<capability>` | `<consumer>` | `<environment>` | `<criticality>` | `<status>` |

Possible resources include:

* compute,
* database,
* object storage,
* cache,
* messaging,
* network,
* identity,
* secret store,
* certificate infrastructure,
* observability infrastructure,
* backup infrastructure,
* recovery infrastructure.

---

# 9. Infrastructure Resource Definition

```text id="k8m3vp"
Resource ID:
<INF-XXX>

Name:
<name>

Purpose:
<purpose>

Capability:
<capability>

Consumers:
<consumers>

Owner:
<owner>

Environment:
<environment>

Lifecycle:
<lifecycle>

Dependencies:
<dependencies>

Criticality:
<criticality>
```

---

# 10. Resource Responsibility

For each resource define:

* who consumes it,
* who owns it,
* what it guarantees,
* what it does not guarantee,
* how failure affects consumers.

```text id="r6x4mk"
Resource:
<resource>

Provides:
<capabilities>

Does Not Provide:
<limitations>

Failure Impact:
<impact>

Recovery:
<recovery>
```

---

# 11. Compute Specification

Define compute behavior required by the system.

Consider:

* execution model,
* isolation,
* lifecycle,
* resource requirements,
* startup,
* shutdown,
* scaling,
* placement,
* failure handling,
* restart behavior.

```text id="v9m5pq"
Compute Requirement:
<requirement>

Runtime Consumer:
<consumer>

Resource Characteristics:
<characteristics>

Lifecycle:
<lifecycle>

Failure Behavior:
<behavior>

Verification:
<verification>
```

Do not invent exact resource values without evidence.

---

# 12. Compute Isolation

Where isolation is required:

```text id="k7x3vp"
Isolation Boundary:
<boundary>

Reason:
<security / reliability / capacity / compliance / other>

Resources Isolated:
<resources>

Failure Isolation:
<behavior>

Security Isolation:
<behavior>
```

---

# 13. Compute Scaling

Define scaling behavior only when required.

Possible dimensions:

* instance count,
* workload units,
* capacity,
* concurrency,
* resource allocation.

```text id="r5m8pk"
Scaling Requirement:
<requirement>

Trigger:
<condition>

Scaling Direction:
<up / down / other>

Constraints:
<constraints>

Verification:
<verification>
```

Do not invent scaling thresholds.

---

# 14. Compute Failure Behavior

Consider:

* process failure,
* resource failure,
* host failure,
* workload restart,
* dependency failure,
* partial capacity.

```text id="v6q4mx"
Failure:
<failure>

Expected Infrastructure Behavior:
<behavior>

Application Impact:
<impact>

Recovery:
<recovery>

Observability:
<signal>
```

---

# 15. Storage Specification

For each storage resource define:

* purpose,
* ownership,
* durability,
* persistence,
* lifecycle,
* access,
* recovery,
* security.

```text id="k9m3vp"
Storage:
<storage>

Purpose:
<purpose>

Data:
<data>

Owner:
<owner>

Persistence:
<requirement>

Durability:
<requirement>

Recovery:
<requirement>

Security:
<requirement>
```

---

# 16. Storage Capacity

Capacity requirements must be derived from approved requirements or evidence.

```text id="r8x5mk"
Storage Requirement:
<requirement>

Source:
<source>

Expected Growth:
<known expectation>

Capacity Strategy:
<strategy>

Monitoring:
<monitoring>
```

Do not invent growth rates.

---

# 17. Storage Performance

Where relevant:

* access pattern,
* latency expectation,
* throughput expectation,
* concurrency,
* workload characteristics.

Only define numerical targets when explicitly supported.

---

# 18. Storage Availability

```text id="v7m4pq"
Storage:
<storage>

Availability Requirement:
<requirement>

Failure Scenario:
<failure>

Expected Behavior:
<behavior>

Recovery:
<recovery>
```

---

# 19. Storage Lifecycle

Define:

* creation,
* active use,
* archival,
* retention,
* deletion,
* retirement.

```text id="k6m9vp"
Data Lifecycle:
<lifecycle>

Infrastructure Behavior:
<behavior>

Owner:
<owner>

Verification:
<verification>
```

---

# 20. Database Infrastructure

Where databases are required:

```text id="r5x8mk"
Database Resource:
<database>

Purpose:
<purpose>

Authoritative Data:
<data>

Owner:
<owner>

Consumers:
<consumers>

Availability:
<requirement>

Recovery:
<requirement>

Security:
<requirement>
```

Database infrastructure must not redefine the domain model.

---

# 21. Database Availability and Recovery

Consider:

* instance failure,
* storage failure,
* connectivity failure,
* recovery,
* restore,
* replication,
* failover where approved.

Replication does not automatically imply:

* multiple data owners,
* strong consistency,
* zero data loss,
* automatic recovery.

Each behavior must be explicitly defined.

---

# 22. Messaging Infrastructure

Where messaging infrastructure exists:

```text id="v8m4pq"
Messaging Resource:
<messaging>

Purpose:
<purpose>

Publishers:
<publishers>

Consumers:
<consumers>

Durability:
<requirement>

Failure:
<behavior>

Recovery:
<behavior>

Observability:
<signals>
```

Event semantics remain governed by Event Contracts and Event Specifications.

---

# 23. Messaging Delivery Infrastructure

Where applicable, specify only approved behaviors:

* persistence,
* delivery,
* duplicate handling,
* ordering,
* retry support,
* replay support,
* quarantine.

Do not invent:

* exactly-once semantics,
* at-least-once guarantees,
* ordering guarantees,
* replay guarantees.

---

# 24. Caching Infrastructure

```text id="k7m5vp"
Cache:
<cache>

Purpose:
<purpose>

Cached Data:
<data>

Source of Truth:
<source>

Population:
<behavior>

Invalidation:
<behavior>

Expiration:
<requirement>

Failure:
<behavior>

Consistency:
<expectation>
```

The cache must not silently become authoritative data storage.

---

# 25. Object / File Storage

Where object or file storage is required:

* object identity,
* ownership,
* lifecycle,
* access,
* retention,
* deletion,
* security,
* integrity,
* backup,
* recovery.

```text id="r6x9mk"
Storage Object:
<object>

Purpose:
<purpose>

Owner:
<owner>

Access:
<access>

Lifecycle:
<lifecycle>

Protection:
<protection>
```

---

# 26. Networking Specification

Define required infrastructure networking behavior.

Consider:

* connectivity,
* routing,
* ingress,
* egress,
* DNS,
* service discovery,
* segmentation,
* traffic distribution,
* certificates.

```text id="v5m8pq"
Network Requirement:
<requirement>

Source:
<source>

Consumers:
<consumers>

Connectivity:
<behavior>

Failure:
<behavior>

Security:
<requirement>
```

---

# 27. Network Segmentation

Where segmentation is required:

```text id="k8m4vp"
Segment:
<segment>

Purpose:
<purpose>

Resources:
<resources>

Allowed Communication:
<communication>

Blocked Communication:
<communication>

Security Rationale:
<rationale>
```

Network segmentation must not be confused with application authorization.

---

# 28. Ingress

Define:

* entry points,
* allowed traffic,
* protection,
* routing,
* availability,
* health behavior.

```text id="r7x3mk"
Ingress:
<ingress>

Purpose:
<purpose>

Consumers:
<consumers>

Protection:
<security>

Routing:
<routing>

Failure:
<failure>
```

---

# 29. Egress

Define outbound connectivity where relevant.

Consider:

* destination,
* purpose,
* authorization,
* failure,
* timeout,
* observability,
* data exposure.

```text id="v9m5pq"
Egress:
<egress>

Destination:
<destination>

Purpose:
<purpose>

Allowed:
<conditions>

Failure:
<behavior>

Security:
<controls>
```

---

# 30. DNS and Service Discovery

Where required:

* identity,
* resolution,
* lifecycle,
* failure behavior,
* caching,
* security.

Do not prescribe a specific discovery mechanism unless decided.

---

# 31. Identity Infrastructure

Define infrastructure capabilities supporting identity:

* identity provider,
* identity lifecycle,
* service identity,
* workload identity,
* credential storage,
* trust establishment.

```text id="k6m8vp"
Identity Resource:
<resource>

Principal:
<principal>

Purpose:
<purpose>

Trust:
<trust>

Lifecycle:
<lifecycle>

Failure:
<behavior>
```

---

# 32. Authorization Infrastructure

Infrastructure may support authorization but must not silently define business authorization.

Distinguish:

```text id="r5x9mk"
Business Authority:
<business rule>

Technical Authorization:
<technical control>

Infrastructure Support:
<infrastructure capability>
```

---

# 33. Secret Management

Define:

* storage,
* access,
* rotation,
* lifecycle,
* exposure prevention,
* failure behavior.

```text id="v7m3pq"
Secret:
<secret>

Storage:
<storage>

Access:
<access>

Rotation:
<requirement>

Exposure Prevention:
<control>

Failure:
<behavior>
```

---

# 34. Certificate Infrastructure

Where applicable:

* certificate issuance,
* storage,
* distribution,
* renewal,
* expiration,
* revocation,
* failure behavior.

```text id="k9m4vp"
Certificate:
<certificate>

Purpose:
<purpose>

Owner:
<owner>

Lifecycle:
<lifecycle>

Renewal:
<behavior>

Failure:
<behavior>
```

---

# 35. Key Management

Where approved:

* key ownership,
* storage,
* access,
* rotation,
* expiration,
* revocation,
* recovery limitations.

Do not invent cryptographic algorithms or policies without approved security decisions.

---

# 36. Infrastructure Observability

Infrastructure observability should provide sufficient signals for:

* availability,
* resource usage,
* capacity,
* failure,
* dependency health,
* recovery,
* security,
* operational diagnosis.

```text id="r8x5mk"
Infrastructure Signal:
<signal>

Purpose:
<purpose>

Consumer:
<consumer>

Source:
<resource>

Retention:
<approved requirement>

Sensitive Data:
<yes/no>

Verification:
<verification>
```

---

# 37. Infrastructure Metrics

Metrics may include:

* resource utilization,
* capacity,
* error rate,
* saturation,
* availability,
* queue state,
* dependency health.

A metric must have a meaningful operational question.

---

# 38. Infrastructure Logging

Define logging expectations for:

* provisioning,
* failures,
* privileged actions,
* security events,
* infrastructure lifecycle changes.

Avoid indiscriminate logging.

Sensitive information must be protected.

---

# 39. Infrastructure Tracing

Where infrastructure participates in distributed behavior:

* correlation,
* dependency visibility,
* infrastructure failure visibility,
* propagation boundaries.

Tracing must remain aligned with the approved Observability Specification.

---

# 40. Backup Specification

For each backup requirement:

```text id="v6m4pq"
Backup:
<backup>

Scope:
<scope>

Trigger:
<trigger>

Retention:
<requirement>

Protection:
<protection>

Verification:
<verification>

Restore:
<verification>
```

---

# 41. Restore Specification

A restore process should define:

* prerequisites,
* source,
* target,
* sequencing,
* integrity verification,
* application compatibility,
* reconciliation,
* post-restore validation.

Backup success does not establish restore success.

---

# 42. Disaster Recovery Infrastructure

Where required:

```text id="k7x9vp"
Recovery Capability:
<capability>

Failure Scenario:
<scenario>

Required Resources:
<resources>

Sequence:
<sequence>

Verification:
<verification>

Limitations:
<limitations>
```

Do not invent RPO/RTO values.

---

# 43. Failure Domains

Identify infrastructure failure domains.

```text id="r5m8pk"
Failure Domain:
<domain>

Resources:
<resources>

Failure:
<failure>

Isolation:
<isolation>

Expected Impact:
<impact>

Recovery:
<recovery>
```

---

# 44. Availability Specification

```text id="v8m3pq"
Capability:
<capability>

Availability Requirement:
<requirement>

Infrastructure Behavior:
<behavior>

Failure:
<failure>

Recovery:
<recovery>

Verification:
<verification>
```

---

# 45. Resilience Specification

Infrastructure resilience may require:

* redundancy,
* isolation,
* failover,
* replacement,
* recovery,
* dependency protection,
* capacity headroom.

Only approved requirements should determine which are necessary.

---

# 46. Resource Exhaustion

Define behavior when infrastructure resources become constrained.

Possible resources:

* compute,
* memory,
* storage,
* connections,
* network,
* queue capacity.

```text id="k6x4vp"
Resource:
<resource>

Exhaustion Condition:
<condition>

Detection:
<signal>

Expected Behavior:
<behavior>

Recovery:
<recovery>
```

---

# 47. Capacity Management

Define:

* capacity indicators,
* growth monitoring,
* saturation detection,
* expansion behavior,
* exhaustion behavior,
* review process.

Do not invent numerical thresholds.

---

# 48. Infrastructure Security

Infrastructure security requirements may include:

* isolation,
* access control,
* secret protection,
* encryption,
* privileged operations,
* network controls,
* auditability,
* resource protection.

Each security control must trace to an approved security expectation.

---

# 49. Privileged Access

```text id="r9m5pk"
Privileged Operation:
<operation>

Authorized Principal:
<principal>

Required Permission:
<permission>

Audit:
<audit>

Failure:
<failure>

Recovery:
<recovery>
```

Do not invent organizational roles.

---

# 50. Infrastructure Configuration

Configuration must remain aligned with Configuration Specification.

Infrastructure configuration may include:

* resource configuration,
* network configuration,
* storage configuration,
* identity configuration,
* runtime dependencies,
* observability configuration.

Secrets must remain outside ordinary configuration values.

---

# 51. Infrastructure Provisioning

Where infrastructure is provisioned automatically:

```text id="v7q4mx"
Resource:
<resource>

Prerequisites:
<prerequisites>

Provisioning:
<process>

Validation:
<validation>

Failure:
<failure>

Rollback:
<rollback>
```

The exact provisioning tool belongs to implementation unless already decided.

---

# 52. Infrastructure Change Management

Infrastructure changes should define:

* affected resources,
* dependencies,
* compatibility,
* validation,
* rollback,
* observability,
* authorization.

```text id="k8m3vp"
Change:
<change>

Affected Resources:
<resources>

Risk:
<risk>

Validation:
<validation>

Rollback:
<rollback>
```

---

# 53. Infrastructure Drift Management

```text id="r6x5mk"
Resource:
<resource>

Expected State:
<expected>

Observed State:
<observed>

Drift:
<drift>

Severity:
<severity>

Resolution:
<resolution>
```

---

# 54. Infrastructure Lifecycle

Resources may transition through:

```text
PLANNED
    ↓
PROVISIONING
    ↓
READY
    ↓
ACTIVE
    ↓
DEGRADED / MAINTENANCE
    ↓
RETIRING
    ↓
RETIRED
```

Failure paths should be represented where relevant.

---

# 55. Infrastructure Upgrade

Define:

* compatibility,
* dependencies,
* sequencing,
* validation,
* rollback,
* data implications,
* downtime expectations,
* observability.

```text id="v5m9pq"
Upgrade:
<upgrade>

Current:
<current>

Target:
<target>

Compatibility:
<compatibility>

Validation:
<validation>

Rollback:
<rollback>
```

---

# 56. Infrastructure Retirement

Retirement must address:

* consumers,
* dependencies,
* data,
* credentials,
* certificates,
* backups,
* monitoring,
* alerts,
* network access,
* costs,
* audit records.

---

# 57. Environment Specification

For each environment:

```text id="k7m4vp"
Environment:
<environment>

Resources:
<resources>

Isolation:
<isolation>

Dependencies:
<dependencies>

Security:
<security>

Observability:
<observability>

Differences:
<differences>
```

Environment differences that alter behavior must be explicit.

---

# 58. Environment Compatibility

```text id="r8x3mk"
Requirement:
<requirement>

Development:
<behavior>

Test:
<behavior>

Staging:
<behavior>

Production:
<behavior>

Material Difference:
<difference>
```

---

# 59. Infrastructure Dependencies

```text id="v6m9pq"
Dependency:
<dependency>

Consumer:
<consumer>

Purpose:
<purpose>

Availability:
<requirement>

Failure:
<behavior>

Recovery:
<behavior>
```

---

# 60. External Infrastructure Providers

Where an external provider is used:

```text id="k5x8vp"
Provider:
<provider>

Capability:
<capability>

Dependency:
<dependency>

Ownership:
<ownership>

Failure:
<failure>

Exit / Migration Consideration:
<consideration>
```

Do not introduce provider-specific assumptions without evidence.

---

# 61. Infrastructure Compatibility Matrix

| Infrastructure Resource | Runtime    | Deployment | Security   | Data       | Observability | Migration  |
| ----------------------- | ---------- | ---------- | ---------- | ---------- | ------------- | ---------- |
| `<resource>`            | `<status>` | `<status>` | `<status>` | `<status>` | `<status>`    | `<status>` |

---

# 62. Infrastructure Verification Strategy

Verification may include:

* provisioning tests,
* connectivity tests,
* security tests,
* backup tests,
* restore tests,
* failure tests,
* recovery tests,
* capacity tests,
* observability tests,
* migration tests,
* compatibility tests.

Select verification proportionally to infrastructure risk.

---

# 63. Infrastructure Test Scenarios

### Provisioning

```text id="r7m4pq"
Given:
<precondition>

When:
<provisioning>

Then:
<expected result>
```

### Failure

```text id="k8x3vp"
Given:
<state>

When:
<infrastructure failure>

Then:
<expected behavior>
```

### Recovery

```text id="v5m9mk"
Given:
<failure>

When:
<recovery action>

Then:
<expected state>
```

### Security

```text id="r6m4pq"
Given:
<principal>

When:
<unauthorized action>

Then:
<expected result>
```

---

# 64. Infrastructure Evidence

Verification evidence may include:

* provisioning results,
* connectivity verification,
* backup/restore evidence,
* security validation,
* failure tests,
* recovery tests,
* monitoring evidence,
* capacity measurements,
* migration validation.

Evidence must be traceable to the requirement being verified.

---

# 65. Infrastructure Risks

```text id="k7x5vp"
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

---

# 66. Infrastructure Unknowns

```text id="v8m4pq"
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

# 67. Infrastructure Assumptions

```text id="r5m9pk"
Assumption:
<assumption>

Evidence:
<evidence>

Confidence:
<confidence>

Impact:
<impact>

Validation:
<validation>
```

---

# 68. Architecture Escalation Triggers

Infrastructure work must return to architecture governance when it introduces:

* new system boundaries,
* new architectural containers,
* new data ownership,
* new consistency requirements,
* new integration patterns,
* new security trust boundaries,
* new reliability guarantees,
* new scalability strategies,
* new deployment architecture,
* new operational ownership,
* significant vendor/platform lock-in.

```text id="k6m3vp"
Trigger:
<trigger>

Architectural Impact:
<impact>

Required Action:
<ADR / architecture review / contract review / other>
```

---

# 69. Infrastructure Decision Candidates

```text id="v7x4pq"
Decision:
<decision>

Options:
<options>

Drivers:
<drivers>

Trade-offs:
<trade-offs>

Reversibility:
<reversibility>

ADR Required:
<yes/no>
```

---

# 70. Technology Selection Boundary

Technology may be selected when:

* an ADR has approved it,
* a constraint requires it,
* an external contract requires it,
* the project explicitly authorizes the choice.

Otherwise specify the required capability and preserve implementation freedom.

---

# 71. Infrastructure Implementation Freedom

```text id="r8m5pk"
Requirement:
<requirement>

Must Be Preserved:
<behavior>

Implementation Freedom:
<freedom>

Technology Constraint:
<constraint>
```

---

# 72. Existing Infrastructure

For existing systems:

```text id="k5x9vp"
Documented State:
<state>

Observed State:
<state>

Target State:
<state>

Difference:
<difference>

Required Action:
<action>
```

Observed infrastructure must be distinguished from documented assumptions.

---

# 73. Infrastructure Migration

Where migration is required:

* current infrastructure,
* target infrastructure,
* coexistence,
* synchronization,
* compatibility,
* transition,
* cutover,
* rollback,
* validation,
* retirement.

Migration behavior must align with Migration Specification.

---

# 74. Infrastructure Specification Review

Review:

* [ ] Every required infrastructure capability is specified.
* [ ] Resource responsibilities are clear.
* [ ] Data ownership is preserved.
* [ ] Security boundaries are preserved.
* [ ] Runtime dependencies are covered.
* [ ] Deployment dependencies are covered.
* [ ] Failure behavior is specified.
* [ ] Recovery behavior is specified where required.
* [ ] Observability is specified.
* [ ] Backup and restore are specified where required.
* [ ] Capacity expectations are evidence-based.
* [ ] Environment differences are explicit.
* [ ] Infrastructure dependencies are identified.
* [ ] Infrastructure changes are governable.
* [ ] Infrastructure technology choices are justified.
* [ ] Verification exists.
* [ ] Traceability exists.
* [ ] No hidden architecture decisions exist.

---

# 75. Infrastructure Specification Outcome

```text id="v6m8pq"
Outcome:

READY
READY_WITH_RISKS
INCOMPLETE
BLOCKED
NOT_REQUIRED
```

## READY

Infrastructure behavior is sufficiently defined for implementation and verification.

## READY_WITH_RISKS

Implementation may proceed with explicit accepted risks.

## INCOMPLETE

Important infrastructure details remain unresolved.

## BLOCKED

Critical infrastructure behavior or dependencies remain unresolved.

## NOT_REQUIRED

No independent infrastructure specification is required for the scope.

---

# 76. Infrastructure Baseline

```text id="r7x3mk"
Infrastructure Specification Baseline:
<INFRA-SPEC-BASELINE-001>

Included Resources:
<resources>

Environment Model:
<environments>

Dependencies:
<dependencies>

Security:
<summary>

Recovery:
<summary>

Observability:
<summary>

Verification:
<summary>

Open Risks:
<risks>

Open Unknowns:
<unknowns>
```

---

# 77. Handoff to Infrastructure Implementation

### Implementation May Assume

* approved infrastructure capabilities,
* accepted resource responsibilities,
* accepted environment model,
* accepted security requirements,
* accepted recovery requirements,
* accepted observability requirements,
* accepted verification strategy.

### Implementation Must Preserve

* architecture,
* data ownership,
* security boundaries,
* runtime requirements,
* deployment requirements,
* operational behavior,
* recovery behavior,
* observability.

### Implementation May Choose

Only implementation details not constrained by:

* architecture,
* ADRs,
* contracts,
* requirements,
* constraints,
* specifications.

### Implementation Must Not Invent

* business semantics,
* architectural boundaries,
* ownership,
* security guarantees,
* availability guarantees,
* scalability guarantees,
* recovery objectives,
* unsupported provider guarantees.

---

# 78. Infrastructure Change Governance

A change that affects only implementation details may remain within infrastructure implementation.

A change affecting:

* architecture,
* security,
* data ownership,
* reliability,
* availability,
* scalability,
* integration,
* contracts,
* migration

must return through the appropriate lifecycle governance.

---

# 79. Agent Instructions

When producing an Infrastructure Specification:

1. Start from Infrastructure Context.
2. Start from approved architecture and specifications.
3. Identify required infrastructure behavior.
4. Define resources and responsibilities.
5. Define compute behavior.
6. Define storage behavior.
7. Define networking behavior.
8. Define identity and secret infrastructure.
9. Define backup and recovery where required.
10. Define observability.
11. Define failure domains.
12. Define capacity expectations only from evidence.
13. Define infrastructure lifecycle.
14. Define provisioning and change behavior where relevant.
15. Define verification.
16. Preserve application and domain ownership.
17. Do not invent numerical limits.
18. Do not invent availability guarantees.
19. Do not invent recovery objectives.
20. Do not introduce providers without justification.
21. Escalate architectural consequences.
22. Keep technology-independent sections technology-independent.
23. Maintain traceability.
24. Treat infrastructure behavior as testable.
25. Distinguish specification from implementation.

---

# 80. Anti-Patterns

## Infrastructure as Architecture

Using infrastructure design to redefine system architecture.

## Platform-First Design

Selecting infrastructure technology before defining required capabilities.

## Resource Guessing

Inventing CPU, memory, storage, throughput, or capacity values.

## Cloud Product Catalog

Replacing infrastructure reasoning with a list of managed services.

## Redundancy Theater

Adding replicas without understanding the actual failure model.

## Backup Theater

Declaring recovery readiness because backups exist.

## Network Trust

Treating network location as sufficient security.

## Shared Infrastructure by Convenience

Sharing resources without analyzing isolation and failure impact.

## Infrastructure-Driven Domain Model

Allowing storage infrastructure to redefine domain semantics.

## Tool-Driven Specification

Writing the specification around an IaC tool rather than infrastructure behavior.

## Provider Lock-In by Accident

Allowing incidental provider features to become architectural requirements.

## Hidden Failure Behavior

Leaving infrastructure failure semantics undefined.

## Infinite Capacity Assumption

Assuming infrastructure can scale without limits or consequences.

## Unsupported Guarantees

Claiming availability, durability, performance, recovery, or security guarantees without evidence.

## Legacy Infrastructure Worship

Treating historical infrastructure as automatically authoritative.

## Infrastructure Dump

Listing resources without explaining their purpose or behavior.

## Infrastructure Theater

Creating detailed infrastructure documents without meaningful verification value.

---

# 81. Safe Progression Question

Before approving the Infrastructure Specification:

> **Does the infrastructure specification define the required resources, capabilities, security boundaries, storage, networking, availability, resilience, recovery, observability, capacity, lifecycle, dependencies, and verification behavior sufficiently to implement the approved infrastructure without introducing unsupported architectural assumptions?**

If the answer is no, identify the smallest artifact or lifecycle phase that must be revisited.

---

# 82. Final Principle

> **Infrastructure Specification turns approved infrastructure capabilities into precise, implementable, testable infrastructure behavior while preserving architecture, security, ownership, operational safety, and implementation freedom.**

The progression is:

```text
Infrastructure Context
        ↓
Infrastructure Specification
        ↓
Infrastructure Implementation
        ↓
Infrastructure Verification
        ↓
Infrastructure Readiness
        ↓
Release Readiness
```

Infrastructure is not complete because resources exist.

Infrastructure is complete when the resources and capabilities required by the approved system are:

* explicitly defined,
* appropriately owned,
* secure,
* observable,
* recoverable where required,
* verifiable,
* compatible with runtime and deployment,
* and governed against architectural drift.
