# Lending Operations Control Tower — Dashboard Specification

> **Decision system, not a reporting wall.** Built from the synthetic 500-application portfolio.

## Page 1 — Executive Pulse

### KPI cards
- Applications
- Approval rate
- Disbursement rate
- Disbursed loan value
- P75 processing days
- SLA breach rate
- API issue rate
- Exception backlog

### Decision tiles
1. **Funnel:** which stage is leaking the most volume?
2. **Operations:** where is SLA risk concentrated?
3. **Partners:** which partners deserve more allocation or intervention?
4. **Technology:** which API/UAT signals require escalation?

## Page 2 — Funnel Diagnostics

**Visuals**
- Funnel: Lead → Application → Documents → Credit Review → Approved → Disbursed
- Stage volume and share
- Approval and disbursement conversion
- Processing-day distribution by stage
- Channel × product performance matrix

**Interaction**
Filters: date, partner, city, channel, product.

**Decision output**
Highlight the highest-volume stage with below-target conversion and/or above-target processing time.

## Page 3 — Partner Performance

**Visuals**
- Partner allocation score leaderboard
- Applications vs disbursement rate scatter
- SLA adherence by partner
- Estimated revenue contribution
- Processing-time benchmark

**Allocation framework**
- 25% disbursement performance
- 15% approval performance
- 20% SLA adherence
- 15% TAT efficiency
- 25% estimated revenue

**Decision output**
- Strategic: high score + meaningful volume
- Growth: high conversion, lower volume
- Optimize: high volume, weak conversion/TAT
- Review: low score or persistent service risk

## Page 4 — Operations Control Tower

**Exception queue**

| Priority | Trigger | Owner action |
|---|---|---|
| P0 | API issue + SLA breach | Tech + Ops escalation |
| P1 | SLA breach | Queue reprioritisation |
| P1 | API issue | Integration investigation |
| P2 | UAT pending | Readiness follow-up |

**Visuals**
- Exception count by priority
- Breach hotspots by partner × city
- P50/P75/P90 processing days
- Ageing / stage mix of open cases

## Page 5 — Technology & Integration

**Visuals**
- API issue rate
- UAT status mix
- API issue by partner
- API issue by product
- Disbursement outcome for issue vs non-issue cases

**Decision output**
Separate engineering reliability from customer/business impact. Escalate issues that affect both conversion and SLA.

## Recommended visual hierarchy

```text
EXECUTIVE KPIs
      ↓
WHERE IS THE LOSS?
      ↓
WHY IS IT HAPPENING?
      ↓
WHO OWNS IT?
      ↓
WHAT ACTION DO WE TAKE?
      ↓
HOW WILL WE MEASURE IT?
```

## Power BI / BI model

Use the application table as the fact table. Treat partner, city, channel, product, stage and date as analytical dimensions. Keep KPI definitions centralized so the dashboard and SQL outputs reconcile.

## Portfolio disclaimer

This is a portfolio dashboard specification using synthetic/anonymized data. It demonstrates product-operations thinking and dashboard design, not production business results.
