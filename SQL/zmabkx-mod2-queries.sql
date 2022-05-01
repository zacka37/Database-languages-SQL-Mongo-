-- 1. Display all of the customer data. (25 rows returned)
select * from customer;
-- 2. Display all of the agent data. (12 rows returned)
select * from agents;
-- 3. Display customer names and grades. (25 rows returned)
select CUST_NAME, GRADE from customer;
-- 4. Display agent code, name, and working area. (12 rows returned)
select AGENT_CODE, AGENT_NAME, WORKING_AREA from agents;
-- 5. Display order number, order amount, and order date. (34 rows returned)
select ORD_NUM, ORD_AMOUNT, ORD_DATE from orders;
-- 6. Show all customer code, name, country, and phone number, for all customers from the United States. (4 rows returned)
select CUST_CODE, CUST_NAME, CUST_COUNTRY, PHONE_NO from customer where CUST_COUNTRY = 'USA';
-- 7. Show agent names and phone numbers for agents from Bangalore. (3 rows returned)
select AGENT_NAME, PHONE_NO from agents where WORKING_AREA = 'Bangalore';
-- 8. Show orders with advance amounts of $100. (6 rows returned)
select ADVANCE_AMOUNT from orders where ADVANCE_AMOUNT = 100;
-- 9. Show the names of grade 2 customers. (10 rows returned)
select CUST_NAME from customer where GRADE = 2;
-- 10. Show all customer information for customers from New York. (3 rows returned)
select * from customer where CUST_CITY = 'New York';
-- 11. Show all agent information for agents who work in London with commission rates greater than 0.12. (2 rows returned)
select * from agents where WORKING_AREA = 'London' and COMMISSION > 0.12;
-- 12. Show order number, agent code, and customer code for orders with advance amount less than or equal to $500, and order amount greater than or equal to $1500. (9 rows returned)
select ORD_NUM, AGENT_CODE, CUST_CODE from orders where ADVANCE_AMOUNT <= 500 and ORD_AMOUNT >= 1500;
-- 13. Show customer code, customer name, agent code, and outstanding amount for customers with outstanding amounts greater than $6000 and pay amount less then or equal to $3000. (3 rows returned)
select CUST_CODE, CUST_NAME, AGENT_CODE, OUTSTANDING_AMT from customer where OUTSTANDING_AMT > 6000 and PAYMENT_AMT <= 3000;
-- 14. Show order numbers for order amounts less than $1000. (8 rows returned)
select ORD_NUM from orders where ORD_AMOUNT < 1000;
-- 15. Show customer names from India with outstanding amounts less than $10,000. (5 rows returned)
select CUST_NAME from customer where CUST_COUNTRY = 'India' and OUTSTANDING_AMT > 10000; 