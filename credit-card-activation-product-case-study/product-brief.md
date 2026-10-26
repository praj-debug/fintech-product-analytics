# Product Brief: Credit Card Activation

## Context

This independent case study explores a hypothetical consumer credit-card journey. The scenario is not based on Bright Money internal data.

## Problem statement

Eligible customers who have been approved may not progress to card activation and first purchase. The reasons are unknown until behavioural data and customer evidence are examined. Potential causes include unclear next steps, card-access friction, verification failures, repayment uncertainty, and lack of relevant guidance.

## Target user

A newly approved, eligible applicant who has not yet activated their card or completed a first purchase.

## User need

“I want to understand what I need to do next, access my card easily, and understand the costs and repayment responsibilities before I use it.”

## Product goal

Increase the share of eligible approved users who activate and make a first purchase within seven days, without worsening customer outcomes, risk, or unit economics.

## User story

As a newly approved cardholder, I want a clear and trustworthy path to set up and use my card so I can make an informed first purchase and understand how repayment works.

## Requirements

### P0: Measurement and clarity
- Define consistent events for approval, card access, activation, first purchase, and repeat use.
- Show a clear next action after approval.
- Provide understandable explanations of relevant fees, repayment obligations, and due dates.
- Instrument errors and recovery paths without logging sensitive payment credentials.

### P1: Recovery and guidance
- Provide actionable recovery guidance for common card-access or verification failures.
- Offer help at the point of friction.
- Send a reminder only where permitted, useful, and within frequency limits.
- Provide a clear post-purchase confirmation and route to spending and payment information.

## Non-goals
- Encouraging unnecessary borrowing or spending.
- Weakening underwriting, verification, or fraud controls.
- Promising approval or credit limits.
- Optimising first purchase without monitoring downstream customer outcomes.

## Dependencies
- Product, Design, Engineering, Analytics, Risk, Compliance, Customer Operations, and external card/issuer partners.
- Accurate event tracking and agreed definitions.
- Legal/compliance review of disclosures and communications.

## Acceptance criteria
- Funnel events pass analytics QA.
- Eligible users can identify their next step and understand repayment information in usability testing.
- Error states provide actionable guidance.
- Experiment assignment and eligibility rules are documented.
- Guardrail monitoring and rollback ownership are agreed before release.
