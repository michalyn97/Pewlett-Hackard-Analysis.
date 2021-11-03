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

Create Table dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	Foreign key (emp_no) references employees (emp_no),
	Foreign key (dept_no) references departments (dept_no),
	Primary key (emp_no, dept_no)


);

Create Table salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	Foreign key (emp_no) references employees (emp_no),
	Primary key (emp_no)

);

Create Table titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	Foreign key (emp_no) references employees (emp_no),
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

Select * from departments;