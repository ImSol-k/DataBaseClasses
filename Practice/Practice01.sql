select * from employees;
select * from jobs;
##################
begin; #문제 1
-- 전체 직원의 다음 정보 조회
-- 입사일 올림차순으로 정렬
-- 이름, 월급, 전화번호, 입사일 순서로 컬럼이름대체

select concat(first_name, '  ',last_name) 이름
      ,salary 월급
      ,phone_number 전화번호
      ,hire_date 입사일
from employees
order by hire_date asc,
         first_name asc;
end;

##################
begin; #문제 2
-- 업무별로 업무이름과 최고월급을 월급의 내림차순으로 정렬

select job_title
	  ,max_salary
from jobs
order by max_salary desc;
end;

##################
begin; #문제 3
-- 담당매니저가있지만 커미션비율이 없고, 월급이 3000초과인
-- 직원의 이름, 매니저아이디, 커미션비율, 월급출력(월급 내림차순)

select concat(first_name, '  ', last_name) name
      ,manager_id
      ,commission_pct
      ,salary
from employees
where manager_id is not null
and commission_pct is null
and salary > 3000;

end;

##################
begin; #문제 4
-- 최고월급이 10000이상인 업무의 이름과 최고월급을
-- 최고월급의 내림차순으로 출력 

select job_title
      ,max_salary
from jobs
where max_salary >= 10000
order by max_salary desc;
end;

##################
begin; #문제 5
-- 월급이 14000미만 10000이상인 직원의 이름(first_name), 월급, 커미션퍼센트를
-- 월급 내림차순으로 출력(단 커미션퍼센트가 null이면 0으로 나타내기) 

select first_name
      ,salary
      ,ifnull(commission_pct, 0)
from employees
where salary between 10000 and 14000
order by salary desc;
end;

##################
begin; #문제 6
-- 부서번호가 10, 90, 100인 직원의 이름, 월급, 입사일, 부서번호출력
-- 입사일은 1977-12 과 같이 표시

select first_name
      ,salary 월급
      ,date_format(hire_date, '%Y-%m') 입사일
      ,department_id
from employees
where department_id = 10
or department_id = 90
or department_id = 100;
end;

##################
begin; #문제 7
-- ,dlfmadp S또는 s가 들어가는 직원의 이름, 월급출력 

select first_name
      ,salary
from employees
where first_name like '%s%';
end;

##################
begin; #문제 8
-- 부서이름이 긴 순서대로 전체부서 출력

select department_name
from departments
order by char_length(department_name) desc;
end;

##################
begin; #문제 9
-- 지사가 있을것으로 예상되는 나라의 이름을 대문자로 출력(올림차순)

select ucase(country_name)
from countries
order by country_name asc;
end;

##################
begin; #문제 10
-- 입사일이 03/12/31 이전 입사한 직원의 이름, 월급, 전화번호, 입사일 출력
-- 전화번호는 000-000-0000형태로 출력 

select concat(first_name,'  ',last_name) name
      ,salary
      ,replace(phone_number, '.', '-')
      ,hire_date
from employees
where hire_date <= '2003-12-31';
end;
