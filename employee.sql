select * from salespeople;

select * from employee;

drop table employee;


create table employee(
  ID int,
  name varchar(10),
  age int,
  salary int,
  balance int
);
  
  
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255) 
);  

CREATE TABLE USERD 
   (	ID NUMBER, 
	FIRST_NAME VARCHAR2(20 BYTE), 
	LAST_NAME VARCHAR2(20 BYTE), 
	EMAIL VARCHAR2(20 BYTE), 
	PASSWORD VARCHAR2(20 BYTE)
   )