-- FamApp UPI Payment Recovery — proposed analytics definitions
-- Independent case study. Schema and examples are illustrative, not FamApp production data.
-- Assumed event table: payment_events
-- Fields: event_id, transaction_id, user_id_hash, event_name, event_ts,
-- payment_type, payee_hash, amount_bucket, status, bank_response_code,
-- app_version, experiment_variant
-- Do not store UPI PINs, full account numbers, or unnecessary personal data.

-- 1) Daily uncertain-outcome rate. Define eligible attempts consistently with engineering.
SELECT
  DATE(event_ts) AS event_date,
  COUNT(DISTINCT CASE WHEN event_name = 'payment_initiated' THEN transaction_id END) AS initiated,
  COUNT(DISTINCT CASE WHEN event_name = 'payment_pending' THEN transaction_id END) AS pending,
  COUNT(DISTINCT CASE WHEN event_name = 'payment_failed_confirmed' THEN transaction_id END) AS failed_confirmed,
  SAFE_DIVIDE(
    COUNT(DISTINCT CASE WHEN event_name = 'payment_pending' THEN transaction_id END),
    COUNT(DISTINCT CASE WHEN event_name = 'payment_initiated' THEN transaction_id END)
  ) AS pending_rate
FROM payment_events
GROUP BY event_date
ORDER BY event_date;

-- 2) Support contacts per 1,000 initiated payment attempts.
-- Requires a consistent transaction-to-support-case association.
WITH attempts AS (
  SELECT DATE(event_ts) AS event_date,
         COUNT(DISTINCT transaction_id) AS initiated
  FROM payment_events
  WHERE event_name = 'payment_initiated'
  GROUP BY event_date
),
contacts AS (
  SELECT DATE(event_ts) AS event_date,
         COUNT(DISTINCT transaction_id) AS support_contacted
  FROM payment_events
  WHERE event_name = 'payment_support_case_created'
  GROUP BY event_date
)
SELECT a.event_date, a.initiated, COALESCE(c.support_contacted, 0) AS support_contacted,
       SAFE_DIVIDE(COALESCE(c.support_contacted, 0), a.initiated) * 1000 AS contacts_per_1000_attempts
FROM attempts a
LEFT JOIN contacts c USING (event_date)
ORDER BY a.event_date;

-- 3) Experiment readout skeleton. Repeat-payment matching is a candidate metric only;
-- confirm the observation window and legitimate-repeat exclusions before analysis.
SELECT
  experiment_variant,
  COUNT(DISTINCT transaction_id) AS eligible_transactions,
  SAFE_DIVIDE(
    COUNT(DISTINCT CASE WHEN event_name = 'avoidable_repeat_payment_flag' THEN transaction_id END),
    COUNT(DISTINCT transaction_id)
  ) AS avoidable_repeat_rate,
  SAFE_DIVIDE(
    COUNT(DISTINCT CASE WHEN event_name = 'payment_support_case_created' THEN transaction_id END),
    COUNT(DISTINCT transaction_id)
  ) AS support_contact_rate
FROM payment_events
WHERE event_name IN (
  'payment_initiated',
  'avoidable_repeat_payment_flag',
  'payment_support_case_created'
)
GROUP BY experiment_variant;
