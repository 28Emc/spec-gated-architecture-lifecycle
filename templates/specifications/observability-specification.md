# Observability Specification

## 1. Document Metadata

| Field                  | Value                       |
| ---------------------- | --------------------------- |
| Document Type          | Observability Specification |
| Lifecycle Phase        | Specifications / SDD        |
| Specification Type     | `OBSERVABILITY`             |
| Status                 | `DRAFT`                     |
| Version                | `0.1`                       |
| System                 | `<system>`                  |
| Observability Boundary | `<boundary>`                |
| Owner                  | `<owner>`                   |
| Created                | `<date>`                    |
| Last Updated           | `<date>`                    |
| Observability Contract | `<contract-id>`             |
| Architecture Baseline  | `<baseline>`                |
| ADR Baseline           | `<baseline>`                |

---

# 2. Purpose

This document specifies implementation-relevant observability behavior derived from an approved Observability Contract.

It defines sufficient detail to implement and verify:

* logs,
* metrics,
* distributed traces,
* health signals,
* readiness and availability signals,
* audit-related telemetry,
* correlation,
* causation,
* failure visibility,
* dependency visibility,
* operational diagnostics,
* sensitive telemetry protection,
* signal retention,
* sampling,
* alerting relationships,
* and observability testing.

It must preserve the semantics established by the Observability Contract.

---

# 3. Core Principle

> **The Observability Contract defines what must be observable and why; the Observability Specification defines sufficient detail to implement and verify those observability expectations.**

The specification must not silently introduce:

* new operational guarantees,
* new monitoring requirements,
* new alerting obligations,
* new sensitive-data exposure,
* new telemetry ownership,
* new infrastructure architecture,
* or unsupported performance assumptions.

---

# 4. Fundamental Distinctions

## Observability

The ability to understand relevant internal system state through externally available signals.

## Telemetry

The data emitted to make that understanding possible.

## Logging

Structured records representing meaningful events, state, diagnostics, or context.

## Metrics

Measurements representing numerical behavior over time.

## Tracing

Representation of causal/request execution paths across components or boundaries.

## Audit

Evidence of security, compliance, governance, or business actions where required.

## Health

Information about the condition of a component or system.

## Observability Specification

Implementation-relevant detail for realizing approved observability behavior.

```text id="q7m4vr"
Observability Contract
        ↓
Observability Specification
        ↓
Instrumentation / Telemetry
        ↓
Operational Verification
```

---

# 5. Entry Conditions

Before creating this specification:

* [ ] Observability Contract exists.
* [ ] Observability Contract is `ACCEPTED` or `ACTIVE`.
* [ ] Relevant operational questions are known.
* [ ] Critical failure scenarios are known.
* [ ] Relevant architecture boundaries are known.
* [ ] Security/privacy requirements are known.
* [ ] Required signals are identified.
* [ ] Signal ownership is known.
* [ ] Blocking observability unknowns are identified.
* [ ] Relevant ADRs are available.

---

# 6. Observability Identity

```text id="m5x8vc"
Observability ID:
<OBS-ID>

Capability:
<capability>

Boundary:
<boundary>

Purpose:
<purpose>

Criticality:
<LOW | MEDIUM | HIGH | CRITICAL>

Status:
<DRAFT | ACCEPTED | ACTIVE | SUPERSEDED | DEPRECATED>
```

---

# 7. Operational Questions

Observability should begin with questions that operators, developers, security teams, or business stakeholders need answered.

| ID        | Question     | Consumer     | Priority     | Required Signal |
| --------- | ------------ | ------------ | ------------ | --------------- |
| OBS-Q-001 | `<question>` | `<consumer>` | `<priority>` | `<signal>`      |

Examples:

* Did the operation succeed?
* Why did it fail?
* Where did latency increase?
* Which dependency is failing?
* Is the service available?
* Are requests being rejected?
* Is a business process completing?
* Was a security-sensitive action performed?

Do not create telemetry without a meaningful question.

---

# 8. Signal Catalog

