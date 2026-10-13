# Security Specification

## 1. Document Metadata

| Field                 | Value                  |
| --------------------- | ---------------------- |
| Document Type         | Security Specification |
| Lifecycle Phase       | Specifications / SDD   |
| Specification Type    | `SECURITY`             |
| Status                | `DRAFT`                |
| Version               | `0.1`                  |
| System                | `<system>`             |
| Security Boundary     | `<boundary>`           |
| Owner                 | `<owner>`              |
| Created               | `<date>`               |
| Last Updated          | `<date>`               |
| Security Contract     | `<contract-id>`        |
| Architecture Baseline | `<baseline>`           |
| ADR Baseline          | `<baseline>`           |

---

# 2. Purpose

This document specifies implementation-relevant security behavior derived from an approved Security Contract.

It defines sufficient detail to implement and verify:

* identity handling,
* authentication,
* authorization,
* trust boundaries,
* protected resources,
* data protection,
* security context,
* credential and secret handling,
* security failure behavior,
* session or request security,
* audit requirements,
* security observability,
* and security-related testing.

It must preserve the security semantics established by the Security Contract.

---

# 3. Core Principle

> **The Security Contract defines the security expectations across a boundary; the Security Specification defines sufficient detail to implement and verify those expectations.**

The specification must not silently introduce:

* new trust assumptions,
* new privileges,
* new protected resources,
* new authentication semantics,
* new authorization policies,
* new data exposure,
* new security boundaries,
* or architectural security mechanisms.

---

# 4. Fundamental Distinctions

## Identity

Represents who or what a principal is.

## Authentication

Establishes confidence in the claimed identity.

## Authorization

Determines whether an authenticated principal may perform an action against a resource.

## Security Context

Represents security-relevant information available while processing a request or operation.

## Trust Boundary

Defines where security assumptions change.

## Security Specification

Defines how approved security behavior is realized and verified.

```text id="s8m4xr"
Security Contract
       ↓
Security Specification
       ↓
Implementation
       ↓
Security Verification
```

A security specification must not be treated as a substitute for threat analysis or architecture decisions.

---

# 5. Entry Conditions

Before creating this specification:

* [ ] Security Contract exists.
* [ ] Security Contract is `ACCEPTED` or `ACTIVE`.
* [ ] Protected resources are known.
* [ ] Relevant principals are identified.
* [ ] Trust boundaries are known.
* [ ] Authentication expectations are known.
* [ ] Authorization semantics are known.
* [ ] Data protection requirements are known.
* [ ] Security failure expectations are known.
* [ ] Relevant architectural decisions are resolved.
* [ ] Blocking security unknowns are identified.

---

# 6. Security Identity

```text id="q6v9mk"
Identity:
<identity>

Principal Type:
<USER | SERVICE | SYSTEM | ORGANIZATION | OTHER>

Authority:
<authority>

Source:
<source>

Lifecycle:
<lifecycle>

Trust Level:
<trust level or unspecified>
```

Identity must not be confused with authorization.

---

# 7. Principal Catalog

| Principal ID | Principal     | Type     | Purpose     | Authority     | Trust Context |
| ------------ | ------------- | -------- | ----------- | ------------- | ------------- |
| `<P-001>`    | `<principal>` | `<type>` | `<purpose>` | `<authority>` | `<context>`   |

Do not invent principals merely because a framework supports them.

---

# 8. Protected Resources

```text id="m5x8vr"
Resource:
<resource>

Owner:
<owner>

Classification:
<classification>

Protection Requirement:
<requirement>

Allowed Principals:
<principals>

Security Boundary:
<boundary>
```

Protected resources may include:

* business capabilities,
* domain data,
* personal data,
* administrative operations,
* integration endpoints,
* event streams,
* files,
* configuration,
* secrets,
* operational interfaces.

---

# 9. Security Boundary

```text id="x7q3vc"
Boundary:
<boundary>

Inside:
<elements>

Outside:
<elements>

Trust Assumption:
<assumption>

Security Responsibility:
<responsibility>

Crossing Condition:
<condition>
```

Network location must not automatically be treated as a trust boundary.

---

