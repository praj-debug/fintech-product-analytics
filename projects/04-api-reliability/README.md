# 04 — API Reliability & Lending Operations

> **Decision question:** When an integration fails, how should Product and Operations quantify the customer/business impact and decide what to fix first?

## Executive Summary

This case study connects API reliability to lending outcomes. The portfolio already exposes an `api_issue` signal, so API problems can be compared with SLA status, processing time, partner, product and disbursement outcome rather than treated as isolated technical events.

The key principle is **application impact over raw request counts**: an API failure that blocks a high-value application or creates an SLA breach deserves a different response from a recoverable technical error.

## Workflow

```text
Customer / Partner
        ↓
Application API
        ↓
Loan Origination System
        ↓
KYC / Credit API
        ↓
Decisioning
        ↓
Sanction
        ↓
Disbursement
```

## Reliability Metrics

| Metric | Definition | Decision use |
|---|---|---|
| API issue rate | Affected applications / applications | Business-impact baseline |
| Processing TAT | Processing duration | Customer/ops impact |
| SLA breach rate | Breached applications / applications | Escalation |
| Affected disbursement rate | Disbursed affected cases / affected cases | Outcome impact |
| Partner issue rate | API-issue cases / partner applications | Integration health |
| Product issue rate | API-issue cases / product applications | Journey hotspot |

## Analytical Query

The portfolio KPI layer includes an exception query that combines API issues with SLA and UAT signals. This makes it possible to identify cases where technology friction is also an operational breach.

See [`analysis/portfolio_kpi_queries.sql`](../../analysis/portfolio_kpi_queries.sql).

## Product Operations Response

### P0
API issue + SLA breach on a critical lending stage. Escalate jointly to Engineering and Operations.

### P1
Material integration issue without immediate SLA breach. Investigate dependency, payload, retry or partner pattern.

### P2
Isolated low-impact issue. Track through the normal product/engineering backlog.

## Product Artifact — Incident Decision Record

```text
SIGNAL
API issue detected
   ↓
IMPACT
Applications affected + SLA status + loan value
   ↓
DIAGNOSIS
Partner / stage / product / failure category
   ↓
ACTION
Retry | manual recovery | partner fix | engineering fix
   ↓
MEASURE
Recovery time + SLA recovery + disbursement outcome
```

## Recommendations

1. Set stage-specific API reliability thresholds.
2. Alert on repeated partner-level failures rather than individual noise.
3. Use idempotent retry handling for recoverable failures.
4. Put application-level business impact beside technical metrics.
5. Link Product, Engineering, Partner and Operations ownership.
6. Track repeat incidents and time-to-recovery as operating KPIs.

## Portfolio Takeaway

The senior signal is knowing that **API reliability is not just an engineering metric**. In lending, reliability becomes a product metric when failures create customer friction, SLA breaches, manual work or lost disbursement value.

## Data Disclaimer

The repository uses synthetic/anonymized data and does not claim production incident counts, API uptime or engineering outcomes.
