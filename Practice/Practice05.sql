create user 'book'@'%' identified by 'book';
drop user 'book'@'%';
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
-- 가장 늦게 입사한 직원의 이름(성이름), 월급, 부서이름 출력
select concat(first_name, '  ', last_name) 이름,
       salary 월급,
       department_name 부서이름,
       hire_date
from employees e, departments d
where e.department_id = d.department_id
and hire_date = (select max(hire_date)
				 from employees);

end; #45
##############################
begin; #문제7 *
-- 평균월급이 가장 높은 부서 직원들의 직원번호, 이름, 성, 업무, 월급 조회
select e.employee_id,
       e.first_name,
       e.last_name,
       j.job_title,
       salary
from employees e
left join jobs j
	   on e.job_id = j.job_id;
group by j.job_id;


select employee_id,
       first_name,
       last_name,
       j.job_title,
       salary
from employees e, departments d, jobs j
where d.department_name = (select d.department_name,
								avg(e.salary)
						 from employees e, departments d
                         group by d.department_name
                         order by avg(salary) desc
                         limit 0,1)
and d.department_id = e.department_id;

-- 평균 월급




end; #45
##############################
begin; #문제8
-- 평균월급이 가장 높은 부서명과 월급 

select d.department_name,
	   avg(e.salary)
from employees e, departments d, (select avg(salary) avgS
								  from employees
                                  group by department_id) s
where e.department_id = d.department_id
group by d.department_name
having avg(e.salary) >= max(s.avgS);

end; #45
##############################
begin; #문제9
-- 평균월급이 가장 높은 지역과 월급 


-- X ----------------------------------
select r.region_name,
	   avg(e.salary)
from employees e, departments d, locations l, countries c, regions r
where e.department_id = d.department_id
  and d.location_id = l.location_id
  and l.country_id = c.country_id
  and c.region_id = r.region_id
group by r.region_name
order by avg(salary) desc
limit 0,1;

end; #45
##############################
begin; #문제10
-- 평균월급이 가장 높은 업무와 평균월급
-- limit 사용x

select j.job_title,
	   avg(e.salary)
from employees e, jobs j, (select avg(salary) avgS
										   from employees
                                           group by job_id) s
where e.job_id = j.job_id
group by j.job_title
having avg(e.salary) >= max(s.avgS);
end; #45



