# Unknowns

## 1. Document Metadata

* **Document Type:** Product Discovery — Unknowns
* **Lifecycle Phase:** Product Discovery
* **Status:** `DRAFT`
* **Version:** `1.0`
* **Owner:** `<owner>`
* **Created:** `<date>`
* **Updated:** `<date>`
* **Related Product Context:** `<document>`
* **Related Requirements:** `<references>`
* **Related Assumptions:** `<references>`
* **Related Constraints:** `<references>`
* **Related Decisions:** `<references>`
* **Related Architecture:** `<references>`

---

## 2. Purpose

This document identifies and manages information that is currently unknown, unresolved, ambiguous, unavailable, or insufficiently understood.

Unknowns are a normal part of discovery. The objective is not to eliminate all uncertainty before progress can occur, but to distinguish uncertainty that is harmless from uncertainty that could materially affect the product, domain, architecture, contracts, security, data, infrastructure, or implementation.

Unknowns provide explicit visibility into what the project does not yet know.

---

## 3. Core Principle

An unknown is information that the project currently does not know with sufficient confidence.

It is different from:

* a fact,
* an assumption,
* a requirement,
* a constraint,
* a decision,
* or a risk.

The distinction is:

```text id="9b8q6h"
FACT
Known and supported by evidence.

ASSUMPTION
Not fully known, but temporarily treated as plausible.

UNKNOWN
Not currently known or sufficiently understood.

REQUIREMENT
What the product needs to achieve.

CONSTRAINT
What limits the solution space.

DECISION
What option has explicitly been selected.

RISK
A possible future event or condition with consequences.
```

The agent MUST NOT hide unknown information by inventing an answer.

---

## 4. Unknown Model

An unknown should capture:

```text id="2l3d5s"
Unknown
├── Identity
├── Question
├── Category
├── Scope
├── Importance
├── Blocking Level
├── Current Knowledge
├── Evidence
├── Impact if Unresolved
├── Resolution Method
├── Owner
├── Target
├── Status
└── Traceability
```

A significant unknown should answer:

* What do we not know?
* Why does it matter?
* Which part of the system does it affect?
* Can we continue without knowing it?
* What decision depends on it?
* How can it be resolved?
* Who can resolve it?
* When must it be resolved?

---

## 5. Unknown Categories

Unknowns MAY belong to one or more categories.

### 5.1 Product Unknowns

Unknowns about:

* user needs,
* product scope,
* expected outcomes,
* adoption,
* workflows,
* priorities,
* success criteria.

Example:

```text id="r0o7l8"
Which user workflow should be prioritized for the first release?
```

---

### 5.2 User / Actor Unknowns

Unknowns concerning:

* actors,
* roles,
* responsibilities,
* permissions,
* behavioral patterns,
* interaction expectations.

Example:

```text id="g0s5p4"
Which actor is authorized to approve the operation?
```

---

### 5.3 Domain Unknowns

Unknowns concerning:

* business concepts,
* terminology,
* relationships,
* lifecycle,
* invariants,
* ownership,
* business rules.

Example:

```text id="x2a1z8"
Does the business consider these two concepts equivalent?
```

Domain unknowns may become blocking when they affect bounded contexts or core business rules.

---

### 5.4 Technical Unknowns

Unknowns concerning:

* technical capabilities,
* runtime behavior,
* dependencies,
* compatibility,
* performance,
* integration mechanisms.

Example:

```text id="f7p6q2"
Can the existing platform support the required operational behavior?
```

---

### 5.5 Data Unknowns

Unknowns concerning:

* data ownership,
* availability,
* quality,
* structure,
* volume,
* historical records,
* retention,
* consistency.

Example:

```text id="u5c8n1"
Is historical data complete enough to support migration?
```

---

### 5.6 Integration Unknowns

Unknowns concerning:

* external APIs,
* events,
* protocols,
* third-party behavior,
* availability,
* compatibility,
* integration ownership.

Example:

```text id="m3k4v9"
Does the external system support the required operation?
```

---

### 5.7 Security Unknowns

Unknowns concerning:

