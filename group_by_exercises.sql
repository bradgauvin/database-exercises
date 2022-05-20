## CodeUP Group_by_exercises

## 1. Create a new file named group_by_exercises.sql
## 2. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
SELECT DISTINCT title
FROM titles;
## Answer: 7 Distinct Titles

## 3. Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
SELECT DISTINCT last_name
FROM employees
Where last_name LIKE 'E%e'
Group by last_name; 
## Answer: 5 Rows returned

## 4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE 'E%e'
GROUP BY full_name;

## 5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT last_name
FROM employees
WHERE
	last_name LIKE '%q%'
	AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
## Last names of Chleq, Lindqvist, and Qiwen

## 6. Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
SELECT last_name, COUNT(*)
FROM employees
WHERE
	last_name LIKE '%q%'
	AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

## 7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT COUNT(gender), gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya')
GROUP BY gender;

## 8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
SELECT 
    LOWER(CONCAT(SUBSTR(first_name, 1, 1),
                    SUBSTR(last_name, 1, 4),
                    '_',
                    SUBSTR(birth_date, 6, 2),
                    SUBSTR(birth_date, 3, 2))) AS 'username',
		COUNT(*) as '#_of_Users'
FROM
    employees
GROUP BY username;
## Are there duplicates? Yes
SELECT 
    LOWER(CONCAT(SUBSTR(first_name, 1, 1),
                    SUBSTR(last_name, 1, 4),
                    '_',
                    SUBSTR(birth_date, 6, 2),
                    SUBSTR(birth_date, 3, 2))) AS 'username',
		COUNT(*) as 'count_of_users'
FROM
    employees
GROUP BY username
HAVING count_of_users > 1;

##BONUS: How many duplicate usernames are there? 13,251 rows returned

## 9. More practice with aggregate functions:
## Determine the historic average salary for each employee. When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by that exact column.
SELECT emp_no, AVG(salary) AS avg_salary
FROM salaries
GROUP BY emp_no;
## Using the dept_emp table, count how many current employees work in each department. The query result should show 9 rows, one for each department and the employee count.
SELECT dept_no, COUNT(emp_no)
FROM dept_emp
WHERE to_date > NOW()
GROUP BY dept_no;

## Determine how many different salaries each employee has had. This includes both historic and current.
SELECT COUNT(DISTINCT salary)AS salary_numbers, emp_no
FROM salaries
GROUP BY emp_no;

## Find the maximum salary for each employee.
SELECT MAX(salary), emp_no
FROM salaries
GROUP BY emp_no;
## Find the minimum salary for each employee.
SELECT MIN(salary), emp_no
FROM salaries
GROUP BY emp_no;
## Find the standard deviation of salaries for each employee.
SELECT STD(salary), emp_no
FROM salaries
GROUP BY emp_no;
## Now find the max salary for each employee where that max salary is greater than $150,000.
SELECT MAX(salary), emp_no
FROM salaries
WHERE salary > 150000
GROUP BY emp_no;
## Find the average salary for each employee where that average salary is between $80k and $90k.
SELECT AVG(salary), emp_no
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) BETWEEN 80000 and 90000;

