# Infrastructure Context

## 1. Document Metadata

| Field                  | Value                  |
| ---------------------- | ---------------------- |
| Document Type          | Infrastructure Context |
| Lifecycle Phase        | Infrastructure         |
| Status                 | `DRAFT`                |
| Version                | `0.1`                  |
| System                 | `<system>`             |
| Scope                  | `<scope>`              |
| Owner                  | `<owner>`              |
| Created                | `<date>`               |
| Last Updated           | `<date>`               |
| Architecture Baseline  | `<baseline>`           |
| Specification Baseline | `<baseline>`           |

---

# 2. Purpose

This document establishes the infrastructure context required to realize the approved architecture, runtime model, deployment model, security expectations, operational requirements, and infrastructure specifications.

It defines:

* infrastructure scope,
* infrastructure responsibilities,
* infrastructure capabilities,
* infrastructure boundaries,
* environments,
* dependencies,
* infrastructure constraints,
* infrastructure risks,
* infrastructure assumptions,
* infrastructure unknowns,
* infrastructure ownership,
* infrastructure-to-architecture relationships.

This document does **not** prescribe specific infrastructure products unless such choices have already been explicitly decided.

---

# 3. Core Principle

> **Infrastructure exists to provide the resources and capabilities required by the approved architecture and operational model without silently becoming a new source of architectural decisions.**

Infrastructure must realize architectural intent.

It must not redefine:

* domain boundaries,
* business rules,
* data ownership,
* API semantics,
* event semantics,
* security responsibilities,
* reliability guarantees,
* operational responsibilities

without appropriate governance.

---

# 4. Infrastructure Context

Infrastructure represents the physical, virtual, managed, or logical resources required for the system to execute.

Depending on the system, this may include:

* compute,
* storage,
* databases,
* networking,
* identity infrastructure,
* secrets,
* certificates,
* messaging infrastructure,
* caching,
* observability infrastructure,
* backup systems,
* recovery infrastructure,
* deployment infrastructure,
* supporting managed services.

Not every system requires every category.

---

# 5. Entry Conditions

Before defining infrastructure:

* [ ] Architecture Review is accepted.
* [ ] Architecture Decision Review is accepted.
* [ ] Specification Readiness Review is accepted.
* [ ] Runtime requirements are known.
* [ ] Deployment requirements are known.
* [ ] Security expectations are known.
* [ ] Data requirements are known.
* [ ] Operational requirements are known.
* [ ] Availability and resilience expectations are known where applicable.
* [ ] Migration requirements are known where applicable.
* [ ] Infrastructure-specific unknowns are identified.

---

# 6. Infrastructure Scope

## In Scope

```text
<infrastructure capabilities and resources>
```

## Out of Scope

```text
<excluded infrastructure areas>
```

## Deferred

```text
<deferred infrastructure areas>
```

Infrastructure scope must remain aligned with approved system scope.

---

# 7. Infrastructure Objectives

Infrastructure objectives may include:

* supporting required runtime behavior,
* providing required storage,
* enabling required connectivity,
* enforcing required security boundaries,
* supporting required availability,
* supporting required resilience,
* enabling observability,
* enabling recovery,
* supporting deployment,
* supporting migration,
* controlling infrastructure risk,
* enabling operational management.

Each objective should have evidence or an approved requirement.

---

# 8. Infrastructure Drivers

Infrastructure decisions may be influenced by:

### Business Drivers

* delivery constraints,
* cost expectations,
* geographic requirements,
* business continuity.

### Architecture Drivers

* runtime topology,
* container boundaries,
* integration model,
* data ownership,
* communication model.

### Quality Drivers

* availability,
* reliability,
* resilience,
* performance,
* scalability,
* recoverability,
* maintainability.

### Security Drivers

* trust boundaries,
* identity,
* secrets,
* encryption,
* isolation,
* compliance.

### Operational Drivers

* deployment,
* monitoring,
* recovery,
* maintenance,
* incident response.

### Migration Drivers

* coexistence,
* compatibility,
* legacy dependencies,
* transition safety.

---

# 9. Infrastructure Capability Model

Infrastructure should be described in terms of capabilities before products.

| Capability     | Purpose     | Consumer     | Required   | Status     |
| -------------- | ----------- | ------------ | ---------- | ---------- |
| `<capability>` | `<purpose>` | `<consumer>` | `<yes/no>` | `<status>` |

Examples:

