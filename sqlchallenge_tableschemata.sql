CREATE TABLE departments (
    dept_no VARCHAR(50) NOT NULL,
    dept_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
	);
SELECT * FROM departments

CREATE TABLE dept_emp (
    emp_no VARCHAR(50) NOT NULL,
    dept_no VARCHAR(50) NOT NULL,
	from_date Date,
	to_date Date,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  	PRIMARY KEY (dept_no, emp_no)
	);

SELECT * FROM dept_emp

CREATE TABLE manager (
    dept_no VARCHAR(50) NOT NULL,
    emp_no VARCHAR NOT NULL,
	from_date Date,
	to_date Date, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  	PRIMARY KEY (dept_no, emp_no)
	);
SELECT * FROM manager 

CREATE TABLE employees (
    emp_no VARCHAR(50) NOT NULL,
    birth_date Date NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	first_name VARCHAR(50) NOT NULL, 
	gender VARCHAR(1)NOT NULL,
	hire_date Date NOT NULL,
  	PRIMARY KEY (emp_no)
	);
SELECT * FROM employees

CREATE TABLE salaries (
    emp_no VARCHAR(50) NOT NULL,
    salary FLOAT NOT NULL,
	from_date Date NOT NULL,
	to_date Date NOT NULL, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  	PRIMARY KEY (emp_no,from_date)
	);
SELECT * FROM salaries 

CREATE TABLE title (
    emp_no VARCHAR(50) NOT NULL,
    title VARCHAR(50) NOT NULL,
	from_date Date NOT NULL,
	to_date Date NOT NULL, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  	PRIMARY KEY (emp_no,title,from_date)
	);
SELECT * FROM title 