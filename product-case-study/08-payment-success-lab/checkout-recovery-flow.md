# Checkout Recovery UX Flow

## Successful payment

1. Show “Payment successful”.
2. Display order confirmation and reference ID where available.
3. Provide the next step to return to the merchant.

## Pending payment

1. Show “We’re checking your payment status”.
2. Explain only what is known; do not promise an unsupported resolution time.
3. Tell the customer not to pay again while the previous attempt is unresolved.
4. Offer a status refresh only if supported by the system.
5. Show a reference ID and support path if the status remains unresolved.

## Confirmed retryable failure

1. Show “Payment didn’t go through”.
2. Explain the reason only when reliable and safe to disclose.
3. Make clear that the previous attempt is confirmed failed.
4. Offer retry or an alternative method only in line with provider rules.
5. Preserve cart/order context where possible.

## Status unavailable

1. Show “We couldn’t confirm your payment status yet”.
2. Do not label the payment successful or failed without evidence.
3. Explain how to check again or contact support.
4. Do not encourage a new payment until the previous attempt is resolved or retry is confirmed safe.

## Design principles

- Put the status heading first.
- Pair icons with text; never rely on color alone.
- Show one primary action at a time.
- Make the reference ID easy to copy.
- Avoid blaming the customer.
- Support screen readers and clear focus order.
