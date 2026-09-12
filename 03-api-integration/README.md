# 04 — API Reliability & Lending Operations

> **Case study:** When an integration fails, how do Product and Operations quantify the customer and business impact and decide what to fix first?

## Executive Summary

Digital lending journeys depend on APIs across lead intake, KYC, credit checks, underwriting, sanction, and disbursement. A technically small failure can become a customer-facing operational problem when it creates retries, stuck applications, manual intervention, or delayed disbursement.

This case study frames API health as a **product and operations metric**, not merely an engineering dashboard.

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
| API Success Rate | Successful requests / total requests | Reliability baseline |
| Failure Rate | Failed requests / total requests | Identify instability |
| P95 Latency | 95th percentile response time | Capture long-tail experience |
| Retry Rate | Retried requests / total requests | Detect avoidable friction |
| Timeout Rate | Timed-out requests / total requests | Identify latency risk |
| Recovery Time | Time from failure to resolution | Operations efficiency |
| Customer Impact Rate | Affected applications / applications | Business impact |

## Example API Contract

```json
{
  "application_id": "APP1001",
  "partner_id": "PARTNER_A",
  "loan_type": "Education Loan",
  "requested_amount": 2500000,
  "source": "Partner_API"
}
```

## Root-Cause Framework

Classify failures into:

- Partner payload / schema issue
- Authentication / authorization
- Timeout / latency
- Downstream dependency
- Validation failure
- Duplicate request
- Unknown / infrastructure

Then connect each category to **applications affected, TAT impact, and disbursement impact**.

## Product Operations Response

### P0
Repeated failures blocking a critical lending stage or high-value application flow.

### P1
Material degradation with workaround available.

### P2
Low-impact or isolated issue that can be addressed through normal backlog prioritization.

## Recommendations

1. Set stage-specific latency and failure thresholds.
2. Introduce alerts for repeated failures and abnormal partner-level error rates.
3. Use idempotent retry handling for recoverable failures.
4. Surface application-level impact alongside technical error metrics.
5. Create an escalation path linking Product, Engineering, Partner, and Operations owners.
6. Track time-to-recovery and repeat incidents as operating KPIs.

## Success Metrics

- API success rate
- P95 latency
- Retry rate
- Mean time to recovery
- Applications blocked by integration failures
- SLA breach rate attributable to API issues
- Disbursement conversion for affected vs unaffected cases

## Tools & Concepts

REST APIs • JSON • Postman • API monitoring • Digital lending • Partner integrations • SLA/TAT • Incident management

## Data

Examples are synthetic and illustrative. No confidential customer, partner, or company information is included.
