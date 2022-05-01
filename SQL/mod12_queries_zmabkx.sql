READ
--1. Write a query to calculate the payments each sales agent is responsible for. Display the agent name and the total payments.
SELECT a.AGENT_NAME, SUM(c.PAYMENT_AMT) AS "Total Payments"
FROM agents a, customer c
WHERE a.AGENT_CODE = c.AGENT_CODE
GROUP BY a.AGENT_NAME;

--2. Write a query to calculate payments for each sales agent by country of the sales agent. Display the agent country and total payments.
SELECT a.COUNTRY, SUM(c.PAYMENT_AMT) AS "Total Payments"
FROM agents a, customer c
WHERE a.AGENT_CODE = c.AGENT_CODE
GROUP BY a.COUNTRY;

--3. Calculate the commission for each order. Display order id, customer name, agent name, and commission amount.
SELECT o.ORD_NUM, c.CUST_NAME, a.AGENT_NAME, SUM(a.COMMISSION * ORD_AMOUNT) AS 'commission'
FROM orders o, customer c, agents a
WHERE o.CUST_CODE = c.CUST_CODE AND c.AGENT_CODE = a.AGENT_CODE
GROUP BY o.ORD_NUM;