--1번
select employee_id, first_name, department_name
from employees e, departments d
where e.department_id=d.department_id;

--2번
select employee_id, first_name, department_name, job_title
from employees e, departments d, jobs j
where e.department_id=d.department_id;

--3번
select employee_id, first_name, job_title, salary, min_salary, max_salary
from employees e, jobs j
where e.job_id = j.job_id;

--4번
select employee_id, first_name, salary
from employees
where salary >
(select salary from employees where employee_id=114)
order by salary;

--5번
select employee_id, first_name, department_name
from employees e, departments d
where d.department_id=e.department_id and d.department_id=
(select department_id from employees where employee_id=114);


--6번
select employee_id, first_name, hire_date from
(select rownum rnum, hire.*from
(select employee_id, first_name, hire_date from employees
order by hire_date desc) hire)
where rnum between 11 and 20;


