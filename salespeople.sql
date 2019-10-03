create table salespeople(snum number(10),sname varchar(20),city varchar(20),comm number(5,3));
create table salespeople (
        snum number,
        sname varchar(20),
        city varchar(20),
        comm decimal(3,2),
        primary key(snum)
);
                                                                                        
drop table salespeople;

select * from salespeople;

insert into salespeople(snum,sname,city,comm) values(10001,'Peel','London',.12);
insert into salespeople(snum,sname,city,comm) values(1002,'Serres','San Jose',.13);
insert into salespeople(snum,sname,city,comm) values(1003,'Motika','London',.11);
insert into salespeople(snum,sname,city,comm) values(1004,'Rafkin','Barcelona',.15);
insert into salespeople(snum,sname,city,comm) values(1005,'Axelrod','New York',.1);




