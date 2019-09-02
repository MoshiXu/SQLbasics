

select * from cust;
select * from salespeople;
select * from orders;

--get all records whose rating is greater than 100

select * from cust where rating=100 or rating=200;

select * from cust where rating=100 and city='London';

select * from cust where rating not in(100,200);

select city from cust group by city;

select avg(amt) from orders;

select count(*) from orders;



select distinct city from cust;


select rowid from orders;

delete from orders where rownum 1;
delete from orders where rowid='ABLUn0AAPAAAAKvAAA';

select * from cust where city not in ('London');

select * from cust where not city='London';

select * from cust where cnum  between 2002 and 2005;

select * from cust where cnum not between 2002 and 2005;

select * from salespeople where snum is not null;


select * from cust order by cname desc;

select * from cust order by cname desc;

select * from orders where amt=(select min(amt) from orders);

--get the miimum rating of city from cust table and group acc to city
select min(rating) as MIN_Rating ,city from cust group by city order by city;
select min(rating) as MIN_Rating ,city from cust group by city;
select min(rating) as MIN_Rating ,city from cust group by city having min(rating)>100;
select min(rating) as MIN_Rating ,city from cust group by city having min(rating)>100 order by city desc;

/*Total number of orders every salesperson had.(Orders table)

How many orders where placed on Oct 05 94?

On what date there was a lowest amount order was palced?

How many orders where taken in total on oct 3 and oct 4th

List the details of salesperson according their increasing order commission they receive

Get all salespeople who lives in either in Barcelona or in london.*/