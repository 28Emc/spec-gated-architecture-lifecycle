# Architectural Views

## 1. Document Metadata

| Field                  | Value                          |
| ---------------------- | ------------------------------ |
| Document Type          | Architectural Views            |
| Lifecycle Phase        | Architecture                   |
| Status                 | `DRAFT`                        |
| Version                | `0.1`                          |
| Owner                  | `<owner>`                      |
| Created                | `<date>`                       |
| Last Updated           | `<date>`                       |
| System                 | `<system>`                     |
| Architecture Context   | `<architecture-context>`       |
| Container Architecture | `<c4-container>`               |
| Component Architecture | `<c4-component-if-applicable>` |

---

# 2. Purpose

This document defines the additional architectural views required to understand, evaluate, communicate, and govern the system architecture beyond the primary C4 structure.

The purpose is not to produce diagrams for completeness.

The purpose is to determine:

* Which architectural concerns require explicit visualization.
* Which views provide meaningful architectural information.
* Which concerns are already sufficiently represented.
* Which views are mandatory due to risk or complexity.
* Which views are optional.
* Which views are unnecessary.

Architectural views may address:

* Runtime behavior
* Deployment
* Data
* Security
* Integration
* Infrastructure
* Network boundaries
* Operational concerns
* Availability
* Resilience
* Migration
* External dependencies

---

# 3. Core Principle

> **An architectural view exists only when it provides meaningful information that cannot be adequately communicated through the existing architecture model or simpler documentation.**

More diagrams do not imply better architecture.

The agent must optimize for:

```text
Architectural clarity
        >
Documentation volume
```

---

# 4. Relationship to C4

C4 provides a useful structural hierarchy:

```text
System Context
      ↓
Containers
      ↓
Components
      ↓
Code
```

Additional architectural views complement this hierarchy.

For example:

```text
Structural View
    └── C4

Runtime View
    └── interactions over time

Deployment View
    └── runtime placement

Data View
    └── data ownership and movement

Security View
    └── trust boundaries and protection

Integration View
    └── external relationships

Operational View
    └── reliability, observability, recovery
```

These views describe different architectural concerns.

They must not be confused with additional C4 levels.

---

# 5. View Applicability

Every candidate view must be evaluated before creation.

```text id="x8q3nv"
View:
<view>

Architectural Concern:
<concern>

Reason Required:
<reason>

Risk If Missing:
<risk>

Existing Representation:
<artifact>

Additional Value:
<value>

Priority:
<CRITICAL | HIGH | MEDIUM | LOW>

Decision:
<REQUIRED | RECOMMENDED | OPTIONAL | NOT_REQUIRED>

Status:
<status>
```

---

# 6. View Status

Recommended statuses:

* `IDENTIFIED`
* `PROPOSED`
* `UNDER_REVIEW`
* `ACCEPTED`
* `ACTIVE`
* `SUPERSEDED`
* `DEPRECATED`
* `NOT_REQUIRED`

---

# 7. View Categories

Potential architectural views include:

1. Runtime View
2. Deployment View
3. Data Architecture View
4. Security Architecture View
5. Integration View
6. Network View
7. Infrastructure View
8. Availability View
9. Resilience View
10. Observability View
11. Migration View
12. Operational View
13. Compliance View
14. Cost/Resource View
15. Other domain-specific architectural views

Not all projects require all views.

---

# 8. View Selection Criteria

Consider creating a view when one or more apply:

* A major quality attribute depends on the concern.
* Multiple components interact dynamically.
* Runtime behavior is difficult to understand statically.
* Deployment topology affects architecture.
* Data ownership or movement is complex.
* Security boundaries are significant.
* External integrations are numerous or critical.
* Failure propagation is important.
* Migration is complex.
* Regulatory requirements affect architecture.
* Operational responsibilities are distributed.
* Infrastructure materially constrains the architecture.
* The concern influences an architecture decision.
* The concern is difficult to communicate through existing artifacts.

---

# 9. View Selection Matrix

