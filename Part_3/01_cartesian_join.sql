-- SQL HW Part 3 Activity 1

-- Part 1: What will be the number of rows in the output of the following query?
-- Query: SELECT * FROM first_table, second_table;
-- Response: The output will consist of 250 rows.
-- The query returns a table containing unique combinations of entries from first_table and second_table
-- Therefore, the total number of rows returned equals 25*10.


-- Part 2: What will the query look like?
-- Query: SELECT * FROM table_one, table_two; look like?
-- Response: The output returned will contain unique combinations of entries from table_one and table_two
-- The total output will consist of 12 rows (i.e., 4*3).





-- Part 1


-- 1. Drop tables if tables already exist
DROP TABLE If EXISTS first_table, second_table;


-- 2. Create tables
CREATE TABLE 
	first_table
		(
			id INT
		);
		
CREATE TABLE 
	second_table
		(
			id INT
		);


-- 3. Add entries to tables
INSERT INTO 
	first_table(id)
VALUES
	(1)
	,(2)
	,(3)
	,(4)
	,(5)
	,(6)
	,(7)
	,(8)
	,(9)
	,(10)
	,(11)
	,(12)
	,(13)
	,(14)
	,(15)
	,(16)
	,(17)
	,(18)
	,(19)
	,(20)
	,(21)
	,(22)
	,(23)
	,(24)
	,(25);

INSERT INTO 
	second_table(id)
VALUES
	(1)
	,(2)
	,(3)
	,(4)
	,(5)
	,(6)
	,(7)
	,(8)
	,(9)
	,(10);


-- 4. Determine number of rows for each table
SELECT COUNT(*) FROM first_table;
SELECT COUNT(*) FROM second_table;


-- 5. Query tables
SELECT * FROM first_table, second_table;


-- 6. Determine number of rows in query output
SELECT COUNT(*) FROM first_table, second_table;





-- Part 2


-- 1. Drop tables if tables already exist
DROP TABLE If EXISTS table_one, table_two;


-- 2. Create tables
CREATE TABLE 
	table_one
		(
			id INT
		);
		
CREATE TABLE 
	table_two
		(
			id INT
		);


-- 3. Add entries to tables
INSERT INTO 
	table_one(id)
VALUES
	(1)
	,(2)
	,(3)
	,(4);

INSERT INTO 
	table_two(id)
VALUES
	(10)
	,(11)
	,(12);


-- 4. Determine number of rows for each table
SELECT * FROM table_one;
SELECT * FROM table_two;


-- 5. Query tables
SELECT * FROM table_one, table_two;


-- 6. Determine number of rows in query output
SELECT COUNT(*) FROM table_one, table_two;
