-- Tables Exercises
--  Previously accomplished: Steps 1-3
-- Q: List all the tables in the database Write the SQL code necessary to acomplish this:
Show Tables;
-- Q: Explore the Employees table.  What different data types are present on this table?
DESCRIBE employees;
-- A: emp_no: int, birth_date: date, first_name & last_name: varchar (14 &16), gender: enum('M','F'), hire_date: date
-- 6 Q: Which table(s) do you think contain a numeric type column? (Write this question and your answer in a comment)
-- 6 A: tables.dept_emp: Emp_no, salaries: salary
-- 7 Q: Which table(s) do you think contain a string type column? (Write this question and your answer in a comment)
-- 7 A: dept_Name, dept_no, employee first/last name, title
-- 8 Q: Which table(s) do you think contain a date type column? (Write this question and your answer in a comment)
-- 8 A: dept_emp: from_date & to_date, employees. birth_date, hire_date, salaries. from_date & to_date, titles. from & to
-- 9 Q: What is the relationship between the employees and the departments tables? (Write this question and your answer in a comment)
-- 9 A: departments and employees are related throug hte dept_emp table joining the emp_no to dept_no
-- 10 Q: Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
show create table dept_manager;