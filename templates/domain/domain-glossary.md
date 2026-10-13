# Domain Glossary

## 1. Document Metadata

| Field                     | Description                                         |
| ---------------| Lifecycle Phase | Domain Discovery |
---------- | --------------------------------------------------- |
| Document ID               | Unique identifier for the glossary                  |
| Version                   | Current document version                            |
| Status                    | `DRAFT`, `UNDER_REVIEW`, `ACCEPTED`, `SUPERSEDED`   |
| Created                   | Creation date                                       |
| Updated                   | Last update date                                    |
| Project                   | Project or system name                              |
| Domain Scope              | Domain or discovery boundary covered                |
| Discovery Mode            | `GREENFIELD`, `EXISTING_SYSTEM`, `SYSTEM_EVOLUTION` |
| Owner                     | Responsible role or person                          |
| Reviewers                 | Relevant domain reviewers                           |
| Related Domain Context    | Related Domain Context artifact                     |
| Related Product Artifacts | Relevant Product Discovery artifacts                |

---

# 2. Purpose

This document establishes and maintains the language used to describe the business domain.

Its purpose is to create a shared and explicit vocabulary that can be used consistently across:

* domain discovery;
* business discussions;
* requirements;
* business rules;
* domain models;
* architecture decisions;
* contracts;
* specifications;
* implementation;
* verification.

The glossary is not merely a dictionary.

It is a domain reasoning artifact.

---

# 3. Core Principle

> **If the same term can mean different things, or different terms can mean the same thing, the domain model may be ambiguous.**

The glossary therefore makes semantic differences explicit.

The objective is not to eliminate every variation in language.

The objective is to identify the terms whose meaning materially affects:

* business behavior;
* responsibilities;
* rules;
* boundaries;
* decisions;
* contracts;
* domain models.

---

# 4. Ubiquitous Language

Ubiquitous Language is the shared vocabulary used by relevant domain participants and reflected consistently in domain analysis and implementation where appropriate.

The language should emerge from:

* domain experts;
* business documentation;
* existing behavior;
* requirements;
* business rules;
* product terminology;
* operational terminology;
* observed workflows;
* validated domain discussions.

The agent must not manufacture terminology merely to make the model appear complete.

---

# 5. Glossary Scope

Define the scope covered by this glossary.

```text id="b2o1d4"
Domain:
...

Subdomain:
...

Capabilities:
...

Actors:
...

Processes:
...

Contexts:
...
```

If multiple bounded contexts eventually use different meanings for the same term, those meanings must be represented separately rather than forced into one global definition.

---

# 6. Term Record

Each significant term should have a structured record.

```text id="0b2eb2"
### TERM-001 — <Term>

**Canonical Term:**  
...

**Definition:**  
...

**Business Meaning:**  
...

**Scope:**  
...

**Category:**  
...

**Status:**  
...

**Confidence:**  
...

**Source:**  
...

**Used By:**  
...

**Related Concepts:**  
...

**Business Rules:**  
...

**Examples:**  
...

**Non-Examples:**  
...

**Synonyms:**  
...

**Homonyms:**  
...

**Conflicts:**  
...

**Contextual Meaning:**  
...

**Traceability:**  
...
```

---

# 7. Term Categories

Terms may be categorized as:

```text id="x6v0sq"
CONCEPT
ACTOR
ROLE
CAPABILITY
PROCESS
POLICY
RULE
STATE
EVENT
RESOURCE
TRANSACTION
OUTCOME
RELATIONSHIP
DOMAIN_AREA
OTHER
UNKNOWN
```

Classification is contextual.

A term should not be classified merely because it resembles a familiar DDD pattern.

---

# 8. Term Status

Possible statuses:

```text id="bkj4go"
PROPOSED
UNDER_REVIEW
ACCEPTED
CONFLICTING
DEPRECATED
SUPERSEDED
UNKNOWN
```

### PROPOSED

The term has been identified but not sufficiently validated.

### UNDER_REVIEW

The term is actively being evaluated.

### ACCEPTED

Relevant domain participants or authorized project decisions accept the meaning.

### CONFLICTING

