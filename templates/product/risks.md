# Risks

## 1. Document Metadata

| Field             | Description                                                                                                 |
| ----------------- | ----------------------------------------------------------------------------------------------------------- |
| Document ID       | Unique identifier for the risk artifact                                                                     |
| Version           | Current document version                                                                                    |
| Status            | `DRAFT`, `UNDER_REVIEW`, `ACCEPTED`, `SUPERSEDED`                                                           |
| Created           | Creation date                                                                                               |
| Updated           | Last update date                                                                                            |
| Scope             | Product, capability, release, increment, or change scope                                                    |
| Owner             | Responsible role or person                                                                                  |
| Reviewers         | Relevant reviewers or decision authorities                                                                  |
| Related Artifacts | Outcomes, requirements, assumptions, unknowns, dependencies, constraints, decisions, architecture artifacts |
| Lifecycle Phase | Product Discovery |
---

# 2. Purpose

This document identifies, evaluates, manages, and tracks uncertainties that could negatively affect product outcomes, domain behavior, architecture, contracts, security, delivery, operations, or system evolution.

The purpose is to make consequential uncertainty visible early enough to support informed decisions and appropriate mitigation.

The risk model should answer:

> What could go wrong, why could it happen, what would be the consequence, how uncertain is it, and what should be done about it?

---

# 3. Core Principle

A risk represents a potential adverse event, condition, or consequence that may affect the system or project.

A risk is not the same as:

* an unknown;
* an assumption;
* a dependency;
* a constraint;
* a requirement;
* a decision;
* an issue;
* a defect.

These concepts may be related, but they must remain distinguishable.

For example:

```text id="8w3m1f"
Unknown:
We do not know whether the external provider supports capability X.

Risk:
If capability X is not supported, the planned integration may become infeasible.
```

The unknown describes missing knowledge.

The risk describes the potential consequence.

---

# 4. Risk Model

The conceptual risk model is:

```text id="c7v5pk"
Cause / Condition
        ↓
Potential Event
        ↓
Potential Consequence
        ↓
Risk Exposure
        ↓
Response
        ↓
Residual Risk
```

Example:

```text id="0h2s8q"
External dependency is unstable
        ↓
Integration becomes unavailable
        ↓
Critical product operation is interrupted
        ↓
High operational risk
        ↓
Mitigation / fallback / monitoring
        ↓
Residual risk remains
```

The agent should avoid recording vague statements such as:

> "Integration is risky."

The risk should identify the condition and consequence.

---

# 5. Risk Statement

A useful risk statement follows:

> **Because [cause or condition], [potential event] may occur, resulting in [consequence].**

Example:

```text id="q8f4nk"
Because the external provider has an undocumented rate limit,
the integration may reject requests during peak usage,
resulting in degraded availability for a critical product capability.
```

The exact structure may vary, but the relationship between cause, event, and consequence should remain clear.

---

# 6. Risk Categories

Recommended categories:

| Category         | Description                                                                        |
| ---------------- | ---------------------------------------------------------------------------------- |
| `PRODUCT`        | Risk to product objectives, value, or user outcomes                                |
| `DOMAIN`         | Risk to business rules, domain correctness, or domain boundaries                   |
| `REQUIREMENT`    | Risk caused by ambiguity, incompleteness, or incorrect requirements                |
| `SCOPE`          | Risk related to scope definition or scope change                                   |
| `DELIVERY`       | Risk to planning, sequencing, or delivery                                          |
| `TECHNICAL`      | Risk related to technical feasibility or system behavior                           |
| `ARCHITECTURE`   | Risk related to architectural structure or decisions                               |
| `CONTRACT`       | Risk involving APIs, events, data, or external agreements                          |
| `DATA`           | Risk involving correctness, ownership, availability, privacy, or migration         |
| `SECURITY`       | Risk involving confidentiality, integrity, authentication, authorization, or trust |
| `PRIVACY`        | Risk involving personal or sensitive information                                   |
| `INTEGRATION`    | Risk involving external or internal integrations                                   |
| `OPERATIONAL`    | Risk involving deployment, monitoring, support, or runtime operation               |
| `INFRASTRUCTURE` | Risk involving environments, infrastructure, or platform capabilities              |
| `DEPENDENCY`     | Risk arising from a significant dependency                                         |
| `MIGRATION`      | Risk associated with system transition                                             |
| `COMPLIANCE`     | Risk involving regulatory or contractual obligations                               |
| `ORGANIZATIONAL` | Risk involving ownership, responsibilities, coordination, or approvals             |
| `COST`           | Risk involving financial or resource constraints                                   |
| `VENDOR`         | Risk involving external providers or third parties                                 |
| `REPUTATIONAL`   | Risk to trust, reputation, or stakeholder confidence                               |

