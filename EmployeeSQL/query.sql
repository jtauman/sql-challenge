-- list employee details for all employees: employee number, last name, first name, sex, salary
SELECT
	e.emp_no "employee number",
	e.last_name "last name",
	e.first_name "first name",
	e.sex,
	s.salary
FROM
	Employee e
Join Salaries s
	on e.emp_no = s.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986
SELECT
	first_name "first name",
	last_name "last name",
	hire_date "date hired"
FROM 
	employee
WHERE
	hire_date LIKE '%/1986'
ORDER BY "last name";

--List the manager of each department with the following information: department number,department name, the manager's employee number, last name, first name.

Select
	dm.dept_no "department number",
	d.dept_name "department name",
	dm.emp_no "manager employee number",
	e.last_name "manager last name",
	e.first_name "manager first name"
FROM
	dept_manager dm
LEFT JOIN departments d
	ON d.dept_no = dm.dept_no
LEFT JOIN employee e
	ON e.emp_no = dm.emp_no;


--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT
	e.emp_no "employee number",
	e.last_name "last name",
	e.first_name "first name",
	d.dept_name "department"
FROM
	employee e
JOIN dept_emp de
	on de.emp_no = e.emp_no
JOIN departments d
	on d.dept_no = de.dept_no
ORDER BY
	e.emp_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT
	first_name "first name",
	last_name "last name",
	sex
FROM employee
WHERE
	first_name = 'Hercules'
AND
	last_name LIKE 'B%'
ORDER BY "last name";


--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT
	e.emp_no "employee number",
	e.last_name "last name",
	e.first_name "first name",
	d.dept_name "department"
FROM employee e
JOIN dept_emp de
	on de.emp_no = e.emp_no
JOIN departments d
	on d.dept_no = de.dept_no
WHERE
	d.dept_name = 'Sales'
ORDER BY
	e.emp_no;

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no "employee number",
	e.last_name "last name",
	e.first_name "first name",
	d.dept_name "department"
FROM employee e
JOIN dept_emp de
	on de.emp_no = e.emp_no
JOIN departments d
	on d.dept_no = de.dept_no
WHERE
	d.dept_name = 'Sales'
OR
	d.dept_name = 'Development'
ORDER BY
	e.emp_no;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
	last_name,
	count(emp_no) "frequency count"
FROM employee
GROUP BY
	last_name
ORDER BY count(emp_no) DESC;
