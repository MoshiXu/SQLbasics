/*1.get the name of the salesperson serving each customer*/
select sname from salespeople inner join cust on snum=cust.snum;

/*2.Produce the names and rating of all customers who have above average orders.*/
select cust.cname cust.rating from (select avg(amt) from orders inner join orders on orders.snum=cust.snum);

/*3.Produce names and cities of all customers with the same rating as Hoffman.*/
select cust.cname, cust.city from cust inner join orders on orders.snum=cust.snum where cust.cname='Hoffman';

/*4.Extract all the orders of Motika.*/
select * from orders inner join salespeople.snum=orders.snum on orders where salespeople.sname='Motika';

/*5.All orders that are greater than the average for Oct 4.*/


/*6.Find name and snum of all salesperson who have more than one customer.*/



/*7.Get the customer name of all orders*/

