-- 1. Calculate the number of orders for each product that has been ordered.
-- Display the product name and number of orders in a column called “Number of Orders”. 
-- Display the results in descending order based on “Number of Orders”.
SELECT p.productName, COUNT(o.orderNumber) AS "Number of Orders"
FROM products p, orderdetails o
WHERE p.productCode = o.productCode
GROUP BY p.productName
ORDER BY COUNT(o.orderNumber) DESC;

-- 2. Calculate the total number of each product that has been ordered. 
--Display the product name and quantity ordered in a column called “Quantity Ordered”. 
--Display the results in descending order based on Quantity Ordered
SELECT p.productName , SUM(o.quantityOrdered) AS "Quantity Ordered"
FROM products p, orderdetails o
WHERE p.productCode = o.productCode
GROUP BY p.productName
ORDER BY SUM(o.quantityOrdered) DESC;

-- 3. Calculate the total dollar value of the top 25 products that has been ordered in the database.
-- Display the product name and the dollar value in a column called “Total Value”.
SELECT p.productName, SUM(o.quantityOrdered * p.buyPrice) AS "Total Value"
FROM products p, orderdetails o
WHERE p.productCode = o.productCode
GROUP BY p.productName
ORDER BY SUM(o.quantityOrdered * p.buyPrice) DESC
LIMIT 25;

-- 4. Calculate the number of orders each customer has placed and display the top 25 in descending order based on orders placed.
-- Display the customer name and the orders placed in a columns called “Orders Placed”.
SELECT c.customerName, COUNT(o.orderNumber) AS "Orders_Placed"
FROM orders o, customers c
WHERE o.customerNumber = c.customerNumber
GROUP BY c.customerNumber
ORDER BY Orders_Placed DESC
LIMIT 25;

-- 5. Calculate the total payments made each year. Display the year and total payments in a column called “Total Payments”.
SELECT YEAR(p.paymentDate), SUM(p.amount) AS "Total Payments"
FROM payments p
GROUP BY YEAR(p.paymentDate)
ORDER BY YEAR(p.paymentDate);

-- 6. Calculate the total payments made each month in 2004. Display the month and total payments in a column called “Total Payments”.
--Order the results by month in ascending order.
SELECT MONTH(p.paymentDate), SUM(p.amount) AS "Total Payments"
FROM payments p
WHERE YEAR(p.paymentDate) = 2004
GROUP BY MONTH(p.paymentDate)
ORDER BY MONTH(p.paymentDate);

-- 7. Calculate the total payments made each day in December of 2004.
-- Display the day in a column named “Day” and total payments in a column called “Total Payments”. Order the results by day in ascending order.
SELECT DAY(p.paymentDate) AS "Day", Sum(p.amount) AS "Total Payments"
FROM payments p
WHERE YEAR(p.paymentDate) = 2004 AND MONTH(p.paymentDate) = 12
GROUP BY DAY(p.paymentDate)
ORDER BY DAY(p.paymentDate);

-- 8. Calculate the total payments made by each customer in the database who has made a payment. 
-- Display the customer name and the total payments in a column named “Total Payments”.
--Order the results by total payments.
SELECT c.customerName, Sum(p.amount) AS "Total Payments"
FROM customers c, payments p
WHERE c.customerNumber = p.customerNumber
GROUP BY Sum(p.amount)
ORDER BY Sum(p.amount);

-- 9. Calculate and display the number of customers in each state.
-- Display the state name and and number of customers in each state in a column called “Number of Customers in State”.
-- Sort the results by the Number of Customers in State.
SELECT c.state, COUNT(c.customerNumber) AS "Number of Customers in State"
FROM customers c
GROUP BY c.state
ORDER BY COUNT(c.customerNumber);

-- 10. Which employees manage the most people? Develop a query to calculate the number of people each employees manages.
-- Display the employee number and number of employees employees they manage in a column called “Number of Reports.
SELECT e.employeeNumber, COUNT(e.reportsTo) AS "Number of Reports"
FROM employees e;
GROUP BY e.employeeNumber
ORDER BY COUNT(e.reportsTo);

-- 11. Write a query to calculate the number of product lines in the database. Display the result in a column called “Number of Lines”.
SELECT COUNT(p.productLine) AS "Number of Lines"
FROM productlines p;

-- 12. Calculate the dollar value of each product in inventory.
-- You can calculate this by multiplying the quantity in stock by the buy price. 
-- Display the product name, quantity in stock, buy price, and in its dollar value in a column called “Dollar Value”.
-- Sort the results in descending order based on dollar value.
SELECT p.productName, p.quantityInStock, p.buyPrice, p.MSRP AS "Dollor Value"
FROM products p
Where p.quantityInStock > 1
ORDER BY p.MSRP DESC;