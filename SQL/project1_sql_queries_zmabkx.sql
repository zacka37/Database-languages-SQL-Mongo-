-- Part one
-- 1. List all of the current employees first name, last name, salary and department name.
SELECT e.first_name, e.last_name, s.salary, d.dept_name
FROM employees e, salaries s, departments d, dept_emp de
WHERE e.emp_no = s.emp_no AND s.to_date = "9999-01-01" AND de.emp_no = e.emp_no AND d.dept_no = de.dept_no;
-- 2. List the first name, last name, and salary of the current employees with the ten (10) highest salaries.
SELECT e.first_name, e.last_name, s.salary
FROM employees e, salaries s
WHERE e.emp_no = s.emp_no AND s.to_date = "9999-01-01"
ORDER BY s.salary DESC
LIMIT 10;
-- 3. What is the total payroll (sum of all current salaries) for the company.
SELECT SUM(salary)
FROM salaries
WHERE to_date = "9999-01-01";
-- 4. Display a list of the unique titles for this company.
SELECT DISTINCT title
FROM titles;
-- 5. List the first name, last name, and department name for all current department managers.
SELECT e.first_name, e.last_name, d.dept_name
FROM employees e, departments d, dept_manager de
WHERE e.emp_no = de.emp_no AND de.dept_no = d.dept_no AND de.to_date = "9999-01-01";
-- 6. How many employees does each department currently have?
-- List the department name and number of employees in a column named “Number of Employees”.
SELECT d.dept_name, COUNT(de.emp_no) AS "Number of Employees"
FROM departments d, dept_emp de
WHERE d.dept_no = de.dept_no AND de.to_date = "9999-01-01"
GROUP BY d.dept_name;
-- 7. How many males and how many females have been hired by this company in its history?
SELECT gender, COUNT(emp_no)
FROM employees
GROUP BY gender;
-- 8. List the titles and the number of current employees that hold that title.
SELECT t.title, COUNT(t.emp_no) AS "Number of Employees"
FROM titles t
WHERE t.to_date = "9999-01-01"
GROUP BY t.title;