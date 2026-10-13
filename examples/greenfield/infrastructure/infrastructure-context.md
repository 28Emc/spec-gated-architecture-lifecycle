# Infrastructure Context — MealPlanner Pro

## 1. Document Metadata

| Field | Value |
|-------|-------|
| Document ID | `INF-CTX-001` |
| Version | `0.2` |
| Status | `IN_REVIEW` |
| Created | `2025-01-29` |
| Updated | `2025-01-30` |
| Project | MealPlanner Pro |
| Lifecycle Phase | Infrastructure |
| Owner | Technical Lead |
| Reviewers | Architect, Security Officer, Operations |

---

## 2. Purpose

Define the infrastructure context required to build, deploy, operate, and observe MealPlanner Pro. This is the Phase 7 infrastructure context — realizing the Phase 6 infrastructure specification.

---

## 3. Infrastructure Scope

**In Scope (MVP):**
- Kubernetes cluster (EKS/GKE) for API deployment
- Managed PostgreSQL (RDS/Cloud SQL) for persistence
- Managed Redis (ElastiCache) for caching/sessions
- Object Storage (S3/GCS) for PDFs/templates
- CI/CD pipeline (GitHub Actions)
- Monitoring stack (Prometheus, Grafana, Alertmanager)
- Logging (Loki/OpenTelemetry Collector)
- TLS certificates (managed)
- Secrets management (Secrets Manager / Vault)
- DNS / Load Balancer

**Out of Scope (MVP):**
- Multi-region deployment
- Disaster recovery automation
- Advanced autoscaling (KEDA)
- Service mesh (Istio/Linkerd)
- Chaos engineering platform

---

## 4. Environments

| Environment | Purpose | Infrastructure | Promotion |
|-------------|---------|----------------|-----------|
| `dev` | Developer integration, feature testing | Shared cluster (namespace), shared DB (schema-per-dev) | Auto on merge to `main` |
| `staging` | Pre-production validation, contract tests | Dedicated cluster, dedicated DB, production-like data | Manual approval |
| `prod` | Production traffic | Dedicated cluster, dedicated DB, HA config | Manual approval (blue-green) |

**Environment Parity:** Staging mirrors prod configuration (scaled down). Dev uses shared resources.

---

## 5. Compute

| Component | Specification | Rationale |
|-----------|---------------|-----------|
| **Kubernetes** | EKS (AWS) or GKE (GCP), 3 node pools | Managed control plane, node autoscaling |
| **API Pods** | Deployment, 3 replicas, 1 CPU / 2Gi RAM | HA, rolling updates, resource limits |
| **Init Containers** | DB migration (Flyway/Liquibase) | Schema versioning per context |
| **Sidecars** | OpenTelemetry Collector (optional) | Observability |

**Autoscaling (MVP):**
- HPA: CPU > 70% → scale to 10 replicas
- **WAIVED:** Production autoscaling policy not finalized — manual scaling documented for initial release. Review before public launch.

---

## 6. Persistence

| Database | Engine | Configuration | Backup |
|----------|--------|---------------|--------|
| **Primary** | PostgreSQL 16 (Managed) | Multi-AZ, 100 GiB, encryption at rest | Automated daily snapshots, 30-day retention, PITR |
| **Cache** | Redis 7 (Managed) | Cluster mode disabled, 10 GiB, encryption | No persistence (cache only) |

**Schemas:** `nutrition`, `client_mgmt`, `compliance`, `integration`, `shared`
**Migrations:** Flyway (per-schema), run in init container on deploy

---

## 7. Networking

| Element | Specification |
|---------|---------------|
| **VPC** | Dedicated per environment, private subnets for pods/DB |
| **Load Balancer** | ALB (AWS) / Cloud Load Balancing (GCP), TLS termination |
| **Ingress** | NGINX Ingress Controller, path-based routing |
| **Egress** | NAT Gateway for USDA API, Auth0, Email, PDF services |
| **Service Mesh** | None (MVP) — in-process comm, mTLS not required |
| **Network Policies** | Kubernetes NetworkPolicy: deny-all default, explicit allow |

---

## 8. Configuration & Secrets

| Mechanism | Scope | Examples |
|-----------|-------|----------|
| **ConfigMaps** | Non-sensitive | Feature flags, timeouts, USDA API base URL |
| **Secrets Manager** | Sensitive | DB password, Redis password, Auth0 client secret, USDA API key, Email API key, PDF API key, JWT signing key |
| **External Secrets Operator** | Sync | Secrets Manager → K8s Secrets |

**Rotation:** Automated for DB/Redis (managed). Manual for API keys (quarterly).

---

## 9. CI/CD Pipeline

```
GitHub Actions Workflow:
1. Build: Compile, unit test, static analysis (SonarQube)
2. Container: Build image, scan (Trivy), sign (cosign)
3. Test: Integration tests (staging), contract tests (Pact)
4. Security: SAST, dependency scan, container scan
5. Deploy Staging: Helm upgrade, smoke tests
6. Manual Approval: Product Owner + Security
7. Deploy Prod: Blue-green (Argo Rollouts / Helm), canary 10% → 100%
8. Post-Deploy: Health checks, synthetic tests
```

**Branching:** `main` → staging → `release/*` tags → prod

---

## 10. Observability

