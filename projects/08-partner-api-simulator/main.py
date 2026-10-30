from datetime import datetime, timezone
from hashlib import sha256
import json
from uuid import uuid4

from fastapi import FastAPI, Header, HTTPException, Response, status
from pydantic import BaseModel, ConfigDict, Field


app = FastAPI(
    title="FinTech Partner API Simulator",
    description=(
        "A synthetic digital-lending partner API for practising "
        "application submission, validation, and idempotent retries."
    ),
    version="0.1.0",
)


class ApplicationRequest(BaseModel):
    """Synthetic application payload. Do not use real customer data."""

    model_config = ConfigDict(str_strip_whitespace=True, extra="forbid")

    partner_reference: str = Field(min_length=3, max_length=40)
    applicant_reference: str = Field(
        min_length=3,
        max_length=40,
        description="Synthetic applicant ID, never a real name or identity number.",
    )
    requested_amount: float = Field(gt=0, le=500_000)
    loan_term_months: int = Field(ge=3, le=60)
    monthly_income: float = Field(gt=0, le=1_000_000)


class ApplicationResponse(BaseModel):
    application_id: str
    partner_reference: str
    status: str
    received_at: datetime


# In-memory storage is intentional for this first milestone.
# Data disappears when the server restarts. Persistence comes later.
applications: dict[str, ApplicationResponse] = {}
idempotency_records: dict[str, tuple[str, str]] = {}


def payload_fingerprint(payload: ApplicationRequest) -> str:
    canonical_payload = json.dumps(
        payload.model_dump(mode="json"),
        sort_keys=True,
        separators=(",", ":"),
    )
    return sha256(canonical_payload.encode("utf-8")).hexdigest()


@app.get("/health")
def health_check() -> dict[str, str]:
    return {"status": "healthy", "service": "partner-api-simulator"}


@app.post(
    "/v1/applications",
    response_model=ApplicationResponse,
    status_code=status.HTTP_201_CREATED,
    summary="Submit a loan application",
)
def create_application(
    payload: ApplicationRequest,
    response: Response,
    idempotency_key: str = Header(
        alias="Idempotency-Key",
        min_length=8,
        max_length=100,
    ),
) -> ApplicationResponse:
    """Accept a synthetic application and safely handle client retries."""

    fingerprint = payload_fingerprint(payload)

    if idempotency_key in idempotency_records:
        existing_fingerprint, existing_application_id = idempotency_records[
            idempotency_key
        ]

        if existing_fingerprint != fingerprint:
            raise HTTPException(
                status_code=status.HTTP_409_CONFLICT,
                detail=(
                    "This Idempotency-Key was already used with a different "
                    "request payload."
                ),
            )

        response.status_code = status.HTTP_200_OK
        return applications[existing_application_id]

    application_id = f"app_{uuid4().hex[:12]}"
    application = ApplicationResponse(
        application_id=application_id,
        partner_reference=payload.partner_reference,
        status="RECEIVED",
        received_at=datetime.now(timezone.utc),
    )

    applications[application_id] = application
    idempotency_records[idempotency_key] = (fingerprint, application_id)

    return application
