# FinTech Lending Control Tower

A recruiter-facing BI layer for the portfolio. The goal is not to display a pile of charts and call it analytics, because apparently rectangles with numbers have become a profession. The dashboard is designed to show **problem → diagnosis → decision → measurement**.

## Dashboard Architecture

### 01 · Executive Pulse
The one-screen leadership view.

**KPI cards**
- Applications
- Approval rate
- Disbursement rate
- Approval → disbursement conversion
- SLA breach rate
- P75 processing days
- API issue rate
- Estimated partner revenue

**Decision questions**
- Is the portfolio growing without quality or service degradation?
- Where is the largest funnel loss?
- Is operational friction concentrated in a specific segment?

### 02 · Funnel Diagnostics
A customer-journey view from lead to disbursement.

**Visuals**
- Funnel volume and conversion
- Stage-to-stage drop-off
- Processing-time distribution
- SLA breach by stage / segment
- Approved-but-not-disbursed recovery queue

**Decision output**
Prioritize the stage with the largest controllable loss rather than optimizing the entire funnel at once.

### 03 · Partner & Channel Performance
A commercial + operations scorecard.

**Visuals**
- Partner ranking
- Weighted partner score
- Disbursement contribution
- SLA adherence
- P75 processing TAT
- Channel conversion
- Revenue contribution

**Decision output**
Use performance tiers to guide partner allocation, enablement, escalation, and review.

### 04 · Operations & Reliability
The control-tower layer.

**Visuals**
- SLA breach trend
- P50 / P75 / P90 processing time
- Exception backlog
- API issue rate
- API issues by partner / product
- High-value affected applications

**Decision output**
Move from reactive case chasing to exception-led operations and incident prioritization.

## Static Portfolio Visual

The repository includes [`../visuals/portfolio_dashboard.svg`](../visuals/portfolio_dashboard.svg), a presentation-ready static dashboard mockup showing the executive pulse, funnel, decision signals, and operating workflow.

It is intentionally labelled as a portfolio visual rather than a production dashboard. The numbers shown on the visual are portfolio metrics, not claims about production performance.

## KPI Definitions

| KPI | Definition | Decision use |
|---|---|---|
| Approval rate | Approved applications / total applications | Credit-funnel health |
| Disbursement rate | Disbursed applications / total applications | End-to-end outcome |
| Approval → disbursement | Disbursed / approved | Post-approval leakage |
| SLA breach rate | SLA-breach applications / total applications | Operational reliability |
| P75 processing days | 75th percentile processing duration | Tail latency / customer experience |
| API issue rate | API-issue applications / total applications | Integration reliability |
| Revenue contribution | Sum of estimated partner revenue | Commercial prioritization |

## BI Build Specification

**Recommended stack:** Power BI + SQL, with the CSV as the portfolio source dataset.

**Suggested model:** one application-level fact table with dimensions for partner, channel, city, product, stage, and date.

**Core slicers:** date, partner, channel, city, product, stage, SLA status, API issue.

**Interaction principle:** every chart should answer a business question and support a next action. Avoid decorative visuals that cannot change a decision.

## SQL Layer

Reusable KPI queries live in [`../analysis/portfolio_kpi_queries.sql`](../analysis/portfolio_kpi_queries.sql). The dashboard should consume the same definitions used in the case studies so the portfolio does not quietly develop three different versions of the truth.

## Portfolio Data Note

All data is synthetic or anonymized and contains no confidential customer, company, partner, or proprietary operational information. Dashboard outputs should be treated as portfolio analysis and case-study evidence, not production business results.
