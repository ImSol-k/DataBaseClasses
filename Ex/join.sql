

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

select *
from employees e
left outer join departments d
on e.department_id = d.department_id;

select *
from employees e
right outer join departments d
on e.department_id = d.department_id;



end;

begin; #full outer

end;
