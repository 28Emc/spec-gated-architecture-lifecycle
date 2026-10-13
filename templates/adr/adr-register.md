# Architecture Decision Register

## 1. Document Metadata

| Field            | Value                          |
| ---------------- | ------------------------------ |
| Document Type    | Architecture Decision Register |
| Lifecycle Phase  | Architecture Decisions         |
| Status           | `DRAFT`                        |
| Version          | `0.1`                          |
| System           | `<system>`                     |
| Owner            | `<owner>`                      |
| Created          | `<date>`                       |
| Last Updated     | `<date>`                       |
| Review Frequency | `<frequency>`                  |

---

# 2. Purpose

The Architecture Decision Register provides the authoritative index of architecture decisions for a system.

It allows the project and AI agents to determine:

* Which architectural decisions exist.
* Which decisions are currently active.
* Which decisions are pending.
* Which decisions were rejected.
* Which decisions have been superseded.
* Which decisions are deprecated or revoked.
* Which decisions affect specific architecture elements.
* Which decisions affect contracts, data, security, or operations.
* Which decisions conflict with one another.
* Which decisions require review.
* Where architectural decision debt exists.

The register is an **index and governance mechanism**.

It does not replace individual ADR documents.

---

# 3. Core Principle

> **The ADR Register provides a coherent view of the architecture's decision history and current decision baseline.**

The register must allow an agent to answer:

```text
What has been decided?
What is still undecided?
What is currently active?
What was superseded?
What conflicts?
What requires review?
```

---

# 4. Authority

The register should be treated as the authoritative index of recorded architectural decisions.

The individual ADR remains the authoritative source for the complete reasoning and consequences of each decision.

Therefore:

```text id="m7x4vr"
Register
   ↓
ADR Reference
   ↓
Full Decision Record
```

The register must not contain a simplified interpretation that contradicts the actual ADR.

---

# 5. Decision Status Model

Supported states:

```text id="q5m8xc"
IDENTIFIED
PROPOSED
UNDER_REVIEW
ACCEPTED
REJECTED
ACTIVE
SUPERSEDED
DEPRECATED
REVOKED
```

Use the status defined by the individual ADR.

Do not invent additional status values without governance.

---

# 6. Master Decision Register

| ADR      | Title     | Category     | Significance | Status     | Date     | Owner     | Authority     |
| -------- | --------- | ------------ | ------------ | ---------- | -------- | --------- | ------------- |
| ADR-0001 | `<title>` | `<category>` | `<level>`    | `<status>` | `<date>` | `<owner>` | `<authority>` |

---

# 7. Decision Categories

Recommended categories:

```text id="v8x3mr"
ARCHITECTURE
DOMAIN
INTEGRATION
API
EVENT
DATA
SECURITY
OBSERVABILITY
INFRASTRUCTURE
DEPLOYMENT
RUNTIME
RELIABILITY
RESILIENCE
SCALABILITY
PERFORMANCE
MIGRATION
COMPATIBILITY
OPERATIONS
COMPLIANCE
PLATFORM
OTHER
```

Categories should describe the architectural concern, not necessarily the technology involved.

---

# 8. Significance Register

| Significance  | Meaning                                  | Governance            |
| ------------- | ---------------------------------------- | --------------------- |
| `TRIVIAL`     | Minimal consequence                      | Lightweight or no ADR |
| `LOCAL`       | Limited architectural impact             | Local review          |
| `SIGNIFICANT` | Multiple areas/boundaries affected       | Formal review         |
| `STRATEGIC`   | Long-term or difficult-to-reverse impact | Strong governance     |

---

# 9. Active Decision Baseline

This section identifies decisions that currently govern the architecture.

| ADR        | Decision     | Scope     | Status   | Effective From |
| ---------- | ------------ | --------- | -------- | -------------- |
| `<ADR-ID>` | `<decision>` | `<scope>` | `ACTIVE` | `<date>`       |

Only decisions with current authority should appear in the active baseline.

Historical or superseded decisions should not be treated as active constraints.

---

# 10. Pending Decisions

```text id="n4q7xc"
ADR:
<ADR-ID>

Title:
<title>

Status:
<IDENTIFIED | PROPOSED | UNDER_REVIEW>

Problem:
<problem>

Why Pending:
<reason>

Decision Authority:
<authority>

Blocking:
<YES | NO>

Expected Decision:
<date / condition>
```

