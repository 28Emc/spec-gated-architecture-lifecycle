# Existing System Scenario — OrderFlow Legacy

## Scenario Overview

**System:** OrderFlow — A 5-year-old order management system for a mid-market B2B distributor.

**Lifecycle Mode:** EXISTING_SYSTEM

**Project Sizing Assessment:**
- Scope: SYSTEM (entire application)
- Domain Complexity: HIGH (complex pricing, inventory, multi-channel)
- Technical Complexity: HIGH (monolith with hidden coupling, 2 databases, 3 external integrations)
- Risk: HIGH (revenue-critical, no test coverage, security debt)
- Reversibility: DIFFICULT_TO_REVERSE (core business logic)
- Integration Surface: HIGH (ERP, payment gateway, shipping carriers)
- **Recommended Lifecycle Depth: LEVEL 3 — FULL**

---

## Scenario Narrative

OrderFlow was built 5 years ago as a rapid MVP and grew organically. The original team has left. Current team: 4 engineers, 1 product manager. The system processes ~$50M/year in orders.

**Trigger:** New VP Engineering wants architecture assessment before planned feature work (new customer portal, marketplace integration).

**Constraints:**
- Cannot stop feature development entirely
- No dedicated architecture sprint — must work in parallel
- Limited documentation (outdated wiki, sparse code comments)
- Production is the only reliable source of truth

---

## Existing-System Entry Mode Principles Demonstrated

This example demonstrates the three-state distinction from `references/architecture-gates.md` Section 15:

```
Documented State
    ↓ (often diverges)
Actual State (observed from code, runtime, data)
    ↓ (target for evolution)
Target State
```

**Key Rule:** `Observed Reality > Historical Documentation` when they conflict.

---

## Phase Approach (Proportional to Risk)

Per `references/project-sizing.md` Section 26 (Existing System focus):
- **System Discovery** → Actual behavior, current architecture, existing contracts
- **Domain Discovery** → Only where needed for assessment
- **Architecture Assessment** → Current vs intended, risks, debt
- **Contract Assessment** → Actual vs documented
- **Decisions** → Only for identified risks/changes
- **Specifications** → Only for remediation work
- **Evolution** → Proportional gate evaluation

**Not doing:** Full greenfield lifecycle. Not creating every template.

---

## Directory Structure

```
existing-system/
├── README.md                          # This file
├── scenario-guide.md                  # Narrative walkthrough
├── project-sizing-assessment.md       # Formal sizing (LEVEL 3)
├── system-assessment/
│   ├── system-discovery.md            # What actually exists (code, runtime, data)
│   ├── documented-vs-actual.md        # Three-state comparison
│   ├── current-architecture.md        # Observed architecture (C4 from code)
│   ├── existing-contracts.md          # Actual API/event contracts
│   └── technical-debt.md              # Cataloged debt with severity
├── architecture-risks/
│   ├── risk-register.md               # Prioritized architectural risks
│   ├── security-assessment.md         # Security gaps
│   ├── data-ownership-analysis.md     # Who owns what (actual vs documented)
│   └── coupling-analysis.md           # Hidden dependencies
├── gate-evaluation/
│   ├── gate-0-initialization.md       # Project scope, entry mode
│   ├── gate-1-product-context.md      # Product understanding (lightweight)
│   ├── gate-2-domain-assessment.md    # Domain model extraction (targeted)
│   ├── gate-3-architecture.md         # Architecture coherence (FULL)
│   ├── gate-4-contracts.md            # Contract assessment (FULL)
│   ├── gate-5-decisions.md            # Decision governance (targeted)
│   ├── gate-6-specifications.md       # Remediation specs (targeted)
│   ├── gate-7-infrastructure.md       # Infra assessment (targeted)
│   └── gate-8-release-readiness.md    # Not applicable (no release)
└── traceability-matrix.md             # Actual → Target traceability
```

---

## Key Behaviors Demonstrated

| Behavior | Example in This Scenario |
|----------|-------------------------|
| Three-state distinction | `Order` aggregate: Documented = single owner; Actual = 3 services modify; Target = Order Service owns |
| Evidence over documentation | Agent discovers `PaymentService` directly updates `Order` table — contradicts wiki |
| Proportional gates | Gate 1 (Product) lightweight; Gate 3 (Architecture) full; Gate 8 (Release) N/A |
| Decision debt identification | `AuthStrategy = OPEN`, `ConsistencyModel = UNKNOWN` catalogued |
| Target architecture | Incremental: Strangler Fig toward modular monolith → services |
| No forced phases | Domain Discovery only for affected areas (Order, Payment) |

---

## Fictional System Details

**Tech Stack:** Java 11, Spring Boot 2.7, PostgreSQL (orders) + MongoDB (catalog), RabbitMQ, AngularJS frontend
**Integrations:** ERP (SAP), Payment (Stripe), Shipping (EasyPost)
**Team:** 4 engineers (2 backend, 1 frontend, 1 DevOps), 1 PM
**Pain Points:** Frequent outages, slow deployments, pricing bugs, no test coverage, security findings