CREATE TABLE departments (
  dept_no varchar (30) not null,
  dept_name varchar (30) not null
);

create table dept_emp (
  emp_no int not null,
  dept_no varchar (30) not null,
  from_date date not null,
  to_date date
);

create table dept_manager (
  dept_no varchar (30) not null,
  emp_no int not null,
  from_date date not null,
  to_date date
);

create table employees (
  emp_no int not null,
  birth_date date not null,
  first_name varchar (20) not null,
  last_name varchar (20) not null,
  gender char (1) not null,
  hire_date date not null
);

create table salaries (
  emp_no int not null,
  salary int not null,
  from_date date not null,
  to_date date
);

create table titles (
  emp_no int not null,
  title varchar (20) not null,
  from_date date not null,
  to_date date
);

---1) List the following details of each employee: employee number, last name, first name, gender, and salary
select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
from salaries
inner join employees on salaries.emp_no=employees.emp_no;

---2) List employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date >='1985-12-31'
and hire_date <'1987-1-1'

---3) List the manager of each department w/ Dept No, Dept Name, mgr emp no, last name, first name, start date, end date

create view names_dates as
	select dept_manager.dept_no, employees.first_name, employees.last_name, dept_manager.from_date, dept_manager.to_date
	from employees inner join dept_manager
	on employees.emp_no = dept_manager.emp_no;

select departments.dept_name, names_dates.dept_no, names_dates.first_name, names_dates.last_name, names_dates.from_date, names_dates.to_date
from departments full join names_dates
on departments.dept_no = names_dates.dept_no

---4) list Dept of each empl with : emp_no, last_name, first_name, dept_name
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees inner join dept_manager
on employees.emp_no = dept_manager.emp_no
inner join departments 
on departments.dept_no = dept_manager.dept_no
--select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
--from employees, dept_manager, departments
--where employees.emp_no = dept_manager.emp_no and departments.dept_no = dept_manager.dept_no

---5) list all employees whose first name is Hercules and last names begins w/ "B"

select first_name, last_name
from employees
where first_name = 'Hercules' and last_name like 'B%'

---6) List employees in the sales dept: emp_no,last, first, dept_name

select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
from employees inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales'

---7) list all employees in sales and development dept - emp_no, first, last, dept name

select employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
from employees inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales' or dept_name = 'Development'

---8) list fequency count of employee last names

select last_name, count(last_name)
from employees
group by last_name


