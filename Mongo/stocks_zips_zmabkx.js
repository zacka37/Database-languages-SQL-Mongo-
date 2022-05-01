// 1.List all zip codes and city from your home state.
db.zips.find({"state": "MO"}, {"id":1});
// 2.List all of the zip codes and cities from the states of Missouri, Florida, Iowa, and Kansas.
db.zips.find({"state": "MO", "state": "FL", "state":"IA"}, {"id":1, "city":1});
// 3.List the zip codes, city, and population in Ohio for all the zip codes with populations of less than 2000 people?
db.zips.find({"pop":{$lt:2000}, "state": "OH"}, {"id":1, "city":1, "pop":1});
// 4.List the zip codes, city, and population for zip codes in the United States that have populations greater than 50,000 people?
db.zips.find({"pop":{$gt:50000}}, {"id":1, "city":1, "pop":1});
// 5.Which zip codes are located in the city of Columbia, Missouri?
db.zips.find({$or: [{"state": "MO"}, {"city": "Columbia"}]}, {"id":1});
// 6.List the population by zip code for all zip codes in the state of Missouri.
db.zips.find({"state": "MO"}, {"pop":1}, {"_id":1});
// 7.Which states have cities named Springfield?
db.zips.distinct("state",{"city": "SPRINGFIELD"});
// 8.How many cities named Springfield are there in the United States?
db.zips.find({"city":"SPRINGFIELD"}).count();
// 9.List the zip code, population, and state for cities named Emerald.
db.zips.find({"city":"EMERALD"}, {"_id":1, "pop":1, "state":1});
// 10.List the zip code, city, and state for cities with a population of 10 people.
db.zips.find({"pop":10}, {"_id":1, "city":1, "state":1});
// 11.List all of the documents in the stocks collection.
db.stocks.find();
//12.List the company name and symbol for all companies in the “Information Technology” sector.
db.stocks.find({"Sector":"Information Technology"}, {"Name":1, "Symbol":1, "_id":0});
// 13.List the symbol, company name, and stock price for all companies in the “Financials” sector whose stock price is greater than $75.
db.stocks.find({"Sector":"Financials", "Price":{$gt:75}}, {"Symbol":1, "Name":1, "Price":1, "_id":0});
// 14.List the Company name, sector, and earnings (EBITDA) for all companies with earnings (EBITDA) of at least $2.5 Billion.
db.stocks.find({"EBITDA":{$gte:2500000000}}, {"Name":1, "Sector":1, "EBITDA":1, "_id":0});
// 15.List the company name, symbol and sector for all companies with a 52 Week High greater than or equal to 150.
db.stocks.find({"52 Week High":{$gte:150}},{ "Name":1, "Symbol":1, "Sector":1, "_id":0});
// 16.List the symbol, company name, and stock price for all companies in the “Real Estate” sector whose stock price is less than $50.
db.stocks.find({"Sector":"Real Estate", "Price":{$lt:50}}, {"Symbol":1, "Name":1, "Price":1, "_id":0});
// 17.List the company name, symbol and dividend yield for companies in the Utilities or Industrials sectors.
db.stocks.find({$or:[{"Sector":"Utilities"}, {"Sector":"Industrials"}]}, {"Name":1, "Symbol":1, "Dividend Yield":1, "_id":0});
// 18.List the company name, symbol and market cap for companies whose dividend yield is greater than 3 or whose earnings/share is less than 1.
db.stocks.find({$or:[{"dividend yield":{$gt:3}}, {"Earnings/Share":{$lt:1}}]}, {"Name":1, "Symbol":1, "Market Cap":1, "_id":0});