# Greenfield Example — MealPlanner Pro

## Scenario Overview

**Product:** MealPlanner Pro — A B2B meal planning and nutrition management platform for dietitians and wellness coaches.

**Lifecycle Mode:** GREENFIELD

**Project Sizing Assessment:**
- Scope: SYSTEM (new product, multiple bounded contexts)
- Domain Complexity: MEDIUM (nutrition science, meal planning algorithms, compliance)
- Technical Complexity: MEDIUM (algorithmic meal generation, PDF reports, external integrations)
- Risk: MEDIUM (health data, regulatory compliance, algorithmic correctness)
- Change Impact: N/A (greenfield)
- Reversibility: PARTIALLY_REVERSIBLE (core domain decisions)
- Integration Surface: MEDIUM (USDA food data, PDF generation, email, calendar)
- **Recommended Lifecycle Depth: LEVEL 2 — STANDARD**

---

## Scenario Narrative

A wellness technology startup wants to build a platform that helps registered dietitians and certified wellness coaches create personalized meal plans for their clients. The product must handle:
- Client onboarding with health profiles, dietary restrictions, goals
- Algorithm-assisted meal plan generation respecting nutrition science
- Plan customization by the practitioner
- Client-facing view with shopping lists, prep guides, progress tracking
- Practitioner dashboard for client management
- Compliance with health data regulations (HIPAA-adjacent)
- Integration with USDA food composition database

The team has a product concept but no implementation. They need to progress from product discovery through release readiness.

---

## Epistemic State Conventions Used

Throughout this example, each artifact explicitly marks information with its epistemic state:

| Marker | Meaning |
|--------|---------|
| `FACT` | Supported by explicit stakeholder decision or regulatory requirement |
| `ASSUMPTION` | Tentatively accepted for analysis; requires validation |
| `PROPOSAL` | Agent recommendation; not yet authorized |
| `DECISION` | Explicitly accepted by authorized decision authority |
| `UNKNOWN` | Genuinely unknown; not assumed |
| `CONFLICTING` | Evidence sources disagree |

---

## Human Decision Authority Boundaries

The following decisions require explicit human authorization (marked `DECISION_REQUIRES_AUTHORITY`):

1. **Product Scope Boundaries** — What is in/out of MVP (Product Owner)
2. **Bounded Context Boundaries** — Domain boundary acceptance (Domain Expert + Architect)
3. **Architecture Style** — Modular monolith vs distributed (Architect + Tech Lead)
4. **Data Ownership** — Who owns client health data (Legal + Product Owner)
5. **External Integrations** — USDA API vs local copy (Architect + Product Owner)
6. **Security/Compliance Approach** — Encryption, audit, access control (Security Officer)
7. **Release Readiness** — GO/NO-GO for launch (Product Owner + Security + Operations)

Agent recommendations are marked `PROPOSAL` throughout. They become `DECISION` only after explicit authorization.

---

## Gate Evaluation Approach

Each phase gate evaluation includes:
- **Satisfied**: Explicitly met criteria with evidence
- **Blocking**: Criteria not met that prevent safe progression
- **Non-Blocking Risks**: Known uncertainties accepted for progression
- **Required Follow-Up**: Specific actions needed

At least one gate will have a `BLOCKING` issue and one will have `PASSED_WITH_RISKS` to demonstrate honest evaluation.

---

## Traceability Conventions

This example uses the 17 canonical traceability relationships from `references/traceability.md`:

```
DERIVES_FROM, REFINES, SATISFIES, REALIZES, IMPLEMENTS,
EXPOSES, CONSUMES, CONSTRAINS, INFLUENCES, DECIDES,
SPECIFIES, VERIFIES, DEPENDS_ON, SUPERSEDES, INVALIDATES,
MITIGATES, JUSTIFIES
```

Traceability is shown in each artifact's Traceability section and in the consolidated traceability matrix at the end.

---

## Directory Structure

```
greenfield/
├── README.md                          # This file
├── scenario-guide.md                  # Narrative walkthrough of the reasoning process
├── project-sizing-assessment.md       # Formal sizing analysis
├── product/
│   ├── product-context.md
│   ├── requirements.md
│   ├── quality-attributes.md
│   ├── constraints.md
│   ├── assumptions.md
│   ├── unknowns.md
│   ├── risks.md
│   ├── decisions.md
│   ├── actors.md
│   ├── outcomes.md
│   ├── scope.md
│   ├── use-cases.md
│   ├── business-rules.md
│   ├── dependencies.md
│   └── product-discovery-summary.md
├── domain/
│   ├── domain-context.md
│   ├── domain-capabilities.md
│   ├── domain-glossary.md
│   ├── bounded-contexts.md
│   ├── context-map.md
│   ├── domain-model.md
│   ├── domain-events.md
│   ├── domain-processes.md
│   └── domain-boundary-review.md
├── architecture/
│   ├── architecture-context.md
│   ├── c4-system-context.md
│   ├── c4-container.md
│   ├── architecture-views.md
│   └── architecture-review.md
├── contracts/
│   ├── contract-governance.md
│   ├── api-contract-mealplan.md
│   ├── api-contract-client.md
│   ├── event-contract.md
│   ├── data-contract.md
│   ├── security-contract.md
│   ├── observability-contract.md
│   └── contract-review.md
├── adr/
│   ├── adr-register.md
│   ├── adr-001-architecture-style.md
│   ├── adr-002-communication-pattern.md
│   ├── adr-003-data-ownership.md
│   ├── adr-004-authentication.md
│   ├── adr-005-pdf-generation.md
│   └── architecture-decision-review.md
├── specifications/
│   ├── specification-governance.md
│   ├── api-specification-mealplan.md
│   ├── api-specification-client.md
│   ├── data-persistence-specification.md
│   ├── component-specification-mealplan-engine.md
│   ├── security-specification.md
│   ├── observability-specification.md
│   ├── configuration-specification.md
│   ├── deployment-specification.md
│   ├── test-specification.md
│   └── specification-readiness-review.md
├── infrastructure/
│   ├── infrastructure-context.md
│   ├── infrastructure-specification.md
│   └── infrastructure-readiness-review.md
├── release/
│   ├── release-readiness-context.md
│   └── release-readiness-review.md
└── traceability-matrix.md             # Consolidated cross-phase traceability
```

---

## How to Read This Example

1. **Start with `scenario-guide.md`** — It explains the reasoning process, not just the documents
2. **Read `project-sizing-assessment.md`** — Understand why Standard depth was chosen
3. **Follow the phase order** — Product → Domain → Architecture → Contracts → ADR → Specifications → Infrastructure → Release
4. **Notice epistemic markers** — Every significant statement is tagged
5. **Check gate evaluations** — See where progression was blocked or accepted with risks
6. **Review traceability matrix** — See the complete chain from product need to verification

---

## Anti-Patterns Demonstrated (and Avoided)

This example intentionally shows:
- ❌ **NOT** jumping to technology choices before domain understanding
- ❌ **NOT** assuming bounded context = microservice
- ❌ **NOT** treating recommendations as decisions
- ❌ **NOT** inventing unknown values
- ❌ **NOT** filling every template field without evidence
- ❌ **NOT** declaring gates passed because documents exist

Instead it shows:
- ✅ Explicit unknowns carried forward
- ✅ Recommendations distinguished from decisions
- ✅ Gates blocked on genuine uncertainty
- ✅ Traceability as reasoning, not documentation
- ✅ Feedback loops when later phases reveal earlier gaps
- ✅ Project sizing driving template selection