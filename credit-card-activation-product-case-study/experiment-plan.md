# Experiment Plan: Activation Journey

## Hypothesis

If eligible approved users receive a clear activation checklist, contextual recovery guidance, transparent repayment information, and one relevant reminder, then more will complete activation and a first purchase within seven days than users in the current journey.

This is a hypothesis to test, not a claimed outcome.

## Design

- **Population:** Newly approved users eligible for the card-access journey who have not activated.
- **Control:** Existing journey.
- **Treatment:** Checklist, recovery guidance, repayment transparency, and consent-aware reminder.
- **Randomisation:** User-level assignment, with assignment held stable throughout the test.
- **Duration:** Set after baseline traffic, expected conversion, and sample-size calculations are validated.
- **Analysis:** Intention-to-treat as the primary analysis; review pre-specified segments for meaningful differences.

## Event taxonomy

| Event | Trigger | Useful properties (non-sensitive) |
|---|---|---|
| application_approved | Approval status becomes available | timestamp, acquisition_channel, device_type |
| card_access_started | User starts card access | timestamp, app_version |
| card_access_completed | Access flow succeeds | timestamp, elapsed_time_bucket |
| card_activation_completed | Activation succeeds | timestamp, elapsed_time_bucket |
| first_purchase_completed | First eligible purchase is confirmed | timestamp, transaction_category_group |
| support_contact_created | User contacts support | timestamp, reason_category |
| reminder_delivered | Permitted reminder is delivered | timestamp, channel |
| reminder_opted_out | User opts out | timestamp, channel |
| repeat_use_30d | Qualifying repeat use within 30 days | cohort_date, eligible_flag |

Do not collect card numbers, CVV, passwords, or other sensitive payment credentials in analytics events.

## Metrics

### Primary
- 7-day activation plus first-purchase conversion among eligible approved users.

### Secondary
- Median time from approval to activation.
- Card-access completion rate.
- Support-contact rate by reason.
- 30-day repeat use.

### Guardrails
- Fraud and dispute rates.
- Complaints and opt-outs.
- Failed payments.
- Early delinquency.
- Risk-adjusted contribution margin.

## Sample size and stopping

Calculate the minimum detectable effect and required sample size from a validated baseline, chosen statistical power, and significance level before launch. Do not stop early just because interim results look favourable unless a sequential testing method has been specified in advance. Monitor safety and risk guardrails throughout.

## Decision framework

- **Scale:** Primary metric clears the pre-agreed evidence threshold and guardrails remain acceptable.
- **Iterate:** Result is inconclusive or evidence points to a narrower friction point; revise the hypothesis and test.
- **Stop/rollback:** Customer harm, risk, compliance, or technical guardrails breach.

## Pre-launch checklist

- [ ] Event definitions and data QA complete
- [ ] Eligibility and randomisation documented
- [ ] Sample size, duration, and decision thresholds pre-registered
- [ ] Risk, compliance, and issuer reviews complete
- [ ] Reminder consent and frequency rules tested
- [ ] Dashboard and rollback owner assigned
- [ ] Customer-support teams briefed on expected changes

## Transparency

All details are a proposed design for an independent portfolio exercise. No experiment has been run and no performance lift is claimed.