| Signal ID | Type     | Purpose     | Consumer     | Criticality     | Status     |
| --------- | -------- | ----------- | ------------ | --------------- | ---------- |
| SIG-001   | `LOG`    | `<purpose>` | `<consumer>` | `<criticality>` | `<status>` |
| SIG-002   | `METRIC` | `<purpose>` | `<consumer>` | `<criticality>` | `<status>` |
| SIG-003   | `TRACE`  | `<purpose>` | `<consumer>` | `<criticality>` | `<status>` |

Supported signal types may include:

```text id="x8q3mk"
LOG
METRIC
TRACE
AUDIT
EVENT
HEALTH
PROFILE
OTHER
```

Not every system requires every signal type.

---

# 9. Signal Selection

For each operational question:

```text id="v6m9xr"
Question:
<question>

Required Signal:
<signal>

Why This Signal:
<reason>

Alternative Signals:
<alternatives>

Coverage:
<coverage>
```

Use the smallest sufficient set of signals.

---

# 10. Logging Specification

```text id="q4v8mk"
Log Purpose:
<purpose>

Producer:
<component>

Consumer:
<consumer>

Severity:
<severity>

Structured:
<YES | NO>

Required Fields:
<fields>

Sensitive Data:
<data>

Retention:
<requirement>
```

Logs must have explicit semantic purpose.

---

# 11. Log Levels

When levels are part of the approved operational model:

| Level     | Meaning     | Use     |
| --------- | ----------- | ------- |
| `<level>` | `<meaning>` | `<use>` |

Do not assign severity based only on framework defaults.

---

# 12. Structured Log Fields

| Field           | Meaning     | Required   | Sensitive  | Source     |
| --------------- | ----------- | ---------- | ---------- | ---------- |
| `timestamp`     | `<meaning>` | `<yes/no>` | `<yes/no>` | `<source>` |
| `correlationId` | `<meaning>` | `<yes/no>` | `<yes/no>` | `<source>` |
| `<field>`       | `<meaning>` | `<yes/no>` | `<yes/no>` | `<source>` |

Field names should be consistent across relevant components.

---

# 13. Log Semantics

Each significant log should answer:

```text id="m7x5vc"
What happened:
<event>

Where:
<component>

When:
<timestamp>

Context:
<context>

Result:
<result>

Impact:
<impact>

Action:
<required action or none>
```

Logs should not become uncontrolled narrative text.

---

# 14. Logging Failure

```text id="x9q4mk"
Logging Failure:
<failure>

Application Impact:
<impact>

Fallback:
<behavior>

Alert:
<requirement>

Data Loss:
<acceptable behavior>
```

Observability failure must not unnecessarily break core business behavior unless explicitly required.

---

# 15. Metric Specification

```text id="v8m3xr"
Metric:
<metric>

Purpose:
<purpose>

Question:
<question>

Unit:
<unit>

Type:
<COUNTER | GAUGE | HISTOGRAM | OTHER>

Owner:
<owner>
```

A metric must have a defined meaning.

---

# 16. Metric Semantics

```text id="q6v9mk"
Metric:
<metric>

Meaning:
<meaning>

Increment:
<condition>

Decrement:
<condition>

Reset:
<condition>

Aggregation:
<aggregation>

Interpretation:
<interpretation>
```

Do not define metrics whose interpretation cannot be explained.

---

# 17. Business Metrics

When relevant:

```text id="m4x8vc"
Business Metric:
<metric>

Business Meaning:
<meaning>

Source:
<source>

Owner:
<owner>

Operational Use:
<use>
```

Business metrics must not be confused with technical health metrics.

---

# 18. Technical Metrics

Examples may include:

* request count,
* error count,
* latency,
* queue depth,
* resource utilization,
* dependency failures,
* retry count.

```text id="x7q5mk"
Metric:
<metric>

Technical Meaning:
<meaning>

Source:
<source>

Threshold:
<value or unspecified>

Action:
<action>
```

Do not invent numerical thresholds.

---

# 19. Metric Dimensions

```text id="v5m9xr"
Metric:
<metric>

Dimension:
<dimension>

Meaning:
<meaning>

Allowed Values:
<values or unspecified>

Cardinality:
<LOW | MEDIUM | HIGH | UNKNOWN>

Justification:
<reason>
```

Dimensions must be carefully controlled to avoid uncontrolled cardinality.

---

# 20. High Cardinality Assessment

