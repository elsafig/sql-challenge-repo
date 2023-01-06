--drop tables if exist if decide to run entire code
--uncomment when needed
--CREATE DATABASE module9db;
--DROP TABLE IF EXISTS dept CASCADE;
--DROP TABLE IF EXISTS titles CASCADE;
--DROP TABLE IF EXISTS employees CASCADE;
--DROP TABLE IF EXISTS dept_emp CASCADE;
--DROP TABLE IF EXISTS dept_man CASCADE;
--DROP TABLE IF EXISTS salaries CASCADE;

--create tables
CREATE TABLE dept (
    dept_no varchar(6) PRIMARY KEY,
    dept_name varchar(24) NOT NULL
);

CREATE TABLE titles (
    title_id varchar(6) PRIMARY KEY,
    title varchar(24) NOT NULL
);

CREATE TABLE employees (
    emp_no varchar(6) PRIMARY KEY,
    emp_title_id varchar(6),
    birthdate date NOT NULL,
    first_name varchar(35) NOT NULL,
    last_name varchar(35) NOT NULL,
    sex varchar(1) NOT NULL,
    hire_date date NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp (
    emp_no varchar(6), 
    dept_no varchar(6),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES dept(dept_no)
);

CREATE TABLE dept_man (
    emp_no varchar(6),
    dept_no varchar(6),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES dept(dept_no)
);

CREATE TABLE salaries (
    emp_no varchar(6),
    salary float NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--datestyle set to match CSV files
SET datestyle TO postgres, mdy;
SHOW datestyle;

--insert data to tables from csv files
COPY dept(dept_no, dept_name)
	FROM 'C:\Users\elsai\sql-challenge-repo\m9-starter-code\data\departments.csv'
	DELIMITER ','
	CSV HEADER;
	
COPY titles(title_id, title)
	FROM 'C:\Users\elsai\sql-challenge-repo\m9-starter-code\data\titles.csv'
	DELIMITER ','
	CSV HEADER;
	
COPY employees(emp_no, emp_title_id, birthdate, first_name, last_name, sex, hire_date)
	FROM 'C:\Users\elsai\sql-challenge-repo\m9-starter-code\data\employees.csv'
	DELIMITER ','
	CSV HEADER;

COPY dept_emp (emp_no, dept_no)
	FROM 'C:\Users\elsai\sql-challenge-repo\m9-starter-code\data\dept_emp.csv'
	DELIMITER ','
	CSV HEADER;
	
COPY dept_man (dept_no, emp_no)
	FROM 'C:\Users\elsai\sql-challenge-repo\m9-starter-code\data\dept_manager.csv'
	DELIMITER ','
	CSV HEADER;
	
COPY salaries (emp_no, salary)
	FROM 'C:\Users\elsai\sql-challenge-repo\m9-starter-code\data\salaries.csv'
	DELIMITER ','
	CSV HEADER;