* identity,
* authorization,
* trust boundaries,
* threat conditions,
* security controls,
* sensitive data.

Example:

```text id="a8j2q5"
Which actors are permitted to access this information?
```

Security unknowns that could materially affect architecture should normally be resolved before the relevant architecture decision is finalized.

---

### 5.8 Operational Unknowns

Unknowns concerning:

* deployment,
* monitoring,
* support,
* ownership,
* incident response,
* maintenance,
* recovery.

Example:

```text id="k6d9w2"
Who is responsible for operating this capability after release?
```

---

### 5.9 Infrastructure Unknowns

Unknowns concerning:

* hosting,
* networking,
* storage,
* compute,
* environments,
* capacity,
* platform limitations.

Example:

```text id="v3p1c7"
What infrastructure capacity is currently available?
```

---

### 5.10 Compliance Unknowns

Unknowns concerning:

* applicable regulations,
* contractual obligations,
* retention requirements,
* auditability,
* jurisdiction,
* mandatory controls.

The agent MUST NOT infer legal or regulatory obligations without evidence.

---

## 6. Unknown Importance

Not every unknown deserves the same level of attention.

Recommended importance levels:

```text id="kq2m4v"
LOW
MEDIUM
HIGH
CRITICAL
```

### LOW

The unknown has limited effect on current work.

### MEDIUM

The unknown affects some decisions or artifacts but does not currently threaten progression.

### HIGH

The unknown could materially affect domain, architecture, contracts, data, security, or implementation.

### CRITICAL

The unknown may affect system viability, core product intent, major security boundaries, compliance, or difficult-to-reverse decisions.

---

## 7. Blocking Level

Importance and blocking status are different concepts.

An unknown may be highly important but not immediately blocking.

Recommended blocking classification:

```text id="6s1q3j"
NON_BLOCKING
DECISION_RELEVANT
GATE_BLOCKING
```

### `NON_BLOCKING`

The project can safely continue without resolving the unknown.

### `DECISION_RELEVANT`

The project can continue generally, but a specific decision should not be finalized without resolving or explicitly accepting the uncertainty.

### `GATE_BLOCKING`

The unknown prevents the project from safely passing the current lifecycle gate.

The agent should never classify an unknown as blocking merely because the information would be useful.

---

## 8. Unknown Status

Recommended lifecycle states:

```text id="r1m5z8"
OPEN
ANALYZING
VALIDATING
RESOLVED
ACCEPTED
DEFERRED
INVALIDATED
SUPERSEDED
```

### `OPEN`

The unknown has been identified.

### `ANALYZING`

The project is investigating possible answers.

### `VALIDATING`

A validation activity is in progress.

### `RESOLVED`

Sufficient evidence now exists to answer the original question.

### `ACCEPTED`

The uncertainty is explicitly accepted for the current scope.

This does not mean that the underlying information has become known.

### `DEFERRED`

Resolution is intentionally postponed.

### `INVALIDATED`

The original question or interpretation is no longer applicable.

### `SUPERSEDED`

The unknown has been replaced by a different question or context.

---

## 9. Unknown Record

Each significant unknown should contain:

```text id="8u4y3n"
Unknown ID:
Title:
Question:
Category:
Scope:
Importance:
Blocking Level:
Status:
Current Knowledge:
Evidence:
Why It Matters:
Resolution Method:
Resolution Owner:
Target Resolution:
Dependent Decisions:
Affected Requirements:
Affected Constraints:
Affected Assumptions:
Affected Architecture:
Affected Contracts:
Traceability:
Review Date:
```

Example:

```text id="f3x6a2"
Unknown ID: UNK-001

Title:
Historical Data Completeness

Question:
Is the existing historical dataset complete enough
to support the planned migration?

Category:
DATA

Scope:
Migration

Importance:
HIGH

Blocking Level:
DECISION_RELEVANT

Status:
OPEN

Current Knowledge:
Historical records are available, but completeness
has not been verified.

Why It Matters:
Migration strategy depends on the available dataset.

Resolution Method:
Data profiling and validation.

Dependent Decisions:
Migration strategy.

Target Resolution:
Before migration architecture is finalized.
```

