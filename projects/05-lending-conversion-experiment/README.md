# 05 — Lending Conversion Experiment

> **Case study:** Can a targeted change reduce customer drop-off without degrading approval quality or increasing operational workload?

## Experiment Brief

This case study demonstrates how a Product Operations / Product Analytics team can turn a funnel problem into a measurable experiment.

The experiment is intentionally designed around a lending workflow where customer friction and operational capacity must both be considered.

## Hypothesis

**If customers receive clearer, stage-specific guidance and proactive document reminders, then document completion and end-to-end disbursement conversion will improve without materially increasing support demand or reducing approval quality.**

## Proposed Change

### Control
Current document collection and status communication.

### Variant
- Stage-specific document checklist
- Clear explanation of missing documents
- Proactive reminder before SLA risk
- Real-time application status messaging

## Metrics

### Primary
**Document completion rate** and **application-to-disbursement conversion**.

### Secondary
- Time to document completion
- Approval-to-disbursement conversion
- P75 processing TAT
- Customer abandonment rate

### Guardrails
- Approval quality
- Complaint/contact rate
- Document resubmission rate
- Operations exception volume

## Experiment Design

| Component | Design |
|---|---|
| Population | Eligible new lending applications |
| Randomization | Application/customer level where operationally valid |
| Control | Existing experience |
| Variant | Improved guidance + reminders |
| Primary decision metric | Document completion |
| Business outcome | Disbursement conversion |
| Guardrails | Quality, support load, operational exceptions |

## Decision Rule

Do not ship because the variant has a prettier conversion number.

Recommend rollout when:

1. the primary metric shows a meaningful positive lift,
2. the business outcome improves or remains directionally positive,
3. no guardrail metric crosses its risk threshold,
4. operational capacity remains within acceptable limits.

## Follow-up Analysis

After the initial result, segment performance by:

- partner,
- acquisition channel,
- customer segment,
- loan amount,
- application stage,
- new vs repeat applicant where available.

This helps determine whether the change is broadly effective or only works for a specific cohort.

## Product Rollout Plan

```text
Experiment
    ↓
Validate result
    ↓
Check guardrails
    ↓
Segment lift
    ↓
Limited rollout
    ↓
Monitor
    ↓
Scale / iterate / rollback
```

## Measurement Discipline

The experiment should report **absolute conversion, relative lift, sample size, confidence interval, and practical business impact**, not only a percentage change.

Where historical variance or sample size is insufficient, the correct product decision is to continue testing rather than manufacture certainty. Humanity has enough dashboards pretending to know things already.

## Portfolio Takeaway

This case study demonstrates product judgment: define the problem, form a falsifiable hypothesis, protect against unintended consequences, and make the rollout decision measurable.

## Data

The experiment design is based on the synthetic lending portfolio and is illustrative rather than a claim of production results.
