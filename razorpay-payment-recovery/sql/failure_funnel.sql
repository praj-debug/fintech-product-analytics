-- Illustrative SQL for a hypothetical, documented payment_events schema.
-- Not Razorpay production SQL. Adapt table and column names to the actual warehouse.
-- Expected columns: attempt_id, event_name, event_timestamp, method_group,
-- failure_category, recovery_eligible, final_outcome, merchant_segment.
WITH attempt_level AS (
  SELECT
    attempt_id,
    MAX(method_group) AS method_group,
    MAX(failure_category) AS failure_category,
    MAX(CASE WHEN recovery_eligible THEN 1 ELSE 0 END) AS recovery_eligible,
    MIN(CASE WHEN event_name = 'payment_attempted' THEN event_timestamp END) AS attempted_at,
    MIN(CASE WHEN event_name = 'payment_succeeded' THEN event_timestamp END) AS succeeded_at,
    MAX(merchant_segment) AS merchant_segment
  FROM payment_events
  GROUP BY attempt_id
),
classified AS (
  SELECT *,
    CASE
      WHEN succeeded_at IS NOT NULL THEN 1
      ELSE 0
    END AS success_flag,
    CASE
      WHEN recovery_eligible = 1 AND succeeded_at IS NOT NULL THEN 1
      ELSE 0
    END AS eligible_recovery_success_flag
  FROM attempt_level
)
SELECT
  method_group,
  COALESCE(failure_category, 'no_failure_recorded') AS failure_category,
  COUNT(*) AS payment_attempts,
  SUM(success_flag) AS successful_attempts,
  ROUND(100.0 * SUM(success_flag) / NULLIF(COUNT(*), 0), 2) AS attempt_success_rate_pct,
  SUM(CASE WHEN recovery_eligible = 1 THEN 1 ELSE 0 END) AS eligible_recovery_attempts,
  SUM(eligible_recovery_success_flag) AS eligible_recovery_successes
FROM classified
GROUP BY method_group, COALESCE(failure_category, 'no_failure_recorded')
ORDER BY payment_attempts DESC;

-- Important: define attempt vs order vs payment intent carefully.
-- Deduplicate events, account for asynchronous status changes, and validate the
-- final-outcome window before interpreting this output. Raw attempt success is
-- not the same as incremental recovery lift; estimate lift with a controlled test.
