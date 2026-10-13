# C4 Container Diagram — MealPlanner Pro

## 1. Document Metadata

| Field | Value |
|-------|-------|
| Document Type | C4 Container |
| Architecture Level | C4 Level 2 |
| Lifecycle Phase | Architecture |
| Status | `IN_REVIEW` |
| Version | `0.2` |
| System | MealPlanner Pro |
| Owner | Architect |
| Created | `2025-01-26` |
| Last Updated | `2025-01-29` |

---

## 2. Container Diagram

```mermaid
C4Container
title Container Diagram — MealPlanner Pro

Person(practitioner, "Practitioner", "Registered dietitian / wellness coach")
Person(client, "Client", "Receives meal plan via email")

System_Boundary(mealplanner, "MealPlanner Pro") {
    Container(api, "MealPlanner API", "Spring Boot 3 / .NET 8", "Modular monolith: REST API, business logic, event publishing")
    ContainerDb(db, "PostgreSQL", "Managed (RDS/Cloud SQL)", "Primary persistence — per-context schemas")
    ContainerDb(redis, "Redis", "Managed (ElastiCache)", "USDA cache, sessions, rate limiting")
    Container(storage, "Object Storage", "S3 / GCS", "PDF templates, generated PDFs, exports")
    Container(queue, "Event Bus", "In-process (ApplicationEventPublisher)", "Domain event distribution between modules")
}

System_Ext(usda, "USDA FoodData Central", "Nutrient database (REST API)")
System_Ext(auth0, "Auth0", "Identity provider (OAuth2/OIDC)")
System_Ext(email, "Email Service", "SendGrid (REST API)")
System_Ext(pdf, "PDF Service", "Document rendering (REST API)")
System_Ext(k8s, "Kubernetes", "EKS / GKE", "Container orchestration")

Rel(practitioner, api, "HTTPS / REST", "JSON")
Rel(client, email, "Receives PDF via email", "SMTP / Email")
Rel(api, db, "Reads/writes per-context schemas", "JDBC / ADO.NET")
Rel(api, redis, "Caches USDA data, sessions", "Redis protocol")
Rel(api, storage, "Stores/retrieves PDFs, templates", "S3 API")
Rel(api, queue, "Publishes/consumes domain events", "In-process")
Rel(api, usda, "Fetches nutrient data", "HTTPS / REST")
Rel(api, auth0, "Validates JWT, retrieves roles", "HTTPS / OAuth2")
Rel(api, email, "Sends meal plan emails", "HTTPS / REST")
Rel(api, pdf, "Renders meal plan PDFs", "HTTPS / REST")
Rel(api, k8s, "Deployed as pods", "Container runtime")
```

---

## 3. Container Descriptions

| Container | Technology | Responsibility | Data |
|-----------|------------|----------------|------|
| **MealPlanner API** | Spring Boot 3 / .NET 8 | All business logic: Nutrition Planning, Client Management, Compliance, Integration modules. Exposes REST API. Publishes/consumes domain events. | Stateless (session in Redis) |
| **PostgreSQL** | Managed (RDS/Cloud SQL) | Primary persistence. Schemas: `nutrition`, `client_mgmt`, `compliance`, `integration`, `shared`. | All domain data |
| **Redis** | Managed (ElastiCache) | USDA nutrient cache (30-day TTL), session store, rate limiting counters. | Cache, sessions |
| **Object Storage** | S3 / GCS | PDF templates, generated meal plan PDFs, data exports. | Documents, templates |
| **Event Bus** | In-process (Spring ApplicationEventPublisher / MediatR) | Distributes domain events between modules. No external broker for MVP. | Events (transient) |

---

## 4. Container Interactions

| From | To | Protocol | Purpose |
|------|-----|----------|---------|
| Practitioner | MealPlanner API | HTTPS / REST | All user interactions |
| MealPlanner API | PostgreSQL | JDBC / ADO.NET | Persistence (per-context schemas) |
| MealPlanner API | Redis | Redis protocol | Caching, sessions, rate limiting |
| MealPlanner API | Object Storage | S3 API | PDF storage, templates |
| MealPlanner API | Event Bus | In-process | Cross-module domain events |
| MealPlanner API | USDA API | HTTPS / REST | Nutrient data fetch |
| MealPlanner API | Auth0 | HTTPS / OAuth2 | Token validation, JWKS |
| MealPlanner API | Email Service | HTTPS / REST | Plan delivery, notifications |
| MealPlanner API | PDF Service | HTTPS / REST | PDF rendering |

---