* compute execution,
* persistent storage,
* relational data storage,
* object storage,
* asynchronous messaging,
* caching,
* network connectivity,
* service discovery,
* identity management,
* secret management,
* certificate management,
* telemetry collection,
* backup,
* recovery.

---

# 10. Infrastructure Responsibility Boundaries

For every infrastructure responsibility:

```text id="k5m8vp"
Responsibility:
<responsibility>

Infrastructure Owns:
<behavior>

Application Owns:
<behavior>

Platform Owns:
<behavior>

External Provider Owns:
<behavior>
```

Infrastructure responsibility must not be confused with application responsibility.

---

# 11. Infrastructure Ownership

| Infrastructure Area | Owner     | Responsibility     | Escalation |
| ------------------- | --------- | ------------------ | ---------- |
| Compute             | `<owner>` | `<responsibility>` | `<path>`   |
| Storage             | `<owner>` | `<responsibility>` | `<path>`   |
| Network             | `<owner>` | `<responsibility>` | `<path>`   |
| Identity            | `<owner>` | `<responsibility>` | `<path>`   |
| Secrets             | `<owner>` | `<responsibility>` | `<path>`   |
| Observability       | `<owner>` | `<responsibility>` | `<path>`   |
| Backup              | `<owner>` | `<responsibility>` | `<path>`   |

Do not invent organizational ownership.

If ownership is unknown, record it as unknown.

---

# 12. Environment Model

Identify required environments.

```text id="r7x4mk"
Environment:
<environment>

Purpose:
<purpose>

Lifecycle:
<development / testing / staging / production / other>

Isolation:
<isolation>

Dependencies:
<dependencies>

Differences:
<differences>
```

Possible environments include:

* local,
* development,
* integration,
* test,
* staging,
* production,
* disaster recovery,
* migration,
* temporary transition environments.

Only include environments actually required.

---

# 13. Environment Consistency

Evaluate differences between environments.

| Concern       | Environment A | Environment B | Material Difference |
| ------------- | ------------- | ------------- | ------------------- |
| Compute       | `<value>`     | `<value>`     | `<yes/no>`          |
| Storage       | `<value>`     | `<value>`     | `<yes/no>`          |
| Network       | `<value>`     | `<value>`     | `<yes/no>`          |
| Identity      | `<value>`     | `<value>`     | `<yes/no>`          |
| Dependencies  | `<value>`     | `<value>`     | `<yes/no>`          |
| Observability | `<value>`     | `<value>`     | `<yes/no>`          |

Differences that can alter behavior must be explicit.

---

# 14. Infrastructure Dependencies

```text id="v8m3pq"
Dependency:
<dependency>

Purpose:
<purpose>

Consumer:
<consumer>

Infrastructure Required:
<requirement>

Failure Impact:
<impact>

Recovery:
<recovery>
```

Dependencies may include:

* managed services,
* external providers,
* identity systems,
* storage,
* network services,
* messaging infrastructure,
* monitoring infrastructure,
* certificate authorities,
* backup systems.

---

# 15. Compute Context

Define compute requirements without prematurely selecting a technology.

Consider:

* execution model,
* runtime requirements,
* isolation,
* lifecycle,
* resource requirements,
* scaling,
* placement,
* failure domains,
* startup behavior,
* shutdown behavior.

```text id="k6x9vp"
Compute Requirement:
<requirement>

Source:
<architecture/specification/quality attribute>

Required Capability:
<capability>

Implementation Freedom:
<freedom>
```

---

# 16. Storage Context

Define required storage capabilities.

Consider:

* persistence,
* durability,
* capacity,
* lifecycle,
* performance,
* availability,
* recovery,
* data classification,
* access patterns.

Do not equate storage infrastructure with domain ownership.

---

# 17. Data Infrastructure Context

For each data infrastructure dependency:

```text id="r5m8pk"
Data Store:
<store>

Purpose:
<purpose>

Authoritative Data:
<data>

Owner:
<owner>

Consumers:
<consumers>

Persistence Requirement:
<requirement>

Recovery Requirement:
<requirement>
```

Infrastructure must preserve approved data ownership and semantics.

---

# 18. Messaging Infrastructure Context

Where messaging is required:

* identify messaging capability,
* identify publishers,
* identify consumers,
* identify operational dependencies,
* identify durability requirements,
* identify failure handling,
* identify recovery requirements.

Do not define event semantics here.

Event semantics remain governed by Event Contracts and Event Specifications.

---

# 19. Caching Infrastructure Context

