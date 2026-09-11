-- FinTech Product Analytics
-- Partner Performance Analysis
-- Synthetic portfolio dataset

-- 1. Applications by partner
SELECT
    partner,
    COUNT(*) AS total_applications
FROM fintech_lending_portfolio_dataset
GROUP BY partner
ORDER BY total_applications DESC;


-- 2. Approved applications by partner
SELECT
    partner,
    COUNT(*) AS approved_applications
FROM fintech_lending_portfolio_dataset
WHERE approval_status = 'Yes'
GROUP BY partner
ORDER BY approved_applications DESC;


-- 3. Disbursed applications by partner
SELECT
    partner,
    COUNT(*) AS disbursed_applications
FROM fintech_lending_portfolio_dataset
WHERE disbursed = 'Yes'
GROUP BY partner
ORDER BY disbursed_applications DESC;


-- 4. Partner approval rate
SELECT
    partner,
    COUNT(*) AS total_applications,
    SUM(CASE WHEN approval_status = 'Yes' THEN 1 ELSE 0 END) AS approved_applications,
    ROUND(
        100.0 * SUM(CASE WHEN approval_status = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS approval_rate_pct
FROM fintech_lending_portfolio_dataset
GROUP BY partner
ORDER BY approval_rate_pct DESC;


-- 5. Partner disbursement rate
SELECT
    partner,
    COUNT(*) AS total_applications,
    SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END) AS disbursed_applications,
    ROUND(
        100.0 * SUM(CASE WHEN disbursed = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS disbursement_rate_pct
FROM fintech_lending_portfolio_dataset
GROUP BY partner
ORDER BY disbursement_rate_pct DESC;


-- 6. Average processing time by partner
SELECT
    partner,
    ROUND(AVG(processing_days), 2) AS avg_processing_days
FROM fintech_lending_portfolio_dataset
GROUP BY partner
ORDER BY avg_processing_days ASC;


-- 7. Estimated revenue by partner
SELECT
    partner,
    ROUND(SUM(estimated_partner_revenue), 2) AS estimated_revenue
FROM fintech_lending_portfolio_dataset
GROUP BY partner
ORDER BY estimated_revenue DESC;
