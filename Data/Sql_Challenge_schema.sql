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