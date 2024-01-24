
############################
#sub query
begin; 
-- 기존문법
-- Den구하기
select first_name
      ,salary
from employees
where first_name = 'Den';
-- 11000이상 구하기
select first_name
      ,salary
from employees
where salary >= 11000;

-- subQuery으로 질문 합치기
-- Den의 월급보다 많이 받는사람만 불러온다
select first_name
      ,salary
from employees
where salary >= (select salary
				   from employees
				  where first_name = 'Den');

end;






