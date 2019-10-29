select max(salary) as secondMax
from hr.employees
where salary<(
    select max(salary)
    from hr.employees
    where salary<(select max(salary) from hr.employees)
)


--rank,dense_tank()
select e.salary,dese_rank() over(order by salary desc) as rank
from hr.employees e

select t1.salary
from (select e.salary,dense_rank() over(order by salary desc) as rank
from hr.employees e) t1
where t1.rank=2

select t1.*
from (select e.first_name,e.last_name,dense_rank() over (order by salary desc) as rank
from hr.employees e)t1
where t1.rank=2


select first_name,last_name
from hr.employees
order by first_name desc,last_name asc


select * 
from hr.departments

select location_id,count(*)
from hr.departments
group by location_id


select * from hr.employees
where department_id is null


select department_id,count(*)
from hr.employees
where department_id is not null
group by department_id


select department_id,count(*)
from hr.employees
where department_id is not null
group by department_id
having count(*)>3


select count(*)
from (select * from hr.employees
        union
    select * from hr.employees)

select count(*)
from (select * from hr.employees
        union all
    select * from hr.employees)


select count(*)
from (select first_name from hr.employees
        union
    select first_name from hr.employees)


select count(*)
from (select first_name,last_name from hr.employees
        union
    select first_name,last_name from hr.employees)



select count(*)
from (select first_name,last_name from hr.employees
        intersect
    select first_name,last_name from hr.employees)
    
    
select count(*)
from (select first_name,last_name from hr.employees
        minus
    select first_name,last_name from hr.employees)
    
select count(*)
from (select first_name,last_name from hr.employees
        minus
    select first_name,last_name from hr.employees where employee_id=100)

--remove duplicate elements first
-- result is 0
select count(*)
from (select first_name from hr.employees where first_name='David'
        minus
    select first_name from hr.employees where employee_id=105)
    
    
--exist
select e1.*
from hr.employees e1
where exists (select e1.employee_id


select * 
from hr.employees
where salary>1000 or employee_id<200


select e.department_id,dense_rank() over(partition by e.department_id order by salary desc) as rank
from hr.employees e

--retrieve employees who have the highest salary in each department
select department_id,salary,rank
from (select e.*,dense_rank() over (partition by e.department_id order by salary desc) as rank
from hr.employees e)
where rank=1



