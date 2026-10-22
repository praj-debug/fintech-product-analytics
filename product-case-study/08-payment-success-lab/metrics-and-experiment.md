# Metrics and Experiment Plan

**Status:** Proposed; no experiment run

## Primary metric

**Payment success rate** = successful eligible payment attempts / all eligible payment attempts.

The denominator, deduplication rules, and attribution window must be agreed with analytics before any live measurement.

## Supporting metrics

- **Recovery rate:** eligible failed attempts followed by a successful recovery within a defined window.
- **Pending resolution rate:** pending attempts that reach a confirmed terminal status within the defined window.
- **Retry success rate:** eligible retry attempts that succeed.
- **Support contact rate:** payment-status support contacts per 1,000 eligible attempts.

## Guardrails

- Duplicate-payment or duplicate-order incidence.
- Refund and chargeback rates.
- Checkout abandonment.
- Customer complaints related to payment uncertainty.
- Time to confirmed status.
- Support contacts per 1,000 payment attempts.

## Illustrative event taxonomy

- `checkout_started`
- `payment_attempt_started`
- `payment_status_shown`
- `retry_guidance_shown`
- `retry_selected`
- `payment_attempt_succeeded`
- `payment_attempt_failed`
- `support_handoff_started`

Events should contain only the minimum non-sensitive attributes needed. Never log PAN, CVV, UPI PIN, passwords, or payment credentials.

## Experiment hypothesis

For customers with a provider-confirmed retryable failure, clearer status copy and a safe next-step action may improve recovery compared with the current experience, without worsening duplicate-payment or support guardrails.

## Proposed design

- **Control:** current status experience.
- **Variant:** plain-language status explanation, reference ID, and safe retry guidance.
- **Eligibility:** confirmed retryable failures only; exclude pending and unknown states unless provider-specific policy supports a safe action.
- **Randomization:** user/session level, reviewed with engineering and analytics.
- **Duration and sample size:** calculate from a validated baseline, minimum detectable effect, traffic, and desired statistical power. Do not invent these inputs.

## Decision rule

Proceed only if the primary metric improves meaningfully and agreed guardrails remain within thresholds. Stop or roll back if duplicate-payment risk or customer harm increases.

## Limitations

No experiment has been run. There is no measured conversion lift, recovery improvement, or reduction in support contacts. Any future readout must include the date range, sample, method, uncertainty, and limitations.
