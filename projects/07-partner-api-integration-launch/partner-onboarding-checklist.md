# Partner Onboarding Checklist

Use this as a working checklist. Replace TBD with an accountable owner, target date and evidence link. A checked item means evidence has been reviewed, not merely that somebody said it was done.

## 1. Discovery and governance

- [ ] Business use case, product, geography and customer journey documented
- [ ] Partner legal entity and business owner confirmed
- [ ] Partner technical, operations and escalation contacts recorded
- [ ] Scope, exclusions and launch approach agreed
- [ ] RACI and decision-making authority documented
- [ ] Commercial, compliance and risk dependencies identified

## 2. API and security

- [ ] API specification and version approved by both parties
- [ ] Field mapping and validation rules signed off
- [ ] Authentication method, scopes and token lifecycle agreed
- [ ] Sandbox and production access provisioned through approved secret management
- [ ] Network allowlisting / certificates / webhook verification completed as applicable
- [ ] Idempotency, timeout, retry, rate-limit and circuit-breaker rules agreed
- [ ] Error catalogue and canonical status mapping approved
- [ ] Data minimisation, encryption, masking and retention reviewed
- [ ] No secrets or real customer data stored in tickets, logs or this repository

## 3. Build and test

- [ ] Engineering owner and delivery plan confirmed
- [ ] Contract tests and integration tests completed
- [ ] Happy-path and negative-path UAT completed
- [ ] Duplicate, timeout, retry and out-of-order event scenarios tested
- [ ] Reconciliation and exception queue validated
- [ ] Logging, correlation IDs, dashboards and alerts verified
- [ ] Defects triaged and retested
- [ ] UAT evidence and sign-offs linked

## 4. Operational readiness

- [ ] Operations SOP and exception-handling steps approved
- [ ] Queue ownership, ageing thresholds and escalation matrix agreed
- [ ] Partner support hours and incident contacts confirmed
- [ ] Reconciliation cadence and mismatch ownership agreed
- [ ] Customer communication for pending / failed / action-required states approved
- [ ] Training completed for relevant Operations and Support users
- [ ] Hypercare roster and daily review cadence confirmed

## 5. Go-live approval

- [ ] All mandatory launch gates in the readiness scorecard are green
- [ ] No open critical defects
- [ ] Production configuration and access independently checked
- [ ] Rollback / traffic-disable procedure tested or reviewed
- [ ] Smoke-test plan and launch owner confirmed
- [ ] Go/no-go decision, approvers and timestamp recorded

## 6. Hypercare and closure

- [ ] Daily API success, latency and error trends reviewed
- [ ] Pending application ageing and reconciliation mismatches reviewed
- [ ] Partner SLA and incident trends reviewed
- [ ] Customer-impacting issues escalated through agreed path
- [ ] Exit criteria for hypercare met
- [ ] Lessons learned and follow-up actions assigned

## Ownership tracker

| Workstream | Accountable owner | Target date | Status | Evidence / decision |
|---|---|---|---|---|
| Product scope | TBD | TBD | Not Started | TBD |
| Partner API contract | TBD | TBD | Not Started | TBD |
| Security review | TBD | TBD | Not Started | TBD |
| Engineering build | TBD | TBD | Not Started | TBD |
| UAT sign-off | TBD | TBD | Not Started | TBD |
| Operations readiness | TBD | TBD | Not Started | TBD |
| Go-live approval | TBD | TBD | Not Started | TBD |
