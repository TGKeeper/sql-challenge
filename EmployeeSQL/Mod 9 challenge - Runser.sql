--I added both not null & character number constraints per instructions
--But since it's historical data with no missing rows, I had no clue where they should go

---create table1 named tbl_title

drop table if exists tbl_title cascade;
create table tbl_title (title_id varchar(5) primary key, 
						title varchar);


select * from tbl_title;						
-------------------------------------------------------

---create table2 named tbl_employees

drop table if exists tbl_employees cascade;
create table tbl_employees (emp_no integer primary key, 
					   emp_title_id varchar(5),
					   birth_date date,
					   first_name varchar,
					   last_name varchar,
					   sex varchar(1),
					   hire_date date,
					   foreign key (emp_title_id) references tbl_title(title_id));
					   
select * from tbl_employees;					   
-------------------------------------------------------

---create table3 named tbl_dept

drop table if exists tbl_dept cascade;
create table tbl_dept (dept_no varchar(4) primary key, 
					   dept_name varchar);

select * from tbl_dept;					   
-------------------------------------------------------

---create table4 named tbl_deptmngr

drop table if exists tbl_deptmngr cascade;
create table tbl_deptmngr (dept_no varchar(4), 
						   emp_no integer NOT NULL,
						  foreign key (dept_no) references tbl_dept(dept_no),
						  foreign key (emp_no) references tbl_employees(emp_no),
						  primary key (emp_no, dept_no));

select * from tbl_deptmngr;
-------------------------------------------------------

---create table5 named tbl_emp_dept;

drop table if exists tbl_emp_dept cascade;
create table tbl_emp_dept (emp_no integer NOT NULL, 
						   dept_no varchar(4),
						  foreign key (dept_no) references tbl_dept(dept_no),
						  foreign key (emp_no) references tbl_employees(emp_no),
						  primary key (emp_no, dept_no));

select * from tbl_emp_dept;
-------------------------------------------------------

---create table6 named tbl_salaries  

drop table if exists tbl_salaries cascade;
create table tbl_salaries (emp_no integer primary key, 
						   salary integer,
						   foreign key (emp_no) references tbl_employees(emp_no));

select * from tbl_salaries;

SELECT COUNT(emp_no)
from tbl_salaries;

---Imported all file data via Object Eplorer's import func
-------------------------------------------------------
-------------------------------------------------------