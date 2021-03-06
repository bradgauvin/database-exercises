##Order by exercises from CodeUp

## 1. Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.
## 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

Select *
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya')
Order BY first_name;
## Irena Reutenauer is first & last nam in first row; Last person Vidya Simmen

## 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya')
ORDER BY first_name, last_name;
## Irena Action is First; Last person Vidya Zweizig

## 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya')
ORDER BY last_name, first_name; 
## First Row Irena Action, Last Row Maya Zyda

## 5.Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
SELECT *
FROM employees
WHERE last_name LIKE 'E%'
	AND last_name Like '%e'
ORDER BY emp_no;
## 899 rows returned,  # 10021 Ramzi Erde is first, #499648 Tadahiro Erde is Last

## 6. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
SELECT *
FROM employees
WHERE last_name LIKE 'E%'
	AND last_name Like '%e'
ORDER BY hire_date DESC;
## 899 rows returned, #Newest is Teiji Eldridge , oldedst is Sergi Erde from 1985-02-02

## 7.Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
SELECT *
FROM employees
WHERE birth_date Like '%-12-25'
	AND hire_date like '199%'
ORDER BY birth_date, hire_date DESC;
## 362 Rows returned, Khun Berini is oldest who was hired last; Dauadi Pettis is youngest and hired first