Where caching is required:

```text id="v7q4mx"
Cache:
<cache>

Purpose:
<purpose>

Data:
<data>

Authority:
<source of truth>

Invalidation:
<strategy>

Failure Behavior:
<behavior>

Consistency:
<expectation>
```

Caching must not become an accidental source of truth.

---

# 20. Networking Context

Identify infrastructure networking requirements:

* connectivity,
* segmentation,
* routing,
* ingress,
* egress,
* DNS,
* service discovery,
* traffic distribution,
* certificates,
* network isolation.

Network location must not automatically be treated as a security boundary.

---

# 21. Security Infrastructure Context

Infrastructure security may include:

* identity infrastructure,
* secret storage,
* key management,
* certificates,
* network segmentation,
* workload isolation,
* privileged access,
* infrastructure audit.

Security responsibilities must remain aligned with the Security Contract and Security Specification.

---

# 22. Secret Management

For each secret category:

```text id="k9m5vp"
Secret:
<secret>

Purpose:
<purpose>

Owner:
<owner>

Storage:
<capability>

Access:
<access>

Rotation:
<requirement>

Exposure Risk:
<risk>
```

Secrets must not be embedded in:

* source code,
* images,
* repositories,
* logs,
* telemetry,
* documentation intended for public distribution.

---

# 23. Certificate and Key Infrastructure

Where applicable:

* certificate ownership,
* issuance,
* renewal,
* expiration handling,
* trust relationships,
* key lifecycle,
* access control,
* rotation,
* revocation.

Do not invent cryptographic policies.

Use approved security requirements.

---

# 24. Backup Infrastructure

For systems requiring backup:

```text id="r6x8mk"
Backup Scope:
<scope>

Data:
<data>

Frequency:
<requirement>

Retention:
<requirement>

Protection:
<requirement>

Verification:
<requirement>

Restore:
<procedure/specification>

Owner:
<owner>
```

Backup existence does not imply recoverability.

Restore must be verifiable.

---

# 25. Recovery Infrastructure

Define infrastructure capabilities required for recovery.

Consider:

* recovery dependencies,
* restore capability,
* replacement resources,
* failure domains,
* recovery sequencing,
* data restoration,
* service restoration,
* verification.

RPO/RTO values must only be defined when supported by approved requirements.

---

# 26. Availability Context

For applicable infrastructure:

```text id="v5m9pq"
Availability Requirement:
<requirement>

Infrastructure Capability:
<capability>

Failure Domain:
<domain>

Expected Behavior:
<behavior>

Verification:
<verification>
```

Do not infer redundancy merely because availability is important.

---

# 27. Resilience Context

Infrastructure resilience may involve:

* redundancy,
* isolation,
* failover,
* replacement,
* recovery,
* dependency protection,
* failure-domain separation.

Redundancy alone does not establish resilience.

---

# 28. Resource Management

Identify relevant resource classes:

* CPU,
* memory,
* storage,
* network,
* connection capacity,
* queue capacity,
* file descriptors,
* other bounded resources.

Do not invent resource limits.

```text id="k7m4vp"
Resource:
<resource>

Requirement:
<requirement>

Exhaustion Behavior:
<behavior>

Monitoring:
<signal>

Recovery:
<behavior>
```

---

# 29. Capacity Context

Capacity requirements should be derived from approved:

* workload expectations,
* quality attributes,
* performance requirements,
* operational constraints,
* observed system behavior.

Avoid speculative capacity planning without evidence.

---

# 30. Infrastructure Observability

Infrastructure observability should support:

* health,
* capacity,
* failures,
* dependencies,
* resource exhaustion,
* availability,
* recovery,
* operational diagnosis.

Align with the approved Observability Contract and Observability Specification.

---

# 31. Infrastructure Auditability

Where infrastructure actions require accountability:

* provisioning,
* privileged access,
* security changes,
* secret operations,
* configuration changes,
* deployment changes,
* destructive operations

should have appropriate audit evidence.

Do not automatically audit everything.

---

# 32. Infrastructure Cost Context

Where cost is architecturally relevant:

```text id="r8x5mk"
Resource:
<resource>

Cost Driver:
<driver>

Expected Constraint:
<constraint>

Optimization:
<strategy>

Trade-off:
<trade-off>
```

Cost optimization must not silently violate approved quality or security requirements.

---

# 33. Infrastructure Compliance

Where applicable:

