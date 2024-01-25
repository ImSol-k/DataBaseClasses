
select * from employees;

########################
begin; #문제 1 
-- 직원들의 사번 이름(성이름), 부서명을 조회해서 
-- 부서이름 오름차순, 사번 내림차순으로 정렬

select e.employee_id
      ,first_name
      ,last_name
      ,d.department_name
from employees e
join departments d
  on e.department_id = d.department_id
order by d.department_name asc
		,employee_id desc;

end; #106

########################
begin; #문제 2
-- employees테이블의 job_id는 현재의 업무아이디이다.
-- 직원들의 사번, 이름, 월급, 부서명, 현재업무를 사번의 오름차순으로 정렬 
-- 부서가없는 kimberely는 표시하지 않는다

select employee_id
      ,first_name
      ,salary
      ,department_name
      ,job_title
from employees e
join departments d
  on e.department_id = d.department_id
join jobs j
  on e.job_id = j.job_id;

end; #106

########################
begin; #문제 2-1
-- 문제 2에서 부서가없는 kimberely까지 표시하기

select employee_id
      ,first_name
      ,salary
      ,department_name
      ,job_title
from employees e
left join departments d
  on e.department_id = d.department_id
join jobs j
  on e.job_id = j.job_id;
end; #107

########################
begin; #문제 3
-- 도시아이디, 도시명, 부서명, 부서아이디를 도시아이디 오름차순으로 정렬
-- 부서가 없는 도시는 표시하지 않는다

select d.location_id
      ,l.city
      ,d.department_id
      ,d.department_id
from departments d
join locations l
  on d.location_id = l.location_id; 

end; #27

########################
begin; #문제 3-1
-- 문제3에서 부서가 없는 도시까지 표시

select l.location_id
      ,l.city
      ,d.department_id
      ,d.department_id
from departments d
right join locations l
  on d.location_id = l.location_id; 

end; #43

########################
begin; #문제 4
-- 지역에 속한 나라들을 지역이름, 나라이름으로 출력하고
-- 지역이름 오름차순, 나라이름 내림차순으로 정렬

select r.region_name
      ,c.country_name
from regions r
left join countries c
	   on r.region_id = c.region_id;

end; #25

########################
begin; #문제 5
-- 자신의 매니저보다 채용일이 빠른사원의 사번, 이름, 채용일, 매니저이름, 매니저입사일 조회

select e.employee_id
      ,e.first_name myName
      ,e.hire_date myHireData
      ,m.first_name managerName
      ,m.hire_date managerHireData
from employees e
join employees m
  on e.manager_id = m.employee_id
 and e.hire_date < m.hire_date;

end; #37

########################
begin; #문제 6
-- 나라명, 나라아이디, 도시명, 도시아이디, 부서명, 부서아이디를 나라명 오름차순으로 정렬 
-- 값이 없는경우 표시하지 않는다

select c.country_name
      ,c.country_id
      ,l.city
      ,l.location_id
      ,d.department_name
      ,d.department_id
-- from countries c, locations l, departments d;
from countries c
right join locations l
		on c.country_id = l.country_id
join departments d
  on l.location_id = d.location_id;
order by c.country_name asc;
end; #27

########################
begin; #문제 7
-- 과거의 업무아이디가 AC_ACCOUNT 로 근무한 사원의 사번, 이름(성이름), 업무아이디, 시작일, 종료일 출력
-- 이름은 성, 이름 합쳐서 출력

select e.employee_id
      ,concat(e.first_name, '  ', e.last_name)
      ,jh.job_id
      ,jh.start_date
      ,jh.end_date
from employees e
join job_history jh
  on e.employee_id = jh.employee_id
 and jh.job_id = 'ac_account';

end; #2

########################
begin; #문제 8
-- 각 부서에 대해 부서번호, 부서이름, 매니저이름(성), 도시, 나라이름, 지역이름까지  출력

select d.department_id
	  ,d.department_name
      ,e.first_name
      ,l.city
      ,c.country_name
      ,r.region_name
from employees e
join departments d
  on e.employee_id = d.manager_id
join locations l
  on d.location_id = l.location_id
join countries c
  on c.country_id = l.country_id
join regions r
  on c.region_id = r.region_id;

end; #11

######################## ??
begin; #문제 9
-- 각 사원에대해서 사번, 이름, 부서명, 매니저이름 조회 
-- 부서가 없는직원도 표시, 매니저가 없는 직원도 표시


       
end; #107


######################## ??
begin; #문제 9-1
-- 문제 9에서 부서없는직원표시 
-- 매니저없는직원 표시하지 않기

select e.employee_id
      ,e.first_name
      ,d.department_name
      ,case when e.employee_id = d.manager_id then e.first_name
       else null
       end manager
from employees e
left join departments d
       on e.employee_id = d.manager_id;

end; #108

######################## ??
begin; #문제 9-2
-- 문제 9에서 부서없는직원, 매니저없는직원 모두 표시하지 않기

end; #106



