# Agent Procedure — How the Agent Works With the Skill

Purpose: define the agent's working protocol when Spec-Gated Architecture Lifecycle is active: the procedure, the formats, the minimal-question policy, the escalation rules, and the usage contract. This reference expands `SKILL.md` §8 and captures the agent-facing protocol that is not duplicated elsewhere.

---

## 1. Agent Working Procedure

For every significant request:

### Step 1 — Understand
Determine: user intent, project context, current state, desired state, affected area.

### Step 2 — Classify
Determine: change scope, risk, complexity, reversibility, lifecycle phase. Use `references/triage-routing.md` to pick the smallest lane (L0–L4, SPIKE).

### Step 3 — Inspect Evidence
Inspect the smallest authoritative set of relevant project files, documentation, contracts, decisions, specifications, implementation, and tests.

### Step 4 — Identify Unknowns
Record missing information that materially affects the decision. Do not fabricate it.

### Step 5 — Analyze
Evaluate alternatives, consequences, dependencies, risks, compatibility, and traceability.

### Step 6 — Decide or Recommend
- If authority exists (within the decision boundary): record the decision.
- If authority does not exist: provide a **recommendation** (see §2 for format) and identify the required decision.

Never label a recommendation as accepted unless explicitly authorized.

### Step 7 — Update Artifacts
Update the smallest authoritative set of documents that the change affects.

### Step 8 — Validate
Check consistency, traceability, evidence, and downstream impact.

### Step 9 — Gate
The review produces findings and a review outcome; the gate receives that evaluation and transitions to a canonical gate state.

Review outcomes:
```text
READY
READY_WITH_RISKS
INCOMPLETE
BLOCKED
```

Gate states after evaluation:
```text
PASSED
PASSED_WITH_RISKS
BLOCKED
WAIVED
```

### Step 10 — Implement Only When Appropriate
Implementation follows approved understanding. Only `APPROVED` specifications are implementable.

---

## 2. Minimal Question Policy

Ask questions only when the missing information materially affects:
- product behavior,
- domain meaning,
- architecture,
- contracts,
- security,
- data ownership,
- release safety,
- difficult-to-reverse decisions.

Avoid unnecessary interrogation. When possible, ask the **smallest question that resolves the decision**.

---

## 3. Recommendation Format

```text
Recommendation:
<recommended option>

Why:
<reason>

Alternatives:
<alternatives>

Trade-offs:
<trade-offs>

Risks:
<risks>

Reversibility:
<reversibility>

Decision Required:
<decision>
```

---

## 4. Finding Format

```text
Finding:
<finding>

Severity:
<INFO / WARNING / SIGNIFICANT / BLOCKING>

Evidence:
<evidence>

Impact:
<impact>

Affected Artifacts:
<artifacts>

Recommended Action:
<action>
```

---

## 5. Escalation Rules

### 5.1 Implementation escalation
Before implementing a requested change, ask:

> **Can this change be implemented without introducing unsupported product, domain, architecture, contract, security, data, or operational assumptions?**

- If yes: proceed at the appropriate implementation level.
- If no: identify the smallest unresolved decision or artifact and address it first.

### 5.2 Architecture escalation
Escalate when implementation or specification work reveals:
- a new architectural boundary,
- a new consistency model,
- a new data owner,
- a new trust boundary,
- a new external contract,
- a new reliability guarantee,
- a new integration pattern,
- a new distributed transaction,
- a new major infrastructure dependency,
- a difficult-to-reverse architectural choice.

Do not bury these decisions inside implementation. Escalate to an ADR via `references/decision-governance.md`.

### 5.3 Release escalation
Escalate when release evaluation reveals:
- an unmet critical requirement,
- a critical security issue,
- a data integrity risk,
- a contract incompatibility,
- a failed migration,
- missing critical infrastructure,
- an unsupported recovery assumption,
- an unauthorized architecture change,
- missing authority.

---

## 6. Safe Progression

Before moving to another phase, ask:

> **Do we have enough evidence-based understanding to continue without introducing unsupported assumptions?**

Possible answers: `YES`, `YES_WITH_RISKS`, `NO`. If `NO`, identify what must be resolved.

---

## 7. Completion Criteria

The lifecycle is complete for a given release or implementation scope when:
- product intent is sufficiently understood,
- domain boundaries are sufficiently understood,
- architecture is sufficiently defined,
- relevant contracts are explicit,
- consequential decisions are governed,
- implementation-relevant specifications are available,
- required infrastructure is ready,
- release readiness has been evaluated,
- verification evidence exists,
- risks are explicit,
- traceability is sufficient,
- final decisions are authorized.

Completion does not mean the architecture is permanent.

---

## 8. Skill Usage Contract

When the skill is active, the agent behaves as:

```text
Discover → Understand → Classify → Analyze → Decide/Recommend → Document → Validate → Gate → Implement/Continue
```

The agent must **not** behave as:

```text
Request → Generate Code
```

unless the request is genuinely local (L0) and does not require unresolved lifecycle reasoning.

The skill must remain independent of any programming language, framework, cloud provider, database, messaging technology, deployment platform, infrastructure-as-code tool, or testing framework. Technology may appear in project artifacts only when explicitly selected. The skill must not embed assumptions from any specific project: project-specific information belongs in the consuming project's workspace.

---

## 9. References

- `SKILL.md` §0 triage router — lane selection that precedes this procedure.
- `references/triage-routing.md` — lanes and STOP thresholds.
- `references/decision-governance.md` — decision authority and ADR escalation.
- `references/lifecycle.md` — phases, entry modes, completion.