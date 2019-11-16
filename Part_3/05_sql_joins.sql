-- SQL HW Part 3 Activity 5


-- Part 1: Describe the diferent types of join clauses supported in SQL
-- Join clausses in SQL include: INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN.
-- INNER JOIN returns only records found in both tables.
-- LEFT JOIN returns all records from the first (or left) table, along with records the second (or right) table has in common
-- with the first table.  LEFT JOIN is a type of outer join.  
-- RIGHT JOIN returns all records from the second (or right) table, along with records the first (or left) table has in common
-- with the second table.  RIGHT JOIN is a type of outer join.  
-- FULL OUTER JOIN returns all records in the first table and all records in the second table.




-- Part 2  
-- A FULL OUTER JOIN or a LEFT JOIN (where the left and right tables correspond to vendor_table and yarn_table, respectively)
-- can be used to return the final view shown in README.md


-- 1. Drop tables if table already exist
DROP TABLE IF EXISTS vendor_table, yarn_table;


-- 2. Create tables
CREATE TABLE vendor_table
	(
		id SERIAL
		,vendor_name VARCHAR
		,vendor_country VARCHAR
		,PRIMARY KEY (id)
	);

CREATE TABLE yarn_table
	(
		id SERIAL
		,yarn_name VARCHAR
		,yarn_type VARCHAR
		,grams INT
		,color INT
		,lot INT
		,qty INT
		,vendor_id INT
		,PRIMARY KEY (id)
		,FOREIGN KEY (vendor_id) REFERENCES vendor_table(id)
	);


-- 3. Add values to tables
INSERT INTO vendor_table
	(
		vendor_name
		,vendor_country
	)
VALUES
	('Carlton', 'Turkey')
	,('Cascade Yarns', 'United States')
	,('Debbie Bliss', 'England')
	,('Tahki', 'Greece');
	
INSERT INTO yarn_table
	(
		yarn_name
		,yarn_type
		,grams
		,color
		,lot
		,qty
		,vendor_id
	)
VALUES
	('Merino Supreme', 'Worsted', 50, 8, 76123, 1, 1)
	,('Cartwheel', 'Bulky', 200, 2, 1801, 2, 2)
	,('Paloma Tweed', 'Super Bulky', 50, 42513, 63978, 2, 3)
	,('Heritage', 'Sock', 100, 5640, 1707058, 1, 2);


-- 4. Preview tables
SELECT * FROM vendor_table;
SELECT * FROM yarn_table;


-- 5. Use RIGHT JOIN to query tables
SELECT
	vt.vendor_name
	,vt.vendor_country
	,yt.yarn_name
	,yt.yarn_type
FROM
	vendor_table vt
LEFT JOIN
	yarn_table yt
ON vt.id = yt.vendor_id;


-- 5. Use FULL OUTER JOIN to query tables
SELECT
	vt.vendor_name
	,vt.vendor_country
	,yt.yarn_name
	,yt.yarn_type
FROM
	vendor_table vt
FULL OUTER JOIN
	yarn_table yt
ON vt.id = yt.vendor_id;
