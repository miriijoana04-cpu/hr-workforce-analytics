-- Average Salary by Department

SELECT 
    d.dept_name                         AS "Department",
    COUNT(e.emp_id)                     AS "Total Employees",
    ROUND(AVG(s.amount), 2)             AS "Average Salary (ALL)",
    ROUND(MIN(s.amount), 2)             AS "Min Salary",
    ROUND(MAX(s.amount), 2)             AS "Max Salary"
FROM departments d
JOIN employees e  ON d.dept_id = e.dept_id
JOIN salaries s   ON e.emp_id  = s.emp_id
WHERE e.status = 'active'
GROUP BY d.dept_name
ORDER BY AVG(s.amount) DESC;