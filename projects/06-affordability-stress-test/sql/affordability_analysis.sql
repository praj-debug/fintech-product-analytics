-- Affordability Stress Test
-- Synthetic portfolio analysis

WITH base AS (
    SELECT
        customer_id,
        net_income,
        existing_emi,
        proposed_emi,
        existing_emi + proposed_emi AS total_emi
    FROM loan_applications
    WHERE net_income > 0
)
SELECT
    customer_id,
    net_income,
    existing_emi,
    proposed_emi,
    total_emi,
    ROUND(total_emi * 100.0 / net_income, 2) AS emi_to_income_pct,
    net_income - total_emi AS residual_income,
    CASE
        WHEN total_emi * 100.0 / net_income < 40
             AND net_income - total_emi >= 40000
            THEN 'GREEN'
        WHEN total_emi * 100.0 / net_income < 60
             AND net_income - total_emi >= 25000
            THEN 'AMBER'
        ELSE 'RED'
    END AS affordability_flag
FROM base
ORDER BY emi_to_income_pct DESC;