# 10. Authentication Specification

```text id="v8m4xr"
Authentication Required:
<YES | NO | CONDITIONAL>

Principal:
<principal>

Authentication Context:
<context>

Authentication Method:
<method>

Required Assurance:
<requirement>

Failure Behavior:
<behavior>
```

The exact authentication technology should only be specified when already decided.

---

# 11. Authentication Flow

```text id="q5v9mk"
Step 1:
<step>

Step 2:
<step>

Step 3:
<step>

Success:
<condition>

Failure:
<condition>

Security Context Established:
<context>
```

The flow must describe security behavior, not merely framework calls.

---

# 12. Authentication Preconditions

```text id="m8x3vr"
Precondition:
<condition>

Required Credential:
<credential>

Required Context:
<context>

Validation:
<validation>
```

---

# 13. Authentication Success

```text id="x4q7vc"
Principal Established:
<principal>

Identity Attributes:
<attributes>

Security Context:
<context>

Authorization Context:
<context>

Audit:
<requirement>
```

Only security-relevant identity information should be propagated.

---

# 14. Authentication Failure

```text id="v6m9xr"
Failure:
<failure>

External Behavior:
<behavior>

Internal Handling:
<handling>

Audit:
<requirement>

Observability:
<requirement>

Information Disclosure:
<restriction>
```

Authentication failures must not expose unnecessary security-sensitive information.

---

# 15. Credential Handling

```text id="q8v4mk"
Credential:
<credential>

Owner:
<owner>

Purpose:
<purpose>

Storage:
<approved mechanism or unspecified>

Transmission:
<requirement>

Exposure:
<restriction>

Rotation:
<requirement>

Revocation:
<requirement>
```

Never document credentials, secrets, tokens, or private keys as literal values.

---

# 16. Secret Management

```text id="m6x3vr"
Secret:
<secret>

Purpose:
<purpose>

Owner:
<owner>

Access:
<requirement>

Storage:
<mechanism>

Rotation:
<requirement>

Revocation:
<requirement>

Audit:
<requirement>
```

Specific secret-management technology belongs here only if architecturally approved.

---

# 17. Authorization Model

```text id="x9q5vc"
Authorization Model:
<model>

Principal:
<principal>

Resource:
<resource>

Action:
<action>

Decision:
<ALLOW | DENY | CONDITIONAL>

Policy:
<policy>
```

Possible models may include:

* role-based,
* attribute-based,
* relationship-based,
* policy-based,
* capability-based,
* domain-specific authorization.

Do not select a model solely because the chosen framework supports it.

---

# 18. Permission Semantics

| Permission     | Resource     | Action     | Condition     | Principal     | Result     |
| -------------- | ------------ | ---------- | ------------- | ------------- | ---------- |
| `<permission>` | `<resource>` | `<action>` | `<condition>` | `<principal>` | `<result>` |

Permissions must represent meaningful authorization behavior.

---

# 19. Business Authority vs Technical Authorization

```text id="v7m4xr"
Business Authority:
<authority>

Technical Authorization:
<mechanism>

Relationship:
<relationship>

Domain Rule:
<rule>
```

Technical roles must not automatically be treated as business roles.

---

# 20. Authorization Decision

```text id="q4v8mk"
Request:
<request>

Principal:
<principal>

Resource:
<resource>

Action:
<action>

Context:
<context>

Decision:
<ALLOW | DENY>

Reason:
<reason>
```

---

# 21. Authorization Failure

```text id="m9x3vr"
Failure:
<UNAUTHENTICATED | UNAUTHORIZED | FORBIDDEN | INVALID_CONTEXT | OTHER>

External Response:
<response>

Internal Handling:
<handling>

Audit:
<requirement>

Observability:
<requirement>
```

Do not expose internal authorization policy details unnecessarily.

---

# 22. Resource-Level Authorization

When authorization depends on the specific resource:

```text id="x6q5vc"
Resource:
<resource>

Resource Owner:
<owner>

Requested Action:
<action>

Principal:
<principal>

Ownership Rule:
<rule>

Authorization Result:
<result>
```

---

# 23. Contextual Authorization

When authorization depends on additional context:

