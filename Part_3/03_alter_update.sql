-- SQL HW Part 3 Activity 3


-- Part 1: Explain the difference between alter and update in SQL statements
-- ALTER is used to change a table.  For example, it can be used to add, delete, and/or modify columns.  It can also be used to add and/or constraints.
-- UPDATE, on the other hand, is used to modify records in a table.  For example, it can be used to change the value of a cell.




-- Part 2


-- 1. Drop tables if table already exist
DROP TABLE IF EXISTS employees;


-- 2. Create table per image in README.md
CREATE TABLE employees
	(
		employee_id INT
		,first_name VARCHAR
		,last_name VARCHAR
		,department_id INT
		,PRIMARY KEY (employee_id)
	);


-- 3. Add values to table
INSERT INTO
	employees
		(
			employee_id
			,first_name
			,last_name
			,department_id
		)
VALUES
	(3, 'Chris', 'Christian', 25)
	,(14, 'Jan', 'Jansson', 45)
	,(17, 'Sam', 'Samuels', 45);


-- 4. Preview table
SELECT * FROM employees;


-- 5. Change column name from department_id to dept_id
ALTER TABLE employees
RENAME COLUMN department_id
TO dept_id;


-- 6. Add a column named annual_salary to table
ALTER TABLE employees
ADD COLUMN annual_salary INT;


-- 7. Preview table
SELECT * FROM employees;


-- 8. Add (test) salary values to annual_salary column
UPDATE employees
SET annual_salary = 40000
WHERE employee_id = 3;

UPDATE employees
SET annual_salary = 50000
WHERE employee_id = 14;

UPDATE employees
SET annual_salary = 60000
WHERE employee_id = 17;


-- 9. Preview table
SELECT * FROM employees;