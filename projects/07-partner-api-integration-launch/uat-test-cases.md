# UAT Test Cases: Partner API Integration

## Test conventions

- Environment: fictional partner sandbox.
- Test data: synthetic only.
- Execution status: Not Run until evidence is recorded.
- Severity: S1 = critical launch blocker; S2 = major business/operational impact; S3 = moderate; S4 = minor.
- A test passes only when the actual result and evidence support the expected result.

## Test cases

| ID | Scenario | Preconditions / steps | Expected result | Severity |
|---|---|---|---|---|
| UAT-001 | Valid application submission | Submit a complete, valid application | 2xx acknowledgement; partner reference and correlation ID stored | S1 |
| UAT-002 | Missing mandatory field | Omit product code or consent reference | Validation error; request not forwarded to partner | S1 |
| UAT-003 | Invalid amount | Submit zero, negative or out-of-range amount | Clear validation response; no partner application created | S1 |
| UAT-004 | Duplicate request | Resubmit same logical request with same idempotency key | Existing outcome/reference returned or safely recognised; no duplicate created | S1 |
| UAT-005 | Timeout after partner acceptance | Simulate client timeout after partner receives request; retry with same key | No duplicate; final partner reference can be reconciled | S1 |
| UAT-006 | Authentication failure | Use expired or invalid sandbox token | Request rejected; no sensitive token logged; alert/owner path works | S1 |
| UAT-007 | Rate limit | Simulate 429 response | Backoff policy applied; retry bounded; no retry storm | S2 |
| UAT-008 | Partner 5xx | Simulate temporary server failure | Bounded retry; unresolved request enters exception handling | S1 |
| UAT-009 | Status mapping | Send each supported partner status | Correct canonical status and timestamp persisted | S1 |
| UAT-010 | Unknown partner status | Send an unmapped status value | Status routed to PARTNER_EXCEPTION; alert generated; no silent misclassification | S1 |
| UAT-011 | Duplicate / out-of-order webhook | Deliver same event twice and then an older event | Idempotent event handling; state does not regress incorrectly | S1 |
| UAT-012 | Invalid webhook signature | Send event with invalid signature | Event rejected; security event logged without exposing secrets | S1 |
| UAT-013 | Reconciliation mismatch | Partner and lender references/statuses differ | Mismatch appears in report/queue with owner and ageing | S2 |
| UAT-014 | PII masking | Trigger request/response logging | Sensitive fields masked or excluded as per policy | S1 |
| UAT-015 | End-to-end decision | Submit application and progress to terminal decision | Customer/operations view shows correct final status and reason code | S1 |

## Execution log template

Copy this table for each test cycle.

| Test ID | Tester | Run date | Actual result | Status (Pass/Fail/Blocked) | Evidence link | Defect ID |
|---|---|---|---|---|---|---|
| UAT-001 | TBD | TBD | TBD | Not Run | TBD | TBD |
| UAT-002 | TBD | TBD | TBD | Not Run | TBD | TBD |
| UAT-003 | TBD | TBD | TBD | Not Run | TBD | TBD |

## Defect triage fields

Every defect should include:
- concise title and affected test ID;
- environment, timestamp and correlation ID;
- reproducible steps and expected vs actual result;
- severity and customer / operational impact;
- evidence with sensitive information removed;
- owner, target fix version and retest result.

## UAT exit criteria

- All S1 test cases pass.
- No open S1 or S2 defects unless explicitly accepted through documented risk approval.
- Failed and blocked tests have owners and resolution plans.
- Evidence is linked and reproducible.
- Product, Engineering, QA, Risk and Operations sign-off is recorded.
