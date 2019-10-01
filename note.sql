
select * from dual;
select sysdate from dual;
select current_timestamp from dual;
select extract (year from sysdate) from dual;

select t_name,nvl(city,'N/A') as city from androidt;

select * from androidt;

select t_name,nvl2(city,city,'N/A')as city from androidt;
