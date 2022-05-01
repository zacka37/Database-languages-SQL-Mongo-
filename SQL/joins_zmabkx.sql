-- 2A
-- 1. Display the customer name, customer number, along with their sales rep’s number, first name, and last name.
SELECT c.customerName, c.customerNumber, c.salesRepEmployeeNumber, e.firstName, e.lastName
FROM customers AS c
JOIN employees AS e ON c.salesRepEmployeeNumber = e.employeeNumber;

SELECT c.customerName, c.customerNumber, c.salesRepEmployeeNumber, e.firstName, e.lastName
FROM customers AS c
LEFT JOIN employees AS e ON c.salesRepEmployeeNumber = e.employeeNumber;

SELECT c.customerName, c.customerNumber, c.salesRepEmployeeNumber, e.firstName, e.lastName
FROM customers AS c
RIGHT JOIN employees AS e ON c.salesRepEmployeeNumber = e.employeeNumber;

-- 2. Display each employee’s first and last name and their office code, city, and phone.
SELECT e.firstName, e.lastName, e.officeCode, o.city, o.phone
FROM employees AS e
JOIN offices AS o ON e.officeCode = o.officeCode;

SELECT e.firstName, e.lastName, e.officeCode, o.city, o.phone
FROM employees AS e
LEFT JOIN offices AS o ON e.officeCode = o.officeCode;

SELECT e.firstName, e.lastName, e.officeCode, o.city, o.phone
FROM employees AS e
RIGHT JOIN offices AS o ON e.officeCode = o.officeCode;

ASK-- 3. Display the customer’s name, and number along with the order number 
-- order date, product name, quantity, and price for each of the customer’s orders.
SELECT c.customerName, c.customerNumber, o.orderNumber, o.orderDate, p.productName, d.quantityOrdered, SUM(p.buyPrice*d.quantityOrdered)
FROM customers AS c
GROUP BY c.customerNumber
JOIN orders AS o ON c.customerNumber = o.customerNumber
JOIN orderdetails AS d ON o.orderNumber = d.orderNumber
JOIN products AS p ON d.productCode = p.productCode;

-- 4. Display the customer name and customer number along with the payment date,
-- check number, and amount for each payment
SELECT c.customerName, c.customerNumber, p.paymentDate, p.checkNumber, p.amount
FROM customers AS c
JOIN payments AS p ON c.customerNumber = p.customerNumber;

SELECT c.customerName, c.customerNumber, p.paymentDate, p.checkNumber, p.amount
FROM customers AS c
LEFT JOIN payments AS p ON c.customerNumber = p.customerNumber;

SELECT c.customerName, c.customerNumber, p.paymentDate, p.checkNumber, p.amount
FROM customers AS c
RIGHT JOIN payments AS p ON c.customerNumber = p.customerNumber;

-- 5. Display the product line, description, and product name for all products
SELECT p.productline, p.productDescription, l.textDescription
FROM products AS p
JOIN productlines AS l ON l.productLine = p.productLine;

-- 2B
-- 1. Show the customer name, order number and order date only for customers who have placed orders.
SELECT c.customerName, o.orderNumber, o.orderDate
FROM customers AS c
RIGHT JOIN orders AS o ON o.customerNumber = c.customerNumber;
-- 2. Show the order number, and order total for all orders. Include orders with no order details.
SELECT o.orderNumber, SUM(d.quantityOrdered*d.priceEach) AS "Order Total"
FROM orders AS o
LEFT JOIN orderdetails AS d ON d.orderNumber = o.orderNumber
GROUP BY o.orderNumber;

-- 3. Show the employee name (first, last) and office address (address line 1, state and country) for all employees.
SELECT e.firstName, e.lastName, o.addressLine1, o.state, o.country
FROM employees AS e
JOIN offices AS o ON o.officeCode = e.officeCode;

-- 4. Show the customer, number, payment date, check number, and amount for each payment. Include customers who have not made any payments.
SELECT c.customerName, c.customerNumber, p.paymentDate, p.checkNumber, p.amount
FROM customers AS c
LEFT JOIN payments AS p ON p.customerNumber = c.customerNumber;

-- 5. Show the employee name, customer name and the total sales for that customer.
-- The results should include employees even if they have do not have customers.
SELECT CONCAT(e.firstName, e.lastName) AS "Employee Name", c.customerName, SUM(d.quantityOrdered*d.priceEach) AS "Total Sale"
FROM employees AS e
LEFT JOIN customers AS c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders AS o ON c.customerNumber = o.customerNumber
LEFT JOIN orderdetails AS d ON d.orderNumber = o.orderNumber
GROUP BY c.customerNumber;