| View           | Required   | Reason     | Risk     | Existing Artifact |
| -------------- | ---------- | ---------- | -------- | ----------------- |
| Runtime        | `<yes/no>` | `<reason>` | `<risk>` | `<artifact>`      |
| Deployment     | `<yes/no>` | `<reason>` | `<risk>` | `<artifact>`      |
| Data           | `<yes/no>` | `<reason>` | `<risk>` | `<artifact>`      |
| Security       | `<yes/no>` | `<reason>` | `<risk>` | `<artifact>`      |
| Integration    | `<yes/no>` | `<reason>` | `<risk>` | `<artifact>`      |
| Network        | `<yes/no>` | `<reason>` | `<risk>` | `<artifact>`      |
| Infrastructure | `<yes/no>` | `<reason>` | `<risk>` | `<artifact>`      |
| Availability   | `<yes/no>` | `<reason>` | `<risk>` | `<artifact>`      |
| Resilience     | `<yes/no>` | `<reason>` | `<risk>` | `<artifact>`      |
| Observability  | `<yes/no>` | `<reason>` | `<risk>` | `<artifact>`      |
| Migration      | `<yes/no>` | `<reason>` | `<risk>` | `<artifact>`      |

---

# 10. Runtime View

## Purpose

The Runtime View explains how the system behaves dynamically during significant scenarios.

It may describe:

* Request flows
* Event flows
* Commands
* Queries
* Asynchronous processing
* State transitions
* Failure paths
* Retries
* Time-dependent behavior
* Coordination between containers or components

It should answer:

> **How does the architecture behave during an important scenario?**

---

# 11. Runtime Scenario

```text id="m4v8qa"
Scenario:
<scenario>

Trigger:
<trigger>

Actor:
<actor>

Participating Containers:
<containers>

Participating Components:
<components>

Sequence:
1. <step>
2. <step>
3. <step>

Business Rules:
<rules>

State Changes:
<changes>

Failure Paths:
<failures>

Expected Outcome:
<outcome>
```

---

# 12. Runtime View Rules

Runtime views should focus on architecturally significant behavior.

Do not document:

* Every method invocation.
* Framework internals.
* Trivial object interactions.
* Implementation call stacks.

Prefer scenarios involving:

* Core business behavior.
* Critical integrations.
* Failure handling.
* Security-sensitive operations.
* High-value workflows.
* Cross-container consistency.
* Asynchronous processing.

---

# 13. Runtime Failure Analysis

```text id="q7n2cx"
Scenario:
<scenario>

Failure Point:
<failure>

Affected Components:
<components>

Failure Propagation:
<propagation>

User/Business Impact:
<impact>

Recovery:
<recovery>

Retry:
<retry>

Compensation:
<compensation>

Architectural Decision:
<decision>
```

Do not invent retry or compensation behavior.

---

# 14. Runtime Consistency

```text id="r5x9vm"
Scenario:
<scenario>

Consistency Requirement:
<requirement>

Affected Containers:
<containers>

Consistency Boundary:
<boundary>

Expected State:
<state>

Failure Consequence:
<consequence>

Decision:
<decision>
```

The runtime view should reveal when business behavior depends on coordination across boundaries.

---

# 15. Deployment View

## Purpose

The Deployment View explains where architectural containers or other runtime units execute.

It may describe:

* Runtime environments
* Compute boundaries
* Deployment units
* Availability zones
* Network boundaries
* External infrastructure
* Managed services
* Deployment relationships
* Scaling boundaries

It should answer:

> **Where does the architecture run, and what deployment relationships affect system behavior?**

---

# 16. Deployment Unit

```text id="c8m4yp"
Deployment Unit:
<unit>

Runs:
<container or runtime>

Environment:
<environment>

Purpose:
<purpose>

Dependencies:
<dependencies>

Scaling:
<scaling>

Availability:
<availability>

Security Boundary:
<boundary>

Operational Owner:
<owner>
```

---

# 17. Deployment Environments

Possible environments:

* Development
* Test
* Integration
* Staging
* Production
* Disaster Recovery
* Other

```text id="v3k7qa"
Environment:
<environment>

Purpose:
<purpose>

Architectural Differences:
<differences>

External Dependencies:
<dependencies>

Data Characteristics:
<data>

Security Characteristics:
<security>

Operational Characteristics:
<operations>
```

Do not assume environments exist unless supported by project evidence.

---

# 18. Deployment Relationships

```text id="n6x2wr"
Deployment Unit A:
<unit>

Deployment Unit B:
<unit>

Relationship:
<relationship>

Network Dependency:
<dependency>

Availability Dependency:
<dependency>

Operational Dependency:
<dependency>

Risk:
<risk>
```

---

# 19. Deployment Independence

Evaluate whether deployment units can evolve independently.

