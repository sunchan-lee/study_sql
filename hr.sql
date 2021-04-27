--�������� ����
desc employees;

--��� employees�� �����͸� �����ش�.
select * from employees;

select employee_id as "�����ȣ", last_name as "�̸�" from employees;


--�ߺ��� ����
select distinct employee_id, department_id from employees;

select rownum, employee_id, last_name from employees;

--employee_id �� 100���� 110����
select rownum, employee_id, last_name from employees
where employee_id between 100 and 110;

--and ���
select rownum, employee_id, last_name from employees
where employee_id >= 100 and employee_id <= 110;

--in ���
select rownum, employee_id, last_name from employees
where employee_id in(100,200,300);
--or
select rownum, employee_id, last_name from employees
where employee_id=100 or employee_id=200 or employee_id=300;

--order by
select rownum, employee_id, last_name from employees
order by employee_id desc;

--like
-- like 'St%' st�� ���۵Ǵ� �����, ���ڼ� ������� ���
select rownum, employee_id, first_name from employees
where first_name like 'St%';

--'%t' t�� ������ �����, �ձ��� �������.
select rownum, employee_id, first_name from employees
where first_name like '%t';

--�տ� �ִ�, �߰��� �ִ�, ���� �ִ� ������� 'll' �̸��� ������ �����.0
select rownum, employee_id, first_name from employees
where first_name like '%ll%';

--upper �빮�� lower �ҹ���
select rownum, employee_id, lower(first_name) from employees;
select rownum, employee_id, upper(first_name) from employees;

select rownum, employee_id, last_name from employees
where lower(last_name) like 'king';


select * from 
(select rownum, employee_id, lower(last_name) last_name from employees)
where last_name='king';

--group by �Լ�
--having �� - ������ �ְ� �˻��ϱ�
select department_id, avg(salary) from employees
group by department_id
having avg(salary)>6000
order by department_id;

--���̺� �� join
--left outer join
select employee_id, first_name, e.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id(+);

--ansi
--left outer join
select employee_id, first_name, e.department_id, department_name
from employees e left outer join departments d
on e.department_id=d.department_id;

--sub query // ex)�����ȣ�� 100�� ����� �μ��� ���� �μ��� �ٹ��ϴ� �����?
select employee_id, first_name, department_id from employees
where department_id  in (select department_id from employees
                            where employee_id=100);

--��������
--employee_id�� 182�� ����� hire_date ���� ���Ŀ� �Ի��� ����� 
--employee_id, first_name, hire_date ��ȸ
--date �� �ε�ȣ�� ǥ�� �����ϴ�.
select employee_id, first_name, hire_date from employees                 -- ��ȣ �ۿ� �ִ� query �� Main Query  
where hire_date > (select hire_date from employees where employee_id=182) -- (employee_id�� 182�� ����� hire_date) - Sub Query
order by hire_date;
--07/06/21 ������ �Ի��� ������� ���´�.

--��������2
--department_id�� 80���� ����� ��� salary ���� ���� 
--����� employee_id, first_name, salary, department_id ��ȸ
select employee_id, first_name, salary, department_id from employees
where salary > (select avg(salary) from employees where department_id=80)
order by salary;

select avg(salary) from employees where department_id=80; --8955.88235

--��������3 (�ָ�����)
--rownum�� �̿��ϼ���
--employee_id �� �������� �������� 5 ~ 10��°�� �����
--employee_id, first_name �� ��ȸ���ּ���.

select rownum, employee_id, first_name from employees
where employee_id between 5 and 10(select employee_id from employees)
order by rownum;






