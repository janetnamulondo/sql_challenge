
--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.first_name, employees.last_name, employees.gender, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;
--ORDER BY emp_no ASC;

-- 2. List employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date between '1986-01-01' AND '1986-12-31'
ORDER BY hire_date ASC;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT manager.dept_no, manager.emp_no, manager.from_date, manager.to_date,employees.first_name, employees.last_name, departments.dept_name
FROM departments
JOIN manager ON
manager.dept_no=departments.dept_no
JOIN employees ON 
manager.emp_no = employees.emp_no
--GROUP BY dept_name

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT departments.dept_name, employees.first_name, employees.last_name
FROM employees
JOIN department ON
manager.dept_no=departments.dept_no
JOIN employees ON 
manager.emp_no = employees.emp_no

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'B%'AND first_name = 'Hercules';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT first_name, last_name
FROM employees
WHERE emp_no IN
(
  SELECT emp_no
  FROM dept_emp 
  WHERE dept_no IN
  (
    SELECT dept_name
    FROM departments
    WHERE dept_name = 'sales'
  )
);

OR

SELECT employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp ON
employees.emp_no=dept_emp.emp_no
JOIN departments ON 
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'

SELECT * FROM employees

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.first_name, employees.last_name, employees.emp_no, departments.dept_name
FROM employees
JOIN dept_emp ON
employees.emp_no=dept_emp.emp_no
JOIN departments ON 
dept_emp.dept_no = departments.dept_no
WHERE dept_name IN = ('Development','Sales')

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "last name frequency"
FROM employees
GROUP BY last_name
ORDER BY "last name frequency" DESC;