Pending decisions must not silently be treated as accepted architecture.

---

# 11. Decision Candidates

Track decisions that have been identified but have not yet become formal ADRs.

| Candidate     | Problem     | Source     | Impact     | Significance | ADR Required |
| ------------- | ----------- | ---------- | ---------- | ------------ | ------------ |
| `<candidate>` | `<problem>` | `<source>` | `<impact>` | `<level>`    | `<YES/NO>`   |

---

# 12. Rejected Decisions

```text id="m8x3vr"
ADR:
<ADR-ID>

Decision:
<decision>

Status:
REJECTED

Reason:
<reason>

Rejected By:
<authority>

Date:
<date>

Future Reconsideration:
<condition or NONE>
```

Rejected decisions should remain visible because future analysis may encounter the same alternative.

---

# 13. Superseded Decisions

| Old ADR    | New ADR    | Reason     | Date     | Migration Required |
| ---------- | ---------- | ---------- | -------- | ------------------ |
| `<ADR-ID>` | `<ADR-ID>` | `<reason>` | `<date>` | `<YES/NO>`         |

A superseded ADR remains part of the architecture history.

---

# 14. Deprecated Decisions

```text id="q6m9vc"
ADR:
<ADR-ID>

Reason:
<reason>

Deprecated Since:
<date>

Replacement:
<ADR-ID or NONE>

New Work Allowed:
<YES | NO | RESTRICTED>

Retirement Condition:
<condition>
```

Deprecation does not erase historical authority.

---

# 15. Revoked Decisions

```text id="v5x8mr"
ADR:
<ADR-ID>

Reason:
<reason>

Revoked By:
<authority>

Date:
<date>

Affected Artifacts:
<artifacts>

Replacement Decision:
<ADR-ID or NONE>
```

A revoked decision should no longer govern current architecture.

---

# 16. Decision Relationships

Architecture decisions form a graph.

Relevant relationships include:

```text id="n7q4xc"
DEPENDS_ON
INFLUENCES
CONSTRAINS
JUSTIFIES
CONFLICTS_WITH
SUPERSEDES
SUPERSEDED_BY
INVALIDATES
MITIGATES
REFINES
REALIZES
```

---

# 17. Decision Dependency Graph

```text id="m3x8vr"
ADR-0001
   ↓ DEPENDS_ON
ADR-0002
   ↓ CONSTRAINS
ADR-0003
```

The graph should identify decisions whose validity depends on earlier decisions.

---

# 18. Decision Conflicts

```text id="x9q4mk"
Conflict ID:
DECISION-CONFLICT-<NNN>

ADR A:
<ADR-ID>

ADR B:
<ADR-ID>

Conflict:
<description>

Type:
<SEMANTIC | ARCHITECTURAL | CONTRACT | DATA | SECURITY | OPERATIONAL>

Severity:
<INFO | WARNING | SIGNIFICANT | BLOCKING>

Current Resolution:
<resolution>

Status:
<OPEN | RESOLVED | ACCEPTED_RISK>
```

A conflict must not be hidden by changing register descriptions.

---

# 19. Decision Consistency Review

Review active decisions collectively.

```text id="q4m7vc"
Decision Set:
<ADR IDs>

Consistent:
<YES | NO | PARTIAL>

Conflicts:
<conflicts>

Contradictions:
<contradictions>

Missing Decision:
<decision>

Result:
<result>
```

An individual ADR may be valid while the collective decision baseline is inconsistent.

---

# 20. Decision Coverage

Evaluate whether important architectural concerns have explicit decisions where needed.

| Concern           | Decision Required | ADR     | Status     |
| ----------------- | ----------------- | ------- | ---------- |
| Data ownership    | `<YES/NO>`        | `<ADR>` | `<status>` |
| Security boundary | `<YES/NO>`        | `<ADR>` | `<status>` |
| Integration model | `<YES/NO>`        | `<ADR>` | `<status>` |
| Consistency       | `<YES/NO>`        | `<ADR>` | `<status>` |
| Deployment        | `<YES/NO>`        | `<ADR>` | `<status>` |
| Migration         | `<YES/NO>`        | `<ADR>` | `<status>` |

Decision coverage is not a requirement to create ADRs for every concern.

Only consequential choices require formal decisions.

---

# 21. Decision Orphans

