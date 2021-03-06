--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM employees e, salaries s
WHERE e.emp_no = s.emp_no;


--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, 
	last_name, 
	hire_date
FROM employees 
WHERE hire_date between '1986-01-01' and '1986-12-31'


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM dept_manager dm, employees e, departments d
WHERE dm.emp_no = e.emp_no
AND dm.dept_no = d.dept_no


--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees e, dept_emp de, departments d
WHERE e.emp_no = de.emp_no
AND de.dept_no = d.dept_no


--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name,
	e.last_name,
	e.sex
FROM employees e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%'
	

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees e, departments d, dept_emp de
WHERE e.emp_no = de.emp_no
AND de.dept_no = d.dept_no
AND d.dept_name = 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees e, departments d, dept_emp de
WHERE e.emp_no = de.emp_no
AND de.dept_no = d.dept_no
AND (d.dept_name = 'Sales' OR d.dept_name = 'Development')



--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, 
COUNT(last_name) AS last_name_count 
FROM employees 
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
