# Synthetic Experiment Readout

## Why this exists

The main case study defines an experiment but does not claim that the test was run in production. This readout uses a small synthetic experiment dataset to show how the decision would be made when results are available.

The numbers below are illustrative. They are not customer results and should not be used as evidence of a real product uplift.

## Test setup

The variant gives applicants clearer document guidance, a more explicit next action and a reminder before the application is likely to miss its expected timeline.

| Metric | Control | Variant |
|---|---:|---:|
| Applications | 1,000 | 1,000 |
| Document to credit-review progression | 34.0% | 39.0% |
| Approval rate | 30.0% | 30.8% |
| Approval to disbursement | 58.0% | 58.5% |
| SLA breach rate | 54.0% | 53.0% |
| Operations contacts per 100 applications | 18.0 | 18.8 |

## Primary metric

Document-to-credit-review progression improves from **34.0% to 39.0%**.

- Absolute lift: **+5.0 percentage points**
- Relative lift: **+14.7%**

For a two-proportion comparison with 1,000 applications per group, the approximate 95% confidence interval for the absolute lift is **+0.8 to +9.2 percentage points**. The result is statistically significant at the conventional 5% level, but the business decision should not rely on the p-value alone.

## What the guardrails say

The variant does not show an obvious deterioration in the illustrative guardrails:

- Approval rate moves from 30.0% to 30.8%
- Approval-to-disbursement conversion moves from 58.0% to 58.5%
- SLA breach rate improves slightly from 54.0% to 53.0%
- Operations contacts increase from 18.0 to 18.8 per 100 applications

The small increase in contacts is worth watching because a conversion improvement that creates an unsustainable support burden is not a clean product win.

## Decision

**Recommend a limited rollout, not an immediate full rollout.**

The primary metric shows a meaningful positive signal and the main guardrails remain directionally healthy in this synthetic example. The next step would be a controlled rollout with continued monitoring of approval quality, support demand, SLA performance and downstream disbursement conversion.

## What I would check next

1. Confirm the event tracking is complete and consistent across both groups.
2. Review results by partner, product and acquisition channel.
3. Check whether the lift is concentrated in applicants with high document-stage friction.
4. Monitor operational contacts during a larger rollout.
5. Re-check the downstream disbursement outcome before scaling broadly.

## Important limitation

This is a synthetic readout created to demonstrate experiment analysis. It does not represent a real experiment, customer population or production outcome.