Identify decisions without meaningful relationships to the rest of the architecture.

Possible orphan conditions:

* No identified scope.
* No affected architecture element.
* No rationale.
* No evidence.
* No authority.
* No implementation or validation relationship.
* No reason for existence.
* No relationship to a real architectural concern.

```text id="v8x5mr"
ADR:
<ADR-ID>

Orphan Condition:
<condition>

Severity:
<severity>

Action:
<action>
```

---

# 22. Decision Debt

Decision debt exists when important architectural choices remain implicit, unresolved, outdated, or inconsistently governed.

Categories:

```text id="n5q3xc"
IMPLICIT_DECISION
MISSING_DECISION
STALE_DECISION
CONFLICTING_DECISION
UNVALIDATED_DECISION
UNAUTHORIZED_DECISION
UNDOCUMENTED_DECISION
EXCESSIVE_DECISION
```

---

# 23. Decision Debt Register

| ID           | Type     | Problem     | Impact     | Severity     | Owner     | Action     |
| ------------ | -------- | ----------- | ---------- | ------------ | --------- | ---------- |
| DEC-DEBT-001 | `<type>` | `<problem>` | `<impact>` | `<severity>` | `<owner>` | `<action>` |

---

# 24. Implicit Decisions

Identify architectural choices that exist in implementation or operational behavior but lack explicit governance.

Examples:

* A database became the authoritative source without a recorded decision.
* A synchronous dependency became mandatory without architectural analysis.
* A framework choice introduced an architectural constraint.
* An external integration became a permanent dependency.
* A security model exists only in configuration.
* A deployment topology became architectural policy without an ADR.

```text id="m6x9vr"
Implicit Decision:
<decision>

Observed Evidence:
<evidence>

Current Impact:
<impact>

ADR Required:
<YES | NO>

Action:
<action>
```

---

# 25. Unauthorized Decisions

Identify decisions that appear to have been made without appropriate authority.

```text id="x4q8mk"
Decision:
<decision>

ADR:
<ADR-ID or NONE>

Authority:
<authority>

Expected Authority:
<authority>

Impact:
<impact>

Action:
<action>
```

The objective is governance, not blame.

---

# 26. Stale Decisions

```text id="q7m3vc"
ADR:
<ADR-ID>

Decision:
<decision>

Current Context:
<context>

Original Context:
<context>

Still Valid:
<YES | NO | PARTIAL | UNKNOWN>

Evidence:
<evidence>

Action:
<action>
```

A decision should be reviewed when its assumptions materially change.

---

# 27. Unvalidated Decisions

```text id="v9x5mr"
ADR:
<ADR-ID>

Decision:
<decision>

Required Validation:
<validation>

Available Evidence:
<evidence>

Validation Status:
<NOT_STARTED | PARTIAL | COMPLETE>

Risk:
<risk>
```

Acceptance does not automatically mean validation has occurred.

---

# 28. Decision Impact Matrix

| ADR        |    Product |     Domain | Architecture |  Contracts |       Data |   Security | Operations |
| ---------- | ---------: | ---------: | -----------: | ---------: | ---------: | ---------: | ---------: |
| `<ADR-ID>` | `<impact>` | `<impact>` |   `<impact>` | `<impact>` | `<impact>` | `<impact>` | `<impact>` |

Use qualitative impact unless quantitative evidence is justified.

---

# 29. Decision-to-Artifact Mapping

```text id="m4x8vr"
ADR:
<ADR-ID>

Requirements:
<REQ IDs>

Domain Artifacts:
<artifact IDs>

Architecture Artifacts:
<artifact IDs>

Contracts:
<contract IDs>

Specifications:
<spec IDs>

Implementation:
<references>

Verification:
<tests / evidence>
```

---

# 30. Decision Traceability Health

```text id="x6q3mk"
ADR:
<ADR-ID>

Forward Traceability:
<VALID | PARTIAL | MISSING | STALE | CONFLICTING>

Backward Traceability:
<VALID | PARTIAL | MISSING | STALE | CONFLICTING>

Implementation Alignment:
<ALIGNED | DRIFT | UNKNOWN>

Verification:
<VERIFIED | PARTIAL | MISSING>
```

---

# 31. Decision Drift Register

| ADR     | Expected Decision | Observed State | Drift     | Impact     | Action     |
| ------- | ----------------- | -------------- | --------- | ---------- | ---------- |
| `<ADR>` | `<decision>`      | `<state>`      | `<level>` | `<impact>` | `<action>` |

