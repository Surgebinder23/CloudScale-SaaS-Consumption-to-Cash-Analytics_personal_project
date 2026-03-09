--How to use this in an interview
--If an interviewer asks, "How do you identify risk in a consumption business?" you point to this query.
--You explain that you don't just look at "Usage" in a vacuum; you look at Usage vs. Commitment. A customer using 1,000 units might look great, but if they paid for 10,000 units, they are actually a high-risk account.

SELECT *
FROM accounts;

WITH account_usage AS (
    SELECT 
        account_id,
        SUM(dbu_consumed * 0.15) as actual_revenue_recognized 
    FROM daily_usage
    GROUP BY 1
)
SELECT 
    a.account_id,
    a.segment,
    a.total_committed_spend,
    ROUND(COALESCE(u.actual_revenue_recognized, 0)::numeric, 2) as actual_revenue,
    -- Cast to numeric to satisfy the ROUND() function requirements
    CASE 
        WHEN a.total_committed_spend = 0 THEN 0 
        ELSE ROUND(((COALESCE(u.actual_revenue_recognized, 0) / a.total_committed_spend) * 100)::numeric, 2) 
    END as pct_consumed,
    -- Risk Logic
    CASE 
        WHEN a.total_committed_spend = 0 THEN 'No Commitment'
        WHEN (COALESCE(u.actual_revenue_recognized, 0) / a.total_committed_spend) < 0.25 THEN 'HIGH RISK - Under-utilization'
        WHEN (COALESCE(u.actual_revenue_recognized, 0) / a.total_committed_spend) > 0.90 THEN 'OPPORTUNITY - Upsell'
        ELSE 'Healthy'
    END as health_status
FROM accounts a
LEFT JOIN account_usage u ON a.account_id = u.account_id
ORDER BY pct_consumed ASC;