```text id="f9m3vc"
Units:
<units>

Independent Deployment:
<yes/no/unknown>

Reason:
<reason>

Shared Dependency:
<dependency>

Coordination Required:
<yes/no>

Risk:
<risk>
```

Deployment independence must not be confused with domain independence.

---

# 20. Data Architecture View

## Purpose

The Data Architecture View explains how important data is owned, stored, exchanged, protected, and evolved.

It may describe:

* Data ownership
* Authoritative sources
* Data stores
* Data movement
* Replication
* Read models
* Data synchronization
* Retention
* Lifecycle
* Sensitive data
* Migration

It should answer:

> **Where does important data belong, who owns it, and how does it move through the architecture?**

---

# 21. Data Ownership Model

```text id="w8q4mk"
Data:
<data>

Semantic Owner:
<owner>

Authoritative Source:
<source>

Consumers:
<consumers>

Writers:
<writers>

Lifecycle:
<lifecycle>

Sensitivity:
<level>

Retention:
<known/unknown>

Migration:
<known/unknown>
```

---

# 22. Data Movement

```text id="j5c9xa"
Data:
<data>

Source:
<source>

Destination:
<destination>

Purpose:
<purpose>

Trigger:
<trigger>

Consistency:
<consistency>

Latency:
<known/unknown>

Failure Handling:
<handling>

Security:
<security>
```

---

# 23. Data Replication

```text id="p7v2rn"
Data:
<data>

Source of Truth:
<source>

Replica:
<replica>

Reason:
<reason>

Consistency:
<model>

Staleness:
<known/unknown>

Update Mechanism:
<known/unknown>

Failure Impact:
<impact>
```

Replication must have an architectural reason.

---

# 24. Data Lifecycle

```text id="x4m8qc"
Data:
<data>

Created:
<event>

Updated:
<event>

Archived:
<event>

Deleted:
<event>

Retention:
<requirement>

Ownership:
<owner>

Compliance:
<requirement>

Security:
<requirement>
```

Do not invent retention periods.

---

# 25. Security Architecture View

## Purpose

The Security Architecture View explains security boundaries and architectural security responsibilities.

It may cover:

* Trust boundaries
* Actors
* Protected assets
* Authentication
* Authorization
* Identity boundaries
* Sensitive data
* External systems
* Privileged operations
* Security zones
* Threat-sensitive interactions

It should answer:

> **What must be protected, from whom, across which boundaries, and where are those responsibilities enforced?**

---

# 26. Trust Boundary

```text id="m9x3vk"
Boundary:
<boundary>

Inside:
<entities>

Outside:
<entities>

Trust Difference:
<difference>

Protected Assets:
<assets>

Threat:
<threat>

Security Control:
<control>

Owner:
<owner>
```

---

# 27. Security Responsibility

```text id="q6r8wa"
Security Concern:
<concern>

Responsible Container:
<container>

Responsible Component:
<component if relevant>

Protected Asset:
<asset>

Actor:
<actor>

Boundary:
<boundary>

Decision:
<decision>
```

---

# 28. Authentication Architecture

```text id="c3v7yn"
Identity Concern:
<concern>

Actors:
<actors>

Identity Authority:
<authority>

Consumers:
<consumers>

Trust Boundary:
<boundary>

Credential Handling:
<known/unknown>

Decision:
<decision>
```

Technology should remain unspecified unless already decided.

---

# 29. Authorization Architecture

```text id="r8m4xq"
Protected Resource:
<resource>

Actor:
<actor>

Authority:
<authority>

Decision Point:
<architectural location>

Policy:
<policy>

Delegation:
<delegation>

Audit Requirement:
<requirement>
```

Do not invent roles or permissions.

---

# 30. Sensitive Data Flow

```text id="v5q9kc"
Data:
<data>

Sensitivity:
<level>

Source:
<source>

Destinations:
<destinations>

Trust Boundaries Crossed:
<boundaries>

Protection Requirement:
<requirement>

Risk:
<risk>
```

---

# 31. Integration View

## Purpose

The Integration View explains relationships between the system and external systems.

It may cover:

* External systems
* Integration ownership
* Data exchanged
* Direction
* Interaction style
* Failure behavior
* Contract criticality
* Translation boundaries
* External dependencies

It should answer:

> **How does the system interact with external systems, and what architectural risks arise from those relationships?**

---

# 32. Integration Record