Decision drift is not automatically a failure.

It may indicate:

* Legitimate architecture evolution.
* Missing ADR.
* Implementation deviation.
* Outdated decision.
* Uncontrolled exception.

---

# 32. Decision Revalidation

Revalidation should be triggered by material changes.

Typical triggers:

* New business requirements.
* Domain boundary changes.
* Contract changes.
* Security changes.
* New quality attribute requirements.
* Infrastructure changes.
* Major dependency changes.
* Migration events.
* Regulatory changes.
* Significant production evidence.

```text id="q8m4vc"
ADR:
<ADR-ID>

Trigger:
<trigger>

Revalidation Required:
<YES | NO>

Review:
<review>

Result:
<VALID | SUPERSEDED | DEPRECATED | REVOKED | MODIFIED>
```

---

# 33. Architecture Baseline

The register should identify the current architectural decision baseline.

```text id="v4x7mr"
Baseline Version:
<version>

Effective Date:
<date>

Active ADRs:
<ADR IDs>

Pending ADRs:
<ADR IDs>

Known Conflicts:
<conflicts>

Known Decision Debt:
<debt>

Baseline Status:
<STABLE | EVOLVING | DEGRADED | BLOCKED>
```

---

# 34. Current vs Target Decision Baseline

For system evolution:

```text id="n9q5xc"
Current Decision:
<decision>

Target Decision:
<decision>

Transition Decision:
<decision>

Migration Requirement:
<requirement>

Completion Condition:
<condition>
```

Current architecture and target architecture may temporarily require different decisions.

---

# 35. Architecture Decision History

Maintain chronological history:

| Date     | ADR     | Event     | Status     | Reason     |
| -------- | ------- | --------- | ---------- | ---------- |
| `<date>` | `<ADR>` | `<event>` | `<status>` | `<reason>` |

Do not erase superseded decisions from history.

---

# 36. Review Prioritization

Prioritize ADR review according to:

```text id="m8x3vr"
Decision Consequence
        ×
Irreversibility
        ×
Uncertainty
        ×
Change Impact
```

High-consequence, difficult-to-reverse, uncertain decisions should receive greater review attention.

---

# 37. Decision Governance Summary

```text id="x5q9mk"
Total ADRs:
<count>

Active:
<count>

Pending:
<count>

Rejected:
<count>

Superseded:
<count>

Deprecated:
<count>

Revoked:
<count>

Open Conflicts:
<count>

Decision Debt:
<count>

Unvalidated Significant Decisions:
<count>

Overall Governance Health:
<HEALTHY | DEGRADED | BLOCKED>
```

Counts should be generated from actual project records rather than manually fabricated.

---

# 38. Architecture Decision Handoff

The register should expose the decisions relevant to subsequent phases.

```text id="q6m4vc"
Active Decisions:
<decisions>

Constraints Created:
<constraints>

Contracts Affected:
<contracts>

Specifications Affected:
<specifications>

Infrastructure Affected:
<infrastructure>

Verification Requirements:
<verification>

Open Decisions:
<decisions>
```

---

# 39. Specification Readiness

Before moving to Specifications / SDD:

```text id="v7x3mr"
Architecture Decisions:
<READY | PARTIAL | BLOCKED>

Active Baseline:
<READY | PARTIAL | BLOCKED>

Critical Conflicts:
<YES | NO>

Decision Debt:
<LOW | MEDIUM | HIGH | CRITICAL>

Required Decisions Still Open:
<YES | NO>

Specification Readiness:
<READY | READY_WITH_RISKS | INCOMPLETE | BLOCKED>
```

Not every architecture decision must be complete before specification begins.

The relevant question is whether unresolved decisions affect the specification scope being defined.

---

# 40. Review Checklist

### Register Integrity

* [ ] Every ADR has a unique identifier.
* [ ] Every ADR has a status.
* [ ] Every accepted decision has appropriate authority.
* [ ] Supersession relationships are explicit.
* [ ] Rejected decisions remain traceable.
* [ ] Deprecated decisions remain historical.
* [ ] Revoked decisions remain traceable.

### Governance

