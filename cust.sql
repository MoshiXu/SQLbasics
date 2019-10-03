create table cust (cnum int,cname varchar(10),city varchar(10),rating int,snum int);

create table cust (
        cnum number,
        cname varchar(20),
        city varchar(20),
        rating number,
        snum number,
        primary key(cnum),
        foreign key(snum) references salespeople(snum) on delete cascade
);

insert into cust(cnum,cname,city,rating,snum) VALUES (2001,'Hoffman','London',100,1001);
insert into cust(cnum,cname,city,rating,snum) VALUES (2002,'Giovanne','Rome',200,1003);
insert into cust(cnum,cname,city,rating,snum) VALUES (2003,'Liu','San Jose',300,1002);
insert into cust(cnum,cname,city,rating,snum) VALUES (2004,'Grass','Berlin',100,1002);
insert into cust(cnum,cname,city,rating,snum) VALUES (2005,'Clemens','London',300,1007);
insert into cust(cnum,cname,city,rating,snum) VALUES (2006,'Pereira','London',100,1004);

