# 01 — Digital Lending Funnel Optimization

> **Decision question:** Where is the lending journey leaking volume, and which intervention should be prioritised first?

## Executive Summary

This case study treats lending as a measurable product funnel rather than a collection of operational stages. The synthetic portfolio contains **500 applications**: **152 approvals (30.4%)** and **89 disbursements (17.8%)**. Only **58.6% of approved applications reach disbursement**, creating a **12.6 percentage-point gap** between approval and disbursement rates.

The second major signal is operational: **272 of 500 applications (54.4%) breach SLA**. The recommendation is therefore not “improve conversion” in isolation. It is to diagnose post-approval leakage and high-volume SLA hotspots together, then instrument interventions against conversion, TAT and guardrails.

## Business Problem

A lending funnel can appear healthy at the top while losing value later through document friction, partner delays, operational queues, integration issues or unresolved exceptions.

The objective is to identify **where volume and value are lost**, quantify the operational cost of that leakage, and define product/operations interventions that can be measured after rollout.

## Funnel Snapshot

```text
500 applications
       ↓
152 approved  | 30.4% of applications
       ↓
89 disbursed | 58.6% of approved
```

## KPI Framework

| KPI | Why it matters |
|---|---|
| Approval rate | Measures movement through credit decisioning |
| Approval → disbursement conversion | Exposes post-approval leakage |
| Disbursement rate | End-to-end funnel outcome |
| P50 / P75 / P90 TAT | Shows typical vs tail operational friction |
| SLA breach rate | Measures service reliability |
| Exception backlog | Quantifies unresolved operational risk |

## Analytical Approach

1. Establish the portfolio funnel.
2. Compare approval with final disbursement outcome.
3. Cut performance by partner, channel, product and city.
4. Compare processing-time distributions, not just averages.
5. Identify SLA/API/UAT exception hotspots.
6. Prioritise interventions using customer impact × business impact × implementation effort.

## Quantified Findings

- **500** applications in the portfolio.
- **30.4%** approval rate.
- **17.8%** end-to-end disbursement rate.
- **58.6%** approval-to-disbursement conversion.
- **54.4%** SLA breach rate.
- **12.6 pp** gap between approval rate and disbursement rate.

Full evidence: [`insights/quantified_findings.md`](../../insights/quantified_findings.md).

## Product / Operations Recommendation

### Priority 1 — Create an approved-but-not-disbursed recovery queue

Segment approved-but-not-disbursed applications by partner, channel, product and processing-time band. Give each exception an owner and next action.

### Priority 2 — Attack repeatable SLA hotspots

Use partner × city × stage cuts to find recurring breach clusters. Do not treat every breach as a unique case if the same root cause is repeating.

### Priority 3 — Instrument the intervention

Measure whether the intervention improves approval-to-disbursement conversion and P75 TAT without increasing API failures, approval-quality risk or operational backlog.

## Measurement Plan

**Primary outcome:** approval → disbursement conversion.

**Secondary:** disbursement rate, P75 processing days, SLA breach rate, exception ageing.

**Guardrails:** API issue rate, approval quality, operational workload.

## SQL

Core analysis is maintained in [`analysis/funnel_analysis.sql`](../../analysis/funnel_analysis.sql), with the reusable KPI layer in [`analysis/portfolio_kpi_queries.sql`](../../analysis/portfolio_kpi_queries.sql).

## Portfolio Takeaway

The important insight is not that conversion is low. It is that **approval is not the final product outcome**. A product-operations analyst should trace the journey through disbursement, connect leakage to operational causes, assign ownership and define how the change will be measured.

## Data Disclaimer

All data is synthetic or anonymized. No confidential customer, company, partner or proprietary operational information is represented, and the quantified results above are not claimed production outcomes.
