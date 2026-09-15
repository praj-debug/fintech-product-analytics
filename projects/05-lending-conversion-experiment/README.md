# 05 - Lending Conversion Experiment

> **Decision question:** Can a targeted change reduce customer drop-off without degrading approval quality or increasing operational workload?

## Experiment Brief

The portfolio has **500 applications** and an **17.8% end-to-end disbursement rate**. This case study turns the observed funnel problem into a controlled product experiment rather than assuming every conversion issue should be solved with more follow-up.

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
**Document-to-credit-review progression rate**

### Secondary
- Application-to-disbursement conversion
- Approval-to-disbursement conversion
- P75 processing TAT
- Document completion time

### Guardrails
- Approval quality
- Complaint or contact rate
- Document resubmission rate
- SLA breach rate
- Operations exception volume
- API issue rate

## Experiment Design

| Component | Design |
|---|---|
| Population | Eligible new lending applications |
| Randomization | Application or customer level where operationally valid |
| Control | Existing experience |
| Variant | Improved guidance + reminders |
| Primary decision metric | Document → credit-review progression |
| Business outcome | Disbursement conversion |
| Guardrails | Quality, support load, SLA, exceptions, API reliability |

## Decision Rule

Recommend rollout only when:

1. the primary metric shows meaningful positive lift
2. the business outcome improves or remains directionally positive
3. no guardrail crosses its agreed risk threshold
4. operational capacity remains acceptable

## Product Artifact

A production experiment ticket would contain:

```text
Problem → Hypothesis → Instrumentation → Experiment → Readout → Decision
```

Instrumentation events are defined in [`experiment_plan.md`](experiment_plan.md).

A [synthetic experiment readout](synthetic_experiment_readout.md) shows how the decision could be made once results are available. It is clearly illustrative and does not claim a real production test.

## Follow-up Analysis

Segment results by partner, acquisition channel, product, loan amount and application stage. Use these cuts to determine whether the intervention should be universal or targeted.

## Rollout Plan

```text
Experiment
    ↓
Validate tracking
    ↓
Read primary + guardrails
    ↓
Segment lift
    ↓
Limited rollout
    ↓
Monitor regression
    ↓
Scale / iterate / rollback
```

## Measurement Discipline

The readout should include **absolute conversion, relative lift, sample size, confidence interval, and practical business impact**. A percentage change without its denominator is merely a confident-looking decoration.

## Portfolio Takeaway

The useful product signal is judgment: define a falsifiable hypothesis, protect customer and operational guardrails, and make the rollout decision measurable.

## Data Disclaimer

The experiment design and readout use synthetic or illustrative data. The repository does not claim the experiment was run in production or that the proposed change generated a real-world uplift.