```text id="v8m4xr"
Context:
<context>

Relevant Attributes:
<attributes>

Condition:
<condition>

Decision:
<decision>
```

Contextual attributes must be explicitly justified.

---

# 24. Security Context Propagation

```text id="q7v3mk"
Source:
<source>

Destination:
<destination>

Context:
<security context>

Required Fields:
<fields>

Integrity:
<requirement>

Confidentiality:
<requirement>

Expiration:
<requirement>
```

Only required security context should cross architectural boundaries.

---

# 25. Session or Request Security

```text id="m5x9vr"
Security Scope:
<SESSION | REQUEST | OPERATION | OTHER>

Context Lifetime:
<lifetime>

Expiration:
<requirement>

Revocation:
<requirement>

Renewal:
<requirement>
```

Do not invent session behavior where the architecture is stateless.

---

# 26. Token Specification

When tokens are part of the approved architecture:

```text id="x8q4vc"
Token Purpose:
<purpose>

Issuer:
<issuer>

Audience:
<audience>

Lifetime:
<requirement>

Required Claims:
<claims>

Optional Claims:
<claims>

Validation:
<rules>

Revocation:
<rules>
```

Token format and technology must not be invented.

---

# 27. Token Claims

| Claim     | Meaning     | Required   | Validation | Sensitive  |
| --------- | ----------- | ---------- | ---------- | ---------- |
| `<claim>` | `<meaning>` | `<yes/no>` | `<rule>`   | `<yes/no>` |

Claims must have explicit semantics.

---

# 28. Data Classification

```text id="v6m3xr"
Data:
<data>

Classification:
<PUBLIC | INTERNAL | CONFIDENTIAL | RESTRICTED | OTHER>

Owner:
<owner>

Protection:
<requirements>

Allowed Exposure:
<scope>
```

Classification must come from approved policy or evidence.

---

# 29. Data Protection

```text id="q9v5mk"
Data:
<data>

At Rest:
<requirement>

In Transit:
<requirement>

During Processing:
<requirement>

Access:
<requirement>

Minimization:
<requirement>

Retention:
<requirement>
```

Specific cryptographic mechanisms belong here only when already decided.

---

# 30. Sensitive Data Handling

```text id="m7x4vr"
Sensitive Data:
<data>

Purpose:
<purpose>

Required:
<YES | NO>

Allowed Locations:
<locations>

Exposure Restrictions:
<restrictions>

Redaction:
<requirements>

Deletion:
<requirements>
```

---

# 31. Data Minimization

| Data Element | Purpose     | Required   | Consumer     | Sensitive  | Retention       |
| ------------ | ----------- | ---------- | ------------ | ---------- | --------------- |
| `<element>`  | `<purpose>` | `<yes/no>` | `<consumer>` | `<yes/no>` | `<requirement>` |

Do not propagate sensitive information merely because it is technically available.

---

# 32. Input Security Validation

```text id="x5q8vc"
Input:
<input>

Source:
<source>

Validation:
<validation>

Normalization:
<normalization>

Allowed Values:
<constraints>

Security Risk:
<risk>

Failure:
<behavior>
```

Validation must distinguish:

* business validation,
* structural validation,
* security validation.

---

# 33. Output Security

```text id="v9m4xr"
Output:
<output>

Consumer:
<consumer>

Allowed Data:
<data>

Restricted Data:
<data>

Redaction:
<behavior>

Authorization:
<requirement>
```

---

# 34. Security Headers / Metadata

When relevant:

```text id="q6v3mk"
Metadata:
<metadata>

Purpose:
<purpose>

Required:
<YES | NO>

Validation:
<validation>

Security Impact:
<impact>
```

Protocol-specific headers should only be documented when part of the approved implementation boundary.

---

# 35. Cross-Boundary Security

```text id="m8x5vr"
Boundary:
<boundary>

Source:
<source>

Destination:
<destination>

Trust Relationship:
<trust>

Authentication:
<requirement>

Authorization:
<requirement>

Data Protection:
<requirement>

Failure:
<behavior>
```

---

# 36. Service-to-Service Security

When applicable:

