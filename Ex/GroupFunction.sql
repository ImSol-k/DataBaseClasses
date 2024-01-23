
# 그룹함수
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

end;




