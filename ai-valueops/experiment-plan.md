# Pilot & Measurement Plan: AI ValueOps

## Hypothesis
A structured AI portfolio workflow with named ownership, baseline metrics, adoption tracking, and finance-reviewed value calculations will improve the quality and speed of AI investment decisions compared with an unstructured pilot review process.

This is a hypothesis, not a measured result.

## Pilot scope
Start with one bounded workflow where volume, cycle time, quality, and cost can be measured. Avoid starting with a company-wide rollout.

## Baseline
Capture:
- Work volume and case mix.
- Current cycle/handling time.
- Error, correction, and rework rates.
- Cost per completed workflow.
- User satisfaction and support burden.
- Current tooling, implementation, and operating costs.

## Event taxonomy
| Event | Purpose | Example properties |
|---|---|---|
| initiative_registered | Track portfolio entry | initiative_id, workflow_type |
| owner_assigned | Confirm accountability | owner_role, assignment_date |
| baseline_approved | Confirm pre-pilot measurement | metric_set_version, period |
| pilot_started | Mark experiment start | cohort, start_date |
| eligible_user_invited | Establish adoption denominator | cohort, role_group |
| workflow_completed | Track real workflow usage | completion_type, quality_review |
| human_override_recorded | Track intervention and trust | override_reason |
| quality_issue_recorded | Monitor output issues | severity, category |
| operating_cost_recorded | Track costs | cost_category, period |
| value_review_completed | Record Finance review | review_period, decision |
| portfolio_decision_recorded | Capture scale/stop outcome | decision, rationale_category |

Avoid collecting sensitive prompts, confidential business data, or unnecessary personal information in analytics events.

## Metrics
- **Adoption:** activation among eligible users, repeat usage, workflow completion.
- **Efficiency:** cycle time, handling time, rework, cost per completed case.
- **Quality:** acceptance/correction rate, error severity, satisfaction.
- **Economics:** validated benefits minus implementation, model, support, review, and risk costs.
- **Guardrails:** privacy/security incidents, policy violations, harmful errors, complaints, and override rate.

## ROI validation
Separate projected savings, pilot-observed changes, and finance-validated realised value. Time released is not automatically cash saved. Document how released capacity translates into avoided costs, more output, or better service outcomes. Record measurement period, population, comparison method, assumptions, and confidence.

## Decision rules
- **Scale:** Pre-agreed outcome thresholds are met, adoption is sustained, quality is acceptable, and Finance validates the business case.
- **Iterate:** Evidence suggests a fixable adoption, workflow, data, or quality barrier.
- **Pause:** Critical dependency, security review, or measurement issue prevents a valid test.
- **Stop:** Business value is weak, costs exceed credible benefits, adoption remains low after reasonable iteration, or risk guardrails breach.

## Pre-launch checklist
- [ ] Named business owner and executive sponsor
- [ ] Baseline and success criteria agreed
- [ ] Eligible population and comparison method documented
- [ ] Data, privacy, security, and risk reviews complete
- [ ] Adoption and quality measures instrumented
- [ ] Finance agrees how value will be calculated
- [ ] Review cadence, decision date, and stop conditions assigned

## Transparency
Independent proposed plan only. No pilot has been run and no ROI is claimed.
