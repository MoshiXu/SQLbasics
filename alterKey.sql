/* To alter primary key
*/
select * from salespeople;
alter table salespeople add primary key (snum);

select * from cust;
alter table cust add primary key (cnum);


/* To alter foreign key
*/
alter table cust 
add foreign key (snum) 
references salespeople(snum);





/*alter table*/
delete from salespeople where snum=1009;
delete from salespeople where snum=1010;

update cust
set city='Rome'
where cnum=2006;
