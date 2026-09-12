# Quantified Portfolio Findings

> Evidence layer for the flagship case studies. Dataset is synthetic/anonymized.

## Executive readout

The portfolio contains **500 applications**. **152 are approved (30.4%)** and **89 are disbursed (17.8%)**, leaving a **12.6 percentage-point gap** between approval and disbursement rates.

SLA performance is the largest operating signal: **272 applications (54.4%) are marked as SLA breaches**. This makes SLA risk a portfolio-level issue rather than a small exception queue.

## Funnel

| Metric | Result |
|---|---:|
| Applications | 500 |
| Approved | 152 |
| Approval rate | 30.4% |
| Disbursed | 89 |
| Disbursement rate | 17.8% |
| Approval → disbursement conversion | 58.6% |
| Approval-to-disbursal rate gap | 12.6 pp |
| SLA breaches | 272 |
| SLA breach rate | 54.4% |

### What the numbers imply

1. **The approval-to-disbursal step deserves investigation.** 58.6% of approved cases reach disbursement, so approval alone is not the end-state KPI.
2. **SLA is not healthy enough to treat as an edge case.** More than one in two applications breaches SLA.
3. **A single aggregate conversion metric hides operational leakage.** Partner, channel, city, product and stage cuts are required before changing the product flow.

## Recommended decisions

### 1. Prioritise post-approval leakage

Create an exception view for approved-but-not-disbursed cases. Segment by partner, product, channel and processing-time band. The first intervention should target the highest-volume root cause, not the most visually dramatic percentage.

### 2. Move operations to exception-led management

Because 54.4% of cases breach SLA, the operating model should prioritise P0/P1 cases and identify repeatable hotspots by partner and city.

### 3. Use partner performance for allocation decisions

Avoid allocating solely on volume. Balance conversion, SLA adherence, processing efficiency and estimated revenue so that growth does not amplify operational failure.

## Measurement plan

Track weekly:

- Approval rate
- Approval → disbursement conversion
- Disbursement rate
- P50 / P75 / P90 processing days
- SLA breach rate
- Exception backlog and ageing
- Partner allocation score
- API issue rate

## Data integrity note

The headline figures above are calculated from the portfolio dataset in this repository. They are portfolio-analysis results, not claimed production outcomes. Any production recommendation would require validation against real event definitions, policy constraints, credit-quality metrics and operational capacity.