```text id="x7q4vc"
Caller:
<service>

Target:
<service>

Identity:
<identity>

Authentication:
<requirement>

Authorization:
<requirement>

Trust:
<assumption>

Credential:
<mechanism>

Failure:
<behavior>
```

Do not assume that internal services are automatically trusted.

---

# 37. Event Security

When the boundary includes events:

```text id="v5m9xr"
Event:
<event>

Publisher:
<publisher>

Consumer:
<consumer>

Data Classification:
<classification>

Authorization:
<requirement>

Sensitive Data:
<data>

Integrity:
<requirement>
```

The Event Specification remains responsible for event-specific implementation detail.

---

# 38. API Security

When the boundary includes APIs:

```text id="q8v4mk"
API:
<api>

Authentication:
<requirement>

Authorization:
<requirement>

Protected Operations:
<operations>

Protected Data:
<data>

Failure:
<behavior>
```

The API Specification should contain operation-level implementation details.

---

# 39. Security Failure Model

| Failure     | Detection  | External Behavior | Internal Behavior | Audit      | Alert      |
| ----------- | ---------- | ----------------- | ----------------- | ---------- | ---------- |
| `<failure>` | `<method>` | `<behavior>`      | `<behavior>`      | `<yes/no>` | `<yes/no>` |

Security failures should be classified consistently.

---

# 40. Security Error Semantics

```text id="m6x3vr"
Security Error:
<error>

Meaning:
<meaning>

Consumer-visible:
<YES | NO>

Response:
<response>

Internal Detail:
<detail>

Audit:
<requirement>
```

Do not expose internal security reasoning through external errors.

---

# 41. Abuse Protection

When required by architecture/security requirements:

```text id="x9q5vc"
Threat:
<threat>

Protected Operation:
<operation>

Protection:
<requirement>

Threshold:
<value or unspecified>

Response:
<behavior>

Recovery:
<behavior>
```

Do not invent thresholds.

---

# 42. Rate Limiting

When explicitly required:

```text id="v7m4xr"
Scope:
<scope>

Principal:
<principal>

Operation:
<operation>

Limit:
<value or unspecified>

Window:
<window or unspecified>

Exceeded Behavior:
<behavior>

Recovery:
<behavior>
```

Rate limiting is not automatically a security requirement for every API.

---

# 43. Account / Principal Lifecycle

```text id="q5v8mk"
Lifecycle:
<CREATED | ACTIVE | SUSPENDED | REVOKED | DELETED | OTHER>

Transition:
<transition>

Trigger:
<trigger>

Authorization Impact:
<impact>

Authentication Impact:
<impact>
```

---

# 44. Credential Lifecycle

```text id="m4x9vr"
Credential:
<credential>

Created:
<condition>

Activated:
<condition>

Rotated:
<condition>

Revoked:
<condition>

Expired:
<condition>

Deleted:
<condition>
```

---

# 45. Security Audit

When audit is required:

```text id="x8q3vc"
Audited Action:
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

Retention:
<requirement>
```

Operational logging is not automatically equivalent to audit evidence.

---

# 46. Security Observability

```text id="v6m5xr"
Security Question:
<question>

Signal:
<LOG | METRIC | TRACE | AUDIT | EVENT | HEALTH | OTHER>

Meaning:
<meaning>

Owner:
<owner>

Sensitive Data:
<data>

Retention:
<requirement>
```

Security telemetry must not create a secondary data-exposure risk.

---

# 47. Security Correlation

```text id="q9v4mk"
Correlation Identifier:
<identifier>

Purpose:
<purpose>

Scope:
<scope>

Propagation:
<behavior>

Sensitive:
<YES | NO>
```

Correlation identifiers must not accidentally become authentication credentials.

---

# 48. Security Concurrency

When security state can be changed concurrently:

```text id="m7x3vr"
Security Resource:
<resource>

Concurrent Operations:
<operations>

Conflict:
<condition>

Expected Result:
<result>

Consistency Requirement:
<requirement>
```

Examples may include concurrent:

* permission changes,
* credential revocation,
* session invalidation,
* account suspension,
* security policy updates.

---

# 49. Security Transactions

