-- 1. Display the customer name and all of their agent’s information.
Select c.cust_Name, a.*
From customer c, agents a
Where c.Agent_code = a.Agent_Code;
-- 2. For each order, display order number, order date, customer name and agent name.
Select o.Ord_Num, o.Ord_Date, c.cust_Name, a.Agent_Name
From orders o, customer c, agents a
Where o.Cust_Code = c.Cust_Code And o.Agent_code = a.Agent_code;
-- 3. Display agent name, customer name, order date, and order amount for customers from Canada.
Select a.Agent_Name, c.cust_Name, o.Ord_Date, o.Ord_Amount
From agents a, customer c, orders o
Where c.cust_Country = "Canada" And c.Cust_Code = o.Cust_Code And c.Agent_Code = a.Agent_Code;
-- 4. Display customer name, order number, and order amount for customers in New York city.
Select c.cust_Name, o.Ord_Num, o.Ord_Amount
From customer c, orders o
Where c.Cust_City = "New York" And c.Cust_Code = o.Cust_Code;
-- 5. Display agent name, customer name, order number and order amount for orders of more han $1,500.
Select a.Agent_Name, c.Cust_Name, o.Ord_Num, o.Ord_Amount
From agents a, customer c, orders o
Where o.Ord_Amount > 1500 And o.Cust_Code = c.Cust_Code And o.Agent_Code = a.Agent_Code;
-- 6. Display all agent and orders information.
Select a.*, o.*
From agents a, orders o
Where a.Agent_Code = o.Agent_Code;
-- 7. Display customer name, customer code, outstanding amount, and agent name for customers with outstanding amounts greater than or equal to $6,000.
Select c.Cust_Name, c.Cust_Code, c.Outstanding_Amt, a.Agent_Name
From agents a, customer c
Where c.Outstanding_Amt >= 6000 And c.Agent_Code = a.Agent_code;
-- 8. Display customer name, order number order amount, and advance amount if order amount is greater than or equal to $2,500 or advance amount is less than $300.
Select c.Cust_Name, o.Ord_Num, o.Ord_Amount, o.advance_Amount
From orders o, customer c
Where o.Cust_Code = c.Cust_Code And (o.Ord_Amount >= 2500 Or o.advance_Amount < 300);
-- 9. Display agent name, agent working area, customer name, customer working area for customers and agents who have the same working area.
Select a.Agent_Name, a.working_Area, c.Cust_Name, c.working_Area
From agents a, customer c
Where c.working_Area = a.working_Area And a.Agent_Code =c.Agent_Code;
-- 10. Display customer name, agent name, and order number where order amount is less than $1,000 or opening amount is greater than $8000.
Select c.Cust_Name, a.Agent_Name, o.Ord_Num
From agents a, customer c, orders o
Where (o.Ord_Amount < 1000 Or c.Opening_Amt > 8000) And c.Cust_Code = o.Cust_Code And c.Agent_Code = a.Agent_Code And a.Agent_Code = o.Agent_Code;