Multiple categories may apply.

---

# 7. Risk vs Unknown

An unknown is missing knowledge.

A risk is a potential adverse consequence.

Example:

```text id="p6k2mx"
Unknown:
How many requests can the external service process?

Risk:
If the service cannot sustain expected demand, critical operations may become unavailable.
```

An unknown may produce a risk.

Resolving the unknown may reduce or eliminate the risk, but this is not guaranteed.

The agent must not convert every unknown into a risk automatically.

---

# 8. Risk vs Assumption

An assumption is something temporarily accepted as true for analysis or planning.

A risk concerns what could go wrong.

Example:

```text id="m3q8az"
Assumption:
The external provider will remain available during the migration.

Risk:
If the provider becomes unavailable during migration, data synchronization may fail.
```

Assumptions should be linked to risks when invalidation would create material consequences.

---

# 9. Risk vs Dependency

A dependency describes reliance.

A risk describes potential adverse consequence.

Example:

```text id="r7n2vc"
Dependency:
The product depends on an external identity provider.

Risk:
If the identity provider becomes unavailable, users may be unable to authenticate.
```

A dependency may create one or more risks.

The dependency itself is not automatically a risk.

---

# 10. Risk vs Constraint

A constraint limits the available solution space.

A risk describes something that may cause harm or failure.

Example:

```text id="a4j6mz"
Constraint:
The system must operate within an existing platform environment.

Risk:
The existing platform may not support the required workload.
```

The constraint may be the source of the risk, but the concepts remain distinct.

---

# 11. Risk vs Decision

A decision selects an option.

A risk describes a potential consequence associated with an option or situation.

Example:

```text id="v9x5dc"
Decision:
Use an external identity provider.

Risk:
Provider availability becomes a dependency for authentication.
```

Risks should inform decisions.

Decisions should not be hidden inside risk statements.

---

# 12. Risk vs Issue

A risk is potential.

An issue is already occurring.

```text id="g2m8xf"
Risk:
The external service may become unavailable.

Issue:
The external service is currently unavailable.
```

When a risk materializes, it should be reclassified or linked to an active issue according to project governance.

The original risk should remain historically traceable.

---

# 13. Risk vs Defect

A defect is an observed deviation from expected behavior.

A risk may exist before any defect occurs.

Example:

```text id="q3w8pk"
Risk:
The synchronization mechanism may lose updates under concurrent modification.

Defect:
Concurrent modification caused an update to be lost during verification.
```

Once evidence confirms an actual defect, the agent must not continue describing the confirmed behavior solely as a hypothetical risk.

---

# 14. Risk Status

Recommended states:

```text id="z6p4bn"
IDENTIFIED
ANALYZING
ACCEPTED
MITIGATING
MONITORING
MATERIALIZED
RESOLVED
RETIRED
SUPERSEDED
REJECTED
```

Meaning:

* `IDENTIFIED` — risk has been recognized.
* `ANALYZING` — consequence, likelihood, or exposure is being evaluated.
* `ACCEPTED` — risk is known and explicitly accepted without immediate mitigation.
* `MITIGATING` — response actions are in progress.
* `MONITORING` — risk remains but is actively monitored.
* `MATERIALIZED` — the potential event has occurred.
* `RESOLVED` — risk is no longer materially applicable.
* `RETIRED` — risk is no longer relevant due to scope or context change.
* `SUPERSEDED` — replaced by a more accurate risk representation.
* `REJECTED` — insufficient evidence or incorrect risk classification.

---

# 15. Risk Lifecycle

The typical lifecycle is:

```text id="n7q2xb"
IDENTIFIED
    ↓
ANALYZING
    ↓
ACCEPTED / MITIGATING
    ↓
MONITORING
    ↓
RESOLVED / MATERIALIZED / RETIRED
```

