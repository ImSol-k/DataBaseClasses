
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
      ,date_format(phone_number)
      ,department_id
from employees;
end; #11
##############################
begin; #문제3
-- 매니저별 담당직원들의 평균월급, 최소월급, 최대월급 
-- 직원은 2005년 이후 입사자 
-- 매니저별 평균월급이 5000이상만 내림차순으로 출력(소수점 첫째자리 반올림)
-- 매니저아이디, 매니저이름, 매니저별 평균월급 , 매니저별최소월급, 매니저별최대월급
select m.manager_id
	  ,m.first_name
from employees m, (select ;
end; #9
##############################
begin; #문제4


end; #45
##############################
begin; #문제5


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