```text id="q8v4mk"
Dimension:
<dimension>

Cardinality Risk:
<LOW | MEDIUM | HIGH>

Reason:
<reason>

Mitigation:
<mitigation>
```

Identifiers such as user IDs, request IDs, or arbitrary values should not automatically become metric dimensions.

---

# 21. Trace Specification

```text id="m6x3vc"
Trace:
<trace>

Purpose:
<purpose>

Boundary:
<boundary>

Consumer:
<consumer>

Required:
<YES | NO | CONDITIONAL>
```

Tracing should answer meaningful causal or execution-path questions.

---

# 22. Trace Scope

```text id="x4q9mk"
Trace Scope:
<operation / request / workflow / integration / other>

Start:
<condition>

End:
<condition>

Included Boundaries:
<boundaries>

Excluded Boundaries:
<boundaries>
```

Do not trace everything by default.

---

# 23. Span Specification

| Span     | Meaning     | Parent     | Attributes     | Sensitive  |
| -------- | ----------- | ---------- | -------------- | ---------- |
| `<span>` | `<meaning>` | `<parent>` | `<attributes>` | `<yes/no>` |

Spans should represent meaningful operations rather than arbitrary source-code methods.

---

# 24. Trace Context Propagation

```text id="v7m5xr"
Source:
<source>

Destination:
<destination>

Context:
<trace context>

Propagation:
<behavior>

Required:
<YES | NO>

Failure:
<behavior>
```

Correlation context must not contain authentication secrets.

---

# 25. Correlation

```text id="q5v8mk"
Correlation ID:
<identifier>

Purpose:
<purpose>

Scope:
<scope>

Propagation:
<behavior>

Required Signals:
<signals>
```

Correlation is not necessarily causation.

---

# 26. Causation

```text id="m9x4vc"
Causation Identifier:
<identifier>

Purpose:
<purpose>

Producer:
<producer>

Consumer:
<consumer>

Relationship:
<relationship>
```

Use causation identifiers only where the underlying behavior requires them.

---

# 27. Request Observability

```text id="x8q3mk"
Operation:
<operation>

Start Signal:
<signal>

Success Signal:
<signal>

Failure Signal:
<signal>

Duration:
<measurement>

Correlation:
<identifier>
```

---

# 28. Dependency Observability

For each important dependency:

```text id="v6m9xr"
Dependency:
<dependency>

Operation:
<operation>

Success:
<signal>

Failure:
<signal>

Latency:
<signal>

Timeout:
<signal>

Retry:
<signal>

Correlation:
<signal>
```

Dependency observability should make relevant failure boundaries visible.

---

# 29. Dependency Failure

```text id="q4v8mk"
Dependency:
<dependency>

Failure:
<failure>

Observed By:
<signal>

Application Behavior:
<behavior>

Operational Impact:
<impact>

Alert:
<requirement>
```

---

# 30. Health Specification

```text id="m7x5vc"
Health Signal:
<signal>

Question:
<question>

Meaning:
<meaning>

Dependencies:
<dependencies>

Failure Condition:
<condition>

Consumer:
<consumer>
```

Health should represent meaningful system condition rather than merely process existence.

---

# 31. Liveness

When required:

```text id="x9q4mk"
Liveness Question:
<question>

Condition:
<condition>

Success:
<behavior>

Failure:
<behavior>

Consumer:
<consumer>
```

Liveness should not include dependencies unless that dependency relationship is explicitly intended.

---

# 32. Readiness

When required:

```text id="v8m3xr"
Readiness Question:
<question>

Ready Condition:
<condition>

Not Ready Condition:
<condition>

Dependencies:
<dependencies>

Consumer:
<consumer>
```

Readiness and liveness must not be conflated.

---

# 33. Startup Observability

```text id="q6v9mk"
Startup Phase:
<phase>

Signal:
<signal>

Expected State:
<state>

Failure:
<behavior>

Operational Action:
<action>
```

---

# 34. Business Process Observability

For significant business processes:

```text id="m4x8vc"
Process:
<process>

Start:
<signal>

Progress:
<signal>

Completion:
<signal>

Failure:
<signal>

Duration:
<measurement>

Business Outcome:
<signal>
```

Business-process observability should not expose unnecessary business or personal data.

