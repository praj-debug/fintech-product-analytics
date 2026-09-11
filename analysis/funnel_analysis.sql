-- FinTech Product Analytics
-- Digital Lending Funnel Analysis
-- Synthetic portfolio dataset

-- 1. Total applications
SELECT
    COUNT(*) AS total_applications
FROM fintech_lending_portfolio_dataset;


-- 2. Applications by funnel stage
SELECT
    stage,
    COUNT(*) AS application_count
FROM fintech_lending_portfolio_dataset
GROUP BY stage
ORDER BY application_count DESC;


-- 3. Approval rate
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN approval_status = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS approval_rate_pct
FROM fintech_lending_portfolio_dataset;


-- 4. Disbursal rate
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS disbursal_rate_pct
FROM fintech_lending_portfolio_dataset;


-- 5. Partner performance
SELECT
    partner,
    COUNT(*) AS applications,
    SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) AS disbursed_cases,
    ROUND(AVG(processing_days), 2) AS avg_processing_days,
    ROUND(SUM(estimated_partner_revenue), 2) AS estimated_revenue
FROM fintech_lending_portfolio_dataset
GROUP BY partner
ORDER BY estimated_revenue DESC;


-- 6. City performance
SELECT
    city,
    COUNT(*) AS applications,
    SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) AS disbursed_cases,
    ROUND(AVG(processing_days), 2) AS avg_processing_days
FROM fintech_lending_portfolio_dataset
GROUP BY city
ORDER BY disbursed_cases DESC;


-- 7. Product performance
SELECT
    product,
    COUNT(*) AS applications,
    SUM(loan_amount) AS total_loan_value,
    SUM(CASE WHEN disbursed = 'Yes' THEN loan_amount ELSE 0 END) AS disbursed_value,
    ROUND(AVG(processing_days), 2) AS avg_processing_days
FROM fintech_lending_portfolio_dataset
GROUP BY product
ORDER BY disbursed_value DESC;


-- 8. SLA performance
SELECT
    sla_status,
    COUNT(*) AS cases,
    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (), 2
    ) AS percentage
FROM fintech_lending_portfolio_dataset
GROUP BY sla_status;


-- 9. API issue analysis
SELECT
    api_issue,
    COUNT(*) AS cases,
    SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) AS disbursed_cases
FROM fintech_lending_portfolio_dataset
GROUP BY api_issue;


-- 10. UAT performance
SELECT
    uat_status,
    COUNT(*) AS cases
FROM fintech_lending_portfolio_dataset
GROUP BY uat_status
ORDER BY cases DESC;


-- 11. Channel performance
SELECT
    channel,
    COUNT(*) AS applications,
    SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) AS disbursed_cases,
    ROUND(AVG(processing_days), 2) AS avg_processing_days
FROM fintech_lending_portfolio_dataset
GROUP BY channel
ORDER BY disbursed_cases DESC;


-- 12. Identify SLA breach hotspots
SELECT
    partner,
    city,
    COUNT(*) AS sla_breaches
FROM fintech_lending_portfolio_dataset
WHERE sla_status = 'SLA Breach'
GROUP BY partner, city
ORDER BY sla_breaches DESC;