---

## 10. Unknown Register

Projects should maintain a consolidated register.

| ID      | Question     | Category | Importance | Blocking          | Status    | Resolution |
| ------- | ------------ | -------- | ---------- | ----------------- | --------- | ---------- |
| UNK-001 | `<question>` | DATA     | HIGH       | DECISION_RELEVANT | OPEN      | `<method>` |
| UNK-002 | `<question>` | DOMAIN   | MEDIUM     | NON_BLOCKING      | ANALYZING | `<method>` |

The register provides visibility but does not replace detailed analysis for consequential unknowns.

---

## 11. Unknowns vs Assumptions

These concepts must remain distinct.

Example:

```text id="k9t2p7"
Unknown:
What percentage of users will use feature X?

Assumption:
Feature X will initially be used by a relatively small
portion of users.
```

The unknown identifies missing information.

The assumption represents a temporary interpretation of that information.

The agent MAY create an assumption to continue analysis, but must preserve the original unknown when the information remains unresolved.

---

## 12. Unknowns vs Risks

An unknown represents missing knowledge.

A risk represents a potential future condition with consequences.

Example:

```text id="3u6m1x"
Unknown:
Will the external provider support the required operation?

Risk:
The provider may not support the required operation,
forcing an alternative integration approach.
```

The unknown may be resolved through investigation.

The risk may remain even after the unknown is resolved.

---

## 13. Unknowns vs Questions

Not every question needs to become a tracked unknown.

A question should become a formal unknown when its answer may materially affect:

* product scope,
* domain understanding,
* architecture,
* contracts,
* security,
* data,
* infrastructure,
* major decisions,
* or lifecycle progression.

Simple clarification questions may be resolved directly without creating a persistent unknown artifact.

---

## 14. Resolution Methods

Unknowns may be resolved through:

* stakeholder clarification,
* domain expert consultation,
* documentation review,
* source-code inspection,
* runtime observation,
* data analysis,
* prototype,
* proof of concept,
* architecture experiment,
* contract inspection,
* integration test,
* security analysis,
* measurement,
* user research,
* operational evidence.

The agent should select the smallest reliable method that can resolve the relevant uncertainty.

---

## 15. Resolution Quality

An unknown is resolved when there is sufficient evidence for the decision or activity that depends on it.

Resolution does NOT require absolute certainty.

The required confidence should depend on:

* consequence,
* reversibility,
* scope,
* risk,
* affected contracts,
* affected users,
* security,
* regulatory impact.

Example:

A reversible internal implementation decision may tolerate moderate uncertainty.

A public contract or irreversible data migration should require substantially stronger evidence.

---

## 16. Decision-Relevant Unknowns

An unknown becomes decision-relevant when its answer could change the selected option.

Example:

```text id="4r8k2m"
Unknown:
Can the existing system support the required integration pattern?

Option A:
Reuse the existing integration capability.

Option B:
Introduce a new integration mechanism.

If the answer changes the preferred option,
the unknown is DECISION_RELEVANT.
```

Decision-relevant unknowns should normally be resolved before the corresponding decision becomes final.

---

## 17. Gate-Blocking Unknowns

An unknown is gate-blocking when progressing without resolution would create unacceptable uncertainty.

Typical examples:

* core domain concept remains undefined,
* ownership of critical data is unknown,
* security boundary is unknown,
* public contract semantics are unresolved,
* mandatory compliance obligations are unknown,
* a major architecture decision depends on an unresolved critical fact.

A gate-blocking unknown must be explicitly addressed before the gate can pass unless an authorized waiver exists.

---

## 18. Unknown Dependencies

Unknowns may depend on other unknowns.

Example:

```text id="9v5b1k"
UNK-001:
Who owns the data?

        ↓

UNK-002:
Which system is authoritative?

        ↓

UNK-003:
What migration strategy is viable?
```

Recommended relationships:

```text id="f6h2d4"
DEPENDS_ON
INFLUENCES
BLOCKS
REFINES
INVALIDATES
RESOLVES
```

