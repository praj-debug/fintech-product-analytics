# Affordability Stress Test for Digital Lending

**Portfolio case study | Product Analytics + Product Operations**

## Product question

How can a lender identify affordability stress early enough to trigger a useful intervention without treating every high-EMI customer as high risk?

## Why this matters

Eligibility asks whether a loan can be approved. Affordability asks whether the repayment structure leaves enough monthly cash flow for normal financial volatility.

That distinction connects customer experience, portfolio quality and responsible lending operations.

## Core calculations

`Affordability Ratio = (Existing EMI + Proposed EMI) / Net Monthly Income`

`Residual Income = Net Monthly Income - Existing EMI - Proposed EMI`

The portfolio uses configurable Green / Amber / Red bands for illustration. These are analytical constructs, not universal credit-policy thresholds, and would need validation against historical repayment outcomes before production use.

## Synthetic example

| Customer | Net Income | Existing EMI | Proposed EMI | Total EMI | EMI / Income | Residual Income |
|---|---:|---:|---:|---:|---:|---:|
| C001 | ₹80,000 | ₹18,000 | ₹12,000 | ₹30,000 | 37.5% | ₹50,000 |
| C002 | ₹65,000 | ₹22,000 | ₹13,000 | ₹35,000 | 53.8% | ₹30,000 |
| C003 | ₹1,20,000 | ₹35,000 | ₹20,000 | ₹55,000 | 45.8% | ₹65,000 |
| C004 | ₹50,000 | ₹20,000 | ₹12,500 | ₹32,500 | 65.0% | ₹17,500 |

## SQL logic

```sql
SELECT
    customer_id,
    net_income,
    existing_emi,
    proposed_emi,
    existing_emi + proposed_emi AS total_emi,
    ROUND(
        (existing_emi + proposed_emi) * 100.0 / NULLIF(net_income, 0),
        2
    ) AS emi_to_income_pct,
    net_income - existing_emi - proposed_emi AS residual_income
FROM loan_applications;
```

See [`sql/affordability_analysis.sql`](sql/affordability_analysis.sql) for the full flagging logic and [`data/sample_loan_applications.csv`](data/sample_loan_applications.csv) for synthetic inputs.

## Operating workflow

`Application → Affordability signal → Policy check → Exception queue → Review / Nudge → Outcome measurement`

### Product opportunities

**Application-time nudge:** show repayment impact and suggest a lower amount or different tenure where policy permits.

**Operations queue:** route amber cases to additional income verification or manual review.

**Customer servicing:** surface customers whose affordability deteriorates after disbursal.

**Experimentation:** test whether clearer repayment transparency improves completion while preserving portfolio quality.

## Metrics

**Primary:** first-payment default rate, 30+ DPD rate, application-to-disbursal conversion.

**Secondary:** manual review rate, application abandonment, average approved amount, customer support contacts.

**Guardrails:** policy exception rate, fraud / documentation anomaly rate, credit loss rate.

## Decision trade-off

A stricter affordability rule can reduce near-term approval and conversion. A looser rule can increase approvals while exposing more customers to repayment stress.

The useful product decision therefore comes from outcome data, policy constraints and customer impact together, rather than a single ratio.

## Assumptions

- All data in this project is synthetic.
- No employer, customer or partner data is used.
- Thresholds are illustrative and must be calibrated to policy and observed repayment outcomes.
- Production use would require appropriate regulatory, privacy, credit-risk and model-governance controls.

## What this demonstrates

**Product Analytics:** metric design, SQL, segmentation and sensitivity thinking.

**Product Operations:** exception queues, policy-to-workflow translation and cross-functional handoffs.

**FinTech:** digital lending, affordability, customer experience and credit-risk trade-offs.
