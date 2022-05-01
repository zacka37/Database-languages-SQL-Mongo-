-- 1. Display the customer first name, last name, and movie titles they rented in 2006. Sort result by customer last name.
SELECT c.first_name, c.last_name, f.title
FROM customer c, film_text f, rental r, inventory i
WHERE c.customer_id = r.customer_id AND r.inventory_id = i.inventory_id AND i.film_id = f.film_id AND YEAR(r.rental_date) = '2006'
ORDER BY c.last_name;

-- 2. How many films are in each category?
-- List the category name in a column called "Category Name" and number of films in the category in a column called "Number of Films".
-- Sort by number of films in descending order
SELECT COUNT(f.film_id) AS "Number Of Films", c.name AS "Category Name"
FROM category c, film_category f
WHERE f.category_id = c.category_id
GROUP BY c.name
ORDER BY COUNT(f.film_id) DESC;

-- 3. Calculate each customer's total payments and display the top 15 customers in terms of total payments in descending order.
-- Display the customer first and last name and total payment amount in a column called "Total Payments".
SELECT c.first_name, c.last_name, SUM(p.amount) AS "Total Payments"
FROM payment p, customer c
WHERE p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY SUM(p.amount) DESC
LIMIT 15;

-- 4. Calculate the total payments for each store.
-- Display store id and total payments in a Column called Total Payments.
-- Display results in descending order by total payments.
SELECT s.store_id, SUM(p.amount) AS "Total Payments"
FROM store s, payment p, staff t
WHERE s.store_id = t.store_id AND t.staff_id = p.staff_id
GROUP BY s.store_id
ORDER BY "Total Payments" DESC;

-- 5. Which films are rented the most?
-- Display the Film name and the total rentals in a column called "Total Rentals".
-- Display results in descending order by total rentals.
SELECT f.title, COUNT(r.rental_id) AS "Total Rentals"
FROM film f, inventory i, rental r
WHERE f.film_id = i.film_id AND i.inventory_id = r.inventory_id
GROUP BY f.film_id
ORDER BY COUNT(r.rental_id) DESC;

-- 6. Which Film categories are rented the most? 
-- Display the category name and the total rentals in a column called "Total Rentals".
-- Display results in descending order by total rentals.
SELECT c.name, COUNT(f.film_id) AS "Total Rentals"
FROM category c, film_category f, film m, inventory i, rental r
WHERE c.category_id = f.category_id AND f.film_id = m.film_id AND m.film_id = i.film_id AND i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY COUNT(f.film_id) DESC;

-- 7. Display the inventory list of movie titles for store number 1. 
-- Display the film title and quantity in stock in a column named "In Stock". 
-- Display results in alphabetical order of the titles.
SELECT f.title, COUNT(i.film_id) AS "In Stock"
FROM inventory i, store s, film f
WHERE s.store_id = 1 AND s.store_id = i.store_id AND i.film_id = f.film_id
GROUP BY f.title
ORDER BY f.title ASC;

-- 8. Which actors have acted in the most movies? 
-- List the actor first and last name and the number of movies in a column named "Number of Movies".
-- Display results in descending order by number of movies.
SELECT a.first_name, a.last_name, COUNT(m.film_id) AS "Number of Movies"
FROM actor a, film_actor f, film m
WHERE a.actor_id = f.actor_id AND f.film_id = m.film_id
GROUP BY a.actor_id
ORDER BY COUNT(m.film_id) DESC;