```text id="x4q8vc"
Security Operation:
<operation>

Transaction Boundary:
<boundary>

Atomicity:
<requirement>

Consistency:
<requirement>

Failure:
<behavior>
```

Do not introduce distributed transactions solely to simplify security behavior without architectural governance.

---

# 50. Security Caching

When security-sensitive information is cached:

```text id="v8m5xr"
Cached Data:
<data>

Purpose:
<purpose>

TTL:
<value or unspecified>

Invalidation:
<mechanism>

Security Risk:
<risk>

Revocation Impact:
<impact>
```

Authorization caching must not silently extend privileges beyond approved policy.

---

# 51. Security Configuration

```text id="q6v9mk"
Configuration:
<configuration>

Purpose:
<purpose>

Security Impact:
<impact>

Source:
<source>

Change Authority:
<authority>

Validation:
<method>
```

Security-sensitive configuration must have explicit ownership.

---

# 52. Security Defaults

For each security-sensitive behavior:

```text id="m5x4vr"
Behavior:
<behavior>

Default:
<default>

Reason:
<reason>

Failure-Safe:
<YES | NO>

Override:
<conditions>
```

Security-sensitive defaults should fail safely where required by the approved contract.

---

# 53. Security Testing

Security verification should cover relevant categories:

```text id="x7q9vc"
AUTHENTICATION
AUTHORIZATION
ACCESS_CONTROL
DATA_PROTECTION
INPUT_VALIDATION
SECRET_HANDLING
SESSION_SECURITY
CROSS_BOUNDARY_SECURITY
SECURITY_FAILURE
AUDIT
OBSERVABILITY
COMPATIBILITY
MIGRATION
```

---

# 54. Security Test Scenario

```text id="v4m8xr"
Scenario ID:
<SEC-TEST-001>

Given:
<initial security state>

When:
<operation>

Then:
<expected security behavior>

And:
<expected protection>

Verification:
<test type>

Evidence:
<evidence>
```

---

# 55. Negative Security Testing

Security specifications should include explicit denial scenarios.

| Scenario     | Principal     | Resource     | Action     | Expected Result |
| ------------ | ------------- | ------------ | ---------- | --------------- |
| `<scenario>` | `<principal>` | `<resource>` | `<action>` | `DENY`          |

Do not validate security only through successful authentication or authorized requests.

---

# 56. Security Boundary Tests

```text id="q8v3mk"
Boundary:
<boundary>

Crossing Attempt:
<attempt>

Expected Authentication:
<requirement>

Expected Authorization:
<requirement>

Expected Data Protection:
<requirement>

Expected Failure:
<behavior>
```

---

# 57. Security Regression

```text id="m6x9vr"
Security Behavior:
<behavior>

Previous Guarantee:
<guarantee>

Current Guarantee:
<guarantee>

Regression Risk:
<risk>

Verification:
<test>
```

Security changes must consider previously established protections.

---

# 58. Existing System Analysis

For existing systems:

```text id="x5q4vc"
Documented Security:
<documented>

Observed Security:
<observed>

Actual Security Behavior:
<actual>

Target Security:
<target>

Differences:
<differences>
```

Historical implementation is evidence, not automatically the desired security baseline.

---

# 59. Security Migration

```text id="v9m5xr"
Current Security Model:
<current>

Target Security Model:
<target>

Transition:
<transition>

Compatibility:
<compatibility>

Credential Migration:
<requirements>

Authorization Migration:
<requirements>

Rollback:
<strategy>
```

---

# 60. Security Compatibility

Potential breaking changes include:

* changing authentication requirements,
* changing authorization rules,
* removing permissions,
* changing resource ownership semantics,
* changing token claims relied upon by consumers,
* changing credential lifecycle,
* changing security context propagation,
* exposing previously protected information,
* changing security failure semantics.

```text id="q7v4mk"
Change:
<change>

Breaking:
<YES | NO | CONDITIONAL>

Impact:
<impact>

Affected Principals:
<principals>

Affected Consumers:
<consumers>
```

---

# 61. Architecture Escalation Triggers

Escalate to Architecture / ADR governance when implementation requires:

