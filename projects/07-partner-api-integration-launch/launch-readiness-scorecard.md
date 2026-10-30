# Launch Readiness Scorecard

## 1. Go / no-go gates

A launch should not be approved by averaging scores. Any failed mandatory gate requires a no-go or a formally documented exception approved by the authorised risk owner.

| Gate | Evidence required | Status | Owner |
|---|---|---|---|
| Scope and API contract | Signed-off brief, field mapping and version | Not Assessed | Product / Engineering |
| Security and privacy | Security review, approved credentials handling, data controls | Not Assessed | Security / Compliance |
| Functional UAT | All S1 scenarios passed with evidence | Not Assessed | QA / Product |
| Defect position | No open critical defects; accepted residual risks documented | Not Assessed | Engineering |
| Observability | Correlation IDs, dashboards, alerts and runbooks verified | Not Assessed | Engineering / Operations |
| Operational readiness | SOP, queue ownership, escalation and reconciliation agreed | Not Assessed | Operations |
| Partner readiness | Support contacts, SLA and production access confirmed | Not Assessed | Partner Manager |
| Rollback / containment | Traffic disablement and incident response reviewed | Not Assessed | Engineering |
| Approval | Named go/no-go approvers and decision timestamp | Not Assessed | Product / Business Owner |

## 2. KPI definitions

Targets must be agreed using expected volumes, partner commitments and baseline performance. The placeholders below are not production commitments.

| KPI | Definition | Suggested view | Guardrail / interpretation |
|---|---|---|---|
| API technical success rate | Successful partner API responses / total eligible requests | 15-min, daily | Segment by endpoint and error family |
| Partner acknowledgement time | Time from lender submission to partner acknowledgement | p50 / p95 | Exclude neither timeouts nor slow responses from the operational view |
| Application acknowledgement rate | Applications acknowledged / valid applications submitted | Daily | Separate technical failures from business rejections |
| Duplicate application rate | Confirmed duplicate partner applications / submitted applications | Daily | Target should be near zero |
| Unknown status rate | Events with unmapped partner status / all status events | Daily | Any unknown status needs investigation |
| Pending ageing | Count of applications beyond agreed processing thresholds | Ageing buckets | Assign queue owner and escalation |
| Reconciliation mismatch rate | Unmatched or inconsistent records / records expected to reconcile | Daily | Investigate by partner reference and date |
| UAT pass rate | Passed test cases / executed test cases | Per test cycle | Report blocked and not-run separately |

## 3. Launch ramp proposal

Illustrative approach only; actual percentages and duration require risk and business approval.

1. Internal smoke test with synthetic or approved test applications.
2. Limited production cohort with enhanced monitoring.
3. Gradual traffic increase after agreed stability window.
4. Full rollout only after product, operations and partner review.

At each stage, review API success, p95 latency, pending ageing, duplicate rate, reconciliation mismatches and customer-impacting incidents.

## 4. Incident triggers and response

| Signal | Initial response | Owner |
|---|---|---|
| Authentication failures spike | Pause automated retries; verify credentials/scopes and partner status | Engineering |
| 5xx / timeout spike | Apply bounded retry policy; assess traffic containment | Engineering + Partner |
| Duplicate submissions detected | Stop unsafe resubmission; reconcile partner references | Engineering + Operations |
| Unknown status received | Quarantine event; investigate mapping and protect customer-facing state | Product + Engineering |
| Pending ageing exceeds threshold | Create owned exception queue and contact partner | Operations |
| Suspected data exposure | Follow security incident process immediately | Security / Incident Lead |

## 5. Go/no-go decision record

- Decision: Pending
- Date / time: TBD
- Release / version: TBD
- Traffic cohort: TBD
- Product approver: TBD
- Engineering approver: TBD
- Operations approver: TBD
- Risk / Compliance approver: TBD
- Partner confirmation: TBD
- Open risks accepted: None recorded
- Rollback owner and trigger: TBD
- Decision notes / evidence: TBD

## 6. Hypercare exit criteria

- Performance is within the agreed operating range for the agreed observation window.
- No unresolved critical customer-impacting incidents.
- Pending and reconciliation queues are within agreed thresholds.
- Partner support and escalation path are functioning.
- Operational ownership has transitioned to steady-state teams.
- Follow-up improvements have owners and target dates.
