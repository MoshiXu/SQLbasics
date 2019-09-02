DECLARE 
   message  varchar2(20):= 'Hello, World!'; 
BEGIN 
   dbms_output.put_line(message); 
END; 

select * from student;

declare
s_char varchar(10) not null 'chicago';
sOne_char s_char%type;
begin
dbms_output.put_line(s_char);
end;

declare
s_record student%ROWTYPE;
begin
s_record.studentname:='john';
s_record.studentage:=20;
dbms_output.put_line(s_record.studentname);
dbms_output.put_line(s_record.studentage);
dbms_output.put_line(s_record.studentssn);
end;

declare

begin
for s in 1..4 loop
    dbms_output.put_line(s);
    end loop;
end;

declare
age student.studentage%type;
begin
select studentage into age from student where studentname='Albert'; 
dbms_output.put_line(age);
 exception
 when others then
 dbms_output.put_line('sqlcode' || sqlcode);
 dbms_output.put_line('sqlerror message' || sqlerrm);
end;

Declare
	New_name varchar2(20);
	New_job varchar2(20);
Begin
	Select name,job into new_name,new_job from emp where empid=1234;
	dbms_output_putline(new_name || new_job);
End

CREATE TABLE departments
(dept_id NUMBER NOT NULL PRIMARY KEY,
dept_name VARCHAR2(60));

select * from departments;

INSERT INTO departments (dept_id,dept_name)
                      VALUES(1,'IT');
INSERT INTO departments (dept_id,dept_name)
                      VALUES(2,'Accounting');
COMMIT;

select * from employees;

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
emp_id_exec number:=20;
emp_sal_exec number;
begin
emp_salary(emp_id_exec,emp_sal_exec);
end;

create or replace procedure update_salary(p_emp_id in number,p_emp_sal in out number) as 
random_number number;
begin
update employees set emp_sal=p_emp_sal where emp_id=p_emp_id
returning emp_sal into p_emp_sal;
dbms_output.put_line(p_emp_sal);
exception
when others then
dbms_output.put_line(sqlerrm);
end update_salary;


declare
emp_id_exec number:=50;
emp_sal_exec number:=50000;
begin
update_salary(emp_id_exec,emp_sal_exec);
end;

CREATE OR REPLACE FUNCTION get_dept_id(p_dept_name departments.dept_name%type) RETURN NUMBER AS
    l_dept_id departments.dept_id%TYPE;  
  BEGIN
    SELECT dept_id into l_dept_id
       FROM  departments
      WHERE  dept_name = p_dept_name;
   RETURN l_dept_id;
 EXCEPTION
   WHEN OTHERS THEN
     DBMS_OUTPUT.PUT_LINE(SQLERRM||' '||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
     RAISE;
  END;
 / 
 
 UPDATE employees
  SET  emp_dept_id = get_dept_id('IT')
WHERE EMP_ID = 60; 
 
 SELECT * 
   FROM employeeS
  WHERE emp_dept_id = get_dept_id('IT');

create or replace trigger update_student_trigger
before update on student for each row
begin
 DBMS_OUTPUT.PUT_LINE('student table before update trigger');
end;

create or replace trigger after_update_student_trigger
after update on student for each row
begin
 DBMS_OUTPUT.PUT_LINE('student table after update trigger');
end;

update student set  student_id=10 where student_name='John';

INSERT INTO student (student_id,student_name)
                      VALUES(1,'Tom');
INSERT INTO student (student_id,student_name)
                      VALUES(2,'John');
                     INSERT INTO student (student_id,student_name)
                      VALUES(3,'Albert');
COMMIT;

select * from student;

declare
c_dept_id departments.dept_id%type;
c_dept_name departments.dept_name%type;
cursor c_departments is select dept_id ,dept_name from departments;
begin
open c_departments;
loop
    fetch c_deparments into c_dept_id ,c_dept_name;
    exit when c_deparment%notfound;
    DBMS_OUTPUT.PUT_LINE(c_dept_id||c_dept_name );
end loop;
close c_departments;
end;

savepoint savePointName;

rollback to savePointName;

commit--permanently save a transaction