```text id="n7x3pf"
External System:
<system>

Owning Container:
<container>

Purpose:
<purpose>

Direction:
<INBOUND | OUTBOUND | BIDIRECTIONAL>

Information:
<information>

Interaction:
<SYNCHRONOUS | ASYNCHRONOUS | BATCH | UNKNOWN>

Criticality:
<criticality>

Failure Impact:
<impact>

Translation:
<translation>

Contract:
<contract>
```

---

# 33. Integration Failure

```text id="k4m8zs"
External System:
<system>

Failure:
<failure>

Affected Capability:
<capability>

Business Impact:
<impact>

Fallback:
<fallback>

Retry:
<retry>

Compensation:
<compensation>

Manual Recovery:
<recovery>

Decision:
<decision>
```

---

# 34. Network View

The Network View should be created only when network topology materially affects architecture.

Potential concerns:

* Network segmentation
* Public/private boundaries
* Ingress/egress
* Firewall boundaries
* Service reachability
* Restricted zones
* External connectivity

```text id="w9c2ma"
Network Zone:
<zone>

Purpose:
<purpose>

Allowed Communication:
<communication>

Restricted Communication:
<communication>

Security Driver:
<driver>

Architecture Impact:
<impact>
```

Do not create network diagrams solely because infrastructure exists.

---

# 35. Infrastructure View

The Infrastructure View describes infrastructure elements that materially influence architecture.

Potential concerns:

* Compute
* Storage
* Network
* Managed services
* Runtime platforms
* Infrastructure dependencies
* Resource constraints

```text id="p3x7vn"
Infrastructure Element:
<element>

Purpose:
<purpose>

Architectural Dependency:
<dependency>

Constraint:
<constraint>

Failure Impact:
<impact>

Operational Owner:
<owner>

Decision:
<decision>
```

Infrastructure details belong here only when architecturally relevant.

---

# 36. Availability View

The Availability View should explain important availability relationships.

```text id="x8m4qc"
Capability:
<capability>

Availability Requirement:
<requirement>

Critical Containers:
<containers>

Critical Dependencies:
<dependencies>

Failure Impact:
<impact>

Recovery Expectation:
<expectation>

Architecture Consequence:
<consequence>
```

Do not invent numerical availability targets.

---

# 37. Resilience View

The Resilience View explains how the architecture behaves under failure.

Consider:

* Dependency failure
* Partial failure
* Timeouts
* Retry
* Backpressure
* Circuit behavior
* Degradation
* Recovery
* Compensation
* Data inconsistency

```text id="m6v9rk"
Failure Scenario:
<scenario>

Affected Boundary:
<boundary>

Expected Behavior:
<behavior>

Degradation:
<degradation>

Recovery:
<recovery>

Data Consequence:
<consequence>

Business Consequence:
<consequence>
```

Only document mechanisms that are supported by requirements or decisions.

---

# 38. Observability View

The Observability View explains how architectural behavior becomes observable.

Potential signals:

* Metrics
* Logs
* Traces
* Audit records
* Domain events
* Operational events

```text id="q4x8wc"
Architectural Concern:
<concern>

Signal:
<signal>

Source:
<source>

Consumer:
<consumer>

Purpose:
<purpose>

Criticality:
<criticality>

Retention:
<known/unknown>
```

---

# 39. Migration View

The Migration View is particularly important for existing-system evolution.

It describes:

* Current architecture
* Target architecture
* Transitional architecture
* Migration boundaries
* Compatibility
* Coexistence
* Data migration
* Contract migration
* Rollback considerations

```text id="v7m3qa"
Current:
<state>

Target:
<state>

Transition:
<state>

Migration Boundary:
<boundary>

Sequence:
<sequence>

Compatibility:
<requirement>

Rollback:
<known/unknown>

Risk:
<risk>
```

---

# 40. Compliance View

Create a Compliance View when regulatory or organizational requirements materially influence architecture.

```text id="n5r8xc"
Requirement:
<requirement>

Affected Data:
<data>

Affected Boundary:
<boundary>

Architectural Consequence:
<consequence>

Control:
<control>

Evidence:
<evidence>

Owner:
<owner>
```

Do not invent regulatory requirements.

---

# 41. Operational View

The Operational View describes responsibilities necessary to operate the architecture.

Potential concerns:

* Health
* Monitoring
* Alerting
* Recovery
* Maintenance
* Deployment
* Incident response
* Operational ownership
* Runbook requirements

