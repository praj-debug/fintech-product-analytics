# 02 - Partner Performance & Allocation Engine

> **Decision question:** Which lending partners should receive more business, more support, or corrective action?

## Executive Summary

Partner performance should not be judged by lead volume alone. This case study combines volume, approval, disbursement, SLA, processing efficiency and estimated revenue into a weighted allocation score.

The portfolio baseline is **500 applications, 152 approvals and 89 disbursements**. The analysis is designed to turn partner reporting into an allocation mechanism while keeping customer experience and operational capacity in the decision.

## Business Problem

Two partners can generate the same number of applications while producing very different outcomes. The operating question is not simply who sent the most leads. It is **where should the next unit of allocation and partner-management effort go?**

## Scorecard

| Dimension | Weight | Decision role |
|---|---:|---|
| Disbursement performance | 25% | Realized business outcome |
| Approval performance | 15% | Funnel quality |
| SLA adherence | 20% | Customer and operations reliability |
| Processing TAT | 15% | Operational efficiency |
| Estimated revenue | 25% | Commercial contribution |

Scores are normalized across partners so a large revenue or volume number does not automatically dominate every dimension.

## Allocation Logic

```text
Partner metrics
      ↓
Normalize performance
      ↓
Weighted score
      ↓
Volume × conversion segmentation
      ↓
Allocation / support / corrective action
```

## Partner Segmentation

| Segment | Signal | Default action |
|---|---|---|
| Strategic | High score + meaningful volume | Increase allocation + joint growth plan |
| Growth | Strong conversion + lower volume | Controlled allocation test |
| Optimize | High volume + weak conversion or TAT | Diagnose before increasing volume |
| Review | Low score or persistent service risk | Corrective plan / reassess |

## Analytical Approach

1. Establish partner-level baseline metrics.
2. Normalize performance across partners.
3. Apply weighted scoring using SQL window functions.
4. Compare conversion, SLA, TAT and revenue together.
5. Identify partners that create high business value but also operational risk.
6. Translate the score into allocation decisions and measurable improvement plans.

## Why the weights need a sensitivity check

The weights are business assumptions, not universal truths. A growth-focused team may value disbursement more, while a customer-experience team may put more weight on SLA and TAT.

The [sensitivity analysis](sensitivity_analysis.md) tests reasonable weighting scenarios and defines when a score should be treated as a decision aid rather than an automatic allocation rule.

## SQL

The reusable scorecard query is in [`analysis/portfolio_kpi_queries.sql`](../../analysis/portfolio_kpi_queries.sql), including normalization and a weighted allocation score.

## Product Artifact

A production implementation would expose:

- current partner score
- score movement week over week
- allocation received
- disbursement yield
- SLA risk
- estimated value
- recommended action

This gives partner managers a way to discuss **decisions and trade-offs**, rather than manually reconciling spreadsheets.

## Success Metrics

- Disbursement conversion
- Incremental disbursed value per allocated lead
- P75 processing TAT
- SLA breach rate
- Estimated revenue per allocated lead
- Allocation-to-disbursement efficiency

## Portfolio Takeaway

The useful part of a partner scorecard is not the number itself. It is whether the score changes who gets attention, volume or corrective action, and whether those decisions are measured afterward.

## Data Disclaimer

All data is synthetic or anonymized. The framework demonstrates decision logic and does not claim production partner performance or commercial results.