Dependencies should be explicit when they affect sequencing.

---

## 19. Unknown Prioritization

Unknowns should be prioritized according to:

```text id="q5m9z2"
Impact × Decision Consequence × Irreversibility
```

This is a reasoning heuristic, not a mandatory numerical scoring system.

High-priority unknowns generally have:

* high consequence,
* high uncertainty,
* difficult-to-reverse decisions,
* broad system impact,
* external dependencies,
* security implications,
* or contractual implications.

The agent should resolve high-consequence unknowns before low-consequence details.

---

## 20. Unknowns and Progressive Elaboration

Not every unknown needs to be resolved immediately.

The lifecycle should progressively reduce uncertainty.

```text id="v8c3x1"
Early Discovery
    ↓
Identify important unknowns
    ↓
Resolve blocking uncertainty
    ↓
Architecture Discovery
    ↓
Resolve architecture-relevant unknowns
    ↓
Contract Discovery
    ↓
Resolve contract-relevant unknowns
    ↓
Specification
    ↓
Resolve implementation-relevant unknowns
```

This prevents both premature detail and uncontrolled ambiguity.

---

## 21. Existing Systems

For existing systems, unknowns should be separated from contradictions.

Example:

```text id="t4m8q6"
Documentation:
System supports operation X.

Observed behavior:
Operation X fails under condition Y.

Unknown:
Is condition Y an intended restriction,
a defect, or an undocumented behavior?
```

The agent should not resolve such conflicts through assumption.

The contradiction should remain visible until sufficient evidence exists.

---

## 22. System Evolution

For system evolution, unknowns should be evaluated relative to the change boundary.

The agent should ask:

* Does this unknown affect the proposed change?
* Does it affect an existing contract?
* Does it affect data migration?
* Does it affect backward compatibility?
* Does it affect security?
* Does it affect an existing architecture boundary?

Unrelated unknowns do not need to block a local change.

---

## 23. Unknown Resolution and Traceability

When an unknown is resolved, the resulting knowledge should be promoted to the appropriate artifact.

Possible outcomes:

```text id="c1f9q5"
Unknown
  ↓
Resolved as Fact
  ↓
Project Knowledge

Unknown
  ↓
Confirmed Product Intent
  ↓
Requirement

Unknown
  ↓
Confirmed Limitation
  ↓
Constraint

Unknown
  ↓
Selected Option
  ↓
Decision

Unknown
  ↓
Confirmed Domain Rule
  ↓
Domain Model / Business Rule
```

The original unknown should remain traceable when it materially influenced the resulting artifact.

---

## 24. Unknown Invalidation

Sometimes an unknown becomes irrelevant.

Example:

```text id="q7s2n4"
Unknown:
Will feature X require external integration?

Later:
Feature X is removed from product scope.
```

The unknown should be marked:

```text id="b5v8k1"
Status: INVALIDATED
Reason:
Feature removed from scope.
```

It should not simply be deleted.

---

## 25. Unknown Change Impact

When an unknown is resolved, evaluate dependent artifacts.

```text id="m2k7r5"
Resolved Unknown
       ↓
Assumptions
       ↓
Requirements
       ↓
Constraints
       ↓
Domain
       ↓
Architecture
       ↓
Contracts
       ↓
Decisions
       ↓
Specifications
```

Only affected relationships should be reevaluated.

The agent should avoid unnecessary project-wide rework.

---

## 26. Unknown Review Checklist

### Identification

* [ ] Important unknowns are explicitly recorded.
* [ ] Unknowns are distinguished from assumptions.
* [ ] Unknowns are distinguished from risks.
* [ ] Questions requiring persistent tracking are identified.

### Prioritization

* [ ] Importance is defined.
* [ ] Blocking level is defined.
* [ ] Decision-relevant unknowns are identified.
* [ ] High-consequence unknowns are prioritized.

### Resolution

* [ ] A resolution method exists where necessary.
* [ ] Resolution timing is appropriate.
* [ ] Ownership is clear.
* [ ] Evidence required for resolution is understood.

### Governance