| Pillar | Implementation |
|--------|----------------|
| **Metrics** | Prometheus (kube-prometheus-stack), ServiceMonitors, custom app metrics |
| **Logs** | Loki + OpenTelemetry Collector, structured JSON, retention 30 days |
| **Traces** | Tempo, OpenTelemetry SDK, W3C TraceContext propagation |
| **Alerts** | Alertmanager → PagerDuty/Slack, runbooks linked |
| **Dashboards** | Grafana: API health, generation latency, USDA cache, error rates, infra |

---

## 11. Security Infrastructure

| Control | Implementation |
|---------|----------------|
| **TLS** | ALB terminates TLS 1.2+, cert-manager (Let's Encrypt) or ACM |
| **mTLS** | Not in MVP (in-process comm). Planned for service extraction. |
| **Secrets** | AWS Secrets Manager / GCP Secret Manager, rotation for DB |
| **WAF** | AWS WAF / Cloud Armor: rate limiting, IP allowlist for admin |
| **Network Policy** | Default deny, explicit allow per module |
| **Image Security** | Trivy scan in CI, cosign signing, admission controller (Kyverno) |

---

## 12. Resilience & Recovery

| Capability | MVP Status |
|------------|------------|
| **Health Checks** | `/actuator/health` (liveness, readiness, startup) |
| **Graceful Shutdown** | SIGTERM handling, connection drain (30s) |
| **Circuit Breakers** | Resilience4j / Polly: USDA, Email, PDF adapters |
| **Retry/Timeout** | Exponential backoff (max 3 retries), timeout per adapter |
| **Backup** | Managed DB: daily snapshots, 30-day retention, PITR |
| **Recovery** | RPO: 24h (snapshot), RTO: < 2h (restore + migrate) |
| **Rollback** | Blue-green: instant traffic switch; Helm rollback < 5 min |

---

## 13. Operational Requirements

| Requirement | Specification |
|-------------|---------------|
| **Runbooks** | Deploy, rollback, scale, DB restore, cert rotation, incident response |
| **On-Call** | Primary + secondary, PagerDuty escalation |
| **Capacity** | Baseline: 3 pods, 100 GiB DB. Growth: +2 pods per 20 practitioners |
| **Cost Monitoring** | AWS Cost Explorer / GCP Billing, alerts at 80% budget |
| **Compliance** | Encryption at rest/transit, audit logs, access reviews quarterly |

---

## 14. Phase 6 vs Phase 7 Boundary

| Aspect | Phase 6 (Specification) | Phase 7 (This Document) |
|--------|-------------------------|-------------------------|
| **Purpose** | *What* infrastructure capabilities required | *How* infrastructure is realized, operated |
| **Source** | Derived from Architecture, Contracts, ADRs | Derived from Phase 6 spec + operational needs |
| **Example** | "Managed PostgreSQL, encryption, multi-AZ" | "RDS PostgreSQL 16, Multi-AZ, 100 GiB, KMS key X, snapshot schedule Y" |
| **Example** | "CI/CD with security scans" | "GitHub Actions: build → scan → test → deploy staging → manual → prod blue-green" |

---

## 15. Traceability

| Relationship | Artifact | Status |
|--------------|----------|--------|
| `DERIVES_FROM` | `SPEC-008` (Deployment Spec) | `VALID` |
| `DERIVES_FROM` | `SPEC-006` (Observability Spec) | `VALID` |
| `DERIVES_FROM` | `SPEC-005` (Security Spec) | `VALID` |
| `DERIVES_FROM` | `SPEC-007` (Configuration Spec) | `VALID` |
| `REALIZES` | Phase 6 Infrastructure Specification | `VALID` |
| `CONSTRAINS` | `ADR-001`, `ADR-004`, `ADR-005` | `VALID` |
| `VERIFIED_BY` | Infrastructure Readiness Review | `VALID` |

---

## 16. Evidence

| Evidence | Type | Source | Confidence |
|----------|------|--------|------------|
| Architecture Context | `DOCUMENT` | Architecture | `HIGH` |
| Phase 6 Infrastructure Spec | `DOCUMENT` | Specifications | `HIGH` |
| Cloud provider quotes | `DOCUMENT` | Vendor | `HIGH` |
| Load test results | `SYSTEM` | Engineering | `MEDIUM` |

---

## 17. Infrastructure Readiness Review Status

```
Gate: GATE-7 — Infrastructure
Status: PASSED_WITH_RISKS

Satisfied:
✓ Development environment defined
✓ Runtime environment (K8s, managed DB, Redis, storage)
✓ Deployment strategy (blue-green)
✓ Networking (VPC, ALB, private subnets)
✓ Configuration (ConfigMaps, Secrets Manager)
✓ Secrets management
✓ Persistence (PostgreSQL, Redis)
✓ CI/CD pipeline
✓ Observability (metrics, logs, traces, alerts)
✓ Security (TLS, WAF, network policies, image scanning)
✓ Backup/recovery (RPO 24h, RTO 2h)
✓ Resilience (circuit breakers, retries, health checks)

Non-Blocking Risks (WAIVED):
⚠ Production autoscaling policy not finalized
  - Waiver: Initial release has controlled internal traffic
  - Risk: Manual scaling required during load spikes
  - Mitigation: Documented scaling procedure, monitoring alerts
  - Review: Before public launch

Required Follow-Up:
1. Finalize HPA/KEDA configuration (Sprint 4)
2. Load test at projected scale (Sprint 4)
3. Document runbooks (Sprint 3)
```