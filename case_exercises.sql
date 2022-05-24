## CODEUP case_exercises

USE employees;
## 1. Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

Select 
	CONCAT(e.first_name,' ',e.last_name) AS full_name,
    de.dept_no,
    e.hire_date AS start_date,
    de.to_date AS end_date,
    CASE
		WHEN de.to_date = '9999-01-01' THEN 1
        Else 0
	END AS is_current_employee
FROM employees e
JOIN dept_emp de USING(emp_no);

## 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
Select 
	CONCAT(first_name,' ',last_name) AS full_name,
    CASE
		WHEN last_name between 'A%' and 'I%' then 'A-H'
        WHEN last_name between 'I%' and 'R%' then 'I-Q'
        ELSE 'R-Z'
	END AS alpha_group
FROM employees; 

## 3. How many employees (current or previous) were born in each decade?
Select
	COUNT(*),
	CASE
	WHEN birth_date LIKE '195%' THEN '50s'
    WHEN birth_date LIKE '196%' THEN '60s'
    WHEN birth_date LIKE '197%' then '70s'
    WHEN birth_date LIKE '198%' THEN '80s'
    WHEN birth_date LIKE '199%' THEN '90s'
    ELSE "Babys"
	END AS age_groups
FROM employees
GROUP BY age_groups;

## 182,886 from 50's , 117138 from 60's -- additional groups were made on assumption that there were younger employees

## 4. What is the current average salary for each of the following departmets

## Wrong query intentiall left in below to ask question on 'Using' statment preventing query
SELECT
    CASE
		WHEN dept_name IN('research', 'development') THEN 'R&D'
        WHEN dept_name IN('sales', 'marketing') THEN 'Sales & Marketing'
        WHEN dept_name IN('Production', 'Quality Management') THEN 'Prod & QM'
        WHEN dept_name IN('Finance', 'Human Resources') THEN 'Finance & HR'
        ELSE dept_name
	END AS dept_group,
    ROUND(AVG(salary),2) AS avg_salary
FROM salaries s
JOIN dept_emp de ON s.emp_no = de.emp_no
	AND de.to_date > NOW()
JOIN departments USING(dept_no)
WHERE s.to_date > NOW()
GROUP BY dept_group;

Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AND s.to_date > NOW() JOIN departments USING(dept_no) WHERE s.to_date > NOW() GR' at line 12

SELECT
    CASE
		WHEN dept_name IN('research', 'development') THEN 'R&D'
        WHEN dept_name IN('sales', 'marketing') THEN 'Sales & Marketing'
        WHEN dept_name IN('Production', 'Quality Management') THEN 'Prod & QM'
        WHEN dept_name IN('Finance', 'Human Resources') THEN 'Finance & HR'
        ELSE dept_name
	END AS dept_group,
    AVG(salary) AS avg_salary
FROM salaries s
JOIN dept_emp de using(emp_no)
	AND de.to_date > NOW()
JOIN departments USING(dept_no)
WHERE s.to_date > NOW()
GROUP BY dept_group;