* a new trust boundary,
* a new identity authority,
* a new authentication architecture,
* a materially different authorization model,
* a new security-sensitive integration,
* a new source of sensitive data,
* a new security responsibility between components,
* a new credential-management architecture,
* a new cross-system security mechanism,
* a new regulatory/security constraint,
* or a security trade-off with significant architectural consequences.

---

# 62. Open Questions

| ID        | Question     | Impact     | Blocking   | Owner     | Resolution |
| --------- | ------------ | ---------- | ---------- | --------- | ---------- |
| SEC-Q-001 | `<question>` | `<impact>` | `<yes/no>` | `<owner>` | `<method>` |

---

# 63. Assumptions

| ID        | Assumption     | Evidence     | Confidence     | Impact     | Validation |
| --------- | -------------- | ------------ | -------------- | ---------- | ---------- |
| SEC-A-001 | `<assumption>` | `<evidence>` | `<confidence>` | `<impact>` | `<method>` |

Security assumptions require particular scrutiny because an invalid trust assumption can invalidate the entire security model.

---

# 64. Risks

| ID        | Risk     | Severity     | Impact     | Mitigation     |
| --------- | -------- | ------------ | ---------- | -------------- |
| SEC-R-001 | `<risk>` | `<severity>` | `<impact>` | `<mitigation>` |

---

# 65. Traceability

| Security Specification Element | Upstream Artifact | Relationship | Verification     |
| ------------------------------ | ----------------- | ------------ | ---------------- |
| `<element>`                    | `<artifact>`      | `REFINES`    | `<verification>` |

Typical chain:

```text id="m8x3vr"
Security Requirement
       ↓
Security Contract
       ↓
Security Specification
       ↓
Implementation
       ↓
Security Verification
```

---

# 66. Specification Review Checklist

### Identity

* [ ] Principals are identified.
* [ ] Identity ownership is clear.
* [ ] Identity is distinguished from authorization.
* [ ] Trust assumptions are explicit.

### Authentication

* [ ] Authentication requirements are explicit.
* [ ] Authentication success behavior is defined.
* [ ] Authentication failure behavior is defined.
* [ ] Credential handling is defined where relevant.

### Authorization

* [ ] Protected resources are identified.
* [ ] Actions are defined.
* [ ] Authorization semantics are explicit.
* [ ] Resource-level authorization is addressed where necessary.
* [ ] Denial behavior is defined.

### Data Protection

* [ ] Sensitive data is identified.
* [ ] Data classification is defined.
* [ ] Exposure is controlled.
* [ ] Data minimization is addressed.
* [ ] Retention/deletion requirements are addressed where relevant.

### Trust Boundaries

* [ ] Trust boundaries are explicit.
* [ ] Cross-boundary authentication is defined.
* [ ] Cross-boundary authorization is defined.
* [ ] Internal systems are not implicitly trusted.

### Failure

* [ ] Authentication failures are defined.
* [ ] Authorization failures are defined.
* [ ] Security failures are observable.
* [ ] External responses avoid unnecessary disclosure.

### Secrets

* [ ] Secrets have ownership.
* [ ] Secret exposure is controlled.
* [ ] Rotation/revocation requirements are addressed.
* [ ] Literal secrets are never documented.

### Audit and Observability

* [ ] Required audit behavior is defined.
* [ ] Security telemetry is defined.
* [ ] Sensitive telemetry is protected.
* [ ] Correlation behavior is defined where relevant.

### Testing

* [ ] Positive authorization scenarios exist.
* [ ] Negative authorization scenarios exist.
* [ ] Authentication failures are tested.
* [ ] Data protection is tested.
* [ ] Security boundary behavior is tested.
* [ ] Regression behavior is tested.

### Governance

* [ ] Security Contract is preserved.
* [ ] ADRs are respected.
* [ ] Security assumptions are explicit.
* [ ] Unknowns are explicit.
* [ ] Architecture escalation triggers are evaluated.
* [ ] Traceability is maintained.

---

# 67. Specification Outcome

```text id="x6q9vc"
Outcome:

READY
READY_WITH_RISKS
INCOMPLETE
BLOCKED
NOT_REQUIRED
```

