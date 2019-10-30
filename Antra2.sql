--inner join
select e.first_name,e.last_name,d.department_name
from hr.employees e join hr.departments d
on e.department_id=d.department_id

--left join/right join
select e.first_name,e.department_id,d.department_name
from hr.employees e left join hr.departments d
on e.department_id=d.department_id
where e.department_id is null


select d.department_id
from hr.departments d left join hr.employees e on d.department_id=e.department_id
group by d.department_id


--list highest salary in each deparment
select MAX(e.salary),e.department_id
from hr.employees e
join hr.departments d on e.department_id=d.department_id
group by e.department_id

select t.department_name,t.first_name,(case when t.salary is null then 0 else t.salary end) as salary
from (select d.department_id,d.department_name,e.first_name,e.salary
        ,rank() over (partition by d.department_id order by e.salary desc) as rank
    from hr.departments d left join hr.employees e on d.department_id=e.department_id) t
where rank=1

select d.department_name,e1.first_name,e1.salary
from(select e.department_id,MAX(salary) as salary
    from hr.employees e
    where e.department_id is not null
    group by e.department_id) t
    right join hr.departments d on t.department_id=d.department_id
    left join hr.employees e1 on e1.salary=t.salary and e1.department_id=d.department_id

