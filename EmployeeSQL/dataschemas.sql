-- Drop tables if they exists
DROP TABLE departments,
	dept_emp,
	dept_manager,
	employees,
	salaries,
	titles
;

-- Create tables
CREATE TABLE departments (
	dept_no CHAR(4) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(20) NOT NULL
)
;

CREATE TABLE titles (
	title_id CHAR(5) NOT NULL PRIMARY KEY,
	title VARCHAR(30) NOT NULL
)
;

CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id CHAR(5) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex CHAR(1) NOT NULL,
	hire_date DATE NOT NULL	
)
;

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	dept_no CHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
)
;

CREATE TABLE dept_manager (
	dept_no CHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	PRIMARY KEY (emp_no, dept_no)
)
;

CREATE TABLE salaries (
	emp_no INT NOT NULL PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	salary INT NOT NULL
)
;