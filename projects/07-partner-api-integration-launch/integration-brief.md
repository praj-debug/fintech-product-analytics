# Integration Brief: Digital Lending Partner Onboarding

## 1. Executive summary

Integrate a fictional lending partner, **Northstar Finance**, with a digital lender's application platform. The initial release supports application submission, partner acknowledgement, status updates and final decision retrieval.

The goal is a reliable, traceable application hand-off with clear ownership when requests fail or remain unresolved.

> Simulation only: Northstar Finance, all business rules, volumes, service levels and technical details in this pack are invented for portfolio demonstration.

## 2. Problem statement

Today, partner onboarding can become fragmented across email threads, spreadsheets and engineering tickets. Unclear field definitions, inconsistent status handling and missing operational ownership can cause:
- incomplete or rejected application submissions;
- duplicate requests after timeouts;
- delayed status visibility for customers and operations;
- manual reconciliation between lender and partner records;
- launch delays caused by late discovery of dependencies.

## 3. Objective and outcomes

**Objective:** establish a controlled, observable integration that passes agreed functional and operational acceptance criteria before production traffic is enabled.

Expected outcomes:
- every submitted application has a traceable internal and partner reference;
- retries do not create duplicate applications;
- partner statuses map consistently to the lender's canonical status model;
- failures are observable, actionable and assigned to an owner;
- Operations can identify pending, failed and ageing applications without engineering intervention.

## 4. Scope

### In scope
- Submit a completed application to the partner.
- Receive an acknowledgement and partner reference.
- Ingest partner status updates.
- Retrieve a final decision and reason codes.
- Handle validation errors, timeouts, retries and duplicate requests.
- Log correlation IDs and operational timestamps.
- Provide exception queues and reconciliation reporting.

### Out of scope for this release
- Disbursement and repayment APIs.
- Partner-side underwriting model changes.
- Customer document upload redesign.
- Multi-partner routing optimisation.
- Automated policy overrides.

## 5. Stakeholders and responsibilities

| Team | Responsibility |
|---|---|
| Product | Scope, customer journey, canonical statuses and acceptance criteria |
| Engineering | API implementation, retries, observability and technical testing |
| Partner technology | Contract confirmation, sandbox access and partner-side fixes |
| Risk / Credit | Required fields, policy dependencies and decision reason mapping |
| Operations | Exception handling, reconciliation and SOP sign-off |
| Compliance / Security | Data minimisation, access controls, retention and security review |
| QA / UAT | Test execution, evidence and defect triage |

## 6. High-level journey

1. Customer completes the lender's application journey.
2. Lender validates mandatory fields and consent.
3. Lender submits the application with a unique idempotency key.
4. Partner returns an acknowledgement with a partner application reference.
5. Partner sends status updates or the lender polls the status endpoint.
6. Lender maps partner status to a canonical application status.
7. Final decision and reason codes are stored and surfaced to authorised users.
8. Exceptions are routed to an owned queue with ageing and escalation rules.

## 7. Functional requirements

| ID | Requirement | Acceptance criteria |
|---|---|---|
| FR-01 | Submit application | Valid payload receives a traceable acknowledgement |
| FR-02 | Validate input | Missing or invalid mandatory fields are rejected before partner submission |
| FR-03 | Prevent duplicates | Repeated request with same idempotency key does not create a second partner application |
| FR-04 | Map statuses | Every supported partner status maps to one documented canonical status |
| FR-05 | Capture decision | Final decision and reason codes are persisted with timestamps |
| FR-06 | Handle failures | Timeout and server errors follow documented retry / exception rules |
| FR-07 | Reconcile | Internal and partner references can be compared in an exception report |
| FR-08 | Audit | Request metadata, response metadata and state changes are traceable without logging secrets or unnecessary PII |

## 8. Non-functional requirements

- **Security:** authenticated service-to-service communication; secrets stored outside source code; least-privilege access.
- **Privacy:** transmit only fields required for the agreed use case; mask sensitive values in logs.
- **Reliability:** define timeout, retry, backoff and dead-letter / manual-review behaviour.
- **Performance:** agree latency targets with the partner before UAT; measure p50 and p95.
- **Observability:** every request has a correlation ID and measurable outcome.
- **Auditability:** retain state-change history according to approved retention policy.

## 9. Assumptions and open questions

| Topic | Working assumption | Question to close |
|---|---|---|
| Authentication | OAuth 2.0 client credentials or mutually agreed equivalent | Which grant, scopes and token lifetime are supported? |
| Status delivery | Webhook or polling | Which mechanism is available in sandbox and production? |
| Idempotency | Client-generated key | What is the partner's key scope and retention period? |
| SLA | To be agreed | What are availability, response-time and support-hour commitments? |
| Error codes | Partner-specific catalogue | Can the partner provide a complete error and reason-code dictionary? |
| Data retention | Minimum required data only | What are approved retention and deletion requirements? |

## 10. Key risks and mitigations

| Risk | Impact | Mitigation |
|---|---|---|
| Field definitions differ | Rejections or incorrect decisions | Signed-off field mapping and contract tests |
| Timeout after partner accepts request | Duplicate submission on retry | Idempotency key and reconciliation |
| Unknown partner status | Application stuck or misreported | Canonical mapping, alert and manual exception queue |
| Sandbox differs from production | Launch defects | Production-readiness confirmation and controlled smoke test |
| No clear incident owner | Extended customer impact | Named escalation contacts and support runbook |

## 11. Definition of ready for UAT

- API contract and field mapping approved by both parties.
- Sandbox credentials and test data available through an approved secure channel.
- Canonical status and error mappings signed off.
- Test cases reviewed by Product, Engineering, QA, Risk and Operations.
- Logging, correlation IDs and dashboards available in the test environment.
- Defect severity definitions and triage owners agreed.