---

# 35. Event Observability

When events are involved:

```text id="x7q5mk"
Event:
<event>

Published:
<signal>

Consumed:
<signal>

Processing Success:
<signal>

Processing Failure:
<signal>

Correlation:
<signal>

Lag:
<signal or unspecified>
```

Do not assume that event lag is relevant to every event architecture.

---

# 36. Queue / Backlog Observability

When applicable:

```text id="v5m9xr"
Backlog:
<backlog>

Meaning:
<meaning>

Measurement:
<metric>

Consumer:
<consumer>

Failure Condition:
<condition>

Operational Action:
<action>
```

---

# 37. Retry Observability

```text id="q8v4mk"
Operation:
<operation>

Retry:
<retry>

Retry Count:
<metric>

Retry Reason:
<signal>

Final Failure:
<signal>

Operational Action:
<action>
```

Retries must not be assumed merely because a dependency exists.

---

# 38. Error Classification

```text id="m6x3vc"
Error:
<error>

Category:
<BUSINESS | VALIDATION | SECURITY | DEPENDENCY | INFRASTRUCTURE | TIMEOUT | UNKNOWN>

Severity:
<severity>

Signal:
<signal>

Consumer:
<consumer>

Action:
<action>
```

Error classification should remain consistent with API, event, security, and architecture contracts.

---

# 39. Failure Correlation

```text id="x4q9mk"
Failure:
<failure>

Correlation:
<identifier>

Causation:
<identifier>

Related Dependency:
<dependency>

Related Operation:
<operation>

Diagnostic Value:
<value>
```

Correlation data should enable diagnosis without becoming a substitute for causal analysis.

---

# 40. Alerting Relationship

Observability does not automatically imply alerting.

```text id="v7m5xr"
Signal:
<signal>

Alert Required:
<YES | NO | CONDITIONAL>

Condition:
<condition>

Consumer:
<consumer>

Expected Action:
<action>

Escalation:
<escalation>
```

Every alert should have an understandable operational purpose.

---

# 41. Alert Specification

```text id="q5v8mk"
Alert:
<alert>

Trigger:
<condition>

Severity:
<severity>

Owner:
<owner>

Action:
<action>

Suppression:
<condition>

Recovery:
<condition>
```

Do not create alerts without an expected response.

---

# 42. Alert Fatigue Assessment

```text id="m9x4vc"
Alert:
<alert>

Frequency:
<expected>

False Positive Risk:
<LOW | MEDIUM | HIGH | UNKNOWN>

Actionability:
<LOW | MEDIUM | HIGH>

Mitigation:
<mitigation>
```

---

# 43. Audit Specification

When audit is required:

```text id="x8q3mk"
Audit Action:
<action>

Actor:
<actor>

Resource:
<resource>

Result:
<result>

Timestamp:
<timestamp>

Evidence:
<evidence>

Integrity:
<requirement>

Retention:
<requirement>
```

Audit records must be distinguished from ordinary application logs.

---

# 44. Security Observability

```text id="v6m9xr"
Security Question:
<question>

Signal:
<signal>

Sensitive Data:
<data>

Redaction:
<behavior>

Access:
<requirement>

Retention:
<requirement>
```

Security telemetry must not become a secondary source of sensitive-data leakage.

---

# 45. Sensitive Telemetry

```text id="q4v8mk"
Signal:
<signal>

Sensitive Field:
<field>

Reason:
<reason>

Required:
<YES | NO>

Redaction:
<behavior>

Masking:
<behavior>

Access:
<restriction>
```

Never log:

* passwords,
* private credentials,
* secret keys,
* authentication tokens,
* or sensitive personal information

unless explicitly required, governed, and protected.

---

# 46. Telemetry Sampling

When sampling is relevant:

```text id="m7x5vc"
Signal:
<signal>

Sampling:
<strategy>

Reason:
<reason>

Minimum Coverage:
<requirement>

Critical Paths:
<paths>

Failure Paths:
<paths>
```

Do not invent sampling percentages without evidence.

---

# 47. Telemetry Retention

```text id="x9q4mk"
Signal:
<signal>

Retention:
<requirement>

Reason:
<reason>

Consumer:
<consumer>

Deletion:
<behavior>

Compliance:
<requirement>
```

