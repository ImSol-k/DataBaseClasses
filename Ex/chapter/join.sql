

###############################
#Join
begin; #inner join(equi join)

select e.first_name	  
      ,d.department_name
      ,d.department_id
from employees e 
join departments d
  on e.department_id = d.department_id;

-- 예제
-- 모든 직원이름, 부서이름, 업부명 출력

select e.first_name name
	  ,d.department_name department
      ,j.job_title job
from employees e 
join departments d
  on e.department_id = d.department_id
join jobs j
  on e.job_id = j.job_id;

select e.first_name
	  ,d.department_name
      ,j.job_title
from employees e
join departments d
join jobs j
  on e.department_id = d.department_id
 and e.job_id = j.job_id;

select first_name
      ,d.department_name
      ,j.job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id
  and e.job_id = j.job_id;

end;

begin; #outer join

begin; #left, right outer
-- 각 방향의row기준으로 데이터를 불러온다

# left #########################
select e.first_name
	  ,d.department_name
      ,j.job_title
from employees e
left outer join departments d
             on e.department_id = d.department_id
left outer join jobs j
             on e.job_id = j.job_id
order by first_name;



# right #########################
select first_name
      ,department_name
      ,j.job_title
from employees e
right outer join departments d
              on e.department_id = d.department_id
right outer join jobs j
              on e.job_id = j.job_id
order by first_name;
              
select first_name
      ,department_name
from employees e
right outer join departments d
              on e.department_id = d.department_id;

end;

begin; #full outer (union)
# 전체출력 ####################
(select *
from employees e
left join departments d
       on e.department_id = d.department_id
)union(
select *
from employees e
right join departments d
        on e.department_id = d.department_id);

# 부분출력 ####################
(select e.employee_id
       ,e.department_id
	   ,e.first_name
       ,d.department_name
from employees e
left join departments d
       on e.department_id = d.department_id
)union(
select e.employee_id
      ,e.department_id
	  ,e.first_name
      ,d.department_name      
from employees e
right join departments d
        on e.department_id = d.department_id);
end;

begin; #self join
-- 같은테이블 비교
select e.first_name
      ,m.employee_id
      ,e.employee_id
from employees e, employees m
where e.manager_id = m.employee_id
order by e.employee_id;

select e.first_name
      ,e.manager_id
      ,d.department_id
from employees e, departments d
where e.manager_id = d.department_id;

select emp.employee_id
	  ,emp.first_name
      ,emp.manager_id
      ,man.first_name manager
from employees emp, employees man
where emp.employee_id = man.employee_id;

# 잘못된 join
select e.first_name
      ,e.salary
      ,l.street_address
from employees e, locations l
where e.salary = l.location_id;


end;

end;
