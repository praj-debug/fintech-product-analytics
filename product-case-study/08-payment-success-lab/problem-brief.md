# Problem Brief: Payment Failure Recovery UX

## User problem

When an online payment fails, remains pending, or returns an unclear status, a customer may not know what happened or what action is safe. Unclear guidance may lead to repeated attempts, uncertainty about whether money was debited, or avoidable support contacts.

## Target users

- **Primary:** customers attempting to complete an online purchase who see a failed, pending, or unknown payment status.
- **Secondary:** support agents investigating payment-status questions.
- **Internal stakeholders:** product, design, engineering, analytics, operations, risk/compliance, and payment-provider teams.

## Job to be done

“When my payment does not complete as expected, help me understand what is known and what I can safely do next, without risking a duplicate payment.”

## Hypotheses to validate

- H1: Status-specific, plain-language explanations will improve customer understanding.
- H2: Safe retry guidance for provider-confirmed retryable failures may improve recovery.
- H3: Showing a reference ID and clear escalation path may reduce avoidable status-related support contacts.
- H4: Pending, confirmed failure, and unknown status require different guidance.

These are hypotheses, not findings.

## Discovery plan

1. Review public payment-help guidance and checkout patterns.
2. Conduct 5–8 neutral user interviews if feasible.
3. Cluster reported pain points by uncertainty, urgency, trust, and recovery effort.
4. Test status copy and flows with a low-fidelity prototype.
5. Prioritize opportunities by user impact, safety, effort, and confidence.

## Scope

**In scope:** status comprehension, error categories, safe retry guidance, reference IDs, support handoff, funnel metrics, and experiment design.

**Out of scope:** a production gateway, real credentials, settlement guarantees, or live-provider integrations.

## Assumptions and unknowns

- A merchant can retrieve a status from its payment service provider.
- Provider status semantics and safe retry rules vary.
- Some statuses may be delayed or temporarily unavailable.
- Baseline success, failure, pending, recovery, and support-contact rates are not currently known.

## Success criteria for this case study

The portfolio artifact should show a clear chain from problem framing to analysis, requirements, UX, measurement, and a decision. Any product-impact claim requires validated data and a defined measurement period.
