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


-- 2. Disbursed cases by partner
SELECT
    partner,
    SUM(
        CASE
            WHEN disbursed = 'Yes' THEN 1
            ELSE 0
        END
    ) AS disbursed_cases
FROM fintech_lending_portfolio_dataset
GROUP BY partner
ORDER BY disbursed_cases DESC;


-- 3. Partner approval rate
SELECT
    partner,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN approval_status = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS approval_rate_pct
FROM fintech_lending_portfolio_dataset
GROUP BY partner
ORDER BY approval_rate_pct DESC;


-- 4. Partner disbursement rate
SELECT
    partner,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN disbursed = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS disbursement_rate_pct
FROM fintech_lending_portfolio_dataset
GROUP BY partner
ORDER BY disbursement_rate_pct DESC;


-- 5. Partner processing performance
SELECT
    partner,
    COUNT(*) AS total_applications,
    ROUND(AVG(processing_days), 2) AS avg_processing_days,
    ROUND(AVG(loan_amount), 2) AS avg_loan_amount
FROM fintech_lending_portfolio_dataset
GROUP BY partner
ORDER BY avg_processing_days ASC;


-- 6. Partner revenue contribution
SELECT
    partner,
    ROUND(SUM(estimated_partner_revenue), 2) AS estimated_revenue
FROM fintech_lending_portfolio_dataset
GROUP BY partner
ORDER BY estimated_revenue DESC;
