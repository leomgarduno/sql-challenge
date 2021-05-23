-- identify variables for each table 
-- declare variables and keys

-- Drop tables

--DROP TABLE IF EXISTS departments;
--DROP TABLE IF EXISTS dept_emp;
--DROP TABLE IF EXISTS dept_manager;
--DROP TABLE IF EXISTS employees;
--DROP TABLE IF EXISTS salaries;
--DROP TABLE IF EXISTS titles;

-- Create tables
-- Primary key is an identifier of our rows, it can not be repted each one has to be different

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(100),
	birth_date DATE,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	sex VARCHAR(100),
	hire_date DATE
);

CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
 	salary INT
);

CREATE TABLE departments (
  	dept_no VARCHAR(100) NOT NULL, 
  	dept_name VARCHAR(100) NOT NULL, 
  	PRIMARY KEY (dept_no)
);


	CREATE TABLE dept_emp (
	  dept_no VARCHAR(100),
	  emp_no INT,
  PRIMARY KEY (dept_no, emp_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


CREATE TABLE dept_manager (
  	dept_no VARCHAR(100),
	emp_no INT,
  	PRIMARY KEY (dept_no, emp_no),
  	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
    title_id INT,
    title VARCHAR(100),
	PRIMARY KEY (title_id)
);

