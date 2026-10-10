USE hr_analysis;
SHOW TABLES;
DESCRIBE hr_workforce;
SELECT *
FROM hr_workforce
LIMIT 5;


-- 1. How many employees are there and what is the average  salary in each department?

SELECT
    department_name,
    COUNT(employee_id) AS total_employees,
    ROUND(AVG(salary), 2) AS average_salary
FROM hr_workforce
GROUP BY department_name
ORDER BY average_salary DESC;

-- 2. Which employees earn more than the company's average salary?

SELECT
    employee_name,
    job_title,
    salary
FROM hr_workforce
WHERE salary > (
    SELECT AVG(salary)
    FROM hr_workforce
)
ORDER BY salary DESC;

-- 3.  What are the top 5 job titles with the highest average salary ?

SELECT
    job_title,
    ROUND(AVG(salary), 2) AS average_salary
FROM hr_workforce
GROUP BY job_title
ORDER BY average_salary DESC
LIMIT 5;

-- 4. Compare average salary between regions.

SELECT
    region_name,
    COUNT(employee_id) AS total_employees,
    ROUND(AVG(salary), 2) AS average_salary
FROM hr_workforce
GROUP BY region_name
ORDER BY average_salary DESC;

-- 5.  Do employees who earn commission have a higher average salary than employees who do not?

SELECT
    has_commission,
    COUNT(employee_id) AS total_employees,
    ROUND(AVG(salary), 2) AS average_salary
FROM hr_workforce
GROUP BY has_commission
ORDER BY average_salary DESC;


-- 6.  How many employees were hired each year?

SELECT
    hire_year,
    COUNT(employee_id) AS employees_hired
FROM hr_workforce
GROUP BY hire_year
ORDER BY hire_year;

-- 7.  What is the total salary cost of each salary band?

SELECT
    salary_band,
    COUNT(employee_id) AS total_employees,
    SUM(salary) AS total_salary_cost
FROM hr_workforce
GROUP BY salary_band
ORDER BY total_salary_cost DESC;

-- 8. Which employees are paid above the midpoint of their job's salary range?

SELECT
    employee_name,
    job_title,
    salary,
    pay_range_position
FROM hr_workforce
WHERE pay_level = "Above Midpoint"
ORDER BY pay_range_position DESC;

-- 9.  Which managers have the largest teams Show the top 5 managers.

SELECT
    manager_name,
    COUNT(employee_id) AS team_size
FROM hr_workforce
WHERE manager_name <> "No Manager"
GROUP BY manager_name
ORDER BY team_size DESC
LIMIT 5;

-- 10.  Which employees had previous jobs before their current role?

SELECT
    employee_name,
    job_title,
    previous_jobs_count
FROM hr_workforce
WHERE previous_jobs_count > 0
ORDER BY previous_jobs_count DESC;

-- 11.  How much total salary cost belongs to each country?

SELECT
    country_name,
    SUM(salary) AS total_salary_cost
FROM hr_workforce
GROUP BY country_name
ORDER BY total_salary_cost DESC;

-- 12.  What is the total number of employees?

SELECT
    COUNT(employee_id) AS total_employees
FROM hr_workforce;

-- 13.  What is the company's overall average salary?

SELECT
    ROUND(AVG(salary), 2) AS overall_average_salary
FROM hr_workforce;

-- 14.  What is the total payroll?

SELECT
    SUM(salary) AS total_payroll
FROM hr_workforce;

-- 15. Which department has the highest total payroll?

SELECT
    department_name,
    SUM(salary) AS total_payroll
FROM hr_workforce
GROUP BY department_name
ORDER BY total_payroll DESC
LIMIT 1;

-- 16. Which employees have the highest salaries?

SELECT
    employee_name,
    job_title,
    department_name,
    salary
FROM hr_workforce
ORDER BY salary DESC
LIMIT 10;

-- 17. How many employees are in each department?

SELECT
    department_name,
    COUNT(employee_id) AS employee_count
FROM hr_workforce
GROUP BY department_name
ORDER BY employee_count DESC;

-- 18. How many employees have commission?

SELECT
    has_commission,
    COUNT(employee_id) AS employee_count
FROM hr_workforce
GROUP BY has_commission;

-- 19. How many employees are below and above midpoint?

SELECT
    pay_level,
    COUNT(employee_id) AS employee_count
FROM hr_workforce
GROUP BY pay_level;


-- 20. What is the average salary in each country?

SELECT
    country_name,
    COUNT(employee_id) AS employee_count,
    ROUND(AVG(salary), 2) AS average_salary
FROM hr_workforce
GROUP BY country_name
ORDER BY average_salary DESC;
