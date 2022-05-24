## CodeUp temporary_tables exercises

## 1. Using the example from the lesson, 
##create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name

## A. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
## b. Update the table so that full name column contains the correct data
## c. Remove the first_name and last_name columns from the table.
## d. What is another way you could have ended up with this same table?

## Creating Table
Select first_name, last_name, dept_name
FROM employees
JOIN dept_emp de USING (emp_no)
JOIN departments d USING (dept_no);

USE employees;
## creating Temp table
Create Temporary table kalpana_1822.employees_with_departments AS (
	Select first_name, last_name, dept_name
	FROM employees
	JOIN dept_emp de USING (emp_no)
	JOIN departments d USING (dept_no)
    where to_date > NOW()
);

USE kalpana_1822;

## step A
ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

## Step B
UPDATE employees_with_departments set full_name = CONCAT(first_name,' ',last_name);

## Step C
ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

## Validation
select *
from employees_with_departments;

## Step D Other way to do this?  Create Full name in the original query 

## 2. Create a temporary table based on the payment table from the sakila database.
## Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. 
##For example, 1.99 should become 199.

USE sakila;
## Create original query
SELECT payment_id, customer_id, staff_id, rental_id, amount
FROM sakila.payment;

USE kalpana_1822;
## Create Temp table
CREATE TEMPORARY TABLE payments AS (
	SELECT payment_id, customer_id, staff_id, rental_id, amount
	FROM sakila.payment
);
## Validate
select * from payments;
describe payments;

ALTER TABLE payments MODIFY amount DECIMAL (6,2);

## ALTER AMOUNT & DROP "CENT" that was created erroneously  (line deleted)
UPDATE payments SET amount = amount *100;
ALTER TABLE payments DROP COLUMN cents;
ALTER TABLE payments MODIFY amount INT;

## Validate
SELECT * FROM payments;

## 3. Find out how the current average pay in each department compares to the overall current pay for everyone at the company. 
##In order to make the comparison easier, you should use the Z-score for salaries. 
##In terms of salary, what is the best department right now to work for? The worst?
USE employees;

## Create foundational query for t.table
SELECT AVG(salary) as avg_salary, std(salary) AS std_salary
from salaries;

## 63810 historic avg_sal
## 16,904 historic std_sal

##CREATE TEMP TABLE

CREATE TEMPORARY TABLE kalpana_1822.salary_info AS(
	SELECT dept_name, AVG(salary) as dept_avg_salary, std(salary) AS dept_std_salary
	from salaries
    JOIN dept_emp USING(emp_no)
    JOIN departments USING(dept_no)
    WHERE dept_emp.to_date > NOW()
    AND salaries.to_date > NOW()
    GROUP BY dept_name
);

USE kalpana_1822;
select * from salary_info;

ALTER TABLE salary_info ADD avg_sal FLOAT(10,2);
ALTER TABLE salary_info ADD std_sal FLOAT(10,2);
ALTER TABLE salary_info ADD z_score FLOAT(10,2);

UPDATE salary_info SET avg_sal = 63810;
UPDATE salary_info SET std_sal = 16904;

## Zscore Calculation
UPDATE salary_info set z_score = (dept_avg_salary-avg_sal)/std_sal;

select* from salary_info
ORDER by z_score;

## In terms of salary, what is the best department right now to work for? The worst? Sales has largest variation, HR has lowest.alter

## BONUS to Come