Different valid interpretations exist.

### DEPRECATED

The term should no longer be introduced for new domain usage.

### SUPERSEDED

Another term or definition replaced it.

### UNKNOWN

Insufficient evidence exists to establish its meaning.

---

# 9. Canonical Term

For each concept, identify the preferred term when evidence supports one.

```text id="75u3z4"
Canonical Term:
...

Reason:
...

Evidence:
...
```

Canonical terminology should not be selected merely because it sounds technically cleaner.

The preferred term should reflect validated domain language.

---

# 10. Definition

Definitions should describe business meaning.

A good definition should answer:

> What does this term mean in this domain?

Avoid definitions such as:

```text id="0z9a2a"
"An Order is an Order entity stored in the order table."
```

Prefer:

```text id="4xw7qk"
"An Order represents a confirmed request by a customer to obtain a defined set of goods or services under the applicable commercial conditions."
```

The exact wording must come from the project's actual domain.

---

# 11. Business Meaning

Record why the term matters.

```text id="c0d8cb"
Business Meaning:
...

Why It Matters:
...

What Behavior Depends On It:
...
```

A term may be important because it affects:

* eligibility;
* responsibility;
* calculation;
* state;
* authorization;
* policy;
* lifecycle;
* outcome;
* ownership.

---

# 12. Scope of Meaning

A term may have different meanings depending on scope.

Record:

```text id="lqq6p1"
Global Meaning:
...

Domain Area Meaning:
...

Context-Specific Meaning:
...

Differences:
...
```

Do not assume that one definition must apply everywhere.

---

# 13. Synonyms

Identify terms that appear to represent the same concept.

Example:

```text id="0j3m0m"
Customer
Client
Buyer
```

Record:

```text id="5nby8c"
Synonym Group:
...

Preferred Term:
...

Alternative Terms:
...

Evidence:
...

Context Differences:
...
```

Synonyms may indicate:

* harmless language variation;
* organizational differences;
* historical terminology;
* different concepts incorrectly treated as equivalent.

The agent must validate before merging meanings.

---

# 14. Homonyms

A homonym occurs when the same term refers to different concepts.

Example:

```text id="p3n2yw"
Account
├── Financial Account
└── User Account
```

For each homonym record:

```text id="7pxw0y"
Term:
...

Meaning A:
...

Meaning B:
...

Context A:
...

Context B:
...

Business Difference:
...

Potential Boundary Implication:
...
```

Homonyms are important evidence when evaluating bounded contexts.

---

# 15. Polysemy

Some terms may have related but distinct meanings.

Example:

```text id="k5r2z6"
"Order"

Possible meanings:
- customer request;
- commercial transaction;
- fulfillment instruction.
```

Record these distinctions explicitly when they influence domain behavior.

Do not collapse related meanings into one concept merely because the vocabulary is similar.

---

# 16. Ambiguous Terms

Identify terms whose meaning is currently unclear.

```text id="q5t1b9"
Term:
...

Possible Meanings:
...

Why Ambiguous:
...

Affected Decisions:
...

Impact:
...

Resolution Method:
...
```

Ambiguity should remain visible until resolved.

---

# 17. Conflicting Definitions

Record situations where different sources define the same term differently.

```text id="w3v8y2"
Term:
...

Definition A:
...

Source A:
...

Definition B:
...

Source B:
...

Conflict:
...

Business Impact:
...

Resolution:
...

Decision:
...
```

Do not silently select one definition unless the authority and evidence justify it.

---

# 18. Domain Expert Language

Record terminology used by domain participants.

```text id="4b0l1n"
Actor / Expert:
...

Term:
...

Meaning:
...

Usage Context:
...

Importance:
...

Validation Status:
...
```

Different groups may legitimately use different terminology.

This is evidence that may later influence context boundaries.

---

# 19. Organizational Vocabulary

Organizations may have established terminology that differs from general industry terminology.

Record:

```text id="b2j8v4"
Organizational Term:
...

Meaning:
...

Industry Equivalent:
...

Difference:
...

Reason:
...

Authority:
...
```

Organizational terminology should not be replaced automatically with supposedly more standard terminology.

