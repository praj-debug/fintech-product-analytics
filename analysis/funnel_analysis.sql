-- Digital Lending Funnel Optimization
-- Portfolio SQL: decision-oriented analysis
-- Dataset: synthetic / anonymized

-- 01. Funnel volume and share
SELECT
    stage,
    COUNT(*) AS applications,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS share_of_portfolio_pct
FROM fintech_lending_portfolio_dataset
GROUP BY stage
ORDER BY applications DESC;

-- 02. Core business conversion
SELECT
    COUNT(*) AS applications,
    SUM(CASE WHEN approval_status = 'Yes' THEN 1 ELSE 0 END) AS approved,
    SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) AS disbursed,
    ROUND(100.0 * SUM(CASE WHEN approval_status = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate_pct,
    ROUND(100.0 * SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS disbursement_rate_pct
FROM fintech_lending_portfolio_dataset;

-- 03. Partner funnel performance
SELECT
    partner,
    COUNT(*) AS applications,
    ROUND(100.0 * SUM(CASE WHEN approval_status = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate_pct,
    ROUND(100.0 * SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS disbursement_rate_pct,
    ROUND(AVG(processing_days), 2) AS avg_processing_days,
    ROUND(SUM(estimated_partner_revenue), 2) AS estimated_revenue
FROM fintech_lending_portfolio_dataset
GROUP BY partner
ORDER BY disbursement_rate_pct DESC, estimated_revenue DESC;

-- 04. Segment performance by channel
SELECT
    channel,
    COUNT(*) AS applications,
    ROUND(100.0 * SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS disbursement_rate_pct,
    ROUND(AVG(processing_days), 2) AS avg_processing_days
FROM fintech_lending_portfolio_dataset
GROUP BY channel
ORDER BY disbursement_rate_pct DESC;

-- 05. SLA health
SELECT
    sla_status,
    COUNT(*) AS cases,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS share_pct
FROM fintech_lending_portfolio_dataset
GROUP BY sla_status
ORDER BY cases DESC;

-- 06. SLA breach hotspots
SELECT
    partner,
    city,
    COUNT(*) AS breached_cases,
    ROUND(AVG(processing_days), 2) AS avg_processing_days
FROM fintech_lending_portfolio_dataset
WHERE sla_status = 'SLA Breach'
GROUP BY partner, city
ORDER BY breached_cases DESC;

-- 07. Technology friction
SELECT
    api_issue,
    COUNT(*) AS affected_cases,
    SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) AS disbursed_cases,
    ROUND(100.0 * SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS disbursement_rate_pct
FROM fintech_lending_portfolio_dataset
GROUP BY api_issue
ORDER BY affected_cases DESC;

-- 08. Product performance
SELECT
    product,
    COUNT(*) AS applications,
    SUM(loan_amount) AS requested_value,
    SUM(CASE WHEN disbursed = 'Yes' THEN loan_amount ELSE 0 END) AS disbursed_value,
    ROUND(AVG(processing_days), 2) AS avg_processing_days
FROM fintech_lending_portfolio_dataset
GROUP BY product
ORDER BY disbursed_value DESC;

-- 09. UAT / readiness signal
SELECT
    uat_status,
    COUNT(*) AS cases,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS share_pct
FROM fintech_lending_portfolio_dataset
GROUP BY uat_status
ORDER BY cases DESC;

-- 10. Exception queue candidates
SELECT
    application_id,
    partner,
    city,
    stage,
    processing_days,
    sla_status,
    api_issue,
    loan_amount
FROM fintech_lending_portfolio_dataset
WHERE sla_status = 'SLA Breach'
   OR api_issue IS NOT NULL
ORDER BY processing_days DESC, loan_amount DESC;
