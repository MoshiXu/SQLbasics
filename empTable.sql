
create sequence emp_id start with 1000 increment by 1;
create table empTable(id number,empname varchar(20));
insert into empTable(id,empname) values(emp_id.nextval,'peter');
insert into empTable(id,empname) values(emp_id.nextval,'alex');
insert into empTable(id,empname) values(emp_id.nextval,'John');
                                                
select * from emptable;