Risk analysis may return to an earlier state when new evidence changes the assessment.

---

# 16. Risk Record

Each significant risk should contain:

| Field           | Description                                           |
| --------------- | ----------------------------------------------------- |
| ID              | Unique identifier                                     |
| Title           | Concise risk name                                     |
| Category        | Risk classification                                   |
| Statement       | Structured risk description                           |
| Cause           | Source or condition                                   |
| Potential Event | What may happen                                       |
| Consequence     | Potential impact                                      |
| Scope           | Affected scope                                        |
| Probability     | Estimated likelihood when evidence permits            |
| Impact          | Consequence severity                                  |
| Exposure        | Combined risk consideration                           |
| Priority        | Relative attention required                           |
| Confidence      | Confidence in assessment                              |
| Status          | Lifecycle status                                      |
| Trigger         | Evidence or condition indicating increased likelihood |
| Owner           | Responsible party                                     |
| Response        | Planned response                                      |
| Mitigation      | Risk-reduction actions                                |
| Contingency     | Response if risk materializes                         |
| Residual Risk   | Remaining risk after response                         |
| Dependencies    | Related dependencies                                  |
| Unknowns        | Related unknowns                                      |
| Assumptions     | Related assumptions                                   |
| Decisions       | Related decisions                                     |
| Evidence        | Supporting evidence                                   |
| Traceability    | Related artifacts                                     |
| Review Date     | Next review point                                     |

---

# 17. Probability

Probability may be recorded qualitatively:

```text id="3x8f1q"
LOW
MEDIUM
HIGH
UNKNOWN
```

Quantitative probabilities should only be used when supported by credible evidence.

The agent must not invent percentages such as:

> "There is a 73% chance of failure."

unless the project has an evidence-based method supporting that value.

---

# 18. Impact

Recommended impact levels:

```text id="7m2v5c"
LOW
MEDIUM
HIGH
CRITICAL
```

Impact should consider consequences across relevant dimensions:

* user outcomes;
* business operations;
* domain correctness;
* security;
* privacy;
* data;
* availability;
* reliability;
* contracts;
* compliance;
* cost;
* reputation;
* delivery;
* architecture;
* migration.

A risk may have different impacts across dimensions.

---

# 19. Exposure

Risk exposure represents the overall significance of the risk based on available evidence.

Conceptually:

```text id="a6q9pz"
Exposure
≈
Probability × Impact
```

This is a conceptual model.

The agent must not imply mathematical precision when probability and impact are qualitative.

Where quantitative scoring is not justified, use qualitative exposure:

```text id="d8k1ms"
LOW
MEDIUM
HIGH
CRITICAL
```

---

# 20. Risk Priority

Risk priority describes how urgently or strongly the project should address the risk relative to other risks.

It may consider:

* exposure;
* urgency;
* blocking effect;
* reversibility;
* mitigation window;
* dependency;
* decision consequence;
* criticality of affected outcomes.

Risk priority must remain separate from impact.

Example:

```text id="m5r8xc"
Impact: CRITICAL
Priority: MEDIUM
```

may be valid when probability is currently very low and mitigation is already effective.

---

# 21. Confidence

Risk assessments should include confidence when evidence is incomplete.

Recommended values:

```text id="y4p7vn"
HIGH
MEDIUM
LOW
```

Example:

```text id="0c8m2d"
Risk:
HIGH

Confidence:
LOW
```

This means the risk appears significant, but the assessment is based on limited evidence.

The agent should make this uncertainty visible.

---

# 22. Risk Triggers

A trigger is an observable condition suggesting that a risk is becoming more likely or is beginning to materialize.

Examples:

* increasing error rate;
* provider degradation;
* missed migration milestone;
* contract change;
* unexpected data discrepancy;
* failed security validation;
* requirement conflict;
* increased operational load.

Triggers should be evidence-based.

The agent must not invent monitoring signals without sufficient context.

---

# 23. Risk Response Strategies

Common response strategies include:

### Avoid

Change the approach so the risk no longer applies.

### Reduce

Decrease probability or impact.

### Transfer

Move responsibility or exposure to another party through an explicit arrangement.