* [ ] Significant decisions have meaningful rationale.
* [ ] Strategic decisions have appropriate review.
* [ ] Difficult-to-reverse decisions have stronger evidence.
* [ ] Decision conflicts are visible.
* [ ] Decision debt is tracked.
* [ ] Implicit decisions are identified.

### Architecture

* [ ] Active decisions form a coherent baseline.
* [ ] No known active ADR conflicts remain unresolved.
* [ ] Affected architecture elements are traceable.
* [ ] Contract impacts are traceable.
* [ ] Data and security impacts are traceable.

### Evolution

* [ ] Superseded decisions identify replacements.
* [ ] Migration implications are recorded.
* [ ] Current and target baselines are distinguishable.
* [ ] Revalidation triggers exist for important decisions.

### Verification

* [ ] Significant decisions have validation strategies.
* [ ] Decision drift can be detected.
* [ ] Implementation alignment can be assessed.

---

# 41. Agent Instructions

When maintaining the Architecture Decision Register:

1. Treat individual ADRs as authoritative decision records.
2. Keep the register synchronized with ADR status.
3. Never invent ADRs.
4. Never invent decision status.
5. Never mark a recommendation as accepted.
6. Never remove historical decisions merely because they are no longer active.
7. Detect supersession explicitly.
8. Detect conflicts between active decisions.
9. Detect missing decisions where implementation contains consequential implicit choices.
10. Detect stale decisions when assumptions or context change.
11. Track decision debt.
12. Track decision drift.
13. Maintain traceability to architecture, contracts, specifications, implementation, and verification.
14. Distinguish current, transition, and target decisions.
15. Escalate unauthorized or unclear decision authority.
16. Revalidate significant decisions when their assumptions materially change.
17. Do not create ADRs for trivial implementation details merely to increase documentation.
18. Do not treat the register as a substitute for ADR reasoning.
19. Do not silently modify ADR history.
20. Preserve rejected and superseded alternatives.
21. Identify decisions that block subsequent lifecycle phases.
22. Keep the active architecture baseline explicit.
23. Use evidence rather than inference when assessing decision state.
24. When conflicts arise, identify them rather than silently choosing one.
25. Ensure the register supports the transition into Specifications / SDD.

---

# 42. Anti-Patterns

## ADR Inventory Theater

Maintaining a large ADR list without meaningful governance.

## Status Without Authority

Changing an ADR to `ACCEPTED` without appropriate authorization.

## Historical Erasure

Deleting superseded or rejected decisions.

## Silent Supersession

Changing architecture while leaving the previous ADR apparently active.

## Decision Explosion

Creating an ADR for every small technical implementation choice.

## Decision Vacuum

Allowing important architectural choices to exist only in code or configuration.

## Register as Source of Truth for Reasoning

Copying enough ADR content into the register that the two records can diverge.

## False Consistency

Marking decisions consistent without actually evaluating their relationships.

## Decision Counting

Using the number of ADRs as a measure of architectural maturity.

## Stale Baseline

Treating old active ADRs as valid without checking their assumptions.

## Untracked Exceptions

Allowing implementation exceptions without recording their architectural impact.

## Decision Debt Blindness

Assuming documented decisions mean there are no implicit or missing decisions.

## Technology-Centric Governance

Organizing decisions only by technology rather than architectural concern.

## Retrospective Fiction

Creating ADRs after implementation and presenting them as original decisions without identifying their retrospective nature.

---

# 43. Safe Progression Question

Before moving from Architecture Decisions toward Specifications:

> **Is there a coherent and authoritative architecture decision baseline, are consequential choices explicit and appropriately governed, are conflicts and decision debt visible, are superseded decisions traceable, and are the remaining open decisions either non-blocking or explicitly managed for the scope being specified?**

If **yes**, proceed to Specifications / SDD.

If **no**, continue Architecture Decision analysis or return to the lifecycle phase responsible for the unresolved uncertainty.

---

# 44. Final Principle

> **The Architecture Decision Register makes the architecture's decision history and current decision baseline visible, governable, and evolvable.**

A healthy decision register allows an agent or engineer to distinguish:

```text
What is decided
What is proposed
What is pending
What is rejected
What is active
What was superseded
What became obsolete
What conflicts
What drifted
What remains unknown
What still requires a decision
```

The register therefore acts as the bridge between **architectural reasoning** and **architectural continuity**.

It prevents architecture from becoming dependent on undocumented conversations, forgotten assumptions, or implementation choices that silently acquire authority over time.
