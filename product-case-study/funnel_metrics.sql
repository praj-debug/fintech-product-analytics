-- Recreate the core funnel metrics from an events table.
-- Expected columns: user_id, event_name, event_date

WITH stage_counts AS (
  SELECT
    COUNT(DISTINCT CASE WHEN event_name = 'lead_created' THEN user_id END) AS leads,
    COUNT(DISTINCT CASE WHEN event_name = 'eligibility_completed' THEN user_id END) AS eligible,
    COUNT(DISTINCT CASE WHEN event_name = 'application_started' THEN user_id END) AS applications_started,
    COUNT(DISTINCT CASE WHEN event_name = 'documents_submitted' THEN user_id END) AS documents_submitted,
    COUNT(DISTINCT CASE WHEN event_name = 'loan_sanctioned' THEN user_id END) AS sanctioned,
    COUNT(DISTINCT CASE WHEN event_name = 'loan_disbursed' THEN user_id END) AS disbursed
  FROM refinance_events
)
SELECT
  leads,
  eligible,
  applications_started,
  documents_submitted,
  sanctioned,
  disbursed,
  ROUND(100.0 * eligible / NULLIF(leads, 0), 1) AS lead_to_eligibility_pct,
  ROUND(100.0 * applications_started / NULLIF(eligible, 0), 1) AS eligibility_to_application_pct,
  ROUND(100.0 * documents_submitted / NULLIF(applications_started, 0), 1) AS application_to_documents_pct,
  ROUND(100.0 * sanctioned / NULLIF(documents_submitted, 0), 1) AS documents_to_sanction_pct,
  ROUND(100.0 * disbursed / NULLIF(sanctioned, 0), 1) AS sanction_to_disbursement_pct
FROM stage_counts; 
