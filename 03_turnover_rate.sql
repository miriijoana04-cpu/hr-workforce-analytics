-- Turnover Rate per Quarter

SELECT 
    YEAR(termination_date)              AS "Year",
    QUARTER(termination_date)           AS "Quarter",
    COUNT(*)                            AS "Employees Left",
    (SELECT COUNT(*) FROM employees)    AS "Total Workforce",
    ROUND(
        COUNT(*) * 100.0 / 
        (SELECT COUNT(*) FROM employees), 2
    )                                   AS "Turnover Rate (%)"
FROM employees
WHERE termination_date IS NOT NULL
GROUP BY YEAR(termination_date), QUARTER(termination_date)
ORDER BY Year, Quarter;