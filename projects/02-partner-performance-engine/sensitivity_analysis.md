# Partner Allocation - Sensitivity Analysis

## Why test the weights?

The allocation score uses five dimensions: disbursement, approval, SLA adherence, TAT and estimated revenue. Those weights are a business choice, not a law of nature.

A useful score should not produce a completely different recommendation every time one weight moves a little. This check helps separate a robust decision from a score that is overly dependent on one assumption.

## Baseline weighting

| Dimension | Baseline |
|---|---:|
| Disbursement performance | 25% |
| Approval performance | 15% |
| SLA adherence | 20% |
| TAT efficiency | 15% |
| Estimated revenue | 25% |

## Scenarios to test

| Scenario | Disbursement | Approval | SLA | TAT | Revenue | Business intent |
|---|---:|---:|---:|---:|---:|---|
| Balanced | 25% | 15% | 20% | 15% | 25% | General allocation decision |
| Customer experience | 25% | 10% | 30% | 25% | 10% | Prioritise service reliability |
| Growth | 35% | 20% | 10% | 10% | 25% | Prioritise realized conversion |
| Commercial | 20% | 10% | 10% | 10% | 50% | Prioritise commercial contribution |

## How to run the check

1. Calculate the normalized partner metrics using the existing KPI query.
2. Apply each scenario's weights to the same normalized scores.
3. Rank partners within each scenario.
4. Compare the top-ranked partners and the size of the score changes.
5. Flag partners whose recommendation changes materially across reasonable scenarios.

## Decision rule

Treat the allocation recommendation as **robust** when a partner remains in the same broad decision group across reasonable weighting scenarios.

Treat the recommendation as **sensitive** when a partner moves between strategic, growth, optimize or review because of a small change in weights. Those cases should receive human review instead of being allocated automatically.

## Why this matters

The point of the score is not to pretend that a formula can replace partner judgment. It is to make the decision more consistent, explainable and easier to review.

A partner can have strong commercial value but weak SLA performance. Another can have excellent service but limited volume. The right allocation decision depends on the business objective, available capacity and customer impact.

## Implementation note

The next version of this model should store the scenario used for each allocation decision so that teams can later explain why a partner received more, less or unchanged volume.
