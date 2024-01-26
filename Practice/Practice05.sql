
##############################
begin; #문제1
-- 담당매니저가 배정되어 있으나 커미션비율이 없고,
-- 월급이 3000초과인 직원의 이름, 매니저아이디, 커미션비율, 월급 출력
select first_name
      ,manager_id
      ,commission_pct
      ,salary
from employees
where manager_id is not null
and commission_pct is null
and salary > 3000;
end; #45
##############################
begin; #문제2
-- 각 부서별로 최고의 월급을 받는 사원의 직원번호, 이름, 월급, 입사일, 전화번호, 부서번호 조회
-- 조건절비교로 작성 
-- 월급의 내림차순 정렬
-- 입사일은 2001-01-13 토요일 형식으로 출력
-- 전화번호는 000-000-0000 형식으로 출력
select employee_id
      ,first_name
      ,salary
      ,case when date_format(hire_date, '%a') = 'Mon' then date_format(hire_date, '%Y-%m-%d 월요일')
			when date_format(hire_date, '%a') = 'Thu' then date_format(hire_date, '%Y-%m-%d 화요일')
			when date_format(hire_date, '%a') = 'Wen' then date_format(hire_date, '%Y-%m-%d 수요일')
			when date_format(hire_date, '%a') = 'Thur' then date_format(hire_date, '%Y-%m-%d 목요일')
			when date_format(hire_date, '%a') = 'Fri' then date_format(hire_date, '%Y-%m-%d 금요일')
			when date_format(hire_date, '%a') = 'Sat' then date_format(hire_date, '%Y-%m-%d 토요일')
       else date_format(hire_date, '%Y-%m-%d 일요일')
       end 'hire_date'
      ,replace(phone_number, '.','-')
      ,department_id
from employees
where (salary,department_id) in (select max(salary)
									   ,department_id
								 from employees
								 group by department_id);
end; #11
##############################
begin; #문제3
-- 매니저별 담당직원들의 평균월급 최소월급, 최대월급
-- 직원은 2005년이후 입사자
-- 매니저별 평균 월급이 5000이상만 내림차순으로 정렬(소수점 첫째자리 반올림)
-- 매니저아이디, 매니저이름, 매니저별편균월급, 매니저별최소월급, 매니저별 최대월급
select m.employee_id
      ,m.first_name
      ,m.salary
      ,avg(e.salary)
      ,max(e.salary)
from employees e, employees m
where m.employee_id = e.manager_id
and m.hire_date < 20050101
and m.salary > 5000
group by m.employee_id
order by round(m.salary, 1) desc;

select manager_id, 
	   avg(salary) 평균,
       max(salary) 최대
from employees
group by manager_id;
end; #9
##############################
begin; #문제4
-- 각 사원에 대해 사번, 이름, 부서명, 매니저이름 조회
-- 부서없는직원도 표시 

select e.employee_id,
       e.first_name name,
       e.department_id,
       m.first_name manager_name
from employees e, employees m
where m.employee_id = e.manager_id;

end; #45
##############################
begin; #문제5
-- 2005년 이후 입사한 직원중 입사일이 11~20번째 직원의 
-- 사번, 이름, 부서명, 월급, 입사일을 입사일순서로 출력
select employee_id,
	   first_name,
       department_id,
       salary,
       hire_date
from employees
where hire_date > 20050101
order by hire_date
limit 10, 10;

end; #45
##############################
begin; #문제6


end; #45
##############################
begin; #문제7


end; #45
##############################
begin; #문제8


end; #45
##############################
begin; #문제9


end; #45
##############################
begin; #문제10


end; #45