```text id="c8x4mp"
Operational Concern:
<concern>

Responsible Unit:
<unit>

Signal:
<signal>

Action:
<action>

Failure:
<failure>

Recovery:
<recovery>

Owner:
<owner>
```

---

# 42. Cost / Resource View

Create this view only when cost or resource constraints materially influence architecture.

```text id="r7q3vk"
Resource:
<resource>

Architectural Consumer:
<consumer>

Cost Driver:
<driver>

Constraint:
<constraint>

Trade-off:
<trade-off>

Decision:
<decision>
```

No unsupported cost estimates should be introduced.

---

# 43. View Consistency

Different architectural views must not contradict each other.

Evaluate:

| Concern     | Structural View | Runtime View | Deployment View | Data View | Security View | Status     |
| ----------- | --------------- | ------------ | --------------- | --------- | ------------- | ---------- |
| `<concern>` | `<state>`       | `<state>`    | `<state>`       | `<state>` | `<state>`     | `<status>` |

Potential contradictions:

* Container exists in one view but not another.
* Data ownership differs.
* Security boundary differs.
* Deployment assumes unavailable runtime behavior.
* Runtime flow uses an undefined dependency.
* Migration view conflicts with target architecture.

---

# 44. View Contradiction

```text id="m4z8yn"
View A:
<view>

View B:
<view>

Contradiction:
<contradiction>

Affected Decision:
<decision>

Severity:
<INFO | WARNING | SIGNIFICANT | BLOCKING>

Resolution:
<resolution>

Status:
<status>
```

Architecture views must be reconciled before contradictions become implementation assumptions.

---

# 45. View Traceability

Each significant view should trace back to architectural drivers.

```text id="x7c3pq"
Architectural Driver:
<driver>

Concern:
<concern>

View:
<view>

Decision:
<decision>

Requirement:
<requirement>

Quality Attribute:
<attribute>

Evidence:
<evidence>
```

---

# 46. View Register

| ID       | View        | Concern     | Priority     | Status     | Reason     |
| -------- | ----------- | ----------- | ------------ | ---------- | ---------- |
| VIEW-001 | Runtime     | `<concern>` | `<priority>` | `<status>` | `<reason>` |
| VIEW-002 | Deployment  | `<concern>` | `<priority>` | `<status>` | `<reason>` |
| VIEW-003 | Data        | `<concern>` | `<priority>` | `<status>` | `<reason>` |
| VIEW-004 | Security    | `<concern>` | `<priority>` | `<status>` | `<reason>` |
| VIEW-005 | Integration | `<concern>` | `<priority>` | `<status>` | `<reason>` |

---

# 47. View Priority

Recommended priority definitions:

### CRITICAL

Missing the view could result in an unsafe architecture decision.

### HIGH

The view is necessary to understand an important architectural concern.

### MEDIUM

The view materially improves architecture understanding.

### LOW

The view is useful but not required for current decisions.

---

# 48. View Quality Assessment

| View     | Completeness | Consistency | Evidence  | Traceability | Confidence     |
| -------- | ------------ | ----------- | --------- | ------------ | -------------- |
| `<view>` | `<level>`    | `<level>`   | `<level>` | `<level>`    | `<confidence>` |

A view should not be considered complete merely because a diagram exists.

---

# 49. Existing-System Analysis

For existing systems, evaluate:

```text id="k6v3mr"
View:
<view>

Documented State:
<state>

Actual State:
<state>

Target State:
<state>

Evidence:
<evidence>

Conflict:
<conflict>
```

Actual behavior must be distinguished from historical documentation.

---

# 50. Architecture Evolution

For system evolution:

```text id="q9x4nc"
View:
<view>

Current:
<state>

Target:
<state>

Transition:
<state>

Preserved:
<behavior>

Changed:
<behavior>

Removed:
<behavior>

Migration Risk:
<risk>
```

---

# 51. Architectural View Risks

| ID            | Risk     | View     | Impact     | Likelihood     | Mitigation     |
| ------------- | -------- | -------- | ---------- | -------------- | -------------- |
| RISK-VIEW-001 | `<risk>` | `<view>` | `<impact>` | `<likelihood>` | `<mitigation>` |

Typical risks:

* Missing critical view.
* Contradictory views.
* Outdated deployment representation.
* Hidden data movement.
* Hidden trust boundary.
* Runtime behavior not represented.
* Migration state omitted.
* Diagram-driven architecture.
* Excessive documentation.

