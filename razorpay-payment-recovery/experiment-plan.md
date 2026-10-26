# Experiment Plan: Failure-Aware Payment Recovery

## Hypothesis
For eligible payment failures that are plausibly recoverable, accurate failure-specific messaging and a safe next action will increase successful payment completion within the recovery window compared with the current experience.

This is a hypothesis, not a claimed result.

## Experiment design
- **Population:** Eligible payment attempts whose failure categories have been approved for recovery.
- **Control:** Existing payment failure experience.
- **Treatment:** Failure-specific status and recovery guidance; safe retries only where permitted.
- **Assignment:** Randomise at a stable unit that prevents cross-arm contamination (for example, merchant or user, depending on product architecture).
- **Duration:** Set after validating traffic, baseline conversion, and sample-size requirements.
- **Analysis:** Intention-to-treat primary analysis; pre-specify segment cuts and exclusions.

## Event taxonomy

| Event | Purpose | Example properties |
|---|---|---|
| payment_attempted | Establish denominator | timestamp, method_group, merchant_segment |
| payment_authorisation_result | Capture outcome | result_category, latency_bucket |
| payment_failed | Record failed attempt | normalised_failure_category, source_system |
| recovery_action_shown | Measure UX exposure | action_type, experiment_arm |
| recovery_action_selected | Understand customer choice | action_type |
| retry_attempted | Monitor repeat attempt | retry_ordinal, eligibility_reason |
| payment_succeeded | Confirm final outcome | elapsed_time_bucket |
| support_contact_created | Quantify friction | reason_category |
| dispute_or_chargeback_recorded | Risk guardrail | event_date, category |

Do not log card numbers, CVV, authentication secrets, or unnecessary personal data in analytics events.

## Metrics
### Primary
Incremental successful payments within a pre-defined recovery window among eligible failed attempts.

### Secondary
- Time to successful payment.
- Checkout completion.
- Duplicate attempts and duplicate charges.
- Support-contact rate by failure category.

### Guardrails
- Fraud and chargebacks/disputes.
- Duplicate charges.
- Latency and technical reliability.
- Processing cost and support load.
- Complaints and customer trust indicators.
- Retry rate for hard declines or categories explicitly excluded by policy.

## Sample size and stopping
Validate baseline rate, define minimum detectable effect, and calculate sample size before launch. Pre-register duration and decision thresholds. Avoid unplanned early stopping based on interim uplift; use a pre-specified sequential design if needed. Safety guardrails should be monitored continuously.

## Decision framework
- **Scale:** Credible improvement in the primary metric and acceptable guardrails.
- **Iterate:** Inconclusive results or evidence that a narrower failure category is driving the effect.
- **Rollback:** Guardrail breach, duplicate-charge risk, or degraded reliability.

## AI investigation agent
A read-only agent may query approved aggregate metrics, flag anomalous shifts, compare cohorts, summarise source-linked evidence, and draft an investigation ticket. It must not autonomously alter routing, retry policies, or risk controls.

## Pre-launch checklist
- [ ] Event schema and failure mapping validated
- [ ] Eligible categories and hard-stop categories approved
- [ ] Idempotency and duplicate-payment handling tested
- [ ] Sample size, duration, and thresholds documented
- [ ] Risk, compliance, and ecosystem reviews complete
- [ ] Dashboard, alert owner, and rollback owner assigned
- [ ] AI access restricted to approved aggregated data

## Transparency
Independent proposed design only. No live experiment has been run and no lift is claimed.
