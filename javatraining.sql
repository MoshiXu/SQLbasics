create table javaTraining(trainee_name varchar(20),dept_name varchar(20),city varchar(20));

select * from javaTraining;

insert into javaTraining(trainee_name,dept_name,city) values('john','cs','new york city');
insert into javaTraining(trainee_name,dept_name,city) values('george','it','chicago');
insert into javaTraining(trainee_name,dept_name,city) values('ken','ee','new jersey');

delete  from javaTraining where trainee_name='john';

select * from javaTraining where trainee_name='george';

update javaTraining set city='Miami' where TRAINEE_NAME='ken';

alter table javaTraining add zip number;
alter table javaTraining drop column  zip ;
--modify column datatype
alter table javaTraining modify city varchar(30);
--change name of column
alter table javaTraining rename   column city to trainee_city;
//change name of table
alter table javaTraining rename to javaT;

alter table javaT rename to javaTraining;



select * from javaT;

truncate table javaTraining;

alter table javaTraining rename   column trainee_city to city;

drop table javaTraining;


create table androidT (t_id number primary key,t_name varchar(20) );


insert into androidT(t_id,t_name) values(101,'john');
insert into androidT(t_id,t_name) values(102,'john');
insert into androidT(t_id,t_name) values(103,'albert');
insert into androidT(t_id,t_name) values(104,'gerrit');
insert into androidT(t_id,t_name) values(105,'alex');
insert into androidT(t_id,t_name) values(106,'peter');
insert into androidT(t_id,t_name) values(107,null);

select * from androidT;
drop table androidT;

create table trainees_sample(t_age number,t_id number,constraint f_tid foreign key(t_id) references androidT(t_id));

insert into trainees_sample(t_age,t_id) values(30,101);
insert into trainees_sample(t_age,t_id) values(32,102);

insert into trainees_sample(t_age,t_id) values(28,103);
insert into trainees_sample(t_age,t_id) values(25,104);
insert into trainees_sample(t_age,t_id) values(26,105);
insert into trainees_sample(t_age,t_id) values(23,106);
select * from trainees_sample;


delete from androidT where t_id=101;

---get records whose age is greater than 25(tarinees _sample table)>,<,>=,<=,=

select * from trainees_sample where t_age=25;

select * from trainees_sample where t_age between 25 and 31;

select * from trainees_sample where t_age=25 or t_age=30;

select * from androidT where t_name is null;
select * from androidT where t_name is not null;

---aggreagte functions

select min(t_age) as MIN_AGE from trainees_sample;

select max(t_age) as MAX_AGE from trainees_sample;

select avg(t_age) as AVG_AGE from trainees_sample;

select sum(t_age) as SUM_AGE from trainees_sample;

SELECT COUNT(*) FROM  trainees_sample;

--DISTINCT

SELECT T_NAME FROM androidT;

select distinct t_name from androidT;

---groupby and having clause
alter table androidT add city varchAR(20);

update androidT set city='Miami' where t_id=101;
update androidT set city='Orlando' where t_id=102;
update androidT set city='New York' where t_id=103;
update androidT set city='New York' where t_id=104;
update androidT set city='San Jose' where t_id=105;
update androidT set city='San Jose' where t_id=106;


select city,count(*) as Total from androidT group by city;
select city,count(*) as Total from androidT group by city order by city;
select city,count(*) as Total from androidT group by city having count(*)=2;
select city,count(*) as Total from androidT group by city having count(*)=2 order by city desc;

select * from trainees_sample order by t_age ;
select * from trainees_sample order by t_age desc;

select * from androidT where t_name like 'g%';


--sequence
create sequence emp_id start with 1000 increment by 1 ;

create table empTable(id number,empname varchar(20));
drop table empTable;
insert into empTable(id,empname) values(emp_id.nextval,'peter');
insert into empTable(id,empname) values(emp_id.nextval,'alex');
insert into empTable(id,empname) values(emp_id.nextval,'john');

select * from empTable;
