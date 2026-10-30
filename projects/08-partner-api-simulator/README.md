# FinTech Partner API Simulator

> **Portfolio simulation | Python | FastAPI | Digital lending | API integration**

A small, runnable API that simulates the first step in a digital-lending partner integration: accepting a loan application and acknowledging it safely.

All partner names, identifiers, amounts, and payloads are synthetic. Do not submit real customer information, credentials, or production data.

## Milestone 1 scope

- Python application built with FastAPI
- Health check at `GET /health`
- Application submission at `POST /v1/applications`
- Request validation for required fields and business limits
- Idempotency-key handling to make safe retries possible
- Interactive API documentation at `/docs`

The application store is in memory for this first milestone. Restarting the server clears submitted applications. Database persistence, application status retrieval, webhook simulation, and automated tests will be added in later milestones.

## Requirements

- Python 3.10 or newer
- pip

## Run locally

From this directory:

```bash
python -m venv .venv
```

Activate the environment:

**macOS / Linux**
```bash
source .venv/bin/activate
```

**Windows PowerShell**
```powershell
.venv\Scripts\Activate.ps1
```

Install dependencies and start the API:

```bash
python -m pip install -r requirements.txt
uvicorn main:app --reload
```

The API will be available at `http://127.0.0.1:8000`.

## Try the endpoints

Health check:

```bash
curl http://127.0.0.1:8000/health
```

Submit a synthetic application:

```bash
curl -X POST "http://127.0.0.1:8000/v1/applications" \
  -H "Content-Type: application/json" \
  -H "Idempotency-Key: demo-request-001" \
  -d '{
    "partner_reference": "northstar-demo-001",
    "applicant_reference": "applicant-demo-001",
    "requested_amount": 75000,
    "loan_term_months": 24,
    "monthly_income": 45000
  }'
```

The first successful submission returns **201 Created** and an application ID. Repeating the same request with the same idempotency key returns **200 OK** with the original application. Reusing that key with a different payload returns **409 Conflict**.

You can also use the interactive Swagger UI at [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs).

## Initial API contract

### `POST /v1/applications`

Required header:

| Header | Purpose |
|---|---|
| `Idempotency-Key` | Unique client-generated key for safely retrying the same submission |

Request fields:

| Field | Type | Validation |
|---|---|---|
| `partner_reference` | string | 3 to 40 characters |
| `applicant_reference` | string | Synthetic reference, 3 to 40 characters |
| `requested_amount` | number | Greater than 0 and at most 500,000 |
| `loan_term_months` | integer | 3 to 60 |
| `monthly_income` | number | Greater than 0 and at most 1,000,000 |

Successful response:

```json
{
  "application_id": "app_0123456789ab",
  "partner_reference": "northstar-demo-001",
  "status": "RECEIVED",
  "received_at": "2026-10-30T10:00:00Z"
}
```

The timestamp and application ID above are illustrative examples.

## Next milestones

1. Add automated tests for successful submissions, validation failures, duplicate retries, and idempotency conflicts.
2. Persist applications in SQLite.
3. Add application status retrieval and controlled status transitions.
4. Simulate partner webhooks and failed-delivery retries.
5. Add SQL reconciliation queries and a Postman collection.

## Portfolio integrity

This is an independent learning project. All data is synthetic. It is not connected to a lender, credit bureau, payment network, or production environment.
