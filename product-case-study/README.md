# Education Loan Refinance Funnel

A small product analytics case study for understanding where borrowers drop off in an education-loan refinance journey.

## Product problem

A refinance funnel can lose users between eligibility, document submission, sanction, and disbursement. The product team needs a simple way to identify the largest drop-off and prioritize improvements.

## Funnel

```text
Leads → Eligibility → Application Started → Documents Submitted → Sanctioned → Disbursed
```

## Example dataset

| Stage | Users | Conversion from previous stage |
|---|---:|---:|
| Leads | 1,000 | 100% |
| Eligibility | 720 | 72.0% |
| Application Started | 540 | 75.0% |
| Documents Submitted | 360 | 66.7% |
| Sanctioned | 270 | 75.0% |
| Disbursed | 210 | 77.8% |

## Product insight

The largest absolute loss happens between **Eligibility and Application Started** (180 users), while the weakest stage-to-stage conversion is **Application Started → Documents Submitted** (66.7%).

This suggests two different product questions:

1. Why are eligible users not starting the application?
2. What friction is preventing applicants from completing document submission?

## Suggested experiments

### Experiment 1: Eligibility-to-application handoff
- Show a personalized next-step checklist immediately after eligibility.
- Add an estimated completion time.
- Test a single primary CTA instead of multiple choices.

**Primary metric:** Eligibility → Application Started conversion.

### Experiment 2: Document collection UX
- Group required documents by borrower/co-applicant.
- Add upload progress and clear rejection reasons.
- Allow users to save and resume later.

**Primary metric:** Application Started → Documents Submitted conversion.

## Success metric framework

```text
North Star: Disbursed refinance customers

Input metrics:
- Eligibility rate
- Application start rate
- Document completion rate
- Sanction rate
- Disbursement rate

Guardrails:
- Application processing time
- Document rejection rate
- Customer support contacts per application
```

## Why this is useful for product teams

The analysis connects **funnel data → user friction → product hypotheses → measurable experiments** rather than stopping at a dashboard.