### Accept

Explicitly acknowledge the risk without immediate mitigation.

### Monitor

Keep the risk active while observing evidence.

### Defer

Postpone action when the timing is not currently justified.

The selected strategy must be explicit.

---

# 24. Mitigation

Mitigation reduces probability or impact before the risk materializes.

Examples:

* additional validation;
* architectural isolation;
* contract stabilization;
* redundancy;
* earlier verification;
* migration rehearsal;
* security controls;
* operational monitoring;
* dependency reduction.

Mitigation should be proportional to risk exposure.

The agent must not recommend elaborate mitigation for low-consequence risks without justification.

---

# 25. Contingency

A contingency defines what should happen if the risk materializes.

Examples:

```text id="h6s9qx"
Risk:
External provider becomes unavailable.

Contingency:
Use an established fallback path.
```

The agent must not assume that a fallback exists.

If no contingency is known:

```text id="2v7nma"
Contingency: UNKNOWN
```

The unknown may become a decision-relevant item.

---

# 26. Residual Risk

Mitigation rarely eliminates all risk.

After mitigation, record the remaining exposure when material:

```text id="f3q8wp"
Initial Risk:
HIGH

Mitigation:
Provider isolation + monitoring

Residual Risk:
MEDIUM
```

Residual risk should not be described as zero unless the project has sufficient evidence that the risk has genuinely been eliminated.

---

# 27. Risk Acceptance

Risk acceptance is an explicit decision to proceed while acknowledging the remaining risk.

Acceptance should identify:

* risk;
* rationale;
* remaining exposure;
* affected scope;
* consequences;
* mitigation already applied;
* responsible authority;
* acceptance date;
* review point when applicable.

The agent must not silently treat unresolved risk as accepted.

---

# 28. Risk Escalation

Risks should be escalated when they:

* threaten critical outcomes;
* affect security or privacy;
* affect external contracts;
* affect regulatory obligations;
* cross organizational boundaries;
* block lifecycle progression;
* require significant architectural change;
* exceed the authority of the current decision maker;
* become materially worse;
* conflict with accepted decisions.

Escalation should preserve traceability.

---

# 29. Risk Dependencies

Risks may depend on:

* unknowns;
* assumptions;
* external systems;
* decisions;
* requirements;
* constraints;
* other risks.

Example:

```text id="p8c2mv"
Unknown:
Provider throughput is unknown.

Risk:
Provider may not support expected demand.

Decision:
Load validation is required before final integration commitment.
```

The relationship should remain explicit.

---

# 30. Risk Chains

Risks may form causal chains:

```text id="r1f7kx"
Unknown data ownership
        ↓
Incorrect data model
        ↓
Contract instability
        ↓
Integration rework
        ↓
Release delay
```

The agent should identify upstream causes and downstream consequences when this materially improves decision quality.

Avoid creating excessively detailed risk chains without decision value.

---

# 31. Risk Aggregation

Several risks may originate from a common cause.

Example:

```text id="v8m2qd"
External provider instability
       ├── Authentication risk
       ├── Availability risk
       ├── Data synchronization risk
       └── Operational risk
```

The agent should identify shared causes where doing so helps prioritize mitigation.

Risk aggregation must not hide distinct consequences.

---

# 32. Product Risks

Product risks may affect:

* intended user outcomes;
* product value;
* adoption;
* scope;
* business viability;
* stakeholder expectations.

The agent should connect product risks to the affected outcomes and requirements.

---

# 33. Domain Risks

Domain risks may involve:

* incorrect business rules;
* ambiguous concepts;
* conflicting policies;
* incorrect state transitions;
* unclear ownership;
* incorrect domain boundaries.

These risks are especially important because incorrect domain understanding can propagate into architecture and contracts.

---

# 34. Architecture Risks

Architecture risks may involve:

* incorrect boundaries;
* inappropriate coupling;
* unavailable capabilities;
* scalability assumptions;
* resilience assumptions;
* difficult migration;
* irreversible decisions;
* architectural complexity;
* unsupported quality attributes.

Architecture risks should be evaluated before implementation when possible.

---

# 35. Contract Risks

Contract risks may involve:

