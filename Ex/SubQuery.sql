
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
				  where first_name = 'Den')
order by salary asc;

#예제 
-- 월급을 가장 적게받는 사람의 이름, 월급 사원번호

select first_name
      ,salary
      ,employee_id
from employees
where salary = (select min(salary)
                     from employees);
                     

-- 평균월급보다 적게받는 사람의 이름, 월급 출력
select first_name
      ,salary
from employees
where salary < (select avg(salary)
                  from employees);
                  

-- 부서번호가 110인 직원의 급여와 같은 월급을 받는
-- 모든 직원의 사번, 이름, 급여 출력 
select employee_id
      ,first_name
      ,salary
from employees
where salary in (select salary
                          from employees
						  where department_id = 110);
-- 단일행연산자는 단일행함수랑 같이 사용해야함!!
select employee_id
      ,first_name
      ,salary
from employees
where salary = (select max(salary)
                          from employees
						  where department_id = 110);
                          
-- 각 부서별로 최고급여를 받는 사원의 이름과 월급 출력 

select first_name
      ,salary
      ,department_id
from employees 
where (department_id, salary) in (select department_id
                                        ,max(salary)
									from employees 
								group by department_id);

end;



############################
#sub query
begin; #any(or)
-- 월급이 11000보다 큰 직원의 이름, 급여 출력
select first_name
      ,salary
from employees
where salary > 11000;

-- 부서번호가 110인 직원의 급여보다 큰 모든직원의 이름, 급여를 출력하세요


select first_name
      ,salary
from employees
where salary >any (select salary
				   from employees
				  where department_id = 110);


end;
select first_name
      ,salary
from employees
where department_id = 110;

begin; #all(and)

select first_name]
      ,salary
from employees
where salary >all (select salary
				   from employees
				  where department_id = 110);

end;