* [ ] Blocking unknowns are visible.
* [ ] Deferred unknowns have a reason.
* [ ] Invalidated unknowns preserve history.
* [ ] Unknown conflicts are explicit.

### Traceability

* [ ] Dependent decisions are identified.
* [ ] Affected requirements are identified.
* [ ] Affected constraints are identified.
* [ ] Resolved knowledge is promoted to the correct artifact.

---

## 27. Gate Contribution

Unknowns contribute primarily to the **Product Discovery Gate**, but they may block any subsequent lifecycle gate.

The gate should verify that:

1. Significant unknowns are identified.
2. Blocking and non-blocking uncertainty are distinguished.
3. Decision-relevant unknowns are visible.
4. Critical unknowns have resolution strategies.
5. Unknowns are not hidden through unsupported assumptions.
6. Deferred unknowns have explicit justification.
7. The remaining uncertainty is acceptable for the next lifecycle phase.

The gate does not require all unknowns to be resolved.

It requires enough uncertainty reduction to proceed safely.

---

## 28. Compact Unknown Register

For lightweight projects:

| ID      | Question     | Importance | Blocking          | Status   | Resolution |
| ------- | ------------ | ---------- | ----------------- | -------- | ---------- |
| UNK-001 | `<question>` | HIGH       | DECISION_RELEVANT | OPEN     | `<method>` |
| UNK-002 | `<question>` | LOW        | NON_BLOCKING      | DEFERRED | `<reason>` |

The level of detail should scale with consequence.

---

## 29. Agent Instructions

When handling unknowns, the agent MUST:

1. Explicitly identify information that is not known.
2. Never invent missing information.
3. Distinguish unknowns from assumptions.
4. Distinguish unknowns from risks.
5. Classify importance and blocking level.
6. Identify unknowns that affect consequential decisions.
7. Prioritize uncertainty according to consequence and reversibility.
8. Resolve blocking uncertainty before progression when required.
9. Use the smallest reliable validation method.
10. Preserve deferred uncertainty.
11. Preserve invalidated and superseded unknowns for traceability.
12. Propagate resolved information through actual dependencies.
13. Avoid resolving unknowns through unsupported inference.
14. Avoid blocking progress over irrelevant uncertainty.
15. Escalate unknowns that require human or domain authority.
16. Record contradictions rather than silently selecting an interpretation.
17. Promote resolved knowledge into the appropriate project artifact.
18. Reevaluate dependent decisions when important unknowns are resolved.
19. Prefer explicit uncertainty over fabricated completeness.
20. Ask focused questions when an unknown materially affects the next decision.

---

## 30. Anti-Patterns

### 30.1 Fabricated Certainty

Inventing answers to eliminate visible uncertainty.

### 30.2 Hidden Unknowns

Proceeding while important information remains unresolved but undocumented.

### 30.3 Everything Is Blocking

Treating every unknown as a reason to stop the lifecycle.

### 30.4 Nothing Is Blocking

Ignoring uncertainty that could invalidate consequential decisions.

### 30.5 Assumption Substitution

Replacing an unknown with an undocumented assumption and treating the assumption as fact.

### 30.6 Premature Resolution

Selecting an answer before sufficient evidence exists.

### 30.7 Documentation Theater

Creating large unknown registers for trivial questions that have no meaningful impact.

### 30.8 Permanent Deferral

Repeatedly postponing high-impact unknowns without justification.

### 30.9 Ignoring Contradictions

Treating conflicting evidence as resolved without investigation.

### 30.10 Uncontrolled Propagation

Assuming that every resolved unknown requires changes throughout the entire system.

---

## 31. Final Principle

Unknowns make uncertainty visible.

A mature lifecycle does not pretend to know everything before proceeding. Instead, it determines which uncertainty matters, resolves what must be known, explicitly accepts what can remain uncertain, and prevents unsupported assumptions from becoming architecture.

The agent should continuously ask:

> **What do we not know, why does it matter, and do we need to know it before taking the next consequential step?**

The objective is not zero uncertainty.

The objective is **sufficiently reduced uncertainty for safe progression**.

