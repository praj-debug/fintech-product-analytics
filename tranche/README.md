# Tranche by Prajakta

## Education Loan Operations Platform

**Tagline:** Every loan. Every milestone. One clear journey.

> Independent portfolio product concept and prototype. This project uses synthetic data and illustrative lender rules. It is not a live lender integration or credit-decisioning service.

## Overview

Tranche is a multi-role education lending CRM concept for managing new education loans and balance transfers (refinancing) across a shared student and partner data model.

It is designed around the operational reality of education lending: multiple borrowers and co-applicants, academic milestones, lender-specific documentation, parallel lender applications, offers and sanctions, tranche-wise disbursement, and post-disbursement follow-through.

## Problem

Education loan journeys often span students, co-applicants, relationship managers, operations teams and lender partners. Information can become fragmented across spreadsheets, email and messaging channels. That fragmentation makes it harder to understand case ownership, document readiness, lender turnaround time, pending actions and the true status of a loan journey.

## Product approach

Tranche brings the journey into one coordinated workspace while keeping the two operating models distinct:

- **New Education Loans:** lead and counselling, eligibility, documentation, lender applications, offers, sanction, agreement and disbursement tranches.
- **Balance Transfers:** existing-loan review, savings validation, document collection, lender mapping, sanction, payoff/foreclosure, payment to the old lender, closure confirmation and post-closure release tracking.

Both workflows share Student 360, people and co-applicants, lender directory, document vault, communications, tasks, audit history and analytics.

## Users and role-aware experiences

| Role | Primary workspace |
|---|---|
| Sales / Relationship Manager | Lead conversion, assigned cases, follow-ups and student communication |
| Loan Operations | Document verification, lender submissions, queries and disbursement tracking |
| Partner Manager | Lender products, eligibility, application outcomes and turnaround time |
| Management | Business overview, funnel, portfolio, team and lender performance |
| Student / Applicant | Application status, document requests, uploads and messages |
| Lender Representative | Assigned lender applications and explicitly permitted information |

Role access is enforced by permissions and assigned-record scope. Students do not see internal notes; lender representatives do not see other lenders' offers or internal commissions.

## Core capabilities

- Business Overview dashboard with drill-through to underlying cases.
- Separate New Loan and BT pipelines.
- Case management in table and Kanban views with shared filters.
- Student 360 with co-applicants, academics, finances and linked cases.
- Hybrid case assignment with manual manager override and audit history.
- Central document vault supporting student self-upload and employee upload.
- Dynamic lender-product checklists, verification, rejection reasons and version history.
- Lender directory, product criteria, multi-lender applications and independent application statuses.
- Offer comparison using total effective cost, not headline rate alone.
- Sanction conditions, agreement steps and tranche-wise disbursements.
- BT payoff/foreclosure tracking, savings validation, old-lender closure and NOC/release tracking.
- Omnichannel communication timeline for WhatsApp, email, SMS and portal messages.
- Tasks, follow-ups, SLA clocks, stale-case flags and escalations.
- Funnel, ageing, lender scorecard, rejection and operations analytics.
- Append-only status history, audit events, consent records and role-based controls.

## Important product decisions

1. Model Person, Case, LenderApplication, Offer, Sanction and Disbursement as distinct entities.
2. Keep case stage separate from each lender application's status.
3. Treat co-applicants and guarantors as first-class people with their own consent and document access.
4. Track document requirements separately from uploaded documents and document versions.
5. In BT, the new lender's payoff/disbursement to the old lender precedes closure confirmation.
6. Pause SLA clocks when action is genuinely waiting on the student or lender.
7. Keep lender recommendation ranking commission-blind; log recommendation rationale.
8. Derive case roll-up status from underlying workflow state rather than allowing arbitrary manual edits.

## MVP boundaries

The first demonstrable slice focuses on RM, Operations and Admin workflows, with a lightweight student portal. It includes synthetic student/person data, both pipelines, lender applications, document verification, offers/sanctions/disbursement, BT payoff and savings calculations, tasks, communication simulation, basic SLA tracking, audit history and decision-focused dashboards.

Not included in the prototype: live lender integrations, real credit decisions, real KYC/bureau checks, money movement, regulated e-sign/e-NACH integrations or compliance certification.

## Proposed technology

- Next.js + TypeScript
- Tailwind CSS + shadcn/ui
- PostgreSQL with row-level security
- Supabase Auth or equivalent identity provider
- Object storage with short-lived signed URLs
- Background jobs for reminders, expiry and SLA events
- Synthetic seed data and role-based permission tests

## Security and trust principles

- Use synthetic data only in the public demo.
- Mask sensitive identifiers and avoid storing full Aadhaar unless legally necessary.
- Apply least-privilege access at the data layer, not only in the UI.
- Use consent and purpose-limited sharing before lender disclosure.
- Log document access, lender sharing, status changes and exports.
- Label simulated integrations and illustrative lender criteria clearly.
- Validate applicable legal and regulatory requirements with qualified counsel before any production use.

## Success measures

- Time from lead creation to submission-ready.
- First-pass document verification rate.
- Stage conversion and case ageing.
- Lender query and approval rates by borrower segment.
- Sanction-to-disbursement completion.
- SLA breach rate excluding paused time.
- BT net savings after fees and the proportion completing old-loan closure.

All portfolio metrics in the prototype are illustrative outputs from synthetic data, not claimed business results.

## Portfolio context

This is an independent product strategy and prototype project by Prajakta Mane. The product thinking is informed by lending operations experience, but the project does not use employer-confidential data, documents or proprietary lender criteria.
