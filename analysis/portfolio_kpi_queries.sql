-- FinTech Product Analytics
-- Portfolio KPI layer for reproducible dashboard + case studies
-- Dataset: synthetic / anonymized, 500 application records

-- KPI 01: portfolio funnel snapshot
SELECT
    COUNT(*) AS applications,
    SUM(CASE WHEN stage IN ('Application','Documents','Credit Review','Approved','Disbursed','Rejected') THEN 1 ELSE 0 END) AS progressed_cases,
    SUM(CASE WHEN approval_status = 'Yes' THEN 1 ELSE 0 END) AS approved_cases,
    SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) AS disbursed_cases,
    ROUND(100.0 * SUM(CASE WHEN approval_status = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate_pct,
    ROUND(100.0 * SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS disbursement_rate_pct
FROM fintech_lending_portfolio_dataset;

-- KPI 02: processing distribution and SLA health
SELECT
    ROUND(AVG(processing_days), 2) AS avg_processing_days,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY processing_days) AS p50_processing_days,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY processing_days) AS p75_processing_days,
    PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY processing_days) AS p90_processing_days,
    ROUND(100.0 * SUM(CASE WHEN sla_status = 'SLA Breach' THEN 1 ELSE 0 END) / COUNT(*), 2) AS sla_breach_rate_pct
FROM fintech_lending_portfolio_dataset;

-- KPI 03: channel scorecard
SELECT
    channel,
    COUNT(*) AS applications,
    ROUND(100.0 * SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS disbursement_rate_pct,
    ROUND(AVG(processing_days), 2) AS avg_processing_days,
    ROUND(100.0 * SUM(CASE WHEN sla_status = 'SLA Breach' THEN 1 ELSE 0 END) / COUNT(*), 2) AS sla_breach_rate_pct,
    ROUND(SUM(loan_amount), 0) AS requested_loan_value
FROM fintech_lending_portfolio_dataset
GROUP BY channel
ORDER BY disbursement_rate_pct DESC, applications DESC;

-- KPI 04: partner scorecard inputs
SELECT
    partner,
    COUNT(*) AS applications,
    ROUND(100.0 * SUM(CASE WHEN approval_status = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate_pct,
    ROUND(100.0 * SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS disbursement_rate_pct,
    ROUND(100.0 * SUM(CASE WHEN sla_status = 'Within SLA' THEN 1 ELSE 0 END) / COUNT(*), 2) AS sla_adherence_pct,
    ROUND(AVG(processing_days), 2) AS avg_processing_days,
    ROUND(SUM(estimated_partner_revenue), 2) AS estimated_revenue
FROM fintech_lending_portfolio_dataset
GROUP BY partner
ORDER BY estimated_revenue DESC, disbursement_rate_pct DESC;

-- KPI 05: partner composite score for allocation decisions
WITH partner_metrics AS (
    SELECT
        partner,
        COUNT(*) AS applications,
        100.0 * SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS disbursal_rate,
        100.0 * SUM(CASE WHEN approval_status = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS approval_rate,
        100.0 * SUM(CASE WHEN sla_status = 'Within SLA' THEN 1 ELSE 0 END) / COUNT(*) AS sla_adherence,
        AVG(processing_days) AS avg_processing_days,
        SUM(estimated_partner_revenue) AS estimated_revenue
    FROM fintech_lending_portfolio_dataset
    GROUP BY partner
), normalized AS (
    SELECT
        *,
        100.0 * (disbursal_rate - MIN(disbursal_rate) OVER ()) /
            NULLIF(MAX(disbursal_rate) OVER () - MIN(disbursal_rate) OVER (), 0) AS disbursal_score,
        100.0 * (approval_rate - MIN(approval_rate) OVER ()) /
            NULLIF(MAX(approval_rate) OVER () - MIN(approval_rate) OVER (), 0) AS approval_score,
        100.0 * (sla_adherence - MIN(sla_adherence) OVER ()) /
            NULLIF(MAX(sla_adherence) OVER () - MIN(sla_adherence) OVER (), 0) AS sla_score,
        100.0 * (MAX(avg_processing_days) OVER () - avg_processing_days) /
            NULLIF(MAX(avg_processing_days) OVER () - MIN(avg_processing_days) OVER (), 0) AS tat_score,
        100.0 * (estimated_revenue - MIN(estimated_revenue) OVER ()) /
            NULLIF(MAX(estimated_revenue) OVER () - MIN(estimated_revenue) OVER (), 0) AS revenue_score
    FROM partner_metrics
)
SELECT
    partner,
    applications,
    ROUND(disbursal_rate, 2) AS disbursal_rate_pct,
    ROUND(approval_rate, 2) AS approval_rate_pct,
    ROUND(sla_adherence, 2) AS sla_adherence_pct,
    ROUND(avg_processing_days, 2) AS avg_processing_days,
    ROUND(estimated_revenue, 2) AS estimated_revenue,
    ROUND(
        0.25 * disbursal_score +
        0.15 * approval_score +
        0.20 * sla_score +
        0.15 * tat_score +
        0.25 * revenue_score,
        2
    ) AS allocation_score
FROM normalized
ORDER BY allocation_score DESC;

-- KPI 06: exception queue for operations
SELECT
    application_id,
    partner,
    city,
    channel,
    product,
    stage,
    processing_days,
    sla_status,
    api_issue,
    uat_status,
    loan_amount,
    CASE
        WHEN api_issue IN ('Yes','Failed') AND sla_status = 'SLA Breach' THEN 'P0 - Tech + SLA'
        WHEN api_issue IN ('Yes','Failed') THEN 'P1 - Tech'
        WHEN sla_status = 'SLA Breach' THEN 'P1 - SLA'
        WHEN uat_status = 'Pending' THEN 'P2 - Readiness'
        ELSE 'Monitor'
    END AS exception_priority
FROM fintech_lending_portfolio_dataset
WHERE sla_status = 'SLA Breach'
   OR api_issue IN ('Yes','Failed')
   OR uat_status = 'Pending'
ORDER BY exception_priority, processing_days DESC, loan_amount DESC;

-- KPI 07: disbursal value concentration
SELECT
    partner,
    ROUND(SUM(CASE WHEN disbursed = 'Yes' THEN loan_amount ELSE 0 END), 0) AS disbursed_value,
    ROUND(100.0 * SUM(CASE WHEN disbursed = 'Yes' THEN loan_amount ELSE 0 END) /
        SUM(SUM(CASE WHEN disbursed = 'Yes' THEN loan_amount ELSE 0 END)) OVER (), 2) AS share_of_disbursed_value_pct
FROM fintech_lending_portfolio_dataset
GROUP BY partner
ORDER BY disbursed_value DESC;
