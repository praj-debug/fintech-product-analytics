# 03 — Lending Operations Control Tower

> **Case study:** How can Product Operations move from reactive case chasing to proactive exception management?

## Executive Summary

This case study defines an executive operating layer for a digital lending business. Instead of presenting disconnected KPIs, the control tower connects **funnel health, TAT, SLA breaches, partner performance, disbursement, and exceptions** into one decision surface.

## Operating Model

```text
                    CONTROL TOWER
                          │
        ┌─────────────────┼─────────────────┐
        ↓                 ↓                 ↓
     FUNNEL            OPERATIONS        PARTNERS
        │                 │                 │
 Conversion          TAT / SLA       Conversion / Value
        │                 │                 │
        └─────────────────┼─────────────────┘
                          ↓
                   EXCEPTION QUEUE
                          ↓
                 OWNER → ACTION → ETA
```

## Executive KPI Layer

| KPI | Purpose | Action trigger |
|---|---|---|
| Applications | Demand | Volume anomaly |
| Approval rate | Funnel quality | Material variance |
| Disbursement rate | Realized conversion | Conversion drop |
| P75 TAT | Long-tail efficiency | SLA risk |
| SLA breach rate | Service health | Threshold breach |
| Disbursed value | Business output | Target variance |
| API failure rate | Technology health | Reliability threshold |
| Exception backlog | Operational risk | Queue ageing |

## Dashboard Design

### Page 1 — Executive Pulse

- KPI cards with current value vs target
- Funnel conversion
- TAT trend
- SLA breach trend
- Disbursed value
- Top operational risks

### Page 2 — Partner Performance

- Partner scorecard
- Conversion vs volume matrix
- SLA/TAT comparison
- High-value exception cases

### Page 3 — Operations Queue

- Ageing buckets
- SLA-at-risk cases
- Stuck-stage distribution
- Owner / queue workload
- Priority exceptions

## Exception Logic

A case should be surfaced when one or more conditions are met:

- approaching SLA threshold,
- already breached SLA,
- stuck in the same stage beyond expected TAT,
- repeated API failure,
- high-value application at risk,
- partner-specific performance anomaly.

## Product Operations Workflow

**Detect → Diagnose → Assign → Resolve → Measure**

Every exception should have an owner, expected resolution time, root-cause category, and closure outcome.

## Success Metrics

- Reduction in P75/P90 processing TAT
- Reduction in SLA breach rate
- Reduction in aged exception backlog
- Improvement in approval-to-disbursement conversion
- Reduction in repeat operational issues
- Increased cases resolved within SLA

## Why this matters

The dashboard is not the deliverable. The operating decision is.

A mature control tower should help a team answer within minutes:

1. **What is breaking?**
2. **Where is it happening?**
3. **Who owns it?**
4. **What should happen next?**
5. **Did the intervention improve the metric?**

## Data

Synthetic/anonymized portfolio dataset. No confidential customer or company data is used.
