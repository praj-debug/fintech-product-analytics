# Tranche — Data Model Notes

## Core relationships

`Person 1—N CasePerson N—1 Case` allows one borrower/co-applicant/guarantor to participate in multiple cases and one case to have multiple people.

`Case 1—N LenderApplication` supports parallel lender submissions. Each LenderApplication belongs to one LenderProduct and maintains its own status and TAT.

`Lender 1—N LenderProduct`; product criteria and document requirements belong to LenderProduct rather than the lender organisation globally.

`LenderApplication 1—N Offer`; accepted Offer creates/links a Sanction.

`Sanction 1—N DisbursementTranche`; education loans can be disbursed in multiple tranches to university or other permitted recipients.

`Case 1—N DocumentRequirement`; requirements are generated per case / lender application context. `Document 1—N DocumentVersion` preserves uploaded versions and verification lineage.

`Case 1—N Task`, `Communication`, `StatusHistory`, `AuditEvent`, `Consent`.

`Case 0..1 ExistingLoan` for BT journeys. ExistingLoan retains old lender, account reference (masked), outstanding principal, ROI, EMI, repayment history, interest certificate, payoff letter amount and validity, prepayment charges, closure/NOC and lien/original-document release milestones.

## Design rules

- Case stage and LenderApplication status are separate state machines.
- Case roll-up status is derived from its workflow and lender application outcomes, not freely edited.
- Status transitions go through a single transition service which validates allowed transitions, required metadata and side effects; it appends StatusHistory and AuditEvent and starts/pauses/resumes SLA timers.
- On hold is represented as a flag/reason and SLA pause, not a universal stage.
- Rejection stores reason code, stage, lender and next action; supports reapply/reopen.
- Offer ranking compares total effective cost (ROI, fees and any moratorium interest), not only headline ROI.
- Lender recommendation is commission-blind. Recommendation rationale is logged.
- A student acceptance action identifies the selected lender application; alternate applications are explicitly closed or withdrawn after confirmation.
- Consent records identify the subject person, purpose, recipient lender, document/field scope, timestamp and withdrawal.
- Store only minimum sensitive identifiers; mask/tokenise Aadhaar and protect PAN/passport/bank information.
- Role visibility is enforced by data-layer policies, not only hidden UI components.
- Demo seed data is synthetic and deliberately non-realistic.
