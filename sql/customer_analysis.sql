-- FinTech Product Analytics
-- Customer & Lending Performance Analysis
-- Synthetic portfolio dataset

-- 1. Customer/application funnel overview
SELECT
    stage,
    COUNT(*) AS application_count,
    ROUND(
        100.0 * COUNT(*) / SUM(COUNT(*)) OVER (),
        2
    ) AS stage_percentage
FROM fintech_lending_portfolio_dataset
GROUP BY stage
ORDER BY application_count DESC;


-- 2. Approval performance
SELECT
    COUNT(*) AS total_applications,
    SUM(CASE WHEN approval_status = 'Yes' THEN 1 ELSE 0 END) AS approved_applications,
    ROUND(
        100.0 * SUM(CASE WHEN approval_status = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS approval_rate_pct
FROM fintech_lending_portfolio_dataset;


-- 3. Disbursement performance
SELECT
    COUNT(*) AS total_applications,
    SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) AS disbursed_cases,
    ROUND(
        100.0 * SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS disbursement_rate_pct
FROM fintech_lending_portfolio_dataset;


-- 4. Partner performance
SELECT
    partner,
    COUNT(*) AS applications,
    SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) AS disbursed_cases,
    ROUND(AVG(processing_days), 2) AS avg_processing_days,
    ROUND(SUM(estimated_partner_revenue), 2) AS estimated_revenue
FROM fintech_lending_portfolio_dataset
GROUP BY partner
ORDER BY estimated_revenue DESC;


-- 5. Processing efficiency
SELECT
    stage,
    COUNT(*) AS applications,
    ROUND(AVG(processing_days), 2) AS avg_processing_days
FROM fintech_lending_portfolio_dataset
GROUP BY stage
ORDER BY avg_processing_days DESC;


-- 6. Identify operational bottlenecks
SELECT
    stage,
    COUNT(*) AS applications,
    ROUND(AVG(processing_days), 2) AS avg_processing_days,
    SUM(CASE WHEN approval_status = 'Yes' THEN 1 ELSE 0 END) AS approved_cases,
    SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) AS disbursed_cases
FROM fintech_lending_portfolio_dataset
GROUP BY stage
ORDER BY avg_processing_days DESC;
