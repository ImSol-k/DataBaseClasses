
#######################
# 그룹함수
begin; 

begin;
select first_name
      ,round(salary, 0)
from employees;
end;

#######################
begin; #count
-- 함수에 입력되는 데이터의 총 건수 구하는 함수

select 'row' coulmn
      ,count(*) 'all'
      ,count(first_name) name
	  ,count(manager_id) manager
      ,count(commission_pct) commission
from employees
where salary > 16000;

-- 월급이 16000초과하는 직원의 수는?
select 'row' coulmn
	  ,count(salary) salary
      ,count(commission_pct) commission
from employees
where salary > 16000;

end;

#######################
begin; #sum
-- 합계구하기

select * from employees;
select sum(salary)
      ,count(*)
      ,sum(email)
from employees;

end;

#######################
begin; #avg
-- 입력된값들의 평균값 구하기( NULL제외)

select count(*)
      ,round(sum(salary), 0)
      ,avg(salary)
      ,round(avg(salary), 0)
from employees;

-- null포함시키는 방법
select count(*)
      ,sum(salary)
      ,avg(ifnull(salary, 0))
from employees;

end;

#######################
begin; #max, min
-- 입력된 컬럼중 가장 큰값/작은값 구하는 함수 

select count(*)
      ,max(salary)
      ,min(salary)
from employees;
end;

#######################
begin; #group절

select department_id
      ,count(department_id) count
	  ,round(avg(salary), 1) salaryAvg
from employees
group by department_id
order by department_id asc;

select department_id
      ,first_name
      ,job_id
      ,count(*)
from employees
group by department_id, job_id, first_name
order by department_id asc;

-- 월급의 합계가 20000 이상인 부서 번호와, 인원수, 월급합계 출력 
select department_id
      ,count(*)
      ,sum(salary) salarySum
from employees
group by department_id
having sum(salary) >= 20000
and department_id = 100
order by department_id asc;

end;

end;

#######################
#if~else/case~end
# if~else(조건문, 참, 거짓)
-- ifnull은 null만 체크가능 
select first_name
      ,commission_pct
      ,ifnull(commission_pct, 0) commission_pct
      ,if(commission_pct is null ,0 , 1) state
from employees;

# case~end
-- java의 if~else랑 비슷하다 
select employee_id
      ,salary
      ,job_id
      -- job_id가 'ac_account'면 then계산
      ,case when job_id = 'ac_account' then salary + salary * 0.1 
            when job_id = 'sa_rep' then salary + salary * 0.2
            when job_id = 'st_clerk' then salary + salary * 0.3
      -- case에 해당사항이 없으면 그냥 salary출력
       else salary
       -- 컬럼명 realsalary으로 출력
       end realsalary
from employees;

# 예제
-- 직원의 이름, 부서번호, 팀 출력
-- 팀은 코드로 결정하고 부서코드가
-- 10~50 = A-TEAM
-- 60~100 = B-TEAM
-- 110~150 = C-TEAM 나머지는 팀없음
select * from employees;
select first_name
      ,department_id
      ,case when department_id >= 10 and department_id <= 50 then 'A-TEAM'
            when department_id >= 60 and department_id <= 100 then 'B-TEAM'
            when department_id >= 110 and department_id <= 150 then 'C-TEAM'
            else '팀없음'
            end team
from employees;

select first_name
      ,department_id
      ,case when department_id between 10 and 50 then 'A-TEAM'
            when department_id between 60 and 100  then 'B-TEAM'
            when department_id between 110 and 150  then 'C-TEAM'
            else '팀없음'
            end team
from employees;

#######################
#join
begin;

begin; #테이블 합치기
-- 조건걸기

select first_name
      ,department_id
from employees;

select department_name
from departments;

select *
from employees, departments, countries;

select first_name      
      ,department_name
      ,e.department_id
      ,location_id
from employees e, departments d
where e.department_id = d.department_id;
end;





begin; #outer join





end;

end;