---

# 52. Architectural View Unknowns

| ID           | Unknown     | View     | Why It Matters | Impact     | Resolution |
| ------------ | ----------- | -------- | -------------- | ---------- | ---------- |
| UNK-VIEW-001 | `<unknown>` | `<view>` | `<reason>`     | `<impact>` | `<method>` |

---

# 53. View Decisions

```text id="w5m9xc"
Decision ID:
<ADR-ID>

View:
<view>

Decision:
<decision>

Context:
<context>

Drivers:
<drivers>

Consequences:
<consequences>

Status:
<status>
```

Examples:

* Required deployment view.
* Security view required before implementation.
* Runtime view required for asynchronous workflow.
* Data view required due to multiple data owners.
* Network view not required.

---

# 54. Architecture View Validation Scenarios

```text id="v8q3nk"
Scenario:
<scenario>

Views Involved:
<views>

Expected Architectural Understanding:
<understanding>

Contradictions:
<contradictions>

Result:
<PASSED | FAILED | PARTIAL | UNKNOWN>
```

Scenarios should verify that the selected views collectively explain important architectural behavior.

---

# 55. Architecture View Handoff

The next lifecycle stages should receive:

### Established

* Required architectural views
* Structural architecture
* Runtime concerns
* Deployment concerns
* Data concerns
* Security concerns
* Integration concerns
* Operational concerns

### Must Preserve

* Domain ownership
* Architectural boundaries
* Quality drivers
* Security boundaries
* Data ownership
* Important invariants

### Must Not Assume

* Technology choices not yet decided
* Infrastructure not yet approved
* Contracts not yet defined
* Operational mechanisms not yet decided

### Open

* `<open concern>`

### Risks

* `<risk>`

### Required Next Actions

* Contract definition
* ADR resolution
* Specification work
* Infrastructure design
* Other

---

# 56. Review Checklist

### Applicability

* [ ] Each view has a documented reason.
* [ ] Unnecessary views have been explicitly marked `NOT_REQUIRED`.
* [ ] View depth is proportional to project risk.

### Consistency

* [ ] Views agree on system boundaries.
* [ ] Views agree on container responsibilities.
* [ ] Data ownership is consistent.
* [ ] Security boundaries are consistent.
* [ ] Runtime behavior is compatible with deployment assumptions.

### Runtime

* [ ] Critical scenarios are represented.
* [ ] Important failure paths are understood.
* [ ] Consistency concerns are visible.

### Deployment

* [ ] Important deployment boundaries are understood.
* [ ] Deployment coupling is visible where relevant.
* [ ] Environment differences are explicit where important.

### Data

* [ ] Ownership is clear.
* [ ] Important data flows are understood.
* [ ] Replication is explicit where relevant.
* [ ] Sensitive data flows are visible.

### Security

* [ ] Trust boundaries are understood.
* [ ] Protected assets are known.
* [ ] Authentication responsibilities are explicit where required.
* [ ] Authorization responsibilities are explicit where required.

### Integration

* [ ] External systems are identified.
* [ ] Critical integrations are represented.
* [ ] Failure behavior is understood.

### Evolution

* [ ] Current and target states are distinguished.
* [ ] Transitional architecture is visible where necessary.
* [ ] Migration risks are understood.

### Governance

* [ ] View decisions are explicit.
* [ ] Contradictions are resolved.
* [ ] Risks and unknowns are recorded.
* [ ] Traceability exists.

---

# 57. Gate Contribution

```text id="n3x7vm"
Architectural Views Status:
<READY | READY_WITH_RISKS | INCOMPLETE | BLOCKED>

Required Views Identified:
<YES | PARTIAL | NO>

View Consistency:
<CONSISTENT | PARTIAL | CONFLICTING>

Runtime Understanding:
<HIGH | MEDIUM | LOW | NOT_REQUIRED>

Deployment Understanding:
<HIGH | MEDIUM | LOW | NOT_REQUIRED>

Data Understanding:
<HIGH | MEDIUM | LOW | NOT_REQUIRED>

Security Understanding:
<HIGH | MEDIUM | LOW | NOT_REQUIRED>

Integration Understanding:
<HIGH | MEDIUM | LOW | NOT_REQUIRED>

Evolution Understanding:
<HIGH | MEDIUM | LOW | NOT_REQUIRED>

Traceability:
<HEALTHY | DEGRADED | BROKEN>

Blocking Findings:
<findings>

Gate Recommendation:
<READY | READY_WITH_RISKS | NOT_READY>
```

