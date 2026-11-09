# Tranche — Product Requirements Document (Working Draft)

**Owner:** Prajakta Mane  
**Product type:** Multi-role education lending CRM  
**Status:** Concept / prototype  
**Data policy:** Synthetic data only for public demo

## 1. Vision

Build a unified operating workspace for education loan origination and balance transfer operations, connecting students, co-applicants, internal teams and lender partners while preserving role-specific workflows and privacy boundaries.

## 2. Goals

1. Reduce time from lead creation to submission-ready.
2. Improve first-pass document verification.
3. Make lender decisions, turnaround times and pending actions measurable.
4. Provide a reliable, auditable view of each student's loan journey.
5. Protect sensitive borrower information through least-privilege access and consent-aware sharing.

## 3. Non-goals for the prototype

- Live lender APIs or portal integrations.
- Real credit underwriting or automated approval.
- Live KYC, bureau pulls or identity verification.
- Payments or funds movement.
- Production WhatsApp/SMS/e-mail delivery.
- Regulated e-signature or e-NACH execution.
- Claiming regulatory certification or production readiness.

## 4. Users

RM, Loan Operations, Partner Manager, Management/Admin, Student/Applicant, Lender Representative.

## 5. Information architecture

- Business Overview
- New Education Loan Pipeline
- Balance Transfer Pipeline
- Borrower profile and all linked lender applications
- Destination-matched student community
- Documents Queue
- Lenders and Lender Products
- Tasks and Communications
- Analytics
- Admin and Audit

The homepage is a business overview, with role-specific widgets and permissions. Case workspace supports Table and Kanban views with shared filters.

## 6. Core domain model

- Person: student, co-applicant, guarantor.
- PersonRole / CasePerson: relationship of a person to a case.
- EducationPlan: country, university, course, intake, fees, admission and visa milestones.
- Case: NEW or BT journey, assigned owner, stage, flags and derived roll-up status.
- Lender: partner organisation.
- LenderProduct: product-specific criteria, fees, rates and document requirements.
- LenderApplication: independent application per case and lender product.
- Offer: amount, ROI type, tenure, fees, moratorium terms, conditions and expiry.
- Sanction: accepted offer and conditions.
- Disbursement / DisbursementTranche: amounts, dates, recipient and status.
- ExistingLoan: BT-only old loan, repayment and payoff information.
- DocumentRequirement: dynamic checklist item.
- Document / DocumentVersion: uploaded file metadata and version lineage.
- Consent: person, purpose, recipient, scope, timestamp and withdrawal.
- Task, Communication, Template, SLATimer.
- StatusHistory and AuditEvent (append-only).
- CommissionAccrual and Payout (later phase, permission gated).

## 7. New Education Loan workflow

Lead Received → Contacted / Counselling → Eligibility Check → Documents Pending → Documents Verified → Application Ready → Lender Selected → Submitted to Lender → Credit Assessment / Query Loop → Offer Presented → Sanctioned → Sanction Accepted → Agreement & Conditions → Disbursement in Progress → Partially Disbursed → Fully Disbursed / Completed.

Exceptions are reasons/flags where possible, not arbitrary editable states: Rejected (with reason taxonomy), Withdrawn, Lost/Disqualified, Expired, Duplicate, Reopened, Escalated, Waiting on Student, Waiting on Lender.

## 8. Balance Transfer workflow

Lead Received → Existing Loan Review → Savings Validation → Documents Pending → Documents Verified → Lender Mapping → Login Pending → Logged In → Credit Assessment / Query Loop → Conditional Approval → Sanctioned → Sanction Accepted & Agreement → Payoff Letter Requested → Payoff Letter Received → New Lender Disbursement to Old Lender → Old Loan Closure Confirmation → NOC / Lien / Original Document Release → Completed.

A payoff letter expiry returns the case to a request-new-letter action. Not Viable is an explicit exit outcome. The old loan is not marked closed before payoff funds are remitted and closure is confirmed.

## 9. Lender application state

