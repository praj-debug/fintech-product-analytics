# API Contract & Field Mapping

## Important

This is an illustrative contract for a portfolio simulation, not a real partner API specification. Paths, payloads, field names and response codes are invented. Never use real credentials or customer information in this repository.

## 1. Illustrative endpoints

| Method | Path | Purpose |
|---|---|---|
| POST | `/v1/applications` | Submit a lending application |
| GET | `/v1/applications/{partner_application_id}` | Retrieve current application status |
| POST | `/v1/webhooks/application-status` | Receive partner status events (if webhook delivery is supported) |

Base URL, authentication scopes, rate limits, timeout and versioning policy must be agreed with the actual partner before implementation.

## 2. Example request

```json
{
  "external_application_id": "APP-DEMO-100045",
  "idempotency_key": "idem-demo-100045-v1",
  "product_code": "PERSONAL_LOAN",
  "requested_amount": 250000,
  "tenure_months": 36,
  "applicant": {
    "applicant_reference": "CUST-DEMO-0091",
    "full_name": "Sample Applicant",
    "date_of_birth": "1992-04-18",
    "mobile": "9999999999",
    "consent_reference": "CONSENT-DEMO-7781"
  },
  "metadata": {
    "source_channel": "web",
    "correlation_id": "corr-demo-100045"
  }
}
```

The values above are fabricated. In production, define data minimisation, encryption, consent, masking and retention controls before exchanging personal data.

## 3. Field mapping

| Lender field | Partner field | Type | Required? | Validation / notes |
|---|---|---|---|---|
| application_id | external_application_id | String | Yes | Unique lender-side reference |
| idempotency_key | idempotency_key | String | Yes | Stable across retries of the same logical submission |
| product_type | product_code | Enum | Yes | Must match agreed product catalogue |
| requested_loan_amount | requested_amount | Decimal | Yes | Positive; currency and precision must be agreed |
| tenure_months | tenure_months | Integer | Yes | Allowed range configured by product policy |
| customer_reference | applicant.applicant_reference | String | Yes | Pseudonymous reference where possible |
| customer_name | applicant.full_name | String | Conditional | Send only if required and approved |
| date_of_birth | applicant.date_of_birth | Date | Conditional | ISO 8601 date; minimise exposure |
| mobile_number | applicant.mobile | String | Conditional | Format and country code rules to be agreed |
| consent_id | applicant.consent_reference | String | Yes | Must resolve to valid consent evidence |
| channel | metadata.source_channel | Enum | Yes | Controlled values only |
| correlation_id | metadata.correlation_id | String | Yes | Propagated across logs and systems |

## 4. Example acknowledgement

```json
{
  "external_application_id": "APP-DEMO-100045",
  "partner_application_id": "NSF-DEMO-778812",
  "partner_status": "RECEIVED",
  "received_at": "2026-10-30T09:30:00Z",
  "correlation_id": "corr-demo-100045"
}
```

## 5. Canonical status mapping

| Partner status | Lender canonical status | Operational meaning |
|---|---|---|
| RECEIVED | SUBMITTED | Partner has acknowledged receipt |
| IN_REVIEW | PROCESSING | Partner is evaluating the application |
| MORE_INFO_REQUIRED | ACTION_REQUIRED | Additional information is required |
| APPROVED | APPROVED | Partner decision is approved |
| REJECTED | DECLINED | Partner decision is declined |
| CANCELLED | CANCELLED | Application is cancelled |
| Unknown / unmapped | PARTNER_EXCEPTION | Do not silently map; route for investigation |

Terminal-state transitions, reversals and duplicate/out-of-order events need explicit rules. A late event must not overwrite a valid terminal decision without an approved transition.

## 6. Error handling proposal

| HTTP / error category | Interpretation | Suggested handling |
|---|---|---|
| 400 validation error | Payload invalid | Do not retry unchanged payload; surface field-level error |
| 401 / 403 | Authentication / authorisation issue | Stop retries, alert integration owner and investigate credentials/scopes |
| 404 | Reference not found | Verify reference and partner environment; route unresolved cases |
| 409 | Duplicate / conflict | Query existing partner reference; do not create a new logical submission |
| 429 | Rate limited | Respect Retry-After if supplied; apply bounded backoff |
| 5xx | Partner service failure | Bounded retry with exponential backoff and jitter; then exception queue |
| Network timeout | Outcome unknown | Retry only with same idempotency key; reconcile before manual resubmission |

The actual retry policy must be agreed with Engineering and the partner. Avoid retry storms and unbounded retries.

## 7. Contract decisions to sign off

- API version and environment URLs
- Authentication, scopes, token refresh and secret rotation
- Required / optional fields, formats, enumerations and length limits
- Currency, amount precision, date and timezone conventions
- Idempotency semantics and retention window
- Timeout, retry, rate-limit and circuit-breaker behaviour
- Webhook signature verification, replay protection and delivery retries
- Error catalogue and business rejection reason codes
- Data classification, encryption, masking and retention
- Versioning, deprecation and backward-compatibility policy