* unstable APIs;
* unclear event semantics;
* incompatible changes;
* missing error behavior;
* undefined versioning;
* inconsistent ownership;
* ambiguous data semantics.

Contract risks should be linked to the relevant contract artifacts once available.

---

# 36. Data Risks

Data risks may involve:

* unclear ownership;
* incorrect semantics;
* loss;
* corruption;
* inconsistency;
* migration failure;
* privacy exposure;
* retention requirements;
* unavailable historical data.

The agent should distinguish data correctness from data availability and data ownership.

---

# 37. Security and Privacy Risks

Security and privacy risks should be treated with appropriate seriousness.

Potential areas include:

* authentication;
* authorization;
* trust boundaries;
* sensitive data;
* secrets;
* identity;
* data exposure;
* auditability;
* external integrations;
* insecure defaults.

The agent must not invent threats that lack contextual relevance.

However, missing security information may itself become an important unknown or risk when the system handles sensitive or critical behavior.

---

# 38. Operational Risks

Operational risks may involve:

* deployment;
* monitoring;
* alerting;
* backup;
* recovery;
* support;
* observability;
* incident response;
* capacity;
* dependency availability.

Operational risk should be considered before release rather than only after implementation.

---

# 39. Existing Systems

For existing systems, risk analysis must distinguish:

```text id="x4n8qp"
Documented Risk
Actual Risk
Target-State Risk
```

Historical documents may contain risks that are no longer applicable.

Conversely, runtime investigation may reveal risks not represented in existing documentation.

The agent should validate important risks against current evidence.

---

# 40. System Evolution

For system evolution, focus risk analysis on the change delta:

* what changes;
* what becomes newly exposed;
* what existing behavior may regress;
* what dependencies change;
* what migration is required;
* what compatibility risks arise;
* what rollback limitations exist.

The objective is not to recreate the entire risk register unless the change warrants it.

---

# 41. Risk Register

A compact risk register may use:

| ID      | Category    | Risk | Probability | Impact   | Exposure | Priority | Status     | Owner |
| ------- | ----------- | ---- | ----------- | -------- | -------- | -------- | ---------- | ----- |
| RSK-001 | INTEGRATION | —    | HIGH        | HIGH     | HIGH     | HIGH     | MITIGATING | —     |
| RSK-002 | DOMAIN      | —    | MEDIUM      | CRITICAL | HIGH     | CRITICAL | ANALYZING  | —     |
| RSK-003 | DATA        | —    | UNKNOWN     | HIGH     | UNKNOWN  | HIGH     | IDENTIFIED | —     |

The register is a summary.

Important risks should retain full rationale, evidence, response, and traceability.

---

# 42. Risk Review Procedure

During risk review, the agent should:

1. Review existing risks.
2. Identify new risks.
3. Reassess changed risks.
4. Verify supporting evidence.
5. Review triggers.
6. Review mitigation effectiveness.
7. Review residual exposure.
8. Identify materialized risks.
9. Retire invalid risks.
10. Identify newly affected artifacts.
11. Update traceability.
12. Escalate risks requiring decisions.

Risk review should be continuous when project context changes.

---

# 43. Risk Change Impact

A risk change may affect:

* requirements;
* scope;
* priorities;
* domain boundaries;
* architecture;
* contracts;
* infrastructure;
* security;
* migration;
* verification;
* release readiness.

The agent should follow traceability relationships to determine downstream impact.

---

# 44. Review Checklist

Before accepting the risk artifact, verify:

### Identification

* [ ] Significant risks are identified.
* [ ] Risk statements describe potential consequences.
* [ ] Categories are appropriate.
* [ ] Status is explicit.

### Assessment

* [ ] Probability is evidence-based or explicitly unknown.
* [ ] Impact is justified.
* [ ] Exposure is appropriately represented.
* [ ] Priority is distinguished from impact.
* [ ] Confidence is explicit when necessary.

### Response

* [ ] Response strategy is explicit.
* [ ] Mitigation is identified where necessary.
* [ ] Contingency is identified where relevant.
* [ ] Residual risk is considered.
* [ ] Risk acceptance is explicit when applicable.

### Dependencies

* [ ] Related unknowns are identified.
* [ ] Related assumptions are identified.
* [ ] Related dependencies are identified.
* [ ] Related decisions are identified.

