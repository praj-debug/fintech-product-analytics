# Credit Card Activation: Approval to First Purchase

**Type:** Independent product-management case study  
**Focus:** Consumer fintech · Credit card activation · Funnel analytics · Experimentation · Risk-aware growth

> **Important:** This is a hypothetical portfolio exercise based on a public job description and general product-management reasoning. It is not Bright Money internal work, does not use Bright Money data, and does not claim results from a real experiment. All example values must be treated as illustrative.

## Problem

An approved applicant is not yet an activated customer. Users may fail to access or activate their card, misunderstand the next step, worry about fees or repayment, or encounter technical friction. This creates a poor customer experience and weakens the return on acquisition and underwriting costs.

**Product question:** How might we help eligible approved users confidently complete card setup and make a first purchase, while protecting customer outcomes and credit risk?

## Proposed approach

1. **Diagnose the funnel:** Measure approval → card access → activation → first purchase → 30-day repeat use.
2. **Understand friction:** Segment by channel, device, time-to-event, verification outcomes, support contacts, and customer feedback.
3. **Design a narrow intervention:** Provide a clear next-step checklist, useful error recovery, transparent repayment/fee information, and a relevant reminder with frequency limits.
4. **Test responsibly:** Run a controlled experiment with pre-defined eligibility, sample-size calculation, duration, and decision thresholds.
5. **Make a decision:** Scale, iterate, or roll back based on activation and downstream outcomes, not a vanity metric alone.

## Metrics

**Primary:** Percentage of eligible approved users completing activation and first purchase within 7 days.

**Secondary:** Time to activation, card-access completion, 30-day repeat use, and support-contact rate.

**Guardrails:** Fraud, disputes, complaints, opt-outs, failed payments, early delinquency, and risk-adjusted contribution margin.

## Experiment outline

| Element | Plan |
|---|---|
| Population | Newly approved eligible users who have not activated |
| Control | Existing approved-user journey |
| Treatment | Clear checklist, contextual help, repayment transparency, and one consent-aware reminder |
| Primary metric | 7-day activation plus first-purchase conversion |
| Analysis | Randomised comparison; pre-register eligibility, minimum detectable effect, sample size, and duration |
| Decision | Scale only if the primary outcome improves credibly and guardrails remain within agreed limits |

I would calculate the sample size from a validated baseline before launch rather than inventing a target uplift. The experiment would be reviewed with Product, Design, Engineering, Risk, Compliance, Operations, and issuer partners.

## Delivery plan

- **Discover:** Validate event instrumentation, quantify stage drop-offs, review support reasons, and interview eligible non-activators.
- **Define:** Choose the largest evidenced friction point and document requirements, edge cases, event definitions, and risk constraints.
- **Build and test:** Prototype the journey, test recovery states, instrument analytics, and validate consent/frequency rules.
- **Experiment:** Launch to a controlled population, monitor guardrails, and review segment-level outcomes.
- **Decide:** Scale, iterate, or stop based on the pre-agreed decision rule.

## Repository contents

- [Live case study](https://praj-debug.github.io/fintech-product-analytics/case-studies/credit-card-activation.html) — narrative case study published on the portfolio.
- `product-brief.md` — problem framing, user story, requirements, and non-goals.
- `experiment-plan.md` — experiment design, event taxonomy, guardrails, and decision framework.
- `sample_funnel.csv` — explicitly synthetic sample data for practicing funnel analysis.

## How to present this in an interview

Describe it as a **self-directed product case study** demonstrating how you would approach an activation problem. Do not present the scenario, assumptions, or any sample figures as production results or work performed at Bright Money.
