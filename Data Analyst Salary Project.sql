SELECT 
    *
FROM
    data_analyst_salary.data_analyst_salary;

-- 1. Retrieve all job titles in the table
SELECT 
    job_title
FROM
    data_analyst_salary
;

-- 2. List all employees who work remotely.
SELECT 
    *
FROM
    data_analyst_salary
WHERE
    work_setting = 'remote';
 
-- 3. Find the total number of employees in the dataset
SELECT 
    COUNT(*) Total_employee
FROM
    data_analyst_salary;

-- 4. Find the total number of employees in the dataset.
SELECT DISTINCT
    company_location
FROM
    data_analyst_salary;

-- 5. . Retrieve all employees who are in full-time employment.
SELECT 
    *
FROM
    data_analyst_salary
WHERE
    employment_type = 'Full-time';

-- 6. Calculate the average salary (in USD) for each job category.
	SELECT DISTINCT
    job_category
FROM
    data_analyst_salary;
		-- Finding the number of distinct job category i.e 10
	SELECT 
    COUNT(DISTINCT job_category)
FROM
    data_analyst_salary;
    
		-- FInding averag salary 
SELECT 
    job_category, AVG(salary_in_usd) avg_salary
FROM
    data_analyst_salary
GROUP BY job_category;

-- 7. Find the top 3 company locations with the highest average salary in USD.
SELECT 
    company_location, AVG(salary_in_usd) avg_salary
FROM
    data_analyst_salary
GROUP BY company_location
ORDER BY avg_salary DESC
LIMIT 3; 

-- 8. Find the number of employees in each experience level.
select experience_level, count(*) No_of_employees
from data_analyst_salary
group by experience_level;

-- 9. Retrieve all employees who have salaries greater than $100,000 in USD.
select *
from data_analyst_salary
where salary_in_usd >100000;

-- 10. Calculate the total salary (in USD) paid for remote work employees.
select sum(salary_in_usd) Total_salary
from data_analyst_salary
where work_setting ="Remote";

-- 11. Find the job title with the highest average salary in USD.
select job_title, avg(salary_in_usd) Avg_salary
from data_analyst_salary
group by job_title
order by avg_salary Desc
limit 1;

-- 12. Compare the average salary in USD between remote and on-site employees.
select work_setting, avg(salary_in_usd) avg_salary
from data_analyst_salary
group by work_setting;

-- 13. Find the largest company size (by number of employees) and the total salary paid by that company size
select company_size, count(*) employee_count, sum(salary_in_usd) total_salary
from data_analyst_salary
group by company_size
order by employee_count desc
limit 1;

-- 14. For each work year, calculate the total salary (in USD) and average salary for employees in each job category.
select work_year,job_category, sum(salary_in_usd) total_salary, avg(salary_in_usd) avg_salary
from data_analyst_salary
group by job_category, work_year;

-- 15. Find the top 5 job categories where employees with "Senior" experience level earn the highest average salary.
select job_category,  experience_level, avg(salary_in_usd) avg_salary
from data_analyst_salary
where experience_level = "senior"
group by job_category 
order by avg_salary desc
limit 5;

-- 16. Identify the job title and company location combination that has the highest average salary.
Select job_title, company_location, avg(salary_in_usd) avg_salary
from data_analyst_salary
group by job_title, company_location
order by avg_salary desc
limit 1;

-- 17. Find the yearly trend of remote work employees and the total salary they earned
select work_year, count(*) remote_emp, sum(salary_in_usd) total_salary
from data_analyst_salary
where work_setting= "remote"
group by work_year
order by work_year;

-- 18. Compare the total salary paid in each company location for each experience level.
select company_location, experience_level, sum(salary_in_usd) Total_salary
from data_analyst_salary
group by company_location, experience_level
order by total_salary desc;
