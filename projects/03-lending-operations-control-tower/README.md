# 03 - Lending Operations Control Tower

> **Decision question:** How can Product Operations move from reactive case chasing to proactive exception management?

## Executive Summary

The portfolio contains **500 applications**, with **54.4% (272 cases) marked as SLA breaches**. That is too large a population to manage through manual case-by-case follow-up.

The control-tower design turns the portfolio into an exception-led operating model: **detect → diagnose → assign → resolve → measure**. The goal is to make the dashboard a decision surface, not another spreadsheet with better typography.

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

| KPI | Portfolio signal | Action use |
|---|---:|---|
| Applications | 500 | Demand baseline |
| Approval rate | 30.4% | Funnel quality |
| Disbursement rate | 17.8% | Realized conversion |
| Approval → disbursement | 58.6% | Post-approval leakage |
| SLA breach rate | 54.4% | Service health |
| P75 TAT | Dashboard metric | Long-tail efficiency |
| API issue rate | Dashboard metric | Technology health |
| Exception backlog | Dashboard metric | Operational risk |

## Dashboard

The repository includes a dashboard specification in [`dashboard/dashboard_spec.md`](../../dashboard/dashboard_spec.md) and a portfolio visual in [`visuals/portfolio_dashboard.svg`](../../visuals/portfolio_dashboard.svg).

## Exception Logic

Surface a case when one or more conditions are met:

- SLA breached or approaching breach
- stuck beyond expected processing time
- API issue affecting the application
- UAT or readiness dependency pending
- high-value application at risk
- repeatable partner, city or product hotspot

## Priority Model

| Priority | Trigger | Action |
|---|---|---|
| P0 | API issue + SLA breach | Tech + Ops escalation |
| P1 | SLA breach | Queue reprioritisation |
| P1 | API issue | Integration investigation |
| P2 | UAT pending | Readiness follow-up |

A [worked exception queue example](exception_queue_example.md) shows how the signal can be turned into an owner, next action and target resolution time. The example is illustrative and is not presented as a production incident log.

## Product Operations Workflow

**Detect → Diagnose → Assign → Resolve → Measure**

Every exception should have an owner, next action, expected resolution time, root-cause category and closure outcome.

Repeated exceptions should also feed back into product, partner or engineering priorities. Otherwise the team is just closing the same problem under different application IDs.

## Success Metrics

- Reduce SLA breach rate
- Reduce P75 and P90 processing TAT
- Reduce aged exception backlog
- Improve approval-to-disbursement conversion
- Reduce repeat operational issues
- Increase the percentage of cases resolved within SLA

## Portfolio Takeaway

The quantified **54.4% SLA breach rate** is the reason an exception-led operating model is justified in this dataset. The useful next step is to identify the partner, city, stage and technology patterns behind those breaches and route them to owners.

## Data Disclaimer

All data is synthetic or anonymized. Quantified figures describe this portfolio dataset and are not claimed production results.
