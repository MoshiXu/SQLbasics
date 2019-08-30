CREATE TABLE departments
(dept_id NUMBER NOT NULL PRIMARY KEY,
dept_name VARCHAR2(60));




INSERT INTO departments (dept_id,dept_name)
                      VALUES(1,'IT');
INSERT INTO departments (dept_id,dept_name)
                      VALUES(2,'Accounting');
COMMIT;

select * from departments;


CREATE TABLE employees
(emp_id NUMBER NOT NULL PRIMARY KEY,
emp_name VARCHAR2(60),
emp_dept_id  NUMBER ,
emp_loc VARCHAR2(60),
emp_sal  NUMBER,
emp_status VARCHAR2(1),
CONSTRAINT emp_dept_fk FOREIGN KEY(emp_dept_id) 
REFERENCES departments(dept_id));


insert into employees(emp_id,emp_name,emp_dept_id,emp_loc,emp_sal,emp_status) VALUES(10,'Tom',1,'CA',50000,'A');
insert into employees(emp_id,emp_name,emp_dept_id,emp_loc,emp_sal,emp_status) VALUES(20,'John',1,'CA',40000,'A');
insert into employees(emp_id,emp_name,emp_dept_id,emp_loc,emp_sal,emp_status) VALUES(50,'Tim',2,'WA',40000,'A');
insert into employees(emp_id,emp_name,emp_dept_id,emp_loc,emp_sal,emp_status) VALUES(60,'Jack',2,'WA',70000,'A');
COMMIT;


select * from employees;


create or replace procedure emp_salary(p_emp_id in number,p_emp_sal out number) as 
random_number number;
begin
select emp_sal into p_emp_sal from employees where emp_id=p_emp_id;
dbms_output.put_line(p_emp_sal);
exception
when others then
dbms_output.put_line(sqlerrm);
end emp_salary;

declare
emp_id_exec number:=50;
emp_sal_exec number:=5000;
begin
emp_salary(emp_id_exec,emp_sal_exec);
end;

DECLARE 
   message  varchar2(20):= 'Hello, World!'; 
BEGIN 
   dbms_output.put_line(message); 
END; 
/ 


create or replace trigger update_dept_trigger
before update on departments
begin
DBMS_OUTPUT.PUT_LINE('dept table before update trigger');
end;

update departments set dept_name='hr' where dept_id=2;

create or replace trigger update_student_trigger
before update on student for each row
begin
DBMS_OUTPUT.PUT_LINE('student table before update trigger');
end;

create or replace trigger after_update_student_trigger
after update on student for each row
begin
DBMS_OUTPUT.PUT_LINE('student table after trigger');
end;

update student set student_id=10 where student_name='John';



NSERT INTO student (student_id,student_name)
                      VALUES(1,'Tom');
INSERT INTO student (student_id,student_name)
                      VALUES(2,'John');
                     INSERT INTO student (student_id,student_name)
                      VALUES(3,'Albert');
COMMIT;

select * from student;



--cursors

declare
c_dept_id departments.dept_id%type;
c_dept_name departments.dept_name%type;

begin
select dept_id,dept_name into c_dept_id,c_dept_name from departments where dept_id=198;

if sql%found then
DBMS_OUTPUT.PUT_LINE(sql%rowcount);
end if;
exception
when others then
DBMS_OUTPUT.PUT_LINE(sqlerrm);
end;


declare
c_dept_id departments.dept_id%type;
c_dept_name departments.dept_name%type;
cursor c_departments is select dept_id,dept_name from department;
begin
open c_departments;
loop
    fetch c_deparments into c_dept_id ,c_dept_name;
    exit when c_deparment%notfound;
    DBMS_OUTPUT.PUT_LINE(c_dept_id||c_dept_name );
end loop;
close c_departments;
end;

if sql%found then
DBMS_OUTPUT.PUT_LINE(sql%rowcount);
end if;
exception
when others then
DBMS_OUTPUT.PUT_LINE(sqlerrm);
end;


savepoint student_One;

delete * from student where student_id=5;

rollback to student_One;

commit;





