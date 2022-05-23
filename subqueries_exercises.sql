## CODEUP Subqueries Exercises
## 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

## Writing query to find hire date of 101010
SELECT hire_date
    FROM employees
    WHERE emp_no = 101010;

## Write query to find other employees
SELECT 
	CONCAT(first_name,' ',last_name)
		AS full_name,
	hire_date
FROM
	employees
JOIN dept_emp USING (emp_no)
WHERE to_date > now()
AND hire_date = (
	SELECT hire_date
    FROM employees 
    WHERE emp_no = 101010);
    

## 2.Find all the titles ever held by all current employees with the first name Aamod.
## code for subquery
SELECT emp_no
FROM employees
JOIN dept_emp USING (emp_no)
WHERE first_name = "Aamod"
AND to_date>NOW();


## code for full answer
SELECT 
	title
FROM 
	titles
WHERE emp_no IN (SELECT emp_no
FROM employees
WHERE first_name = "Aamod"
AND to_date>NOW()
)
GROUP BY title;

## 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
Select 
	emp_no
FROM 
	dept_emp
WHERE to_date < now();

Select
	COUNT(*)
From employees
WHERE emp_no not IN (
	Select emp_no
	FROM dept_emp
	WHERE to_date < now()
);
## 214,916 employees no longer at organization

## 4. Find all the current department managers that are female. List their names in a comment in your code.
SELECT emp_no
FROM dept_manager
WHERE to_date>NOW();

SELECT
	concat(first_name,' ',last_name) AS full_name
FROM employees
WHERE emp_no IN (SELECT emp_no
	FROM dept_manager
	WHERE to_date>NOW()
)
and gender ='F';
## Isamu Legleitner, Karsten Sigstam, Leon DasSarma, Hilary kambil

## 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
## Building Subquery for companies's overall historical average
Select AVG(salary)
FROM salaries;

## Finding full answer
Select first_name, last_name, salary
From employees
Join salaries USING (emp_no)
Where salary > (
	Select AVG(salary)
	FROM salaries
) and to_date > NOW();
## 154,543 records returned

## 6. How many current salaries are within 1 standard deviation of the current highest salary? 
## Building Subquries
## Overall average, STD, max and 1SD from Max
Select AVG(salary),STD(salary), MAX(salary), MAX(salary)-STD(salary)
FROM salaries;

## Current average, STD, max and 1 SD from Max
Select AVG(salary),STD(salary), MAX(salary), MAX(salary)-STD(salary)
FROM salaries
WHERE to_date > NOW();

## Current Max Salary
Select MAX(Salary)
From salaries
Where to_date > NOW();

## Max - 1 STD (overall)
SELECT MAX(salary)-STD(salary)
FROM salaries;

## Max - 1 ST(Current)
SELECT MAX(salary)-STD(salary)
FROM salaries
Where to_date > NOW();

## Total Employees
Select COUNT(*)
From dept_emp
WHERE to_date > NOW();
## Returns 240,124 employees

Select Count(*)
FROM salaries
WHere salary >(SELECT MAX(salary)-STD(salary)
FROM salaries
)
AND to_date > NOW();
## 78 current salaries based on overall salary STD

Select Count(*)
FROM salaries
WHere salary >(SELECT MAX(salary)-STD(salary)
FROM salaries
Where to_date > NOW()
)
AND to_date >NOW();
## 83 current salaries based on current salary STD

## what percentages of salaires is this?

Select 
	(Select Count(*)
	FROM salaries
    WHERE to_date > NOW()
	AND salary >(SELECT MAX(salary)-STD(salary)
		FROM salaries
		Where to_date > NOW()))
/
	(Select COUNT(*)
	From dept_emp
	WHERE to_date > NOW()
	)* 100
AS perc_emp
From salaries
Group BY perc_emp;

## 0.0346%

## 		(Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
## Hint You will likely use multiple subqueries in a variety of ways
## Hint It's a good practice to write out all of the small queries that you can. 
## 		Add a comment above the query showing the number of rows returned. 
## 		You will use this number (or the query that produced it) in other, larger queries.


##BONUS

## Find all the department names that currently have female managers.
##Find the first and last name of the employee with the highest salary.
##Find the department name that the employee with the highest salary works in.