---

# 20. Legacy Vocabulary

Existing systems may contain terminology that no longer reflects the desired domain language.

For existing systems record:

```text id="5u6l3s"
Legacy Term:
...

Current Meaning:
...

Historical Meaning:
...

Target Term:
...

Migration Consideration:
...
```

Legacy vocabulary is evidence of the current system, not necessarily the target domain language.

---

# 21. Technical Terms That Must Not Be Domain Terms

Identify technical terminology that has accidentally entered domain discussions.

Examples include:

```text id="9s5h4m"
DTO
Controller
Repository
Endpoint
Database
Table
Topic
Queue
Microservice
API
Cache
```

These terms may be valid implementation concepts but should not replace actual business concepts.

Record suspected leakage when it creates domain ambiguity.

---

# 22. Term Relationships

Terms may have semantic relationships.

Supported relationship types include:

```text id="7d9zv1"
SYNONYM_OF
ALIAS_OF
SPECIALIZATION_OF
GENERALIZATION_OF
PART_OF
REFINES
CONTRASTS_WITH
DEPENDS_ON
GOVERNS
TRIGGERS
PRODUCES
CONSUMES
REPRESENTS
REPLACES
SUPERSEDES
```

Each relationship should have evidence when its meaning materially affects the domain model.

---

# 23. Contextual Vocabulary

When bounded contexts are identified, vocabulary should be scoped accordingly.

Example:

```text id="r4g7p2"
Term: Account

Context: Billing
Meaning: ...

Context: Identity
Meaning: ...

Relationship:
Same lexical term, different domain meaning.
```

A glossary must not force global terminology when the domain naturally contains context-specific meanings.

---

# 24. Context Vocabulary Boundaries

For each candidate bounded context record:

```text id="8q2e9a"
Context:
...

Core Terms:
...

Terms With Context-Specific Meaning:
...

Terms Excluded:
...

Terms Shared With Other Contexts:
...

Potential Translation Requirements:
...
```

This information may later support Context Mapping.

---

# 25. Translation Boundaries

Identify places where one context's vocabulary must be translated into another context's language.

```text id="1e4tq5"
Source Context:
...

Source Term:
...

Target Context:
...

Target Term:
...

Semantic Difference:
...

Translation Responsibility:
...

Risk:
...
```

Do not assume that identical names imply identical semantics.

---

# 26. State Terminology

State names are often semantically significant.

For each domain lifecycle:

```text id="2w6n8k"
Concept:
...

State:
...

Definition:
...

Entry Conditions:
...

Exit Conditions:
...

Invalid Interpretations:
...
```

Avoid generic states such as `ACTIVE`, `DONE`, or `PENDING` when the actual business meaning is more specific.

---

# 27. Event Terminology

Domain events should use language that represents meaningful business occurrences.

For each event term:

```text id="4y9f3j"
Event:
...

Meaning:
...

Past-Tense Interpretation:
...

Trigger:
...

Business Consequence:
...

Related Concept:
...
```

Avoid naming domain events after technical actions such as:

```text id="d7x0m3"
DatabaseUpdated
MessageSent
EndpointCalled
RecordInserted
```

unless those actions themselves are genuinely meaningful business events.

---

# 28. Capability Terminology

Capabilities should use business language.

Preferred:

```text id="w1d3r6"
Manage Eligibility
Calculate Settlement
Approve Claim
Fulfill Order
```

Avoid:

```text id="7z5c2a"
EligibilityService
SettlementController
OrderAPI
ClaimModule
```

The latter may be implementation artifacts rather than domain capabilities.

---

# 29. Process Terminology

Business processes should be named according to the business activity.

Record:

```text id="0x5n7q"
Process:
...

Purpose:
...

Trigger:
...

Outcome:
...

Participants:
...

Important Terms:
...
```

Do not derive business process names directly from endpoint names or application workflows.

---

# 30. Glossary Conflicts and Boundary Signals

Some language conflicts are architectural signals.

Potential signals include:

* same term has materially different meanings;
* different teams own different meanings;
* same rule differs between contexts;
* lifecycle differs;
* concept ownership is contested;
* actors interact differently with the concept;
* one context treats a concept as central while another treats it as supporting.

