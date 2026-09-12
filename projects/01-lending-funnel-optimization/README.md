# 01 — Digital Lending Funnel Optimization

> **Case study:** How should a lending product reduce drop-off and improve end-to-end conversion without adding operational load?

## Executive Summary

This case study treats the lending journey as a product funnel rather than a reporting problem. The analysis connects stage conversion, turnaround time, SLA adherence, partner/channel mix, and disbursement outcomes to identify where intervention is most likely to create business value.

The goal is to move from **funnel signal → root cause → product decision → measurement plan**.

## Business Problem

A digital lending funnel can lose customers for very different reasons: friction in document collection, slow operational queues, integration failures, weak lead quality, or delays between approval and disbursement.

A single approval-rate KPI does not explain where the customer experience breaks.

### Decision to support

**Which stages and segments should Product + Operations prioritize first, and what should change?**

## Journey

```text
Lead
  ↓
Application
  ↓
Documents
  ↓
Verification
  ↓
Credit Decision
  ↓
Sanction
  ↓
Disbursement
```

## KPI Framework

| KPI | Definition | Decision use |
|---|---|---|
| Application → Approval | Approved / Applications | Overall credit conversion |
| Approval → Disbursement | Disbursed / Approved | Post-approval leakage |
| End-to-end Conversion | Disbursed / Applications | North-star funnel outcome |
| Stage Drop-off | Lost cases / entering cases | Prioritize friction |
| Processing TAT | Elapsed processing time | Operations efficiency |
| P50 / P75 / P90 TAT | Distribution percentiles | Detect long-tail delays |
| SLA Breach Rate | Breached cases / eligible cases | Escalation priority |

## Analytical Approach

1. Build a consistent funnel from the application-level dataset.
2. Quantify stage-to-stage conversion rather than relying on volume alone.
3. Compare outcomes by partner, channel, city, product, and loan amount.
4. Separate average TAT from tail latency using P50/P75/P90.
5. Overlay SLA breaches and API issues to locate operational hotspots.
6. Translate the strongest signals into product and process interventions.

## SQL

See [`analysis/funnel_analysis.sql`](../../analysis/funnel_analysis.sql) for the base queries.

The portfolio intentionally uses SQL patterns that would support an analytics workflow in production: conditional aggregation, window functions, segmentation, and exception analysis.

## Decision Framework

### Prioritization matrix

| Opportunity | Customer pain | Business impact | Operational effort | Priority |
|---|---:|---:|---:|---|
| Document-status visibility | High | High | Medium | P0 |
| SLA exception queue | High | High | Low | P0 |
| Proactive document reminders | High | Medium | Medium | P1 |
| Partner/channel quality rules | Medium | High | Medium | P1 |
| Post-approval tracking | Medium | High | Low | P1 |

## Product Recommendation

Build an **exception-led lending operations layer** rather than asking operations teams to inspect every application manually.

The product should surface:

- applications approaching SLA breach,
- incomplete or repeatedly rejected documents,
- applications stuck between workflow stages,
- partner/channel segments with unusually low conversion,
- API failures affecting otherwise healthy applications.

This turns analytics into an operating mechanism.

## Measurement Plan

A successful change should move the following metrics:

**Primary:** end-to-end disbursement conversion and P75 processing TAT.

**Secondary:** document completion rate, SLA breach rate, approval-to-disbursement conversion.

**Guardrails:** approval quality, complaint/contact rate, exception backlog.

## Portfolio Takeaway

The point of the analysis is not to report that a funnel has leakage. The useful output is a defensible answer to **where to intervene, why, what to change, and how to know the change worked**.

## Data

Synthetic/anonymized portfolio dataset. No confidential customer or company data is used.