## READY

The security behavior is sufficiently specified for implementation and verification.

## READY_WITH_RISKS

Implementation may proceed with explicit non-blocking risks.

## INCOMPLETE

Important security behavior remains unspecified.

## BLOCKED

An unresolved security or architectural issue prevents safe progression.

## NOT_REQUIRED

An independent Security Specification is unnecessary for the relevant scope.

---

# 68. Handoff

### Implementation Must Preserve

* identity semantics,
* authentication requirements,
* authorization semantics,
* trust boundaries,
* protected resources,
* data protection,
* security failure behavior,
* audit requirements,
* security observability,
* credential lifecycle requirements.

### Implementation May Choose

* internal security abstractions,
* internal validation structure,
* framework configuration structure,
* internal policy evaluation structure,

provided approved security behavior remains unchanged.

### Implementation Must Not Introduce

* implicit trust,
* privilege escalation,
* new identity authorities,
* new security boundaries,
* new sensitive-data exposure,
* weakened authentication,
* weakened authorization,
* undocumented security guarantees.

---

# 69. Agent Instructions

When producing a Security Specification:

1. Start from the accepted Security Contract.
2. Identify principals.
3. Identify protected resources.
4. Identify trust boundaries.
5. Separate identity, authentication, and authorization.
6. Define authentication behavior.
7. Define authorization behavior.
8. Define denial behavior.
9. Define security context propagation.
10. Define data protection.
11. Define sensitive-data handling.
12. Define credential and secret handling.
13. Define security failures.
14. Define audit requirements.
15. Define security observability.
16. Define relevant negative tests.
17. Preserve approved security semantics.
18. Do not invent credentials or secrets.
19. Do not invent security mechanisms.
20. Do not assume internal systems are trusted.
21. Do not equate technical roles with business authority.
22. Do not introduce new trust boundaries silently.
23. Escalate architectural security consequences.
24. Maintain traceability.

---

# 70. Anti-Patterns

## Authentication = Authorization

Successfully identifying a principal does not imply permission to perform every action.

## Role Explosion

Creating excessive technical roles instead of modeling meaningful authorization semantics.

## Framework-First Security

Choosing security behavior because a framework provides a convenient mechanism.

## Internal = Trusted

Assuming internal network location provides sufficient trust.

## Network Security = Application Security

Treating network isolation as a substitute for application-level authorization.

## Hidden Privilege

Granting permissions that are not represented in the authorization model.

## Credential Leakage

Exposing credentials, tokens, keys, or secrets through configuration, logs, events, errors, or documentation.

## Data Exposure by Convenience

Returning sensitive information because it is available internally.

## Security by Obscurity

Relying on hidden implementation details instead of explicit protection.

## Audit Everything

Generating audit records without defining their purpose, ownership, integrity, or retention.

## Logging = Audit

Treating ordinary operational logs as authoritative audit evidence.

## Unverified Trust

Relying on undocumented trust assumptions.

## Legacy Security Worship

Preserving historical security behavior without evaluating whether it remains correct.

## Security Theater

Producing extensive security documentation without meaningful protection or verification.

## Specification Prematurity

Defining implementation security details before security requirements and contracts are understood.

---

# 71. Safe Progression Question

Before accepting this specification:

> **Does this specification define enough precise and verifiable security behavior for identity, authentication, authorization, trust boundaries, protected resources, data protection, security failures, secrets, observability, and audit requirements without introducing unsupported security architecture?**

If not, determine whether the missing information belongs to:

```text id="v5m8xr"
Product
Domain
Architecture
Security Contract
ADR
Specification
Implementation
```

---

# 72. Final Principle

> **A Security Specification turns approved security expectations into precise, implementation-relevant, and verifiable behavior without silently changing the system's security model.**

The intended relationship is:

```text id="q9v4mk"
Security Requirement
        ↓
Security Contract
        ↓
Security Specification
        ↓
Security Implementation
        ↓
Security Verification
```

A healthy security specification makes clear **who may do what, to which resource, under which security context, across which trust boundary, with which protection and failure behavior**, while leaving implementation choices unconstrained unless they have already been architecturally decided.