These signals should be considered during bounded context discovery.

They are evidence, not automatic boundary decisions.

---

# 31. Vocabulary Confidence

Each important term should have a confidence level:

```text id="q9k5s1"
HIGH
MEDIUM
LOW
```

### HIGH

Meaning is directly supported by authoritative domain evidence.

### MEDIUM

Meaning is supported by multiple consistent sources but remains partially inferential.

### LOW

Meaning is primarily inferred or weakly supported.

---

# 32. Vocabulary Evidence

Evidence may include:

* domain expert confirmation;
* approved product documentation;
* accepted business rules;
* operational procedures;
* current system behavior;
* existing contracts;
* domain models;
* user terminology;
* regulatory definitions;
* organizational policies.

Technical implementation should not automatically outrank domain evidence.

---

# 33. Existing System Vocabulary

For existing systems compare:

```text id="y3h8n2"
Documented Vocabulary:
...

Observed Vocabulary:
...

Code Vocabulary:
...

Operational Vocabulary:
...

Target Vocabulary:
...
```

Identify divergence explicitly.

Example:

```text id="x7p4d6"
Business term: "Settlement"

Code term: "Payment"

Observation:
The implementation uses "Payment", while domain participants distinguish payment initiation from settlement.
```

Such differences may represent domain debt.

---

# 34. Vocabulary Evolution

Vocabulary changes must be traceable.

Record:

```text id="s5k2m8"
Previous Term:
...

New Term:
...

Reason:
...

Effective Context:
...

Migration Required:
...

Affected Artifacts:
...

Decision:
...
```

Do not rewrite historical artifacts merely to make terminology appear consistent.

Historical terminology may be necessary for understanding prior decisions and implementations.

---

# 35. Domain Language Decisions

Material terminology choices should be recorded as explicit decisions when they affect:

* domain boundaries;
* business rules;
* requirements;
* contracts;
* specifications;
* implementation;
* external communication.

A simple vocabulary preference does not necessarily require an ADR.

The required governance level should be proportional to impact.

---

# 36. Traceability

Terms should be traceable to the artifacts that establish or use their meaning.

Useful relationships include:

```text id="x4v6c2"
DEFINED_BY
SUPPORTED_BY
USED_BY
REFINES
SPECIALIZES
CONTRADICTS
SUPERSEDES
MAPS_TO
TRANSLATES_TO
INFLUENCES
```

Example:

```text id="v0m8s7"
TERM-001
    ↓ DEFINED_BY
BR-004

TERM-001
    ↓ USED_BY
UC-003

TERM-001
    ↓ INFLUENCES
BC-002
```

---

# 37. Glossary Health

Evaluate glossary quality using:

### Coverage

Are important domain terms represented?

### Consistency

Are terms used consistently where they should be?

### Clarity

Are definitions understandable?

### Boundary Awareness

Are context-specific meanings visible?

### Conflict Visibility

Are semantic conflicts explicit?

### Evidence

Are important definitions supported?

### Currency

Does the glossary reflect the current accepted domain understanding?

---

# 38. Vocabulary Debt

Vocabulary debt exists when terminology is inconsistent, ambiguous, obsolete, or misleading.

Examples:

* one concept has several competing names;
* one name represents several concepts;
* code terminology differs from business terminology;
* legacy terms remain in new documentation;
* terms have no authoritative definition.

Record:

```text id="j6s1v9"
Debt:
...

Impact:
...

Affected Areas:
...

Priority:
...

Resolution:
...
```

Vocabulary debt should be prioritized according to business and architectural impact.

---

# 39. Review Checklist

### Language

* [ ] Important domain terms are identified.
* [ ] Definitions describe business meaning.
* [ ] Canonical terminology is explicit where appropriate.
* [ ] Synonyms are documented.
* [ ] Homonyms are documented.
* [ ] Ambiguous terms are visible.
* [ ] Conflicting definitions are visible.

### Context

* [ ] Context-specific meanings are documented.
* [ ] Potential translation boundaries are identified.
* [ ] Vocabulary differences are considered when evaluating boundaries.

