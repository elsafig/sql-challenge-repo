--	ANALYSIS

--List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department along with their 
--department number, department name, employee number, last name, and first name(2 points)
SELECT dept_man.dept_no, dept.dept_name, dept_man.emp_no, employees.last_name, employees.first_name
FROM ((employees
INNER JOIN dept_man ON employees.emp_no = dept_man.emp_no)
	  INNER JOIN dept ON dept_man.dept_no = dept.dept_no);

--List the department number for each employee along with that employee’s 
--employee number, last name, first name, and department name(2 points) 
SELECT dept_emp.dept_no, dept.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
FROM ((employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no)
	  INNER JOIN dept ON dept_emp.dept_no = dept.dept_no);

--List first name, last name, and sex of 
--each employee whose first name is Hercules and whose last name begins with the letter B(2 points)
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%' ;

--List each employee in the Sales department, including their employee number, last name, and first name(2 points) 
SELECT dept_emp.emp_no, employees.last_name, employees.first_name
FROM ((employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no)
	  INNER JOIN dept ON dept_emp.dept_no = dept.dept_no)
	 WHERE dept.dept_name = 'Sales';
	 
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name(4 points)
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, dept.dept_name
FROM ((employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no)
	  INNER JOIN dept ON dept_emp.dept_no = dept.dept_no)
	 WHERE dept.dept_name = 'Sales' OR dept.dept_name='Development';
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)(4 points)