Retention must be driven by operational, security, compliance, or business requirements.

---

# 48. Telemetry Availability

```text id="v8m3xr"
Signal:
<signal>

Availability Requirement:
<requirement>

Failure Behavior:
<behavior>

Fallback:
<behavior>

Impact:
<impact>
```

Observability infrastructure may fail; the specification should make important consequences explicit.

---

# 49. Telemetry Backpressure

When relevant:

```text id="q6v9mk"
Signal:
<signal>

Backpressure Risk:
<risk>

Behavior:
<behavior>

Loss Policy:
<policy>

Application Impact:
<impact>
```

Telemetry must not unintentionally destabilize the business workload.

---

# 50. Telemetry Resource Usage

```text id="m4x8vc"
Signal:
<signal>

Resource:
<CPU | MEMORY | NETWORK | STORAGE | OTHER>

Impact:
<impact>

Constraint:
<constraint>

Mitigation:
<mitigation>
```

Avoid inventing resource budgets.

---

# 51. Configuration

```text id="x7q5mk"
Observability Configuration:
<configuration>

Purpose:
<purpose>

Owner:
<owner>

Change Authority:
<authority>

Validation:
<method>
```

Observability configuration must not silently alter business semantics.

---

# 52. Runtime Controls

When supported:

```text id="v5m9xr"
Control:
<control>

Purpose:
<purpose>

Default:
<default>

Override:
<conditions>

Security:
<requirements>

Operational Impact:
<impact>
```

Examples may include controlled:

* sampling,
* diagnostic levels,
* feature-specific telemetry,
* tracing scope.

---

# 53. Dashboard Relationship

Dashboards are consumers of observability signals, not the observability contract itself.

```text id="q8v4mk"
Dashboard:
<dashboard>

Purpose:
<purpose>

Signals:
<signals>

Consumer:
<consumer>

Operational Question:
<question>
```

A dashboard should not become the only definition of telemetry semantics.

---

# 54. Operational Scenario

```text id="m6x3vc"
Scenario ID:
<OBS-SCENARIO-001>

Given:
<initial condition>

When:
<condition>

Then:
<expected signals>

And:
<diagnostic information>

Verification:
<method>
```

---

# 55. Incident Diagnostic Scenario

```text id="x4q9mk"
Incident:
<incident>

Question:
<question>

Required Signals:
<signals>

Expected Diagnostic Path:
<path>

Missing Signal:
<signal>

Verification:
<method>
```

Observability should be evaluated against realistic failure diagnosis.

---

# 56. End-to-End Correlation Scenario

```text id="v7m5xr"
Entry Point:
<entry>

Intermediate Boundaries:
<boundaries>

Final Outcome:
<outcome>

Correlation:
<identifier>

Expected Trace:
<trace>

Expected Logs:
<logs>

Expected Metrics:
<metrics>
```

---

# 57. Existing System Analysis

For existing systems:

```text id="q5v8mk"
Documented Observability:
<documented>

Observed Signals:
<observed>

Actual Coverage:
<coverage>

Target Observability:
<target>

Differences:
<differences>
```

Historical telemetry is evidence, not automatically the desired target.

---

# 58. Observability Migration

```text id="m9x4vc"
Current:
<current>

Target:
<target>

Transition:
<transition>

Compatibility:
<compatibility>

Migration Risks:
<risks>

Cutover:
<condition>
```

---

# 59. Observability Compatibility

Potentially breaking changes include:

* removing signals required by operators,
* changing metric meaning,
* changing metric dimensions,
* changing log semantics,
* removing correlation,
* changing trace context behavior,
* changing audit evidence,
* removing health information,
* changing security telemetry,
* changing operational alert conditions.

```text id="x8q3mk"
Change:
<change>

Breaking:
<YES | NO | CONDITIONAL>

Affected Consumer:
<consumer>

Impact:
<impact>
```

---

# 60. Architecture Escalation Triggers

Escalate to Architecture / ADR governance when observability work introduces:

* a new cross-system observability boundary,
* a new operational dependency,
* significant telemetry infrastructure,
* materially different runtime architecture,
* new data retention architecture,
* new sensitive-data handling,
* significant performance/resource impact,
* new reliability requirements,
* a new tracing/correlation architecture,
* or an observability trade-off affecting system behavior.

