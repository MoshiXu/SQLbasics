select * from employees;

--number3 sal
select e.*
from(select emp_name,rank() over (order by Emp_sal) as rank
from employees) e
where e.rank=3;

--rank by name
select emp_name,rank() over (order by emp_name) as name
from employees;

--rank by emp_id
select emp_name,emp_loc,rank() over (order by emp_loc) as rank
from employees;

--second highest
select max(emp_sal)
from employees
where emp_sal<(select Max(emp_sal) from employees); 

--print all as second highest
select temp.*
from (select e.emp_name,e.emp_dept_id,e.emp_sal,dense_rank() over(order by emp_sal) as salary
from employees e)temp
where temp.salary=2;

--order by name
select *
from employees
order by emp_name;

--order by salary
select * 
from employees
order by emp_sal;
-- order by salary descrease
select * 
from employees
order by emp_sal desc;

--order by salary then by name
select *
from employees
order by emp_sal desc,emp_name;

--group by

