# Lending Conversion Experiment — Product Experiment Brief

## Decision to make

Can a simplified document-collection experience increase application progression without reducing approval quality or increasing operational workload?

## Hypothesis

Reducing document friction and clarifying the next required action will increase document-stage progression and ultimately improve approval/disbursement conversion.

## Test design

| Element | Control | Variant |
|---|---|---|
| Document journey | Existing flow | Reduced steps + clearer checklist |
| Status visibility | Existing status | Explicit next-action status |
| Reminder logic | Existing cadence | Triggered reminder for incomplete docs |

## Primary metric

**Document-to-credit-review progression rate**

## Secondary metrics

- Application-to-approval conversion
- Approval-to-disbursement conversion
- Overall disbursement rate
- Median processing days

## Guardrails

- Approval quality must not deteriorate
- SLA breach rate must not increase materially
- Operations exception volume must remain within capacity
- API error rate must not increase

## Decision rule

Ship when the variant shows a meaningful improvement in the primary metric while all guardrails remain within agreed limits.

Do not optimize for conversion alone. In lending, a prettier funnel that creates worse credit quality or an operational fire is not a product win.

## Segmentation after readout

Break results by:

- Product
- Channel
- Partner
- City
- Loan amount band
- Baseline document-stage friction

Use segmentation to determine whether the intervention should be universal or targeted.

## Rollout plan

1. Instrument both journeys with identical event definitions.
2. Validate tracking before exposure.
3. Run a controlled pilot.
4. Review primary metric and guardrails.
5. Expand gradually if the decision rule is met.
6. Monitor post-launch performance for regression.

## Instrumentation contract

```text
application_started
application_submitted
document_checklist_viewed
document_uploaded
document_completed
credit_review_started
approval_completed
disbursement_completed
```

Each event should include application_id, partner, product, channel, timestamp and experiment_variant.

## Data note

This is a portfolio experiment plan. The repository does not claim that the experiment was run in production or that the proposed change generated a real-world uplift.
