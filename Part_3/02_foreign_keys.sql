-- SQL HW Part 3 Activity 2


-- 1. Drop tables if tables already exist
DROP TABLE IF EXISTS employees, departments;


-- 2. Create departments table
CREATE TABLE departments
	(
		id INT
		,dept_name VARCHAR
		,PRIMARY KEY(id)
	);


-- 3. Create employees table
CREATE TABLE employees
	(
		employee_id INT
		,first_name VARCHAR
		,last_name VARCHAR
		,department_id INT
		,PRIMARY KEY(employee_id)
		,FOREIGN KEY(department_id) REFERENCES departments(id)
	);


-- 4. Add entries to departments table
INSERT INTO 
	departments (id, dept_name)
VALUES
	(45, 'webdev');
	

-- 5. Add entries to employees table
INSERT INTO 
	employees
		(
			employee_id
			,first_name
			,last_name
			,department_id
		)
VALUES
	(14, 'Jan', 'Jansson', 45)
	,(17, 'Sam', 'Samuels', 45);


-- 6. Preview tables
SELECT * FROM departments;
SELECT * FROM employees;


-- 7. Join tables where department id is 45
SELECT
	*
FROM
	employees e
JOIN
	departments d
ON 
	e.department_id = d.id
WHERE
	e.department_id = 45;