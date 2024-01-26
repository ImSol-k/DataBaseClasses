#########################
begin; #문제1
-- 평균월급보다 적은 월급을 받는 직원은 몇명인지 구하기
select count(salary)
from employees
where salary < (select avg(salary)
                  from employees);
end; #
######################### 
begin; #문제2
-- 평균월급 이상, 최대월급 이하의 월급을 받는 사원의 
-- 직원번호, 이름 , 월급, 평균월급, 최대월급을 월급의 오름차순으로 정렬

select avg(salary) from employees;
select max(salary) from employees;

select employee_id
      ,first_name
      ,salary
      ,(select avg(salary)
		from employees) as 'avg(salary)',
       (select max(salary)
		from employees) as 'max(salary)'
from employees
where salary >= (select avg(salary)
				   from employees)
and salary <= (select max(salary)
				   from employees)
order by salary asc;



select e.employee_id
	  ,e.first_name
      ,e.salary
      ,avg(m.salary)
      ,max(m.salary)
from employees e, employees m
where e.salary >= (select avg(salary)
				   from employees)
and e.salary <= (select max(salary)
				   from employees)
group by e.employee_id
order by salary asc;


end; #51
#########################
begin; #문제3
-- 직원중 Steven(first_name) king(last_name)이 소속된 부서가 있는곳의 주소를 알아보려고 한다
-- 도시아잉디, 거리명, 우편번호, 도시명, 주, 나라아이디 출력 
select *
from locations
where (location_id) 
   in (select location_id
         from departments
         where(department_id) 
         in (select department_id
              from employees
              where first_name = 'steven'
					 and last_name = 'king'));
end;
#########################
begin; #문제4
-- job_id가 'st_man인 직원의 월급보다 작은 직원의 사번, 이름, 월급을 월급의 내림차순으로 출력(any)
select employee_id
      ,first_name
      ,salary
from employees
where salary <any (select salary
					from employees 
                    where job_id = 'st_man')
order by salary desc;
end; #74
#########################
begin; #문제5
-- 각 부서별로 최고의 월급을 받는 사원의 직원번호, 이름, 월급, 부서번호 조회 
-- 조회결과는 월급의 내림차순으로 정렬
-- 조건절비교, 테이블조인 두가지방법으로 작성
# 조건절비교 ===============================
select employee_id
      ,first_name
      ,salary
      ,department_id
from employees
where (department_id, salary) 
   in (select department_id
             ,max(salary)
		 from employees
	 group by department_id)
order by salary desc;
# 테이블조인 ===============================
select e.employee_id
      ,e.first_name
      ,e.salary
      ,e.department_id
from employees e, (select department_id
						 ,max(salary) maxSalary
					from employees
				group by department_id) s
where e.department_id = s.department_id
and e.salary = s.maxSalary
order by salary desc;

end; #11
#########################
begin; #문제6
-- 각 업무별로 월급의 총 합구하기 
-- 월급 총 합이 가장 놓은 업무부터 업무명과 월급 총 합 조회

select j.job_title
      ,s.sumSalary
from jobs j, (select sum(salary) sumSalary
                    ,job_id
			    from employees
                group by job_id) s
where j.job_id = s.job_id
order by s.sumSalary desc;

end; #19
#########################
begin; #문제7
-- 자신의 부서 평균 월급보다 월급이 많은 직원의 번호, 이름, 월급 조회

select e.employee_id
      ,e.first_name
      ,e.salary
from employees e, (select avg(salary) avgSalary
	                     ,department_id
					from employees
                    group by department_id) s
where e.salary > s.avgSalary
and e.department_id = s.department_id;


end; #38
#########################
begin; #문제8
-- 직원 입사일이 11번째에서 15번째의 직원의 사번, 이름, 월급, 입사일 순서로 출력
select employee_id
      ,first_name
      ,salary
      ,hire_date
from employees
order by hire_date asc
limit 10,5;
-- end;