---

# 61. Open Questions

| ID        | Question     | Impact     | Blocking   | Owner     | Resolution |
| --------- | ------------ | ---------- | ---------- | --------- | ---------- |
| OBS-Q-001 | `<question>` | `<impact>` | `<yes/no>` | `<owner>` | `<method>` |

---

# 62. Assumptions

| ID        | Assumption     | Evidence     | Confidence     | Impact     | Validation |
| --------- | -------------- | ------------ | -------------- | ---------- | ---------- |
| OBS-A-001 | `<assumption>` | `<evidence>` | `<confidence>` | `<impact>` | `<method>` |

---

# 63. Risks

| ID        | Risk     | Severity     | Impact     | Mitigation     |
| --------- | -------- | ------------ | ---------- | -------------- |
| OBS-R-001 | `<risk>` | `<severity>` | `<impact>` | `<mitigation>` |

---

# 64. Traceability

| Observability Specification Element | Upstream Artifact | Relationship | Verification     |
| ----------------------------------- | ----------------- | ------------ | ---------------- |
| `<element>`                         | `<artifact>`      | `REFINES`    | `<verification>` |

Typical chain:

```text id="v6m9xr"
Operational Question
        ↓
Observability Contract
        ↓
Observability Specification
        ↓
Instrumentation
        ↓
Operational Verification
```

---

# 65. Specification Review Checklist

### Operational Questions

* [ ] Important operational questions are explicit.
* [ ] Each important question has sufficient signals.
* [ ] Signals have defined consumers.
* [ ] Signal purpose is understood.

### Logging

* [ ] Logs have semantic purpose.
* [ ] Structured fields are defined where required.
* [ ] Severity is meaningful.
* [ ] Sensitive data is protected.
* [ ] Logging failure behavior is considered.

### Metrics

* [ ] Metrics have explicit meaning.
* [ ] Units are defined.
* [ ] Dimensions are justified.
* [ ] Cardinality risk is evaluated.
* [ ] Business and technical metrics are distinguished.

### Tracing

* [ ] Trace scope is explicit.
* [ ] Important boundaries are represented.
* [ ] Context propagation is defined.
* [ ] Sensitive information is protected.

### Health

* [ ] Health semantics are clear.
* [ ] Liveness is distinguished from readiness.
* [ ] Dependency requirements are explicit.
* [ ] Startup behavior is considered where relevant.

### Failures

* [ ] Dependency failures are observable.
* [ ] Important application failures are observable.
* [ ] Retry behavior is observable where relevant.
* [ ] Operational impact is visible.

### Security

* [ ] Security telemetry is protected.
* [ ] Audit is distinguished from logging.
* [ ] Sensitive information is redacted.
* [ ] Access to telemetry is controlled.

### Alerting

* [ ] Alerts have explicit conditions.
* [ ] Alerts have owners.
* [ ] Alerts have expected actions.
* [ ] Alert fatigue is considered.

### Operations

* [ ] Important incidents can be diagnosed.
* [ ] Correlation is defined where needed.
* [ ] Observability remains useful during failures.
* [ ] Telemetry resource impact is understood.

### Governance

* [ ] Observability Contract is preserved.
* [ ] ADRs are respected.
* [ ] Assumptions are explicit.
* [ ] Unknowns are explicit.
* [ ] Architecture escalation triggers are evaluated.
* [ ] Traceability is maintained.

---

# 66. Specification Outcome

```text id="q4v8mk"
Outcome:

READY
READY_WITH_RISKS
INCOMPLETE
BLOCKED
NOT_REQUIRED
```

## READY

Observability behavior is sufficiently specified for implementation and verification.

## READY_WITH_RISKS

Implementation may proceed with explicit non-blocking risks.

## INCOMPLETE

Important observability behavior remains unspecified.

## BLOCKED

An unresolved architectural, operational, security, or observability issue prevents safe progression.

## NOT_REQUIRED

An independent Observability Specification is unnecessary for the relevant scope.

---

# 67. Handoff

### Implementation Must Preserve

