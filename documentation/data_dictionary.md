# Data Dictionary

## FinTech Lending Portfolio Dataset

This dataset is a synthetic or anonymized portfolio model used to demonstrate product analytics and operations decision-making.

| Field | Business meaning | Typical use |
|---|---|---|
| `application_id` | Unique lending application | Funnel and case-level analysis |
| `customer_id` | Unique customer identifier | Customer-level aggregation |
| `application_date` | Date the application was submitted | Cohorts and trends |
| `partner` | Partner or acquisition source | Partner performance and allocation |
| `loan_type` | Lending product type | Product segmentation |
| `requested_amount` | Amount requested by the applicant | Demand and value analysis |
| `approved_amount` | Amount approved | Approval economics |
| `application_status` | Current application status | Journey monitoring |
| `approval_status` | Approval outcome | Conversion analysis |
| `disbursed` | Whether the case was disbursed | Business outcome |
| `disbursed_amount` | Amount actually disbursed | Disbursed value and value-at-risk analysis |
| `processing_days` | Time taken to process the application | TAT analysis |
| `estimated_revenue` | Estimated commercial contribution | Partner and product economics |
| `stage` | Current funnel stage | Funnel analysis and stuck-case identification |

## Analytical dimensions

The dataset supports analysis across:

- lending funnel conversion
- customer and application journey
- partner performance
- product performance
- operational TAT
- SLA and exception signals
- disbursement value
- API and UAT indicators where available

## Data quality checks

Before using the data for a decision, validate:

1. application IDs are unique
2. categorical values use consistent definitions
3. amount fields are non-negative
4. status combinations are logically valid
5. processing duration is within a reasonable range
6. missing values are understood rather than silently discarded
7. segment comparisons have enough observations to be useful

## A note on production data

A real lending system would usually need more event-level detail for deeper diagnosis, such as stage entry and exit timestamps, API failure categories, retry counts, exception owner, resolution timestamp and root-cause category.

Adding those fields would make it possible to move from portfolio-level diagnosis to more precise journey and incident analysis.

## Privacy

The dataset is synthetic or anonymized and is intended only for portfolio demonstration. It contains no real customer or confidential company information.
