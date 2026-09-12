# Data Dictionary

## FinTech Lending Portfolio Dataset

This dataset is a **synthetic/anonymized portfolio model** used to demonstrate product analytics and operations decision-making.

| Field | Business meaning | Typical use |
|---|---|---|
| `application_id` | Unique lending application | Funnel / case-level analysis |
| `customer_id` | Unique customer identifier | Customer-level aggregation |
| `application_date` | Application submission date | Cohorts / trends |
| `partner` | Partner or acquisition source | Partner performance |
| `loan_type` | Lending product type | Product segmentation |
| `requested_amount` | Amount requested | Demand / value analysis |
| `approved_amount` | Amount approved | Approval economics |
| `application_status` | Current application status | Journey monitoring |
| `approval_status` | Approval outcome | Conversion analysis |
| `disbursed` | Whether the case was disbursed | Business outcome |
| `disbursed_amount` | Amount actually disbursed | Business value |
| `processing_days` | Processing duration | TAT analysis |
| `estimated_revenue` | Estimated commercial contribution | Partner / product economics |
| `stage` | Current funnel stage | Funnel analysis |

## Analytical dimensions

The dataset supports analysis across:

- lending funnel conversion,
- customer/application journey,
- partner performance,
- product performance,
- operational TAT,
- SLA / exception signals,
- disbursement value,
- API and UAT indicators where available.

## Data-quality principles

Before using the data for decision-making, validate:

1. application IDs are unique,
2. categorical values use consistent definitions,
3. amount fields are non-negative,
4. status combinations are logically valid,
5. processing duration is within a reasonable range,
6. missing values are understood rather than silently discarded.

## Privacy

The dataset is synthetic/sample data created for portfolio demonstration. It contains no real customer or confidential company information.
