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


Create Table dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	Primary key (emp_no, dept_no)
);

Create Table emp_titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
	
);

----Create and Join Tables
SELECT e.emp_no,
e.first_name,
e.last_name,
et.title,
et.from_date,
et.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN emp_titles AS et
ON (e.emp_no = et.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;
----Verify table
Select * from retirement_titles;

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles AS rt
ORDER BY emp_no ASC, to_date DESC;
-----Verify table
Select * from unique_titles;

Select COUNT(ut.emp_no),ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;
-----Verify Table
Select * from retiring_titles;

----Part Two
SELECT DISTINCT ON(e.emp_no)e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
et.title
INTO mentor_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN emp_titles AS et
ON (e.emp_no = et.emp_no)
WHERE (e.birth_date BETWEEN '1962-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;
----Verify Table
Select * from mentor_eligibility;