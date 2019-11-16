-- Drop tables if tables already exist
DROP TABLE IF EXISTS
	departments
	,employees
	,dept_employees
	,dept_managers
	,salaries
	,titles;


-- Create tables
CREATE TABLE departments 
	(
		dept_no VARCHAR NOT NULL
		,dept_name VARCHAR NOT NULL
		,PRIMARY KEY (dept_no)
	);

CREATE TABLE employees
	(
		emp_no INT NOT NULL
		,birth_date DATE NOT NULL
		,first_name VARCHAR NOT NULL
		,last_name VARCHAR NOT NULL
		,gender VARCHAR NOT NULL
		,hire_date DATE NOT NULL
		,PRIMARY KEY (emp_no)
	);

CREATE TABLE dept_employees
	(
		emp_no INT NOT NULL
		,dept_no VARCHAR NOT NULL
		,from_date DATE NOT NULL
		,to_date DATE NOT NULL
		,FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
		,FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);

CREATE TABLE dept_managers
	(
		entry_id SERIAL
		,dept_no VARCHAR NOT NULL
		,emp_no INT NOT NULL
		,from_date DATE NOT NULL
		,to_date DATE NOT NULL
		,PRIMARY KEY (entry_id)
		,FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
		,FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);

CREATE TABLE salaries
	(
		entry_id SERIAL
		,emp_no INT NOT NULL
		,salary INT NOT NULL
		,from_date DATE NOT NULL
		,to_date DATE NOT NULL
		,PRIMARY KEY (entry_id)
		,FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);

CREATE TABLE titles
	(
		entry_id SERIAL
		,emp_no INT NOT NULL
		,title VARCHAR NOT NULL
		,from_date DATE NOT NULL
		,to_date DATE NOT NULL
		,PRIMARY KEY (entry_id)
		,FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);


-- Preview tables
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_employees;
SELECT * FROM dept_managers;
SELECT * FROM salaries;
SELECT * FROM titles;


-- Import data (csv)