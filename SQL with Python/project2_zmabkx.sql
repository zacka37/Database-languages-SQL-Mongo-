1)
CREATE VIEW EmployeesPerRegion AS
SELECT r.region_name, COUNT(e.employee_Id) AS "Number of Employees"
FROM regions r, countries c, locations l, departments m, employees e
WHERE e.department_id = m.department_id AND m.location_id = l.location_id AND l.country_id = c.country_id AND c.region_id = r.region_id
GROUP BY r.region_name;

SELECT *
FROM EmployeesPerRegion
WHERE region_name = "Americas";

2)
CREATE VIEW “managers” AS
SELECT e.first_name, e.last_name, e.phone_number, e.email, j.job_title, d.department_name
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id AND e.job_id = j.job_id AND e.employee_Id IN (SELECT manager_id FROM employees GROUP BY manager_id);

SELECT department_name, COUNT(first_name) AS 'Number of Managers'
FROM managers
GROUP BY department_name;
3)
CREATE VIEW DependentsByDepartment AS
SELECT COUNT(d.dependent_id) AS dependent_number, m.department_name AS departmentName
FROM dependents d, departments m, employees e
WHERE d.employee_id = e.employee_id AND e.department_id = m.department_id
GROUP BY m.department_name;

SELECT *
FROM DependentsByDepartment
ORDER BY dependent_number DESC
LIMIT 2;

4)
CREATE VIEW HiresByYear AS
SELECT COUNT(employee_id) AS "Employees Hired", YEAR(hire_date) AS "Year"
FROM employees
GROUP BY YEAR(hire_date);

SELECT *
FROM HiresByYear
WHERE Year = 1997;

5)
CREATE VIEW “SalaryByDepartment” AS
SELECT SUM(e.salary), d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
GROUP BY d.department_id;

SELECT *
FROM SalaryByDepartment
WHERE department_name = "Finance";

6)
ALTER VIEW SalaryByJobTitle AS
SELECT SUM(e.salary) AS Salary, j.job_title AS Job_Title
FROM employees e, jobs j
WHERE j.job_id = e.job_id
GROUP BY j.job_title;

SELECT *
FROM SalaryByJobTitle
ORDER BY Job_Title ASC
LIMIT 1;

7)
CREATE VIEW EmployeeDependents AS
SELECT e.first_name, e.last_name, e.email, e.phone_number, COUNT(d.dependent_id) AS numberOfDependents
FROM employees e
LEFT JOIN dependents d ON d.employee_id = e.employee_id
GROUP BY e.employee_id;

SELECT *
FROM EmployeeDependents
WHERE numberOfDependents = 0;

8)
CREATE VIEW CountryLocation AS
SELECT c.country_name, COUNT(l.location_id) AS NumberOfLocations
FROM locations l
RIGHT JOIN countries c ON c.country_id = l.country_id
GROUP BY c.country_name;

SELECT *
FROM CountryLocation
WHERE NumberOfLocations = 0;