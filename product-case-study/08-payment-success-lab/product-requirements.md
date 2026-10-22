# Product Requirements: Payment Status and Recovery

**Status:** Draft concept  
**Version:** 0.1  
**Evidence status:** Hypotheses; no live experiment completed

## Summary

Design a payment-result experience that states the known status, offers a safe next step, and avoids encouraging repeat payment while the previous attempt may still be processing.

## Goals

- Help customers understand the payment outcome.
- Support recovery from eligible confirmed failures.
- Reduce avoidable uncertainty without making unsupported promises.
- Prevent unsafe repeat attempts.

## Non-goals

- Replacing a payment service provider.
- Guaranteeing settlement or refund timing.
- Automatically retrying every failed attempt.
- Collecting payment secrets in the prototype.

## User stories

- As a customer, I want to know whether my payment succeeded, failed, or is still processing.
- As a customer with a pending payment, I want guidance on whether to wait or take action.
- As a customer with a confirmed retryable failure, I want a safe way to retry or choose another method.
- As a support agent, I want a reference ID and relevant status context to investigate the issue.

## Requirements

### P0: Must have

- Display distinct states: Successful, Pending, Failed, and Status unavailable.
- For Pending, discourage another payment until the status is resolved or provider policy confirms retry is safe.
- Show a reference ID when available.
- Show reason details only when reliable and appropriate for customers.
- Provide a support path without exposing payment credentials.
- Avoid claiming money was debited, refunded, or settled unless confirmed by a reliable source.

### P1: Should have

- Offer alternative payment methods only when the prior attempt is confirmed failed or safe to abandon.
- Track non-sensitive funnel events.
- Provide accessible status text that does not rely on color alone.

## Acceptance criteria

- Each status has distinct copy and a suitable next step.
- Pending and unknown states do not show an unsafe retry prompt.
- Reference ID is easy to copy when present.
- Analytics events exclude card numbers, CVV, UPI PINs, passwords, and other secrets.
- Status changes are accessible to assistive technology.

## Edge cases

- Provider status timeout.
- Delayed success after an apparent failure.
- Duplicate provider event delivery.
- App closed during authentication.
- Missing transaction reference.
- Conflicting status responses.
- Customer switches payment method while a prior attempt is pending.

## Dependencies

Provider-specific status mapping, idempotency handling, event instrumentation, customer-support processes, privacy/security review, and design/engineering capacity.

## Open questions

- Which provider codes can safely map to customer-facing explanations?
- What exact conditions make a retry safe?
- What are baseline support-contact reasons and volumes?
- Which user segments and payment methods belong in the first test?
