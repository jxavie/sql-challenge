-- Preview tables
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_employees;
SELECT * FROM dept_managers;
SELECT * FROM salaries;
SELECT * FROM titles;


-- 1. List detailing employee number, last name, first name, gender an salary for each employee:
SELECT
	e.emp_no
	,e.birth_date
	,e.first_name
	,e.last_name
	,e.gender
	,s.salary
FROM
	employees e
INNER JOIN 
	salaries s
ON
	e.emp_no = s.emp_no
ORDER BY
	emp_no;


-- 2. List of employees hired in 1986
SELECT 
	*
FROM 
	employees
WHERE 
	date_part('year', hire_date) = 1989;


-- 3. List detailing the following for the manager of each department:
--         department number and name, manager's employee number, last and first names, and start and end employment dates
SELECT
	d.dept_name
	,d.dept_no
	,dm.emp_no
	,e.last_name
	,e.first_name
	,dm.from_date
	,dm.to_date
FROM
	departments d
LEFT JOIN
	dept_managers dm
ON
	d.dept_no = dm.dept_no
LEFT JOIN
	employees e
ON
	dm.emp_no = e.emp_no
LEFT JOIN
	dept_employees de
ON
	e.emp_no = de.emp_no
ORDER BY
	dept_name
	,from_date DESC;
	

-- 4. List detailing the following for each employee:
--         employee number, last name, first name, and department name
SELECT
	e.emp_no
	,e.last_name
	,e.first_name
	,subjoin.dept_name
FROM
	employees e
LEFT JOIN
	(
		SELECT
			d.dept_name
			,de.emp_no
		FROM
			departments d
		INNER JOIN
			dept_employees de
		ON
			d.dept_no = de.dept_no		
	) AS subjoin
ON
	e.emp_no = subjoin.emp_no
ORDER BY
	emp_no;


-- 5. List of employees with the first name Hercules and last names beginning with "B"
SELECT
	emp_no
	,last_name
	,first_name
FROM 
	employees
WHERE
	first_name = 'Hercules'
AND
	last_name LIKE 'B%'
ORDER BY
	last_name;


-- 6. List detailing the following for all employees in the Sales Department:
--         employee number, last name, first name, department name
SELECT
	e.emp_no
	,e.last_name
	,e.first_name
	,subjoin.dept_name
FROM
	employees e
LEFT JOIN
	(
		SELECT
			d.dept_name
			,de.emp_no
		FROM
			departments d
		INNER JOIN
			dept_employees de
		ON
			d.dept_no = de.dept_no		
	) AS subjoin
ON
	e.emp_no = subjoin.emp_no
WHERE
	subjoin.dept_name = 'Sales'
ORDER BY
	emp_no;
	

-- 7. List detailing the following for all employees in the Sales and Development Departments:
--         employee number, last name, first name, department name
SELECT
	e.emp_no
	,e.last_name
	,e.first_name
	,subjoin.dept_name
FROM
	employees e
LEFT JOIN
	(
		SELECT
			d.dept_name
			,de.emp_no
		FROM
			departments d
		INNER JOIN
			dept_employees de
		ON
			d.dept_no = de.dept_no		
	) AS subjoin
ON
	e.emp_no = subjoin.emp_no
WHERE
	subjoin.dept_name = 'Sales'
OR
	subjoin.dept_name = 'Development'
ORDER BY
	emp_no;


-- 8. List of frequency count of employee last names in descending order
SELECT
	last_name
	,count(*) AS total_count
FROM 
	employees
GROUP BY
	last_name
ORDER BY
	total_count DESC
	,last_name;