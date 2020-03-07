--Question 1
--List the following details of each employee: employee number, last name, first name, gender and salary.
select Employees.emp_no, Employees.last_name, Employees.first_name, Salaries.salary as "Salary ($)", Employees.gender
From Salaries
Inner join Employees on
Salaries.emp_no = Employees.emp_no;

--Question 2
--List employees who were hired in 1986.
select emp_no, last_name, first_name, hire_date
from Employees  
where
	hire_date >= '19860101' and
	hire_date <= '19861231'; 
	
--Question 3
--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, 
--first name, and start and end employment dates.
select Departments.dept_no as "Dept No", Departments.dept_name as "Dept Name", Dept_Manager.emp_no as "Emp No", Employees.last_name as "Last Name", 
	Employees.first_name as "First Name", Dept_Manager.from_date as "Start Date", Dept_Manager.to_date as "End Date"
from Departments
inner join Dept_Manager on
Departments.dept_no = Dept_Manager.dept_no
inner join Employees on
Dept_Manager.emp_no = Employees.emp_no; 

--Question 4
--List the department of each employee with the following information: employee number, last name, first name, and department name.
select Employees.emp_no as "Emp No", Employees.last_name as "Last Name", Employees.first_name as "First Name", Departments.dept_name as "Dept Name"
from Employees
inner join Dept_Emp on
Employees.emp_no = Dept_Emp.emp_no
inner join Departments on
Dept_Emp.dept_no = Departments.dept_no; 

--Question 5
--List all employees whose first name is "Hercules" and last names begin with "B."
select first_name as "First Name", last_name as "Last Name" from Employees
where first_name = 'Hercules' and last_name like 'B%'; 

--Question 6
--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select emp_no from Dept_Manager
where emp_no NOT IN (select distinct emp_no from Dept_Emp);
select Departments.dept_name, Employees.emp_no, Employees.last_name, Employees.first_name
from Departments
inner join Dept_Emp on
Departments.dept_no = Dept_Emp.dept_no
inner join Employees on
Dept_Emp.emp_no = Employees.emp_no
where dept_name = 'Sales'; 

--Question 7
--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select Departments.dept_name, Employees.emp_no, Employees.last_name, Employees.first_name
from Departments
inner join Dept_Emp on
Departments.dept_no = Dept_Emp.dept_no
inner join Employees on
Dept_Emp.emp_no = Employees.emp_no
where dept_name IN ('Sales','Development')
order by dept_name, last_name;

--Question 8
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "last_name_count"
from Employees
group by last_name
order by "last_name_count" DESC;
