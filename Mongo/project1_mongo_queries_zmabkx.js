// 1. How many products have an MSRP of $100 greater than or equal to?
db.products.find({"MSRP": {$gte:100}}).count();

// 2. Calculate the number of orders each customer has placed and display the top 25
// in descending order based on orders placed.
// Display the customer name and the orders placed in a columns called “Orders Placed”.
db.orders.aggregate([
{$group: {"_id": "$customerName", OrdersPlaced: {$sum: 1}}},
{$sort: {OrdersPlaced: -1}},
{$project: {"customerName": 1 , OrdersPlaced: 1}},
{$limit: 25}
])
// 3. List the product names where the quantity in stock is greater than 5000.
db.products.aggregate([
{$match: {"quantityInStock": {$gt:5000}}},
{$project: {"_id": 0, "productName": 1}}
])
// 4. Calculate and display the number of customers in each state.
//Display the state name and and number of customers in each state in a column called “Number of Customers in State”.
db.customers.aggregate([
{$group: {"_id": "$state", NumberofCustomersinState: {$sum: 1}}},
{$project: {"state": 1, NumberofCustomersinState: 1}}
])
// 5. Which employees manage the most people?
// Develop a query to calculate the number of people each employees manages.
//Display the employee name and number of employees employees they manage in a column called “Number of Reports”.
db.employees.aggregate([
{$group: {_id: "$reportsTo", NumberofReports: {$sum: 1}}},
{$project: {reportsTo: 1, NumberofReports: 1}}
])
// 6. List the names and credit limit of the customers with the 10 highest credit limits.
db.customers.aggregate([
{$sort: {"creditLimit": -1}},
{$project: {'customerName': 1, 'creditLimit': 1, '_id': 0}},
{$limit:10}
])
// 7. Write a query to calculate the number of product lines in the database.
//Display the result in a column called “Number of Lines”. 
db.products.aggregate([
{$group: {_id: "$productLine.line", NumberofLines: {$sum: 1}}},
{$count: 'NumberofLines'}
])
// 8. Calculate the dollar value of each product in inventory.
//You can calculate this by multiplying the quantity in stock by the buy price.
//Display the product name, quantity in stock, buy price, and in its dollar value in a column called “Dollar Value”.
//Sort the results in descending order based on dollar value.
db.products.aggregate([
{$project: {productName: 1, quantityInStock: 1, buyPrice: 1, DollarValue: {$multiply: ['$quantityInStock', '$buyPrice']}, _id:0}},
{$sort: {DollarValue: -1}}
])