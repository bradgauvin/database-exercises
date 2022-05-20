-- Join Example Database

-- 1. Use the join_example_db. 
-- Select all the records from both the users and roles tables.

SELECT * FROM join_example_db.users;

SELECT * 
FROM users
JOIN roles ON users.role_id = roles.id;

-- 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. 
## Use count and the appropriate join type to get a list of roles along with the number of users that has the role. 
## Hint: You will also need to use group by in the query.

SELECT t2.name AS role_name, COUNT(t1.name) AS number_of_employees 
FROM users as t1
RIGHT JOIN roles AS t2 on t1.role_id = t2.id
GROUP by role_name;

## Employees Database

## 1. use the empoyees database
USE employees;

## 2 Using the example in the Associative Table Joins section as a guide, 
## write a query that shows each department along with the name of the current manager for that department.

Select t3.dept_name, CONCAT(t1.first_name,' ',t1.last_name) AS dept_manager
FROM employees AS t1
JOIN dept_manager AS t2 ON t1.emp_no = t2.emp_no
	AND to_date > NOW()
JOIN departments AS t3 on t3.dept_no = t2.dept_no;

## 3. Find the name of all departments currently managed by women.
Select t3.dept_name, CONCAT(t1.first_name,' ',t1.last_name) AS dept_manager
FROM employees AS t1
JOIN dept_manager AS t2 ON t1.emp_no = t2.emp_no
	AND to_date > NOW()
    AND gender = 'F'
JOIN departments AS t3 on t3.dept_no = t2.dept_no;

## 4. Find the current titles of employees currently working in the Customer Service department.
SELECT t2.title AS Title, COUNT(t1.emp_no)As count
FROM employees AS t1
JOIN dept_emp AS t3 on t3.emp_no = t1.emp_no
JOIN departments AS t4 ON t4.dept_no = t3.dept_no
	AND t4.dept_no = 'd009'
    AND t3.to_date > NOW()
JOIN titles AS t2 ON t2.emp_no = t1.emp_no
	AND t2.to_date > NOW()
GROUP BY title;
-- add one more Where clause - limited for current wide...not moved...
## My answers dont match - How can I validate? 

## 5. Find the current salary of all current managers.
SELECT 
	t2.dept_name,
    CONCAT(t1.first_name,' ',t1.last_name) AS full_name,
    salary
FROM employees as t1
JOIN dept_manager as t3 on t3.emp_no = t1.emp_no
	AND t3.to_date > NOW()
JOIN departments as t2 on t2.dept_no = t3.dept_no
JOIN salaries as t4 on t4.emp_no = t1.emp_no
	AND t4.to_date > NOW();
    
## 6. Find the number of current employees in each department.
Select
	t2.dept_no,
    t2.dept_name,
    COUNT(t3.emp_no) AS num_employees
FROM
	dept_emp as t3
JOIN 
	departments AS t2 on t2.dept_no = t3.dept_no
	AND t3.to_date > NOW()
Group BY dept_no;
    
## 7. Which department has the highest average salary? Hint: Use current not historic information.

SELECT 
	d.dept_name,
    AVG(salary) AS average_salary
FROM dept_emp as de
JOIN
	salaries AS s ON de.emp_no = s.emp_no
    AND s.to_date > NOW()
    AND de.to_date > NOW()
JOIN 
	departments AS d ON d.dept_no = de.dept_no
GROUP BY d.dept_name
HAVING dept_name = "Sales";

## 8. Who is the highest paid employee in the Marketing department?

Select
	e.first_name,
    e.last_name,
    s.salary
FROM
	employees AS e
Join 
	salaries AS s on s.emp_no = e.emp_no
JOIN dept_emp AS de on de.emp_no = e.emp_no
JOIN departments AS d on d.dept_no = de.dept_no
	AND d.dept_name = "Marketing"
ORDER by s.salary DESC
LIMIT 1;

## 9. Which current department manager has the highest salary?
SELECT 
	t2.dept_name,
    CONCAT(t1.first_name,' ',t1.last_name) AS full_name,
    salary
FROM employees as t1
JOIN dept_manager as t3 on t3.emp_no = t1.emp_no
	AND t3.to_date > NOW()
JOIN departments as t2 on t2.dept_no = t3.dept_no
JOIN salaries as t4 on t4.emp_no = t1.emp_no
	AND t4.to_date > NOW()
ORDER BY salary DESC
LIMIT 1;

## Determine the average salary for each department. Use all salary information and round your results.



  