---

# 58. Compact View Register

```text id="q6m2zr"
System:
<system>

Required Views:
- <view>

Optional Views:
- <view>

Not Required:
- <view>

Critical Concerns:
- <concern>

Major Risks:
- <risk>

Open Decisions:
- <decision>

Architecture Views Status:
<status>
```

---

# 59. Agent Instructions

When determining architectural views:

1. Start from the approved structural architecture.
2. Identify architectural concerns not adequately represented.
3. Evaluate whether each concern requires a dedicated view.
4. Prefer the smallest sufficient set of views.
5. Use runtime views for significant dynamic behavior.
6. Use deployment views when placement or infrastructure affects architecture.
7. Use data views when ownership or movement is architecturally significant.
8. Use security views when trust boundaries or protected assets matter.
9. Use integration views for significant external relationships.
10. Use migration views when current and target architectures differ materially.
11. Use resilience views when failure behavior is architecturally significant.
12. Use observability views when operational visibility is an architectural concern.
13. Do not create views merely because a template exists.
14. Do not invent infrastructure.
15. Do not invent security controls.
16. Do not invent performance, availability, retention, or cost targets.
17. Keep views consistent with C4 architecture.
18. Detect contradictions across views.
19. Record important view decisions.
20. Preserve traceability to requirements, quality attributes, domain boundaries, and ADRs.
21. Revisit previous architecture artifacts when a view exposes a contradiction.
22. Mark unnecessary views explicitly as `NOT_REQUIRED`.
23. Keep view depth proportional to risk and complexity.

---

# 60. Anti-Patterns

## Diagram Collection

Creating many diagrams without improving architectural understanding.

## View-by-Template

Creating every possible view because templates exist.

## Contradictory Architecture

Allowing different views to represent incompatible architectures.

## Deployment-First Architecture

Allowing infrastructure topology to define business boundaries.

## Infrastructure as Architecture

Treating cloud resources as the primary architectural model.

## Runtime Call-Stack

Turning runtime views into implementation-level call traces.

## Data-First Architecture

Allowing storage topology to define domain ownership.

## Security Afterthought

Adding security views only after architecture decisions are already fixed.

## Hidden Data Flow

Failing to represent important data movement.

## Hidden Trust Boundary

Ignoring security boundaries between actors, systems, or environments.

## Static-Only Architecture

Using structural diagrams while ignoring runtime behavior.

## Migration Blindness

Showing only target architecture while hiding transitional complexity.

## False Precision

Inventing infrastructure, capacity, availability, retention, or performance values.

## View Duplication

Repeating the same information across multiple diagrams without additional value.

## Stale Views

Maintaining diagrams that no longer reflect the architecture.

## Diagram-Driven Decisions

Changing architecture merely to make a diagram cleaner.

---

# 61. Safe Progression Question

Before leaving the Architecture phase:

> **Do the selected architectural views provide sufficient and consistent understanding of the system's structure, runtime behavior, deployment, data, security, integration, operational, and evolution concerns that materially affect subsequent contracts, decisions, specifications, and implementation?**

If:

* **Yes** → proceed to Contracts.
* **Yes, with risks** → proceed while carrying the risks explicitly.
* **No, because structural boundaries are unclear** → revisit C4.
* **No, because runtime behavior is unclear** → add or refine a Runtime View.
* **No, because security boundaries are unclear** → add or refine a Security View.
* **No, because data ownership is unclear** → add or refine a Data View.
* **No, because current/target architecture is unclear** → add or refine a Migration View.
* **No, because the architecture itself is unresolved** → return to Architecture Decisions.

---

# 62. Final Principle

> **Architectural views are lenses over the architecture, not additional architecture for its own sake.**

The Architecture phase should produce the minimum coherent set of views necessary to understand the system.

The resulting model may therefore look like:

```text
C4 System Context
        ↓
C4 Container Architecture
        ↓
C4 Component Architecture
        │
        ├── Runtime View
        ├── Deployment View
        ├── Data View
        ├── Security View
        ├── Integration View
        ├── Resilience View
        ├── Migration View
        └── Other justified views
```

Not every project requires every view.

The correct architecture documentation is the smallest set of representations that makes **important structure, behavior, constraints, risks, decisions, and consequences sufficiently understandable to proceed safely**.
