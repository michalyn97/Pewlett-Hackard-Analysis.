Create Table departments (
	dept_no VARCHAR(4) not null,
	dept_name VARCHAR(40)  not null,
	Primary key (dept_no),
	Unique (dept_name)

);

Create Table employees(
	emp_no int NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

Create Table dept_manager2(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	Primary key (emp_no, dept_no)


);

Create Table salaries1 (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	Primary key (emp_no)

);

Create Table titles1 (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	Primary key (emp_no)
);

Create Table dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR (4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	Foreign key (emp_no) references employees (emp_no),
	Foreign key (dept_no) references departments (dept_no),
	Primary key (emp_no, dept_no)
);

Select * FROM employees

--- determine the list of employees eligible for retirement
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

---create a query of employees born in 1952
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

---retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

---create a new table for the retirement info
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

---view the new retirement info table
SELECT * FROM retirement_info;