* data residency,
* retention,
* access control,
* audit requirements,
* regulatory constraints,
* organizational policies.

Only record actual requirements.

---

# 34. Infrastructure Constraints

```text id="v6m3pq"
Constraint:
<constraint>

Source:
<source>

Strength:
<MANDATORY | PREFERRED | INFORMATIONAL>

Scope:
<scope>

Impact:
<impact>
```

Infrastructure constraints must remain distinguishable from infrastructure decisions.

---

# 35. Infrastructure Assumptions

```text id="k9x4vp"
Assumption:
<assumption>

Evidence:
<evidence>

Confidence:
<HIGH | MEDIUM | LOW>

Impact:
<impact>

Validation:
<method>
```

Unsupported infrastructure assumptions must remain visible.

---

# 36. Infrastructure Unknowns

```text id="r5m8pk"
Unknown:
<unknown>

Importance:
<LOW | MEDIUM | HIGH | CRITICAL>

Blocking:
<NON_BLOCKING | DECISION_RELEVANT | GATE_BLOCKING>

Resolution:
<method>
```

---

# 37. Infrastructure Risks

| ID          | Risk     | Severity     | Impact     | Mitigation     |
| ----------- | -------- | ------------ | ---------- | -------------- |
| INFRA-R-001 | `<risk>` | `<severity>` | `<impact>` | `<mitigation>` |

---

# 38. Infrastructure Failure Domains

Identify meaningful failure boundaries.

```text id="v7q3mx"
Failure Domain:
<domain>

Affected Resources:
<resources>

Failure:
<failure>

Expected Impact:
<impact>

Isolation:
<isolation>

Recovery:
<recovery>
```

Failure domains should be based on actual infrastructure characteristics or explicit design requirements.

---

# 39. Shared Infrastructure

If infrastructure is shared:

```text id="k6m9vp"
Shared Resource:
<resource>

Consumers:
<consumers>

Shared Responsibility:
<responsibility>

Isolation:
<isolation>

Failure Impact:
<impact>

Security Impact:
<impact>

Capacity Impact:
<impact>
```

Shared infrastructure must not accidentally create shared architectural ownership.

---

# 40. Infrastructure-to-Architecture Mapping

```text id="r8x4mk"
Architecture Element:
<element>

Infrastructure Capability:
<capability>

Relationship:
<supports / constrains / hosts / connects / protects>

Evidence:
<evidence>
```

---

# 41. Infrastructure-to-Runtime Mapping

| Runtime Requirement | Infrastructure Capability | Status     |
| ------------------- | ------------------------- | ---------- |
| `<requirement>`     | `<capability>`            | `<status>` |

---

# 42. Infrastructure-to-Deployment Mapping

| Deployment Requirement | Infrastructure Capability | Status     |
| ---------------------- | ------------------------- | ---------- |
| `<requirement>`        | `<capability>`            | `<status>` |

---

# 43. Infrastructure-to-Security Mapping

| Security Requirement | Infrastructure Capability | Verification     |
| -------------------- | ------------------------- | ---------------- |
| `<requirement>`      | `<capability>`            | `<verification>` |

---

# 44. Infrastructure-to-Operations Mapping

| Operational Requirement | Infrastructure Capability | Evidence     |
| ----------------------- | ------------------------- | ------------ |
| `<requirement>`         | `<capability>`            | `<evidence>` |

---

# 45. Infrastructure Technology Decisions

Technology choices belong here only when:

* already decided,
* required by an accepted ADR,
* required by an explicit constraint,
* or necessary to realize an approved infrastructure capability.

```text id="v5m8pq"
Technology:
<technology>

Capability:
<capability>

Decision Source:
<ADR / constraint / requirement>

Status:
<status>
```

Do not introduce technology merely because it is familiar or popular.

---

# 46. Infrastructure Alternatives

When multiple viable approaches exist:

```text id="k7x3vp"
Requirement:
<requirement>

Option A:
<option>

Option B:
<option>

Trade-offs:
<trade-offs>

Decision Required:
<yes/no>

ADR:
<ADR>
```

Consequential infrastructure choices must use decision governance.

---

# 47. Infrastructure Decision Escalation

Escalate when infrastructure selection changes:

* architecture boundaries,
* data ownership,
* consistency,
* security trust,
* availability guarantees,
* resilience model,
* scalability model,
* integration model,
* operational responsibility,
* migration strategy.

Infrastructure must not silently make architectural decisions.

---

# 48. Infrastructure Lifecycle

