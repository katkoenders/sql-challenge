CREATE TABLE Departments (
	dept_no varchar not null,
	dept_name varchar not null
	constraint pk_Departments primary key (dept_no));
	
CREATE TABLE Dept_Emp (
	emp_no int not null,
	dept_no varchar not null,
	from_date date not null,
	to_date date not null);
	
CREATE TABLE Dept_Manager (
	dept_no varchar not null,
	emp_no int not null,
	from_date date not null,
	to_date date not null);

CREATE TABLE Employees (
	emp_no int not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	gender varchar not null,
	hire_date date not null
	constraint pk_Employees primary key (emp_no));

CREATE TABLE Salaries (
	emp_no int not null,
	salary int not null,
	from_date date not null,
	to_date date not null);
	
CREATE TABLE Titles (
	emp_no int not null,  
	title varchar not null,
	from_date date not null,
	to_date date not null);
	
ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no;

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);
						
ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);