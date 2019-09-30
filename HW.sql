/*Total number of orders every salesperson had.(Orders table)*/
  select count(snum) from orders group by city;
  
/*How many orders where placed on Oct 05 94?*/
  select count(odate) from orders where odate='05-OCT-94';
  
/*On what date there was a lowest amount order was palced?*/
  select odate from orders order by amt limit 1;
  
/*How many orders where taken in total on oct 3 and oct 4th*/
  select count(odate) from orders where odate='03-OCT-94' or odate='04-OCT-94';
  
/*List the details of salesperson according their increasing order commission they receive*/
  select * from salespeople order by comm asc;

/*Get all salespeople who lives in either in Barcelona or in london.*/
  select sname from salespeople where city='Barcelona' or city='London';

/*Minimum order made by every customer (orders table)*/
  select min(count(*)) from orders group by cnum;

/*List the Average order received per  every date and sort them in increasing order*/
  select avg(count(odate)) from orders group by odate asc;

/*Get all the cust  data whose name starts with G*/
  select * from cust where cname like 'G%';

/*Create books table —columns bookid(has to be a sequence starting from 1256,primary key), book_name,book_author
Create lending_table——columns  bookId(seq,foreign key), person_id(Primary Key),date_taken*/
  create sequence s increment by 1 start with 1256;
  create table books(book_id number ,book_name varchar(20),book_author varchar(20),constraint primary key(book_id));

/*Insert some records to both tables
Make sure data integrity is maintained when inserting records*/
  insert into books(book_id,book_name,book_author) values(s.nextval,'BOOKNAME','AUTHOR');

/*Get the minimum rating of customer aacording to every city  (1.city,2.MIn_Rating)*/
  select city, min(rating) as Min_Rating from cust group by city;
