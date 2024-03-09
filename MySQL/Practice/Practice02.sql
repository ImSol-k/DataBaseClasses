begin;
select * from employees;
select * from departments;
select * from job_history;
select * from jobs;
select * from locations;
select * from countries;
select * from regions;
end;

########################
begin; #문제 1
-- 매니저가 있는 직원은 몇명인지 출력

select count(manager_id)
from employees;
end;

########################
begin; #문제 2
-- 직원중 최고임금과 최저임금 출력 후
-- 두 임금의 차이 구하기

select max(salary) max
      ,min(salary) min
      ,max(salary) - min(salary) difference
from employees;
end;

########################
begin; #문제 3
-- 마지막으로 신입사원이 들어온 날 년 월 일로 출력

select date_format(max(hire_date), '%Y년 %m월 %d일') 마지막입사
from employees;
end;

########################
begin; #문제 4
-- 부서별 평균임금, 최고임금, 최저임금을 부서아이디와 함꼐 출력
-- 정렬순서는 부서번호 내림차순

select avg(salary) avg
      ,max(salary) max
      ,min(salary) min
      ,department_id
from employees
group by department_id
order by department_id desc;
end;

########################
begin; #문제 5
-- 업무별로 평균임금, 최고임금, 최저임금, 업무아이디출력 
-- 정렬순서 최저임금 내림차순, 평균임금(소수점 반올림) 오름차순
-- 정렬순서는 최소임금 2500구간일때 확인해보기

select avg(salary)
      ,max(salary)
      ,min(salary)
      ,job_id
from employees
group by job_id
order by min(salary) desc
		,round(avg(salary), 2) asc;
end;

########################
begin; #문제 6
-- 가장 오래 근속한 직원의 입사일 출력
-- 2005-08-20 Saturday 형식으로 출력

select date_format(min(hire_date), '%Y-%m-%d %W') 최고근속
from employees;
end;

########################
begin; #문제 7
-- 평균임금과 최저임금의 차이가 2000미만인 부서, 평균임금, 최저임금, 쳥균임금 - 최저임금을 
-- 두 임금차이 내림차순으로 출력

select avg(salary)
      ,min(salary)
      ,max(salary)
      ,avg(salary)-min(salary) difference
from employees
group by department_id
having difference < 2000
order by difference desc;
end;

########################
begin; #문제 8
-- 업무별로 최고임금과 최저임금의 차이 출력 내림차순 정렬

select job_id
      ,max(salary) - min(salary) salary
from employees
group by job_id
order by salary desc;
end;

########################
begin; #문제 9
-- 2005년 이후 입사자중 관리자 별로 평균 급여 최소급여 최대급여 알아보기 
-- 관리자별로 평균급여가 5000이상중에 평균급여 최소급여 최대급여 출력
-- 매니저아이디(manager_id), 평균급여(avg), 최대급여(max), 최소급여(min) 으로 출력

select manager_id
      ,avg(salary) avg
      ,min(salary) min
      ,max(salary) max 
from employees
where hire_date > '2005-01-01'
group by manager_id
having avg(salary) >= 5000;
end;

########################
begin; #문제 10
-- 입사일이02/12/31이전이면 '창립맴버' 이후로는 00년입사 05이후입사는'상장이후입사'출력
-- 입사일 오름차순 정렬

select hire_date
	  ,case when hire_date < 20021231 then '창립맴버'
            when hire_date between 20030101 and 20031231 then '03년입사'
            when hire_date between 20040101 and 20041231 then '04년입사'
            else '상장이후입사'
            end optData
from employees
order by hire_date asc;
end;

########################
begin; #문제 11
-- 가장 오래 근속한 직원의 입사일 출력 
-- 2005년 08월 20일(토요일) 형식

select case when date_format(min(hire_date), '%a') = 'Mon' then date_format(min(hire_date), '%Y년 %m월 %d일 월요일')
            when date_format(min(hire_date), '%a') = 'Tus' then date_format(min(hire_date), '%Y년 %m월 %d일 화요일')
            when date_format(min(hire_date), '%a') = 'Wnd' then date_format(min(hire_date), '%Y년 %m월 %d일 수요일')
            when date_format(min(hire_date), '%a') = 'Thu' then date_format(min(hire_date), '%Y년 %m월 %d일 목요일')
            when date_format(min(hire_date), '%a') = 'Fri' then date_format(min(hire_date), '%Y년 %m월 %d일 금요일')
            when date_format(min(hire_date), '%a') = 'Sat' then date_format(min(hire_date), '%Y년 %m월 %d일 토요일')
	   else date_format(min(hire_date), '%Y년 %m월 %d일 일요일')
	   end  '최고근속자입사일'
from employees;

end;

