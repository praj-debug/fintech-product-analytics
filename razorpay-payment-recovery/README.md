# Razorpay Payment Recovery: Reduce Avoidable Payment Failures

**Type:** Independent product-management case study  
**Focus:** Payments · Growth · SQL/funnel analytics · AI-assisted investigation · Experimentation · Unit economics

> **Transparency:** This is a hypothetical portfolio exercise inspired by a public Razorpay Senior Product Manager job description and general payment-product principles. It is not Razorpay internal work, does not use Razorpay data, and reports no real experiment results. Any sample data is synthetic and clearly labelled.

## The problem

A failed payment is not one problem. Temporary issuer/network issues, authentication friction, customer-correctable errors, hard declines, fraud controls, and integration issues require different responses. Generic retries can increase friction, duplicate attempts, processing costs, and risk without improving genuine payment completion.

**Product question:** How might we help legitimate customers recover from recoverable payment failures while protecting reliability, customer trust, and payment economics?

## Proposed solution

1. **Diagnose:** Build a segmented payment funnel and classify failure causes with validated event and response-code mappings.
2. **Prioritise:** Estimate failure volume, recoverability, merchant impact, customer effort, and cost. Start with one high-volume eligible failure category.
3. **Improve recovery UX:** Show accurate payment status and one appropriate next step, preserve checkout context, prevent duplicate submissions, and provide a support route for uncertain states.
4. **Add safe platform intelligence:** Apply deterministic eligibility rules for retries and approved routing options. Use an AI investigation agent to summarise aggregate patterns and draft evidence-backed investigations, with human approval for operational changes.
5. **Experiment:** Compare the new experience with the current journey and measure incremental successful payments, not raw retry volume.
6. **Decide:** Scale only if conversion improves without unacceptable changes to fraud, disputes, duplicate charges, latency, cost, or customer complaints.

## Metrics

**Primary:** Incremental successful payments within a defined recovery window among eligible failed attempts.

**Secondary:** Time to success, checkout completion, duplicate attempts, and support-contact rate.

**Guardrails:** Fraud, chargebacks/disputes, duplicate charges, latency, processing cost, complaints, and retries of hard declines.

## Repository contents

- [Live case study](https://praj-debug.github.io/fintech-product-analytics/case-studies/razorpay-payment-recovery.html)
- `product-brief.md` — user problem, requirements, non-goals, dependencies, and acceptance criteria.
- `experiment-plan.md` — experiment design, event taxonomy, metrics, and guardrails.
- `sql/failure_funnel.sql` — example SQL to calculate stage-level payment outcomes from a documented event schema.
- `sample_payment_failures.csv` — synthetic sample records for practising diagnosis.

## Interview framing

Present this as a self-directed case study demonstrating how you would approach payment recovery at a payment platform. Do not claim it was built for Razorpay or that the synthetic figures are production outcomes.
