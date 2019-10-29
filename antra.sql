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
