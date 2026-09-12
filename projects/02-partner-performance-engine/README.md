# 02 — Partner Performance & Allocation Engine

> **Case study:** Which lending partners should receive more business, more support, or corrective action?

## Executive Summary

Partner performance should not be judged by lead volume alone. This case study builds a decision framework combining **volume, conversion, disbursement, turnaround time, SLA adherence, and commercial value** to create a more balanced partner scorecard.

The output is designed to support partner reviews, allocation decisions, and targeted improvement plans.

## Business Problem

Two partners can generate the same number of applications while producing very different outcomes. One may convert quickly with strong economics; another may create operational load without translating volume into disbursement.

### Decision to support

**Where should incremental lead allocation and partner-management effort go?**

## Scorecard Design

| Dimension | Example weight | Why it matters |
|---|---:|---|
| Disbursement conversion | 25% | Measures realized business outcome |
| Approval conversion | 15% | Measures funnel quality |
| SLA adherence | 20% | Protects customer experience |
| Processing TAT | 15% | Measures operational efficiency |
| Business value | 15% | Captures commercial contribution |
| Volume consistency | 10% | Rewards sustainable supply |

> Weights are illustrative and should be calibrated against business economics and historical outcomes.

## Partner Segmentation

```text
                    HIGH CONVERSION
                         │
          GROWTH         │       STRATEGIC
       Low volume        │       High volume
                         │
LOW VOLUME ──────────────┼────────────── HIGH VOLUME
                         │
       REVIEW            │       OPTIMIZE
     Low volume          │       High volume
     Low conversion      │       Low conversion
                         │
                    LOW CONVERSION
```

## Analytical Approach

1. Establish partner-level baseline metrics.
2. Normalize metrics where scale differences could distort rankings.
3. Apply weighted scoring.
4. Segment partners by volume and conversion.
5. Flag partners with strong commercial outcomes but weak SLA/TAT, and vice versa.
6. Convert the scorecard into allocation and improvement actions.

## Decision Rules

### Strategic
Increase allocation and create joint growth plans.

### Growth
Test higher allocation where operational capacity exists.

### Optimize
Diagnose lead quality, funnel friction, or partner process issues before increasing volume.

### Review
Reassess economics, SLA performance, and operational effort.

## Product / Operations Recommendations

- Build a partner scorecard into the operating dashboard.
- Use partner-level SLA alerts instead of waiting for monthly reviews.
- Create an exception queue for high-value applications at risk of breach.
- Compare partner performance against peer benchmarks, not just absolute targets.
- Tie allocation decisions to realized outcomes rather than raw lead counts.

## Success Metrics

- Disbursement conversion
- Incremental disbursed value per allocated lead
- P75 processing TAT
- SLA breach rate
- Partner contribution margin / revenue
- Allocation-to-disbursement efficiency

## Portfolio Takeaway

This is deliberately framed as a **decision engine**, not a partner report. A strong Product Operations analyst should be able to explain not only who performed best, but **what action the business should take next and how that action will be measured**.

## Data

Synthetic/anonymized portfolio dataset. No confidential customer or company data is used.
