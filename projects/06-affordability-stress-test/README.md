# Affordability Stress Test for Digital Lending

> A product analytics case study for identifying when an EMI may become unaffordable before it turns into a delinquency problem.

## Product question

**How can a lender flag affordability stress early enough to trigger a useful intervention without treating every high-EMI customer as high risk?**

This case study models a lightweight affordability layer that combines income, existing obligations, proposed EMI and buffer capacity.

## Why this matters

A simple eligibility decision can answer **“Can we approve this loan?”**

An affordability layer asks a different question:

**“Will this repayment structure leave the customer with enough monthly cash flow to absorb normal financial volatility?”**

That distinction matters for customer experience, portfolio quality and responsible lending operations.

## Synthetic example

| Customer | Net Income | Existing EMI | Proposed EMI | Total EMI | EMI / Income | Buffer |
|---|---:|---:|---:|---:|---:|---:|
| A | ₹80,000 | ₹18,000 | ₹12,000 | ₹30,000 | 37.5% | ₹50,000 |
| B | ₹65,000 | ₹22,000 | ₹13,000 | ₹35,000 | 53.8% | ₹30,000 |
| C | ₹1,20,000 | ₹35,000 | ₹20,000 | ₹55,000 | 45.8% | ₹65,000 |
| D | ₹50,000 | ₹20,000 | ₹12,500 | ₹32,500 | 65.0% | ₹17,500 |

The key point is that **EMI ratio alone is not the whole story**. Two customers can have similar ratios but very different residual income.

## Proposed decision framework

### 1. Calculate affordability ratio

`Affordability Ratio = (Existing EMI + Proposed EMI) / Net Monthly Income`

### 2. Calculate residual income

`Residual Income = Net Monthly Income - Existing EMI - Proposed EMI`

### 3. Add an affordability flag

A production implementation could create configurable bands such as:

- **Green:** repayment load and residual income both within policy
- **Amber:** elevated repayment load or limited residual buffer
- **Red:** repayment load and buffer indicate material affordability stress

The thresholds should be configured by the lender’s credit policy and validated against historical repayment outcomes. They should not be hard-coded as universal rules.

## SQL-style analysis

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

## Product opportunity

Instead of using the flag only at underwriting, the same signal can power:

1. **Application-time nudges**  
   Show a repayment preview and suggest a lower amount or longer tenure when affordability is stretched.

2. **Operations queues**  
   Route amber cases for additional income verification or manual review.

3. **Customer servicing**  
   Surface customers whose affordability deteriorates after disbursal.

4. **Experimentation**  
   Test whether clearer repayment transparency improves completion while preserving portfolio quality.

## Metrics

**Primary**
- First-payment default rate
- 30+ DPD rate
- Application-to-disbursal conversion

**Secondary**
- Manual review rate
- Application abandonment
- Average approved amount
- Customer support contacts

**Guardrails**
- Policy exception rate
- Fraud / documentation anomaly rate
- Credit loss rate

## Product trade-off

A stricter affordability rule may reduce near-term approvals and conversion.

A looser rule may increase approvals while exposing more customers to repayment stress.

The product decision should therefore be made using **outcome data + policy constraints + customer impact**, not a single threshold.

## Assumptions

- All data in this case study is synthetic.
- The ratios are analytical constructs, not credit policy recommendations.
- Thresholds require validation against historical repayment performance.
- Real-world implementation would require appropriate regulatory, privacy, credit-risk and model-governance controls.

## What this demonstrates

**Product Operations:** exception queues, policy-to-workflow translation, cross-functional handoffs.

**Product Analytics:** derived metrics, segmentation, SQL logic and decision frameworks.

**FinTech:** digital lending, affordability, customer experience and credit-risk trade-offs.
