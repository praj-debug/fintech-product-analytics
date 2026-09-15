# Exception Queue - Example

The control tower is meant to help a team decide what needs attention next. The queue below shows the structure I would use in an operating workflow.

These rows are **illustrative examples** of the workflow and are not presented as production incidents.

| Priority | Signal | Business impact | Owner | Next action | Target |
|---|---|---|---|---|---|
| P0 | API issue + SLA breach | Application is delayed and technology friction is affecting service | Engineering + Ops | Check failure pattern, recover case and confirm partner impact | Same day |
| P1 | SLA breach | Customer journey is outside expected processing time | Lending Ops | Reassign case, identify stage bottleneck and update customer status | Same day |
| P1 | API issue | Integration problem may create manual work or downstream leakage | Engineering + Partner | Review failure category, retry behaviour and affected partner/stage | Same day |
| P2 | UAT pending | Readiness dependency may delay a journey or release | Product + Partner | Confirm test status and owner, then track to closure | Next working day |

## What the queue should add in production

A real operating queue should also capture:

- application ID
- partner
- stage
- failure or root-cause category
- loan value at risk
- created timestamp
- ageing
- owner
- next action
- expected resolution time
- resolution timestamp
- final outcome

## Operating rhythm

**Detect → Diagnose → Assign → Resolve → Measure**

The queue should be reviewed with the relevant owners, not treated as another report. Repeated exceptions should feed back into product, partner or engineering priorities so the same issue does not keep returning with a fresh application ID.

## Success measures

- SLA breach rate
- P75 and P90 processing time
- aged exception backlog
- time to resolution
- repeat incident rate
- approval-to-disbursement conversion
- percentage of exceptions closed within target