### Governance

* [ ] Critical risks are escalated appropriately.
* [ ] Material risk acceptance has authority.
* [ ] Risk changes are traceable.
* [ ] Materialized risks are no longer treated only as hypothetical.

### Existing Systems

* [ ] Actual behavior is considered where relevant.
* [ ] Historical risks are distinguished from current risks.
* [ ] Evolution risks focus on the change boundary.

---

# 45. Gate Contribution

Risk analysis contributes to lifecycle gates by demonstrating that:

* significant risks are visible;
* critical risks have appropriate responses;
* blocking risks are identified;
* security and privacy risks are considered where relevant;
* architecture and contract risks are understood before commitment;
* residual risk is explicit;
* risk acceptance is governed;
* important uncertainties are connected to risk analysis.

A risk register is not complete merely because risks have been listed.

The relevant question is:

> Has the project reduced or explicitly accepted the risk necessary to proceed safely?

---

# 46. Agent Instructions

When applying this artifact, the agent must:

1. Distinguish risk from unknown, assumption, dependency, constraint, issue, defect, and decision.
2. Identify cause, potential event, and consequence.
3. Gather evidence before assigning significant risk levels.
4. Avoid fabricated probabilities or numerical precision.
5. Identify affected outcomes and requirements.
6. Identify dependencies and assumptions.
7. Identify triggers where meaningful.
8. Evaluate mitigation and residual risk.
9. Make risk acceptance explicit.
10. Escalate consequential risks.
11. Update risks when evidence changes.
12. Reclassify materialized risks appropriately.
13. Validate important risks against actual behavior in existing systems.
14. Focus evolution analysis on the change boundary.
15. Avoid inventing threats or failure modes without contextual evidence.
16. Preserve traceability.
17. Scale risk analysis according to consequence and project complexity.
18. Ask targeted questions when missing information materially affects risk assessment.

The agent should prefer:

```text id="j4v9sx"
Evidence
   ↓
Potential Event
   ↓
Consequence
   ↓
Risk
   ↓
Response
   ↓
Residual Risk
```

over:

```text id="c8m2pq"
Assumption
   ↓
Risk Label
```

---

# 47. Anti-Patterns

## 47.1 Everything Is a Risk

Not every uncertainty or dependency is a risk.

---

## 47.2 Risk Without Consequence

> "The database is risky."

This does not explain what may happen.

---

## 47.3 Fabricated Probability

Assigning precise probabilities without evidence creates false confidence.

---

## 47.4 Risk as a Hidden Requirement

A risk statement must not silently become a requirement.

If a mitigation becomes mandatory behavior, the appropriate requirement or decision artifact should be updated.

---

## 47.5 Risk as a Hidden Decision

The agent must not hide a selected solution inside a mitigation statement.

---

## 47.6 Risk Acceptance by Silence

Unresolved risk is not automatically accepted.

---

## 47.7 Permanent Risk Labels

A risk should be reviewed as context changes.

---

## 47.8 Ignoring Residual Risk

Mitigation does not necessarily eliminate risk.

---

## 47.9 Treating Issues as Risks

Once an event has occurred, it should no longer be described solely as hypothetical.

---

## 47.10 Legacy Risk Assumption

Historical risk documentation must not automatically be treated as current truth.

---

## 47.11 Invented Threats

Security and operational risks should be grounded in system context rather than generic threat lists.

---

## 47.12 Risk Register Theater

A large risk register is not evidence of good risk management.

Only risks that improve decision quality should receive significant analysis.

---

# 48. Safe Progression Question

Before progressing beyond risk analysis, the agent should be able to answer:

> **Do I understand the risks that could materially affect the product, domain, architecture, contracts, security, data, operations, delivery, or evolution, including their causes, consequences, evidence, responses, and residual exposure?**

If the answer is no, the agent should identify the missing evidence or ask targeted questions rather than inventing risk assessments.

---

# 49. Final Principle

> **Risk management makes potential adverse consequences visible early enough to support informed decisions, proportional mitigation, explicit acceptance, and safe progression.**

A strong risk model does not attempt to eliminate uncertainty.

It makes uncertainty's potential consequences visible, actionable, traceable, and governable.

