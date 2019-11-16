SELECT * FROM actor LIMIT 100;
SELECT * FROM address LIMIT 100;
SELECT * FROM city LIMIT 100;
SELECT * FROM country LIMIT 100;
SELECT * FROM customer LIMIT 100;
SELECT * FROM customer_list LIMIT 100;
SELECT * FROM film LIMIT 100;
SELECT * FROM film_actor LIMIT 100;
SELECT * FROM inventory LIMIT 100;
SELECT * FROM payment LIMIT 100;
SELECT * FROM rental LIMIT 100;
SELECT * FROM staff LIMIT 100;
SELECT * FROM store LIMIT 100;


-- 1. Drop view if it already exists
DROP VIEW IF EXISTS all_parties;


-- 2. Create view that returns first and last names of all actors, customers and staff
CREATE VIEW all_parties AS
	SELECT 
		'actor' AS actor
		,last_name
		,first_name
	FROM actor	
	UNION
	SELECT 
		'customer' AS customer
		,last_name
		,first_name
	FROM customer
	UNION
	SELECT 
		'staff' AS staff
		,last_name
		,first_name
	FROM staff
	ORDER BY 
		last_name,
		first_name;


-- 3. Display View
SELECT * FROM all_parties LIMIT 100;


-- 4. Determine number of customer entries from the customer and customer_list tables
SELECT
	COUNT(customer_id) AS customer_count
FROM customer;

SELECT
	COUNT(id) AS customer_count
FROM customer_list;


-- 5. Drop View if it already exists
DROP VIEW IF EXISTS customer_combined;


-- 6. Using UNION ALL display from the customer and customer_list the name and ID of all customers
-- Column email used as proxy for customer name for the customer table
CREATE VIEW customer_combined AS
	SELECT 
		customer_id
		,email
	FROM customer
	UNION ALL
	SELECT 
		id
		,name
	FROM customer_list
	ORDER BY
		customer_id;


-- 7. Display View
SELECT * FROM customer_combined


-- 8. Determine total customer count and unique number of customers.
-- From the results, it appears that the customer and customer_list tables contain the same customers
SELECT COUNT(customer_id) FROM customer_combined;

SELECT 
	COUNT(DISTINCT customer_id) AS entry_count
FROM customer_combined;


-- 9. Use FULL OUTER JOIN to create a merged table containing information from the customer and customer_list tables
CREATE VIEW customer_join AS
	SELECT
		customer.customer_id
		,customer.first_name
		,customer.last_name
		,customer_list.city
	FROM 
		customer
	FULL OUTER JOIN customer_list
		ON customer.customer_id = customer_list.id
	ORDER BY
		customer_id;


-- 10. Display View
SELECT
	*
FROM
	customer_join;


-- 11. From View, display the customer id for customers living in London
SELECT
	customer_id as "customers from london"
FROM 
	customer_join
WHERE 
	city = 'London';