Infrastructure resources may have lifecycle states:

```text
PLANNED
PROVISIONING
READY
ACTIVE
DEGRADED
MAINTENANCE
RETIRING
RETIRED
FAILED
```

Lifecycle must be defined only where operationally meaningful.

---

# 49. Provisioning Context

Where provisioning is relevant:

* prerequisites,
* dependencies,
* ordering,
* validation,
* failure handling,
* rollback,
* ownership,
* auditability.

Infrastructure provisioning should be reproducible where required.

---

# 50. Infrastructure Drift

Infrastructure drift occurs when actual infrastructure differs from approved infrastructure expectations.

```text id="r9m5pk"
Resource:
<resource>

Expected:
<expected>

Observed:
<observed>

Drift:
<drift>

Severity:
<severity>

Action:
<action>
```

---

# 51. Existing Infrastructure

For existing systems distinguish:

```text
Documented Infrastructure
        ↓
Observed Infrastructure
        ↓
Target Infrastructure
```

Historical documentation must not automatically override observed behavior.

---

# 52. Infrastructure Migration

Where infrastructure migration is required:

* current infrastructure,
* target infrastructure,
* coexistence,
* compatibility,
* migration sequence,
* data movement,
* network transition,
* identity transition,
* rollback,
* validation,
* retirement

must be addressed.

Infrastructure migration must align with the approved Migration Specification.

---

# 53. Infrastructure Retirement

Retirement should address:

* dependencies,
* data,
* credentials,
* certificates,
* network exposure,
* backups,
* monitoring,
* alerts,
* costs,
* access,
* audit,
* documentation.

Do not retire infrastructure solely because replacement infrastructure exists.

---

# 54. Infrastructure Verification

Infrastructure requirements should be verifiable.

Examples:

* provisioning succeeds,
* required connectivity exists,
* isolation works,
* backup completes,
* restore succeeds,
* secrets are protected,
* certificates are valid,
* resources recover,
* failure domains behave as expected.

```text id="v8m4pq"
Infrastructure Requirement:
<requirement>

Verification:
<verification>

Evidence:
<evidence>

Status:
<status>
```

---

# 55. Infrastructure Test Scenarios

Relevant scenarios may include:

### Provisioning

```text
Given:
<precondition>

When:
<provisioning action>

Then:
<expected result>
```

### Failure

```text
Given:
<infrastructure state>

When:
<failure>

Then:
<expected behavior>
```

### Recovery

```text
Given:
<failure state>

When:
<recovery>

Then:
<expected result>
```

### Security

```text
Given:
<security context>

When:
<unauthorized action>

Then:
<expected result>
```

---

# 56. Infrastructure Compatibility

Evaluate compatibility with:

* runtime,
* deployment,
* APIs,
* events,
* data,
* security,
* observability,
* migration.

```text id="k5m8vp"
Dependency:
<dependency>

Current:
<current>

Target:
<target>

Compatible:
<yes/no>

Action:
<action>
```

---

# 57. Infrastructure Specification Boundary

This document must not become:

* a complete deployment specification,
* a complete network design,
* a security architecture,
* a database design,
* a cloud product catalog,
* an IaC implementation,
* a runbook,
* a cost spreadsheet.

Those concerns should be handled by their appropriate artifacts.

---

# 58. Infrastructure Baseline

```text id="r7x4mk"
Infrastructure Baseline:
<INFRA-BASELINE-001>

Architecture Baseline:
<baseline>

Specification Baseline:
<baseline>

Infrastructure Capabilities:
<list>

Environment Model:
<list>

Critical Dependencies:
<list>

Known Risks:
<list>

Open Unknowns:
<list>
```

---

# 59. Infrastructure Readiness

Infrastructure context is sufficiently established when:

* [ ] Infrastructure scope is clear.
* [ ] Required capabilities are identified.
* [ ] Responsibility boundaries are understood.
* [ ] Environment requirements are understood.
* [ ] Runtime requirements are mapped.
* [ ] Deployment requirements are mapped.
* [ ] Security requirements are mapped.
* [ ] Data requirements are mapped.
* [ ] Operational requirements are mapped.
* [ ] Recovery requirements are understood where applicable.
* [ ] Infrastructure dependencies are identified.
* [ ] Critical failure domains are understood.
* [ ] Infrastructure risks are explicit.
* [ ] Critical unknowns are identified.
* [ ] Technology choices are not being invented prematurely.
* [ ] Infrastructure does not silently introduce architecture.

