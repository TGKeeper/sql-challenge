--- MOD 9 HOMEWORK QUESTIONS --- 

--1. List the employee number, last name, first name, sex, and salary of each employee:

select tbl_employees.emp_no, tbl_employees.last_name, tbl_employees.first_name, tbl_employees.sex, tbl_salaries.salary
from tbl_employees
inner join tbl_salaries 
on tbl_employees.emp_no = tbl_salaries.emp_no;

-------------------------------------------------------

--2. List the first name, last name, and hire date for the employees who were hired in 1986.

select first_name, last_name, hire_date
from tbl_employees
where hire_date 
between '01/01/1986' and '12/31/1986';

-------------------------------------------------------

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

select  tbl_deptmngr.dept_no, tbl_dept.dept_name, tbl_deptmngr.emp_no, tbl_employees.last_name, tbl_employees.first_name
from tbl_dept
inner join tbl_deptmngr 
on tbl_deptmngr.dept_no = tbl_dept.dept_no

inner join tbl_employees 
on tbl_deptmngr.emp_no = tbl_employees.emp_no;

-------------------------------------------------------
--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

select tbl_emp_dept.dept_no, tbl_emp_dept.emp_no, tbl_employees.last_name, tbl_employees.first_name, tbl_dept.dept_name
from tbl_employees
inner join tbl_emp_dept
on tbl_emp_dept.emp_no = tbl_employees.emp_no

inner join tbl_dept
on tbl_emp_dept.dept_no = tbl_dept.dept_no;

-------------------------------------------------------

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from tbl_employees
where first_name = 'Hercules' and last_name like 'B%';

-------------------------------------------------------
--6. List each employee in the Sales department, including their employee number, last name, and first name.

select tbl_dept.dept_name, tbl_emp_dept.emp_no, tbl_employees.last_name, tbl_employees.first_name
from tbl_employees
inner join tbl_emp_dept
on tbl_emp_dept.emp_no = tbl_employees.emp_no

inner join tbl_dept
on tbl_emp_dept.dept_no = tbl_dept.dept_no

where dept_name = 'Sales';

-------------------------------------------------------

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

select tbl_dept.dept_name, tbl_emp_dept.emp_no, tbl_employees.last_name, tbl_employees.first_name
from tbl_employees
inner join tbl_emp_dept
on tbl_emp_dept.emp_no = tbl_employees.emp_no

inner join tbl_dept
on tbl_emp_dept.dept_no = tbl_dept.dept_no

where dept_name = 'Sales' 
or dept_name = 'Development';

-------------------------------------------------------

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select last_name, count(last_name) as "No. of Employees w/Surname"
from tbl_employees
group by last_name
order by "No. of Employees w/Surname" desc;

-------------------------------------------------------
