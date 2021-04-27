--내림차순 정렬
desc employees;

--모든 employees의 데이터를 보여준다.
select * from employees;

select employee_id as "사원번호", last_name as "이름" from employees;


--중복값 제거
select distinct employee_id, department_id from employees;

select rownum, employee_id, last_name from employees;

--employee_id 가 100에서 110까지
select rownum, employee_id, last_name from employees
where employee_id between 100 and 110;

--and 사용
select rownum, employee_id, last_name from employees
where employee_id >= 100 and employee_id <= 110;

--in 사용
select rownum, employee_id, last_name from employees
where employee_id in(100,200,300);
--or
select rownum, employee_id, last_name from employees
where employee_id=100 or employee_id=200 or employee_id=300;

--order by
select rownum, employee_id, last_name from employees
order by employee_id desc;

--like
-- like 'St%' st로 시작되는 사람들, 글자수 상관없이 모두
select rownum, employee_id, first_name from employees
where first_name like 'St%';

--'%t' t로 끝나는 사람들, 앞글자 상관없이.
select rownum, employee_id, first_name from employees
where first_name like '%t';

--앞에 있던, 중간에 있던, 끝에 있던 상관없이 'll' 이름이 나열된 사람들.0
select rownum, employee_id, first_name from employees
where first_name like '%ll%';

--upper 대문자 lower 소문자
select rownum, employee_id, lower(first_name) from employees;
select rownum, employee_id, upper(first_name) from employees;

select rownum, employee_id, last_name from employees
where lower(last_name) like 'king';


select * from 
(select rownum, employee_id, lower(last_name) last_name from employees)
where last_name='king';

--group by 함수
--having 절 - 조건을 주고 검색하기
select department_id, avg(salary) from employees
group by department_id
having avg(salary)>6000
order by department_id;

--테이블 간 join
--left outer join
select employee_id, first_name, e.department_id, department_name
from employees e, departments d
where e.department_id = d.department_id(+);

--ansi
--left outer join
select employee_id, first_name, e.department_id, department_name
from employees e left outer join departments d
on e.department_id=d.department_id;

--sub query // ex)사원번호가 100인 사람의 부서와 같은 부서에 근무하는 사람은?
select employee_id, first_name, department_id from employees
where department_id  in (select department_id from employees
                            where employee_id=100);

--연습문제
--employee_id가 182인 사람의 hire_date 보다 이후에 입사한 사람의 
--employee_id, first_name, hire_date 조회
--date 도 부등호로 표현 가능하다.
select employee_id, first_name, hire_date from employees                 -- 괄호 밖에 있는 query 가 Main Query  
where hire_date > (select hire_date from employees where employee_id=182) -- (employee_id가 182인 사람의 hire_date) - Sub Query
order by hire_date;
--07/06/21 이후의 입사한 사원들이 나온다.

--연습문제2
--department_id가 80번인 사람의 평균 salary 보다 많은 
--사람의 employee_id, first_name, salary, department_id 조회
select employee_id, first_name, salary, department_id from employees
where salary > (select avg(salary) from employees where department_id=80)
order by salary;

select avg(salary) from employees where department_id=80; --8955.88235

--연습문제3 (주말과제)
--rownum을 이용하세요
--employee_id 가 오름차순 기준으로 5 ~ 10번째인 사람의
--employee_id, first_name 을 조회해주세요.

select rownum, employee_id, first_name from employees
where employee_id between 5 and 10(select employee_id from employees)
order by rownum;