### Evidence

* [ ] Important terms have supporting evidence.
* [ ] Confidence levels are explicit.
* [ ] Unsupported terminology has not been presented as fact.

### Existing Systems

* [ ] Legacy vocabulary is distinguished from target vocabulary.
* [ ] Code terminology is not automatically treated as domain terminology.
* [ ] Historical terminology has been preserved where relevant.

### Domain Modeling

* [ ] Capability terminology is business-oriented.
* [ ] Process terminology is business-oriented.
* [ ] Event terminology represents business occurrences.
* [ ] State terminology reflects business meaning.

### Governance

* [ ] Material terminology decisions are explicit.
* [ ] Changes are traceable.
* [ ] Vocabulary conflicts that affect architecture are escalated.

---

# 40. Agent Instructions

When creating or reviewing this artifact, the agent must:

1. Extract terminology from validated domain evidence.
2. Prefer domain participant language over technical naming.
3. Distinguish synonyms from genuinely different concepts.
4. Detect homonyms and polysemy.
5. Preserve ambiguity when evidence is insufficient.
6. Never invent definitions to complete the glossary.
7. Record technical terminology that leaks into the domain model.
8. Identify context-specific meanings.
9. Treat language differences as potential boundary evidence.
10. Avoid assuming that a shared word represents a shared model.
11. Preserve historical terminology when necessary for traceability.
12. Propagate material vocabulary conflicts to Domain Discovery.
13. Escalate terminology conflicts when they affect rules, ownership, boundaries, contracts, or architecture.
14. Keep the glossary proportional to domain complexity.
15. Avoid creating glossary entries for irrelevant technical vocabulary.

---

# 41. Anti-Patterns

## 41.1 Dictionary Theater

Creating a large glossary containing terms that have no impact on domain understanding.

---

## 41.2 Technical Vocabulary as Ubiquitous Language

Using implementation terms as substitutes for business concepts.

---

## 41.3 Forced Standardization

Forcing different domain meanings into one definition merely to maintain terminology consistency.

---

## 41.4 False Synonyms

Assuming two terms mean the same thing without validating their business semantics.

---

## 41.5 Ignoring Homonyms

Assuming identical words imply identical concepts.

---

## 41.6 Glossary as Global Truth

Assuming every term must have exactly one meaning across all bounded contexts.

---

## 41.7 Code-First Terminology

Taking class names, table names, endpoints, or service names as authoritative domain language.

---

## 41.8 Premature Context Mapping

Defining context relationships before their semantic differences are understood.

---

## 41.9 Silent Terminology Changes

Changing terminology across documents without recording the reason or impact.

---

## 41.10 Vocabulary Without Evidence

Introducing terms because they are common in the industry rather than because they are supported by the project's domain.

---

# 42. Compact Glossary Register

Maintain a compact index:

| ID       | Term | Category | Status      | Context   | Confidence |
| -------- | ---- | -------- | ----------- | --------- | ---------- |
| TERM-001 | —    | CONCEPT  | ACCEPTED    | —         | HIGH       |
| TERM-002 | —    | POLICY   | PROPOSED    | —         | MEDIUM     |
| TERM-003 | —    | STATE    | CONFLICTING | Context A | LOW        |

The register is a navigation aid.

The detailed records remain authoritative.

---

# 43. Safe Progression Question

Before progressing to capability analysis or bounded context discovery, ask:

> **Do we have a sufficiently clear and evidence-based domain language to distinguish important concepts, responsibilities, rules, and semantic boundaries without silently collapsing different meanings into one model?**

If the answer is no, continue vocabulary discovery or explicitly record the uncertainty.

---

# 44. Final Principle

> **A domain model cannot be more precise than the language used to describe the domain.**

The glossary exists to make that language explicit.

It should reveal:

```text id="r7b1c4"
Terms
  ↓
Meanings
  ↓
Differences
  ↓
Relationships
  ↓
Boundaries
```

The goal is not linguistic perfection.

The goal is sufficient semantic clarity to support reliable domain modeling and subsequent architectural decisions.

