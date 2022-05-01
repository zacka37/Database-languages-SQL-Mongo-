// 1. Write a query to create a view named "custByCity" to get a count of how many customers there are in each city.
// Query the custByCity view to show the number of customers in Singapore.
db.createView(
    "custByCity",
    "customers",
    [
    {$group: {_id: "$city", "customers": {$sum:1}}}
])

db.custByCity.find(
    {"_id": "Singapore"}
)

//2. Write a query to create a view named "paymentsByMonth" that calculates payments per month. You will have to group by multiple columns for this query: month and year because payments from January 2004 and January 2005 should not be grouped together. Remember the SQL month() and year() functions.
//2. Query the paymentsByMonth view to show payments in November 2004.
db.createView(
    "paymentsByMonth",
    "customers",
    [
    {$unwind: "$payments"},
    {$addFields: {"year":{$year: "$payments.paymentDate"}, "month":{$month: "$payments.paymentDate"}}},
    {$group: {_id: {month: "$month", year: "$year"}, totalPerMonth: {$sum:"$payments.amount"}}}
])

db.paymentsByMonth.aggregate([
    {$match: {'_id.year': 2004, "_id.month": 11}}
])

QuanityOrdered * buyPrice
//3. Write a query to create a view named "orderTotalsByMonth" to calculate order totals (in dollars) per month.
//3. Query the orderTotalsByMonth view to show the order total in August 2004.
db.createView(
    "orderTotalsByMonth",
    "orders",
    [
    {$unwind: "$orderDetails"},
    {$addFields:  {"month":{$month: "$orderDate"}, "year":{$year: "$orderDate"}}},
    {$group: {_id: {month: "$month", year: "$year"}, totalPerMonth: {$sum:{$multiply:["$orderDetails.quantityOrdered", "$orderDetails.priceEach"]}}}}
])

db.paymentsByMonth.aggregate([
    {$match: {'_id.year': 2004, "_id.month": 8}}
])

//4. Write a query to create a view named "productSalesYear" that calculates sales per product per year. Include the product name, sales total, and year.
//4. Query the productSalesYear view to show the sales per year for the "2001 Ferrari Enzo".
db.createView(
    "productSalesYear",
    "orders",
    [
    {$unwind: "$orderDetails"},
    {$addFields: {"year":{$year: "$orderDate"}}},
    {$group: {_id: {year: "$year", productName: "$orderDetails.productName"}, salesPerYear: {$sum:{$multiply:["$orderDetails.quantityOrdered", "$orderDetails.priceEach"]}}}},
])

db.productSalesYear.aggregate([
    {$match: {"_id.productName": "2001 Ferrari Enzo"}}
])

QuanityOrdered * buyPrice
//5. Write a query to create a view named "orderTotals" that displays the order total for each order. Include order number, customer name, and total.
//5. Query the orderTotals view to select the top 15 orders.
db.createView(
    "orderTotals",
    "orders",
    [
    {$unwind: "$orderDetails"},
    {$group: {_id: {customerName: "$customerName", orderNumber: "$_id"}, total: {$sum:{$multiply:["$orderDetails.quantityOrdered", "$orderDetails.priceEach"]}}}}
])

db.orderTotals.aggregate([
    {$sort: {total: -1}},
    {$limit: 15}
])

