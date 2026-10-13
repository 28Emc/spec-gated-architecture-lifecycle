# Project Sizing Assessment — MealPlanner Pro

## Assessment Overview

**Product:** MealPlanner Pro
**Date:** 2025-01-15
**Assessor:** Spec-Gated Architecture Lifecycle Agent
**Lifecycle Mode:** GREENFIELD

---

## Sizing Dimensions

### Scope: SYSTEM
- New product with multiple bounded contexts (Nutrition Planning, Client Management, Compliance, Integration)
- 4 identified bounded contexts
- Single deployable unit (modular monolith)
- 1 primary external integration (USDA API), 2 secondary (Email, PDF)
- 1 team (3 engineers + 1 dietitian consultant)

### Domain Complexity: MEDIUM
- 6 core business capabilities identified
- Nutrition science rules (macronutrient calculations, restriction logic) — moderate complexity
- 3 primary actors (Practitioner, Client, System)
- 8+ invariants (meal plan validity, consent, data retention)
- Domain changes expected: nutrition science updates, new restriction types

### Technical Complexity: MEDIUM
- Algorithmic meal generation (constraint satisfaction)
- PDF report generation (external service)
- USDA API integration (rate limited, external dependency)
- Email notifications (async)
- Single deployment unit simplifies operations
- No distributed transactions, no event sourcing, no CQRS

### Risk: MEDIUM
- Health data handling (HIPAA-adjacent) — requires encryption, audit, access control
- Algorithmic correctness — meal plans affect health outcomes
- External API dependency (USDA) — availability, rate limits, data quality
- Regulatory uncertainty — exact compliance requirements not fully known
- No safety-critical or financial transaction risk

### Change Impact: N/A (Greenfield)
- New system, no existing architecture to impact

### Reversibility: PARTIALLY_REVERSIBLE
- Architecture style (modular monolith) — DIFFICULT_TO_REVERSE once implemented
- Bounded context boundaries — DIFFICULT_TO_REVERSE
- Technology choices (language, framework) — PARTIALLY_REVERSIBLE
- External integrations — REVERSIBLE (can swap providers)
- Data model — PARTIALLY_REVERSIBLE (migrations required)

### Integration Surface: MEDIUM
- USDA FoodData Central API (external, rate limited)
- Email service (SendGrid or similar)
- PDF generation service (external or self-hosted)
- OAuth2 identity provider (Auth0 or similar)
- Managed PostgreSQL, Redis, Object Storage

### Criticality: MEDIUM
- Business-critical for startup (core product)
- Not life-safety or financial-critical
- Reputational risk if health data exposed or meal plans incorrect

---

## Sizing Matrix Evaluation

| Dimension | Classification |
|-----------|----------------|
| Scope | SYSTEM |
| Domain Complexity | MEDIUM |
| Technical Complexity | MEDIUM |
| Risk | MEDIUM |
| Reversibility | PARTIALLY_REVERSIBLE |
| Integration Surface | MEDIUM |

**Complexity vs Risk Matrix Position:** Medium Complexity, Medium Risk → **Standard lifecycle with formal gates** (per `references/project-sizing.md` Section 9)

---

## Recommended Lifecycle Depth: LEVEL 2 — STANDARD

### Justification

The project is not a trivial internal tool (would be Level 1) but also not a distributed, high-risk, multi-system platform (would be Level 3).

**Level 2 applies because:**
- Multiple bounded contexts require domain analysis and architecture
- Meaningful quality attributes (security, availability, correctness)
- External integrations require contract governance
- Health data requires explicit security decisions and ADRs
- Team size supports standard process without overhead

**Not Level 3 because:**
- Single deployable unit (modular monolith)
- No distributed communication complexity
- No regulatory mandate requiring formal certification
- Team size (3 engineers) cannot sustain full enterprise ceremony

**Not Level 1 because:**
- Domain complexity (nutrition rules, invariants) requires explicit modeling
- Architecture decisions (modular monolith vs services) are strategic
- Security/compliance requires formal governance
- External contracts require compatibility analysis

---

## Phase Depth Selection

