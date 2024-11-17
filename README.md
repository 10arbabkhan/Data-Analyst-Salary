# Global Data Analyst Salary Insights
## Overview
This project analyzes salary trends for data analyst roles across various industries and regions. Using SQL queries, the project extracts and analyzes key insights from a dataset, focusing on job titles, employment types, remote work trends, and salary distributions. The goal is to provide actionable insights for professionals and organizations to understand global salary patterns.

## Project Objectives
1. Identify job titles and their corresponding average salaries.
2. Explore the impact of work settings (remote vs. on-site) on salaries.
3. Analyze salary trends across different regions and company sizes.
4. Understand the correlation between experience levels and salary in USD.
5. Examine year-over-year changes in salary patterns.


## Dataset
The data for this project is sourced from the Kaggle dataset 
https://www.kaggle.com/datasets/hummaamqaasim/jobs-in-data

## Schema
```sql
CREATE TABLE Data_Analyst_Salary (
    work_year INT,
    job_title VARCHAR(50),
    job_category VARCHAR(50),
    salary_currency VARCHAR(50),
    salary INT,
    salary_in_usd INT,
    employee_residence VARCHAR(50),
    experience_level VARCHAR(50),
    employment_type VARCHAR(50),
    work_setting VARCHAR(50),
    company_location VARCHAR(50),
    company_size VARCHAR(50)
);
```
## Business Problems and Solutions (Queries Solved)
```sql
SELECT 
    *
FROM
    data_analyst_salary.data_analyst_salary;
```
-- 1. Retrieve all job titles in the table
```sql
SELECT 
    job_title
FROM
    data_analyst_salary
;
```
-- 2. List all employees who work remotely.
```sql
SELECT 
    *
FROM
    data_analyst_salary
WHERE
    work_setting = 'remote';
 ```
-- 3. Find the total number of employees in the dataset
```sql
SELECT 
    COUNT(*) Total_employee
FROM
    data_analyst_salary;
```
-- 4. Find the total number of employees in the dataset.
```sql
SELECT DISTINCT
    company_location
FROM
    data_analyst_salary;
```
-- 5. . Retrieve all employees who are in full-time employment.
```sql
SELECT 
    *
FROM
    data_analyst_salary
WHERE
    employment_type = 'Full-time';
```
```sql
-- 6. Calculate the average salary (in USD) for each job category.
	SELECT DISTINCT
    job_category
FROM
    data_analyst_salary;
		-- Finding the number of distinct job categories i.e 10
	SELECT 
    COUNT(DISTINCT job_category)
FROM
    data_analyst_salary;
    
		-- Finding average salary 
SELECT 
    job_category, AVG(salary_in_usd) avg_salary
FROM
    data_analyst_salary
GROUP BY job_category;
```
-- 7. Find the top 3 company locations with the highest average salary in USD.
```sql
SELECT 
    company_location, AVG(salary_in_usd) avg_salary
FROM
    data_analyst_salary
GROUP BY company_location
ORDER BY avg_salary DESC
LIMIT 3;
```
-- 8. Find the number of employees in each experience level.
```sql
SELECT 
    experience_level, COUNT(*) No_of_employees
FROM
    data_analyst_salary
GROUP BY experience_level;
```
```sql
-- 9. Retrieve all employees who have salaries greater than $100,000 in USD.
SELECT 
    *
FROM
    data_analyst_salary
WHERE
    salary_in_usd > 100000;
```
```sql
-- 10. Calculate the total salary (in USD) paid for remote work employees.
SELECT 
    SUM(salary_in_usd) Total_salary
FROM
    data_analyst_salary
WHERE
    work_setting = 'Remote';
```
-- 11. Find the job title with the highest average salary in USD.
```sql
SELECT 
    job_title, AVG(salary_in_usd) Avg_salary
FROM
    data_analyst_salary
GROUP BY job_title
ORDER BY avg_salary DESC
LIMIT 1;
```
-- 12. Compare the average salary in USD between remote and on-site employees.
```sql
SELECT 
    work_setting, AVG(salary_in_usd) avg_salary
FROM
    data_analyst_salary
GROUP BY work_setting;
```
-- 13. Find the largest company size (by number of employees) and the total salary paid by that company size
```sql
SELECT 
    company_size,
    COUNT(*) employee_count,
    SUM(salary_in_usd) total_salary
FROM
    data_analyst_salary
GROUP BY company_size
ORDER BY employee_count DESC
LIMIT 1;
```
-- 14. For each work year, calculate the total salary (in USD) and average salary for employees in each job category.
```sql
SELECT 
    work_year,
    job_category,
    SUM(salary_in_usd) total_salary,
    AVG(salary_in_usd) avg_salary
FROM
    data_analyst_salary
GROUP BY job_category , work_year;
```
-- 15. Find the top 5 job categories where employees with "Senior" experience level earn the highest average salary.
```sql
SELECT 
    job_category,
    experience_level,
    AVG(salary_in_usd) avg_salary
FROM
    data_analyst_salary
WHERE
    experience_level = 'senior'
GROUP BY job_category
ORDER BY avg_salary DESC
LIMIT 5;
```
-- 16. Identify the job title and company location combination that has the highest average salary.
```sql
SELECT 
    job_title, company_location, AVG(salary_in_usd) avg_salary
FROM
    data_analyst_salary
GROUP BY job_title , company_location
ORDER BY avg_salary DESC
LIMIT 1;
```
-- 17. Find the yearly trend of remote work employees and the total salary they earned
```sql
SELECT 
    work_year,
    COUNT(*) remote_emp,
    SUM(salary_in_usd) total_salary
FROM
    data_analyst_salary
WHERE
    work_setting = 'remote'
GROUP BY work_year
ORDER BY work_year;
```
-- 18. Compare the total salary paid in each company location for each experience level.
```sql
SELECT 
    company_location,
    experience_level,
    SUM(salary_in_usd) Total_salary
FROM
    data_analyst_salary
GROUP BY company_location , experience_level
ORDER BY total_salary DESC;
```

## Key Insights
### Remote Work Trends:
Employees working remotely constitute a significant portion of the workforce.
Salaries for remote workers are often comparable to on-site roles.
### Job Title and Salary:
Specific roles such as "Data Scientist" and "Machine Learning Engineer" are among the highest-paying within the dataset.
Entry-level roles exhibit a wider range of salary variability than senior roles.
### Regional Insights:
Employees in specific regions (e.g., North America) tend to earn higher salaries.
Companies in larger economies offer more competitive salaries.
### Experience-Level Impact:
There is a clear progression in salaries with increasing experience, with senior-level professionals earning significantly higher pay.

## Conclusions
### Remote Work:
Remote opportunities have expanded significantly, with competitive salaries offered across many regions.
### Experience Matters:
Experience level is a critical factor in salary determination, highlighting the importance of skill development and career progression.
### Regional Differences:
Salaries vary significantly by location, driven by regional economic factors and industry norms.
### Company Size:
Larger companies are more likely to offer higher salaries, reflecting their greater resources and market reach.

