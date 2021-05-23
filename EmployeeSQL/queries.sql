-- CHECK TABLES	

SELECT * FROM employees;
SELECT * FROM departments; 
SELECT * FROM dept_emp; 
SELECT * FROM dept_manager; 
SELECT * FROM salaries; 
SELECT * FROM titles; 


-- 1 List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

-- 2 List first name, last name, and hire date for employees who were hired in 1986.

SELECT * FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;

-- 3 List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

SELECT employees.emp_no, dept_manager.dept_no, departments.dept_name, employees.last_name, 
employees.first_name
FROM employees 
INNER JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments 
ON dept_manager.dept_no = departments.dept_no;

-- 4 List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees INNER JOIN dept_manager 
ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments 
ON dept_manager.dept_no = departments.dept_no;


-- 5 List first name, last name, and sex for employees whose first name is 
-- "Hercules" and last names begin with "B."


SELECT first_name, last_name, sex
FROM employees
WHERE 
first_name LIKE'Hercules'
AND last_name LIKE 'B%';

-- 6 List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- 7 List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE
departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

-- 8 In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.

SELECT employees.last_name, COUNT(employees.last_name) AS "freq last name"
FROM employees
GROUP BY employees.last_name
ORDER BY "freq last name" DESC;