A borrower profile represents one student and one borrower-level loan case can have multiple parallel lender applications. Each application has its own lender reference, journey type (NEW or BT), owner, submitted checklist, status, queries, timestamps and decision. The public demo shows one to three applications per student, all visible together in the student's portal and borrower profile. Lender representatives see only their lender's applications, with separate NEW and BT queues. On student offer acceptance, selected application is recorded and alternate applications are closed as alternate chosen, subject to a confirmation step. Parallel hard bureau enquiries should be controlled by a configurable cap and prequalification process.

## 10. Documents

Student upload portal and internal employee uploads feed one vault. Checklist is generated using case type, lender product and borrower profile. Ops can approve, reject or request resubmission with reason. Maintain versions, verification history, expiry and access audit. Share only documents with an appropriate consent and authorised recipient.

## 11. Communications and tasks

Unified timeline across WhatsApp, email, SMS and portal. Prototype messages are simulated and labelled. Include templates, reminders, follow-ups, escalation and task ownership. Keep student-facing communication separate from internal notes.

## 12. Assignment

Hybrid assignment: default automated allocation by team, role, availability, workload, skill/language and intake capacity; managers can manually assign or override. Log allocation rationale and every reassignment.

## 13. Analytics

Decision-led dashboards: stage conversion and ageing; lead source to disbursement; document first-pass rate and verification TAT; lender application outcomes and sanction TAT; rejection reasons; SLA breaches excluding pause time; BT savings and payoff-stage drop-off; capacity and workload. All sample values must be marked synthetic.

## 14. Permissions and security

RBAC plus record ownership/assignment scope. Enforce row-level access at the database and re-check authorization on every API and export. Student sees own records only. Lender rep sees assigned applications and consented/allowed fields only. No lender rep access to other lenders' offers or internal commission data; no student access to internal notes. Mask sensitive identifiers, use short-lived file URLs, scan uploads, log access and exports. No real PII in public demo. The current static GitHub Pages prototype does not implement these server-side controls; its role switcher demonstrates intended UI boundaries only.

## 15. MVP scope

- Six role-specific demo views: Admin, Relationship Manager, Loan Operations, Lender / Partner Manager, Student / Applicant and Lender Representative.
- UI-level role switching and assigned-lender sample views; production authorization remains a backend requirement.
- Student portal shows every lender application for the borrower on one page, with a maximum of three sample applications per student.
- Community suggestions use university, city, state / region and destination country; students in the same region are recommended the same regional group.
- Each of the six roles has a guided walkthrough describing navigation and expected content.
- Student, co-applicant, education plan and financial profile.
- Shared case engine with separate NEW and BT pipelines.
- Lender directory, lender products, independent lender applications.
- Dynamic checklists, central upload vault and verification.
- Offers, sanction, tranche disbursement, BT payoff/savings calculator.
- Tasks, communication timeline, six templates and simulated messaging.
- Basic SLA, stale-case indicators, audit log, masking and permission tests.
- Dashboard: funnel, ageing, lender scorecard, rejection Pareto.

## 16. Later phases

Phase 2: authenticated backend and database policies for role and record scope; lender query loop; student offer compare/accept; SLA pause; escalation matrix; auto-assignment tuning; duplicate merge; mock OCR; expiry tracking; and permission-tested commission lifecycle and reconciliation.

Phase 3: forecasting, geography, team productivity, calendar sync, workflow editor and selected integration spikes.

## 17. Acceptance criteria for portfolio demo

- A complete student journey is demonstrable in under 10 minutes.
- A borrower with multiple lender applications can view each lender reference and status together on one page.
- Lender representative can switch between separate NEW and BT queues and see only applications assigned to the selected lender.
- Community recommendations match the student's destination city, state / region and country.
- Each role has a visible walkthrough with navigation actions and explanations.
- New Loan and BT have visibly distinct stages and business rules.
- Multiple lender applications can exist on one case.
- Document checklist and verification status are traceable.
- BT payoff precedes closure confirmation.
- Role permissions can be demonstrated and tested.
- All demo records are obviously synthetic and all integrations marked simulated.
