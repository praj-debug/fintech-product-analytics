-- Partner Rejection Diagnosis
-- Portfolio SQL: identify where partner-stage rejection is concentrated.
-- Expected source columns:
-- application_id, partner, aip_status, partner_decision,
-- rejection_reason, bureau_score, employment_type,
-- declared_income, bureau_income, journey_type, lead_source,
-- dsa, is_duplicate

-- 1. Partner-level rejection rate
SELECT
    partner,
    COUNT(*) AS partner_submissions,
    SUM(CASE WHEN partner_decision = 'REJECTED' THEN 1 ELSE 0 END) AS rejected,
    ROUND(
        100.0 * SUM(CASE WHEN partner_decision = 'REJECTED' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0), 2
    ) AS rejection_rate_pct
FROM partner_applications
WHERE aip_status = 'AIP'
GROUP BY partner
ORDER BY rejection_rate_pct DESC;

-- 2. Rejection reason concentration
SELECT
    partner,
    rejection_reason,
    COUNT(*) AS rejected_applications,
    ROUND(
        100.0 * COUNT(*) /
        NULLIF(SUM(COUNT(*)) OVER (PARTITION BY partner), 0), 2
    ) AS share_of_partner_rejections_pct
FROM partner_applications
WHERE aip_status = 'AIP'
  AND partner_decision = 'REJECTED'
GROUP BY partner, rejection_reason
ORDER BY partner, rejected_applications DESC;

-- 3. Scorecard / risk-cohort view
-- Where partner score bands are available, use them to test whether
-- rejection is concentrated among AIP users failing the partner's
-- proprietary underwriting scorecard.
SELECT
    partner,
    partner_score_band,
    bureau_score_band,
    COUNT(*) AS applications,
    SUM(CASE WHEN partner_decision = 'REJECTED' THEN 1 ELSE 0 END) AS rejected,
    ROUND(
        100.0 * SUM(CASE WHEN partner_decision = 'REJECTED' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0), 2
    ) AS rejection_rate_pct
FROM partner_applications
WHERE aip_status = 'AIP'
GROUP BY partner, partner_score_band, bureau_score_band
ORDER BY partner, rejection_rate_pct DESC;

-- 4. Identify potential declared-income / bureau-income mismatch
-- This is an addressable secondary hypothesis, not the assumed primary cause.
SELECT
    partner,
    CASE
        WHEN bureau_income IS NULL OR bureau_income = 0 THEN 'No bureau income'
        WHEN ABS(declared_income - bureau_income) / bureau_income <= 0.10 THEN '0-10% variance'
        WHEN ABS(declared_income - bureau_income) / bureau_income <= 0.25 THEN '11-25% variance'
        ELSE '>25% variance'
    END AS income_variance_band,
    COUNT(*) AS applications,
    SUM(CASE WHEN partner_decision = 'REJECTED' THEN 1 ELSE 0 END) AS rejected
FROM partner_applications
WHERE aip_status = 'AIP'
GROUP BY partner, income_variance_band
ORDER BY partner, rejected DESC;

-- 5. Compare DIY and assisted journeys
SELECT
    journey_type,
    COUNT(*) AS applications,
    SUM(CASE WHEN partner_decision = 'REJECTED' THEN 1 ELSE 0 END) AS rejected,
    ROUND(
        100.0 * SUM(CASE WHEN partner_decision = 'REJECTED' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0), 2
    ) AS rejection_rate_pct
FROM partner_applications
WHERE aip_status = 'AIP'
GROUP BY journey_type
ORDER BY rejection_rate_pct DESC;

-- 6. DSA / source quality view
SELECT
    dsa,
    lead_source,
    COUNT(*) AS applications,
    SUM(CASE WHEN partner_decision = 'REJECTED' THEN 1 ELSE 0 END) AS rejected,
    SUM(CASE WHEN is_duplicate = TRUE THEN 1 ELSE 0 END) AS duplicates,
    ROUND(
        100.0 * SUM(CASE WHEN partner_decision = 'REJECTED' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0), 2
    ) AS rejection_rate_pct
FROM partner_applications
WHERE aip_status = 'AIP'
GROUP BY dsa, lead_source
HAVING COUNT(*) >= 30
ORDER BY rejection_rate_pct DESC;

-- 7. Addressable vs structural rejection framework
-- Use partner-provided reason groups to separate:
--   structural/low-observability = proprietary scorecard failure
--   addressable = data, journey, routing, or sourcing issues
SELECT
    partner,
    CASE
        WHEN rejection_reason_group = 'PROPRIETARY_SCORECARD' THEN 'Structural / low-observability'
        ELSE 'Addressable / platform-influenced'
    END AS rejection_type,
    COUNT(*) AS rejected_applications
FROM partner_applications
WHERE aip_status = 'AIP'
  AND partner_decision = 'REJECTED'
GROUP BY partner, rejection_type
ORDER BY partner, rejected_applications DESC;
