## CodeUP Limit Exercises

## 1. Create a new SQL script named limit_exercises.sql.
## 2. MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. For example, to find all the unique titles within the company, we could run the following query:
SELECT DISTINCT title FROM titles;
# List first 10 distinct titles: Senior Engineer staff, engineer, senior staff, assistant engineer, technique leader, manager

## 3. Find all previous or current employees hired in the 90s and born on Christmas. Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. Write a comment in your code that lists the five names of the employees returned.
SELECT *
FROM employees
WHERE birth_date Like '%-12-25'
	AND hire_date like '199%'
ORDER BY hire_date
LIMIT 5; 
## Five employees: Alselm Cappelo, Utz Mandell, Bouchung Schreiter, Baocai Kushner, and Petter Stroustrup

## 4. Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results.
## LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?
SELECT *
FROM employees
WHERE birth_date Like '%-12-25'
	AND hire_date like '199%'
ORDER BY hire_date
LIMIT 5 OFFSET 45;
## OFFSET would be the total number of results.  If we are looking at the tenth page we would need to offset by 45 or nine pages of results.  Limit would be the number of items perpage.