## 5. Data Flow: Meal Plan Generation

```mermaid
sequenceDiagram
    participant Practitioner
    participant API
    participant NutritionModule
    participant Redis
    participant USDA
    participant DB
    participant EventBus
    participant ClientModule
    participant IntegrationModule
    participant Email
    participant PDF

    Practitioner->>API: POST /meal-plans/generate {clientId, macroTargets}
    API->>NutritionModule: GenerateMealPlanCommand
    NutritionModule->>Redis: Check USDA cache
    alt Cache miss
        NutritionModule->>USDA: Search foods, get nutrients
        USDA-->>NutritionModule: Nutrient data
        NutritionModule->>Redis: Cache nutrient profiles
    end
    NutritionModule->>DB: Load client restrictions (client_mgmt.clients)
    NutritionModule->>NutritionModule: Run constraint solver
    NutritionModule->>DB: Save MealPlan (nutrition.meal_plans)
    NutritionModule->>EventBus: Publish MealPlanGenerated
    EventBus->>ClientModule: Consume MealPlanGenerated
    ClientModule->>DB: Update client plan history
    Practitioner->>API: PUT /meal-plans/{id}/customize {swaps, portions}
    API->>NutritionModule: CustomizeMealPlanCommand
    NutritionModule->>NutritionModule: Recalculate nutrition
    NutritionModule->>DB: Update MealPlan
    NutritionModule->>EventBus: Publish PlanCustomized
    Practitioner->>API: POST /meal-plans/{id}/publish
    API->>ClientModule: PublishPlanCommand
    ClientModule->>DB: Update plan status = PUBLISHED
    ClientModule->>EventBus: Publish PlanPublished
    EventBus->>IntegrationModule: Consume PlanPublished
    IntegrationModule->>PDF: Render meal plan PDF
    PDF-->>IntegrationModule: PDF bytes
    IntegrationModule->>Storage: Store PDF
    IntegrationModule->>Email: Send PDF to client email
    Email-->>Client: Delivers email with PDF attachment
```

---

## 6. Deployment View

```
┌─────────────────────────────────────────────────────────────┐
│                    Kubernetes Namespace                      │
│  ┌─────────────────────────────────────────────────────┐    │
│  │                 MealPlanner API (Deployment)         │    │
│  │  Replicas: 3  |  Resources: 1 CPU, 2Gi RAM           │    │
│  │  Health: /actuator/health  |  Metrics: /actuator/prometheus  │    │
│  └─────────────────────────────────────────────────────┘    │
│                                                             │
│  ┌──────────────┐  ┌──────────────┐  ┌────────────────┐    │
│  │ PostgreSQL   │  │ Redis        │  │ Object Storage │    │
│  │ (Managed)    │  │ (Managed)    │  │ (S3/GCS)       │    │
│  └──────────────┘  └──────────────┘  └────────────────┘    │
└─────────────────────────────────────────────────────────────┘
```

**Environments:** `dev` → `staging` → `prod` (blue-green)
**CI/CD:** GitHub Actions → Build → Unit Test → Integration Test → Container Scan → Deploy staging → Manual approval → Deploy prod

---

## 7. Traceability

| Relationship | Artifact | Status |
|--------------|----------|--------|
| `DERIVES_FROM` | `ARCH-CTX-001` | `VALID` |
| `DERIVES_FROM` | `C4-SYSTEM-CONTEXT-001` | `VALID` |
| `REALIZES` | `ARCH-001`..`ARCH-004` (modules) | `VALID` |
| `EXPOSES` | `API-CONTRACT-001`, `API-CONTRACT-002` | `VALID` |
| `CONSUMES` | USDA, Auth0, Email, PDF contracts | `VALID` |
| `IMPLEMENTS` | `SPEC-001`..`SPEC-009` | `VALID` |

---

## 8. Evidence

| Evidence | Type | Source | Confidence |
|----------|------|--------|------------|
| Architecture Context | `DOCUMENT` | Architecture | `HIGH` |
| Technical spike (modular monolith) | `CODE` | Engineering | `HIGH` |
| Load test results | `SYSTEM` | Engineering | `MEDIUM` |
| Container image scan | `SYSTEM` | CI/CD | `HIGH` |

---

## 9. Review Status

```
Status: IN_REVIEW
Gate 3: PASSED_WITH_RISKS
```

---

## 10. Change History

| Version | Date | Change | Author |
|---------|------|--------|--------|
| `0.1` | `2025-01-26` | Initial container diagram | Agent |
| `0.2` | `2025-01-29` | Updated event flow after domain decision | Agent |