## CodeUp SQL exercises - Where clause

## #2 fin all current or previous employee with the first names 'Irena', 'Vidya', or 'Maya' using IN

select emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
## Answer: 709 Rows returned

## 3 Find all current or previous employess with 'Irena', 'Vidya', or 'Maya' as in Q2 but use OR instead of IN.  Enter coment w/ # of records. Does it match number of rows from Q2?

select emp_no, first_name, last_name
from employees
Where first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya';
## 709 Rows returned

## 4. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
select emp_no, first_name, last_name, gender
FROM employees
Where first_name = 'Irena' AND gender = 'M'
OR first_name = 'Vidya' AND gender ='M'
OR first_name = 'Maya' AND gender = 'M';
## 414 Rows Returned

## 5. Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
select emp_no, first_name, last_name, gender
FROM employees
Where last_name LIKE 'E%';
## 7,330 Rows returned

## Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?
select emp_no, first_name, last_name, gender
FROM employees
Where last_name LIKE 'E%'
OR last_name LIKE '%E';
## 30723 Start or end in "E"select emp_no, first_name, last_name, gender
select emp_no, first_name, last_name, gender
FROM employees
Where last_name LIKE '%E';
## 24,292 names end in "e" 
SELECT 30723-24292;
## Difference of 6,431

## 7 Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?
select emp_no, first_name, last_name, gender
FROM employees
Where last_name LIKE 'E%'
AND last_name LIKE '%E';
## 899 Rows Returned 
Select 24292-899;
## 23,393 employees name ends in 'e' but does not start with 'e'. 24,292 total names begin and end with 'e'.  I believe this is what is being asked; unclear.

## 8.Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
select emp_no, first_name, last_name, gender, hire_date
FROM employees
Where hire_date BETWEEN '1990-01-01' and '1999-12-31'
ORDER by hire_date DESC;
## 135,214 Employees hired in the 90's 

## 9. Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
select emp_no, first_name, last_name, gender, birth_date
FROM employees
Where birth_date Like '%-12-25';
## 842 Rows returned

## 10.Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
select emp_no, first_name, last_name, gender, birth_date, hire_date
FROM employees
Where birth_date Like '%-12-25'
AND hire_date between '1990-01-01' AND '1999-12-31';
## 362 Rows Returned

## 11. Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
select emp_no, first_name, last_name, gender
FROM employees
Where last_name LIKE '%q%' 
OR last_name LIKE '%Q%'
ORDER by last_name DESC;
## 1873 Rows returned

## 12. Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
select emp_no, first_name, last_name, gender
FROM employees
Where last_name LIKE '%q%' 
AND last_name NOT LIKE '%Qu%'
ORDER by last_name DESC;
## 547 Rows Returned