---

# 60. Infrastructure Handoff

### Infrastructure May Assume

* approved architecture,
* approved runtime model,
* approved deployment model,
* approved security expectations,
* approved data ownership,
* approved observability requirements,
* approved operational expectations.

### Infrastructure Must Preserve

* architectural boundaries,
* data ownership,
* security boundaries,
* domain semantics,
* contract semantics,
* runtime behavior,
* approved quality attributes.

### Infrastructure Must Not Invent

* business rules,
* domain ownership,
* API semantics,
* event semantics,
* unsupported reliability guarantees,
* unsupported scalability guarantees,
* unsupported security guarantees.

---

# 61. Infrastructure Gate Contribution

This document contributes to the Infrastructure phase gate.

The Infrastructure phase should not pass merely because infrastructure resources have been selected.

It should demonstrate that the required infrastructure capabilities:

* support the approved architecture,
* satisfy approved runtime and deployment requirements,
* satisfy security expectations,
* support operational behavior,
* support recovery where required,
* are observable,
* are verifiable,
* and do not introduce unsupported architectural assumptions.

---

# 62. Agent Instructions

When creating or reviewing Infrastructure Context:

1. Start from approved architecture.
2. Start from approved runtime and deployment requirements.
3. Identify capabilities before technologies.
4. Identify infrastructure boundaries.
5. Identify ownership.
6. Identify environments.
7. Identify infrastructure dependencies.
8. Identify failure domains.
9. Identify security infrastructure requirements.
10. Identify storage requirements.
11. Identify networking requirements.
12. Identify backup and recovery requirements.
13. Identify observability requirements.
14. Identify infrastructure constraints.
15. Identify infrastructure assumptions.
16. Identify infrastructure unknowns.
17. Identify infrastructure risks.
18. Preserve application and domain ownership.
19. Do not invent resource limits.
20. Do not invent availability guarantees.
21. Do not invent recovery objectives.
22. Do not select technology without evidence or decision authority.
23. Escalate infrastructure choices that affect architecture.
24. Keep infrastructure specifications traceable.
25. Verify infrastructure behavior rather than merely documenting resources.

---

# 63. Anti-Patterns

## Infrastructure as Architecture

Using infrastructure choices to define system architecture without governance.

## Platform First

Selecting a platform before understanding required capabilities.

## Product Catalog Architecture

Listing cloud products instead of defining infrastructure responsibilities.

## Resource Guessing

Inventing CPU, memory, storage, throughput, or capacity requirements.

## Redundancy Equals Resilience

Assuming redundancy automatically establishes resilience.

## Backup Equals Recovery

Assuming that a backup exists therefore recovery is guaranteed.

## Replication Equals Ownership

Assuming replicated data has multiple owners.

## Network Equals Security

Treating network location as sufficient trust.

## Shared Infrastructure by Convenience

Sharing infrastructure without evaluating coupling, security, capacity, or failure impact.

## Database as Domain Model

Allowing infrastructure storage structure to redefine domain semantics.

## Infrastructure as Configuration Dump

Listing values without explaining responsibility or behavior.

## Tool Lock-In

Allowing infrastructure tooling to dictate architecture unnecessarily.

## Hidden Dependencies

Failing to identify infrastructure dependencies.

## Legacy Infrastructure Worship

Treating historical infrastructure as automatically required.

## Infrastructure Theater

Producing elaborate infrastructure documentation without verification value.

---

# 64. Safe Progression Question

Before progressing from Infrastructure Context:

> **Do we understand the infrastructure capabilities, boundaries, dependencies, environments, security responsibilities, storage, networking, recovery, observability, operational requirements, risks, and constraints necessary to realize the approved architecture without introducing unsupported architectural assumptions?**

If the answer is no, identify the smallest artifact or lifecycle phase that must be revisited.

---

# 65. Final Principle

> **Infrastructure Context establishes what the system requires from its execution environment before deciding how those capabilities are physically or technologically provided.**

Infrastructure should be derived from:

```text
Product Requirements
        ↓
Domain Model
        ↓
Architecture
        ↓
Contracts
        ↓
Architecture Decisions
        ↓
Specifications
        ↓
Infrastructure Capabilities
        ↓
Infrastructure Realization
```

The objective is not to maximize infrastructure detail.

The objective is to provide exactly the infrastructure capability required by the approved system while preserving architectural intent, operational safety, security, traceability, and implementation freedom.