| Lifecycle Phase | Depth | Rationale |
|----------------|-------|-----------|
| Product Discovery | STANDARD | Full context, requirements, constraints, assumptions, unknowns |
| Domain Discovery | STANDARD | Capabilities, bounded contexts, glossary, processes — not full DDD tactical patterns |
| Architecture | STANDARD | C4 Level 1 + 2, selective Level 3; quality attributes; no formal ATAM |
| Contracts | STANDARD | API, event, data, security contracts; versioning; no full consumer-driven contracts |
| Architecture Decisions | STANDARD | 5 ADRs for strategic decisions; no ADR for every implementation choice |
| Specifications | STANDARD | API, data, component, security, observability, deployment, test specs |
| Infrastructure | STANDARD | Phase 6 (requirements) + Phase 7 (realization); Terraform/Helm; no full DR plan |
| Release Readiness | STANDARD | Functional, architecture, contracts, security, testing, operations — no formal audit |

---

## Gate Scope

| Gate | Scope | Notes |
|------|-------|-------|
| Gate 0 | Full | Project initialization |
| Gate 1 | Full | Product context sufficient |
| Gate 2 | Full | Domain model sufficient — BLOCKED until boundaries decided |
| Gate 3 | Full | Architecture coherent — depends on Gate 2 |
| Gate 4 | Full | Contracts sufficient |
| Gate 5 | Full | Architectural decisions governed |
| Gate 6 | Full | Implementation ready |
| Gate 7 | Full | Operationally prepared — autoscaling waived |
| Gate 8 | Full | Release ready — pentest waived with GO_WITH_RISKS |

---

## Documentation Depth

**Included (proportional to risk):**
- Product Context, Requirements, Quality Attributes, Constraints, Assumptions, Unknowns, Risks, Decisions
- Domain Context, Capabilities, Glossary, Bounded Contexts, Context Map, Processes, Events, Boundary Review
- Architecture Context, C4 System Context, C4 Container, Architecture Views, Architecture Review
- Contract Governance, API Contracts (2), Event Contract, Data Contract, Security Contract, Observability Contract, Contract Review
- ADR Register, 5 ADRs, Architecture Decision Review
- Specification Governance, API Specs (2), Data Persistence, Component (MealPlan Engine), Security, Observability, Configuration, Deployment, Test, Specification Readiness Review
- Infrastructure Context, Infrastructure Specification (Phase 6), Infrastructure Specification (Phase 7), Infrastructure Readiness Review
- Release Readiness Context, Release Readiness Review
- Traceability Matrix

**Excluded (not justified by risk):**
- Full C4 Level 3 for all components
- Formal threat model (STRIDE)
- Consumer-driven contract testing framework
- Full disaster recovery plan
- Architecture review board charter
- Detailed capacity planning
- Formal compliance certification artifacts

---

## Dynamic Resizing Triggers Monitored

The agent will reassess sizing if discovery reveals:
- [ ] Multiple deployable units required (would upscale to Level 3)
- [ ] Regulatory certification required (SOC2, HIPAA formal) — would upscale
- [ ] External consumers of API beyond practitioners — would upscale contract governance
- [ ] Distributed transactions needed — would upscale
- [ ] Team grows beyond 5 engineers — may upscale governance
- [ ] USDA API replaced with local database — may downscale integration complexity

---

## Evidence Base

| Dimension | Evidence |
|-----------|----------|
| Scope | User interviews, product vision document |
| Domain Complexity | Dietitian consultant input, nutrition science literature review |
| Technical Complexity | Technical lead assessment, USDA API documentation review |
| Risk | Security officer consultation (preliminary), compliance checklist |
| Reversibility | Architectural decision analysis (ADR-001) |
| Integration Surface | API documentation review, vendor evaluation |

---

## Classification Confidence

| Dimension | Confidence | Unknowns |
|-----------|------------|----------|
| Scope | HIGH | None |
| Domain Complexity | MEDIUM | Exact number of restriction types |
| Technical Complexity | MEDIUM | USDA API reliability in production |
| Risk | MEDIUM | Exact regulatory classification |
| Reversibility | HIGH | Based on ADR-001 analysis |
| Integration Surface | HIGH | Known integrations identified |

**Overall Confidence:** MEDIUM — Regulatory classification is the primary uncertainty affecting risk assessment.

---

## Agent Notes

This sizing assessment was performed *before* selecting lifecycle depth, per `references/project-sizing.md` Section 14. The assessment is recorded explicitly so that:
1. The rationale for LEVEL 2 is traceable
2. Future reassessment has a baseline
3. Human reviewers can validate or challenge the classification

If the regulatory review reveals CRITICAL risk, the agent will recommend upscaling to LEVEL 3 and re-evaluating gate scope.