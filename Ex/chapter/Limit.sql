###########################
#limit

select employee_id
	  ,first_name
      ,salary
from employees
order by employee_id asc
limit 8 offset 0;

-- 07년에 입사한 급여가 많은 직원중 3등에서 7등의 이름, 급여, 입사일 
select first_name 이름
      ,salary 월급
      ,date_format(hire_date, '%Y년 %m월 %d일 (%a)') 입사일
from employees
where hire_date between '2007-01-01' and '2007-12-31'
order by salary desc
limit 2, 5;