* operational question coverage,
* signal semantics,
* metric meaning,
* trace meaning,
* correlation behavior,
* health semantics,
* security telemetry requirements,
* audit requirements,
* sensitive-data protection,
* retention requirements,
* alert semantics.

### Implementation May Choose

* internal instrumentation structure,
* framework-specific instrumentation,
* telemetry adapters,
* internal helper abstractions,
* dashboard implementation,

provided approved observability semantics remain unchanged.

### Implementation Must Not Introduce

* uncontrolled telemetry,
* sensitive-data leakage,
* undocumented alert guarantees,
* new operational dependencies,
* misleading metric semantics,
* hidden observability coupling,
* or business behavior changes caused by instrumentation.

---

# 68. Agent Instructions

When producing an Observability Specification:

1. Start from the accepted Observability Contract.
2. Identify operational questions.
3. Identify consumers of observability.
4. Select the minimum sufficient signals.
5. Define log semantics.
6. Define metric semantics.
7. Define metric dimensions.
8. Evaluate cardinality.
9. Define trace scope.
10. Define correlation and causation where needed.
11. Define health behavior.
12. Separate liveness from readiness.
13. Define dependency observability.
14. Define failure visibility.
15. Define security telemetry.
16. Define audit behavior where required.
17. Define sensitive telemetry protection.
18. Define sampling only when necessary.
19. Define retention only when supported by requirements.
20. Define alerting only where actionable.
21. Verify observability against realistic operational scenarios.
22. Do not log everything.
23. Do not trace everything.
24. Do not create metrics without meaning.
25. Do not invent thresholds.
26. Do not expose sensitive information.
27. Do not treat dashboards as contracts.
28. Do not introduce observability infrastructure architecture silently.
29. Escalate significant architectural consequences.
30. Maintain traceability.

---

# 69. Anti-Patterns

## Log Everything

Producing excessive logs without operational purpose.

## Telemetry by Tool

Choosing signals because a monitoring platform makes them easy to collect.

## Metric Without Meaning

Creating counters or gauges whose interpretation is unclear.

## High-Cardinality Explosion

Using arbitrary identifiers as metric dimensions.

## Trace Everything

Generating traces without diagnostic value or controlled cost.

## Log = Event

Treating operational logs as business events.

## Event = Log

Treating business events as merely operational telemetry.

## Audit = Logging

Treating ordinary logs as authoritative audit evidence.

## Dashboard = Contract

Allowing a dashboard to become the implicit definition of observability.

## Alert Everything

Creating alerts without clear action.

## Alert Without Owner

Generating alerts that nobody is responsible for responding to.

## Sensitive Telemetry Leakage

Exposing credentials, personal data, tokens, or confidential information.

## Infinite Retention

Keeping telemetry indefinitely without operational or regulatory justification.

## Infrastructure-Only Observability

Monitoring infrastructure while ignoring important business or application behavior.

## False Precision

Inventing numerical thresholds, latency targets, retention periods, or sampling rates without evidence.

## Legacy Observability Worship

Preserving historical telemetry merely because it already exists.

## Observability Theater

Creating dashboards, metrics, and logs without improving diagnosis or operational understanding.

## Specification Prematurity

Defining telemetry implementation before observability questions and contracts are understood.

---

# 70. Safe Progression Question

Before accepting this specification:

> **Can the relevant operational, business, security, reliability, and failure questions be answered through defined, owned, protected, and verifiable observability signals without introducing unsupported operational architecture?**

If not, determine whether the missing information belongs to:

```text id="m7x5vc"
Product
Domain
Architecture
Observability Contract
ADR
Specification
Implementation
```

---

# 71. Final Principle

> **An Observability Specification turns approved observability expectations into precise, implementation-relevant, and verifiable telemetry behavior without confusing signals with the tools that produce them.**

The intended relationship is:

```text id="x9q4mk"
Operational Question
        ↓
Observability Contract
        ↓
Observability Specification
        ↓
Instrumentation / Telemetry
        ↓
Operational Verification
```

A healthy observability specification makes clear **what must be observable, why it matters, who consumes the signal, what the signal means, how failures are exposed, how sensitive data is protected, and how the resulting observability is verified**, while avoiding unnecessary coupling to a particular monitoring or telemetry technology.
