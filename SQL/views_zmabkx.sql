--1. Write a query to create a view named "SFEmployees" for those salespeople who work in the San Francisco office. Include the employee name (first, last), number, email, and job title.
--1. Query the SFEmployees view to count the number of employees in the San Francisco office.
CREATE VIEW SFEmployees AS
SELECT e.lastName, e.firstName, e.employeeNumber, e.email, e.jobTitle
FROM employees e, offices o
WHERE o.city = "San Francisco" AND o.officeCode = e.officeCode; 

SELECT COUNT(employeeNumber)
FROM SFEmployees;

--2.Write a query to create a view named "managers" to display all the managers. Include the manager’s name (first, last), number, email,  job title, and office city.
--2. Query the managers view to show the number of managers in each city.
CREATE VIEW managers AS
SELECT e.lastName, e.firstName, e.employeeNumber, e.email, e.jobTitle, o.city, e.reportsTo
FROM employees e, offices o
WHERE e.jobTitle LIKE "%Manager%" AND o.officeCode = e.officeCode;

SELECT COUNT(employeeNumber), city
FROM managers
GROUP BY city;

--3. Write a query to create a view named "custByCity" to get a count of how many customers there are in each city.
--3. Query the custByCity view to show the number of customers in Singapore.
CREATE VIEW custByCity AS
SELECT COUNT(customerNumber), city
FROM customers
GROUP BY city;

SELECT *
FROM custByCity
WHERE city = "Singapore";

--4. Write a query to create a view named "paymentsByMonth" that calculates payments per month.
-- You will have to group by multiple columns for this query: month and year because payments from January 2004 and January 2005 should not be grouped together. Remember the SQL month() and year() functions.
--4. Query the paymentsByMonth view to show payments in November 2004.
CREATE VIEW paymentsByMonth AS
SELECT SUM(p.amount), MONTH(p.paymentDate) AS month, YEAR(p.paymentDate) AS year
FROM payments p
GROUP BY MONTH(p.paymentDate), YEAR(p.paymentDate);

SELECT *
FROM paymentsByMonth
WHERE month = 11 AND year = 2004;

QuanityOrdered * buyPrice
Group by month--5. Write a query to create a view named "orderTotalsByMonth" to calculate order totals (in dollars) per month.
--5. Query the orderTotalsByMonth view to show the order total in August 2004.
CREATE VIEW orderTotalsByMonth AS
SELECT SUM(d.quantityOrdered * d.priceEach) AS orderTotalsByMonth, MONTH(o.orderDate) AS "month", YEAR(o.orderDate) AS "year"
FROM orderdetails d, orders o
WHERE d.orderNumber = o.orderNumber
GROUP BY MONTH(o.orderDate), YEAR(o.orderDate);

SELECT *
FROM orderTotalsByMonth
WHERE  month = 8 AND year = 2004;

QuanityOrdered * buyPrice
Group by productLine--6. Write a query to create a view named "salesPerLine" that calculates sales per product line.
--6. Query the salesPerLine view to show the total sales for the "Classic Cars" line.
ALTER VIEW salesPerLine AS
SELECT SUM(d.quantityOrdered * d.priceEach) AS "sales per product line" , p.productLine
FROM orderdetails d,  products p
WHERE p.productCode = d.productCode 
GROUP BY p.productLine;

SELECT *
FROM salesPerLine
WHERE productLine = "Classic Cars";

--7. Write a query to create a view named "productSalesYear" that calculates sales per product per year. Include the product name, sales total, and year.
--7. Query the productSalesYear view to show the sales per year for the "2001 Ferrari Enzo".
CREATE VIEW productSalesYear AS
SELECT p.productName, SUM(d.priceEach * d.quantityOrdered) AS "Sales Total", YEAR(o.orderDate) AS "year"
FROM products p, orderdetails d, orders o, customers c
WHERE p.productCode = d.productCode AND d.orderNumber = o.orderNumber AND o.customerNumber = c.customerNumber
GROUP BY p.productName, YEAR(o.orderDate);

SELECT *
FROM productSalesYear
WHERE productName = "2001 Ferrari Enzo";

QuanityOrdered * buyPrice--8. Write a query to create a view named "orderTotals" that displays the order total for each order. Include order number, customer name, and total.
--8. Query the orderTotals view to select the top 15 orders.
ALTER VIEW orderTotals AS
SELECT d.orderNumber, c.customerName, SUM(d.quantityOrdered * d.priceEach) AS Total
FROM orderdetails d, customers c, orders o
WHERE o.customerNumber = c.customerNumber AND d.orderNumber = o.orderNumber
GROUP BY d.orderNumber;

SELECT *
FROM orderTotals
ORDER BY Total DESC
LIMIT 15;

--9. Write a query to create a view named "salesPerRep" that calculates total sales for each sales rep.
CREATE VIEW salesPerRep AS
SELECT SUM(d.quantityOrdered * d.priceEach) AS "Total Sales", c.salesRepEmployeeNumber
FROM orderdetails d, products p, customers c, orders o
WHERE d.productCode = p.productCode AND d.orderNumber = o.orderNumber AND o.customerNumber = c.customerNumber
GROUP BY c.salesRepEmployeeNumber;

--10. Write a query to create a view named "salesPerOffice" that displays sales per office.
CREATE VIEW salesPerOffice AS
SELECT SUM(d.quantityOrdered * d.priceEach) AS Sales, f.officeCode
FROM orderdetails d, orders o, customers c, employees e, offices f
WHERE d.orderNumber = o.orderNumber AND o.customerNumber = c.customerNumber AND c.salesRepEmployeeNumber = e.employeeNumber AND e.officeCode = f.officeCode
GROUP BY f.officeCode;