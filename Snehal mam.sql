show databases;
create database pdb3;
use pdb3;

create table students(
sid integer,
sname char(30),
age integer,
course char(30));

show tables;
use pdb3;
show tables;
desc students;
insert into students values(1,'Amit',25,'mysql');
select * from students;
insert into students values(2,'Neha',24,'mysql');
insert into students values(3,'Saloni',23,'DA');
insert into students values(4,'Nisha',22,'mysql');

select * from students;

select 5+5 as Result;

select 5=5 as Result;

select 5 != 5 as Result;

-- This is a comment

/* ansgh
vyg
hjk
this is a multi line comment
*/

select 5 + null as Result;
select 5 = null as Result;

show tables;

create table patients(
pid integer,
pname varchar(255),
dob date,
toa datetime);

show tables;

insert into patients values(1,'Harry','2000-01-26','2023-04-04 08;30;00');
insert into patients values(2,'Potter','2000-02-20','2024-01-04 09;30;00');
insert into patients values(3,'Jim','2001-01-02','2023-07-05 10;30;00');

select * from patients;

create table if not exists patients(id integer, name char(30));

-- DDL : Create
create table test(id integer);
desc test;

-- DDL : Drop
drop table test;
show tables;

-- DDL : Rename
rename table students to myclass;

show tables;

-- DDL : Alter
-- Add column
select * from myclass;
alter table myclass add column marks integer default 0;
select * from myclass;

-- Drop column
alter table myclass drop column age;
select * from myclass;

-- (change column name)
alter table myclass change column sid stdid integer;
select * from myclass;

-- (change data type of column)
desc myclass;
alter table myclass modify column sname varchar(30);
desc myclass;

-- (change table name)
alter table myclass rename to students;
show tables;

-- DML : Insert
select * from students;
insert into students values(5,'John',null,50); -- Type 1 insert

select * from students;
insert into students values(6,'Jay',60);

-- type 2 insert
insert into students (stdid,sname,marks) values (6,'Jay',60);
select * from students;

desc students;
insert into students (stdid,sname,course) values (7,'Piyush','Mysql'); 
select * from students; -- instead of null at marks it came 0 because while creating column marks we have given default value 0

-- Type 3 Insert
insert into students values(8,'harry','mysql',70),(9,'potter','DA',80),(10,'mary','Dance',84);
select * from students;

-- DML: Update
update students set sname='Natasha' where stdid=1; -- this command is showing error then use further command to enable the settings

set sql_safe_updates = 0;

update students
set marks= null
where marks= 0;

select * from students;

update students
set course= 'Dance',Marks= 85
where stdid= 5;

select * from students;

update students set course= 'Mysql';
select * from students;

-- DML : DELETE
delete from students where stdid= 2;

select * from students;

delete from students 
where marks= null; -- wrong query 

select * from students;

delete from students 
where marks is null;  -- is null or is not null these to things only works with null , no operator like + _ = doesnt work with null.
select * from students;

delete from students;
select * from students;

insert into students values(1,'Neha','Mysql',70);
insert into students values(1,'Rucha','Mysql',83);
insert into students values(1,'Rushi','Mysql',90);
select * from students;

-- DDL : Truncate
truncate students;
select * from students;

show create table students;

show tables;

-- DQL : Select
select * from myemp;
select * from myemp limit 10;  -- to see 1st 10 records

select * from myemp limit 10 offset 50; -- To see 1st 10 records from 50th row
select * from myemp limit 20 offset 50; -- To see 1st 20 records from 50th row

select * from myemp limit 10 offset 96;  -- Last 10 Records

select emp_id, first_name, last_name, salary from myemp;  -- only column we wanted that came
select emp_id, first_name, last_name, salary from myemp limit 10; -- only column we wanted that came & only 1st 10 rows we wanted

select emp_id, first_name, last_name, salary, salary * 0.2 from myemp limit 10;
 -- we added new column called derived column which will not be inserted in the main data but only visisble for this query
 -- it is 20% bunus in salary

select emp_id, first_name, last_name, salary, salary * 0.2 as Bonus from myemp limit 10;
 -- to change the derived column name
 
 select emp_id, first_name, last_name, salary, salary * 0.2 as Bonus, salary + bonus as total_salary from myemp limit 10;
 -- its showing error because bonus is derived column it is not present in the data
 
 select emp_id, first_name, last_name, salary, salary * 0.2 as Bonus, salary + salary*0.2 as Total_Salary from myemp limit 10;
 -- we wanted the total salary column
 
 select dep_id from myemp limit 10;
 select distinct dep_id from myemp;
 -- we wanted the unique dep ids
 
 select distinct job_id from myemp; 
 
 show tables;
 select* from person;
 select distinct fname,lname from person;
 select distinct fname from person;
 select distinct lname from person;
 
 select * from myemp; -- here dept id is not in ascending or descending order to convrt it use order by keyword
select * from myemp order by DEP_ID; -- dept id is in ascending order
select * from myemp order by DEP_ID desc; -- dept id is in descending order

select * from myemp order by DEP_ID, MGR_ID;

select * from myemp order by DEP_ID, HIRE_DATE; -- to check who is junior and who is senior (junior 1st then senior)
select * from myemp order by DEP_ID, HIRE_DATE desc; -- (senior 1st then junior)

select distinct dep_id from myemp order by dep_id;
select distinct dep_id from myemp order by dep_id desc;

select * from myemp where salary < 10000;  -- for records whose salary is less than 10000
select * from myemp where salary >= 10000;

-- >, <, >=,<= are relational operators

select * from myemp where hire_date < '2000-01-01';  -- for people whos hire date less than 2000
select * from myemp where 
dep_id != 100;

select * from myemp where salary between 10000 and 15000;
select * from myemp where hire_date between '1987-01-01' and '1987-12-31';

-- AND & OR Gates/ Operators
select* from myemp where dep_id=80 and salary > 10000;  -- for emp whose dep id is 80 & salary is > 10000
select* from myemp where dep_id=80 and MGR_Id=100;

-- In operator
select* from myemp where dep_id= 40 or dep_id= 60 or dep_id= 70;
select* from myemp where dep_id in (40, 60, 70); -- insted of writing or operstor so many time use IN Operator

-- Like Operator 
select* from myemp where FIRST_NAME like 'A%';  -- people whose name starting from A
select* from myemp where FIRST_NAME like '%A'; -- people whose name Ending with A
select* from myemp where FIRST_NAME like 'A%A'; -- people whose name starting with A and Ending with A
select* from myemp where FIRST_NAME like '%A%'; -- a is coming in between names

select* from myemp where JOB_ID like 'SA%';
select* from myemp where JOB_ID like '%CLERK';

select* from myemp where FIRST_NAME like 'J%';
select* from myemp where FIRST_NAME like 'J____'; -- 4 Underscores are given bcz we want 5 character names whos nae starts with J
select* from myemp where FIRST_NAME like '% %'; -- for finding the person who has 2 first names

select* from myemp where FIRST_NAME not like 'A%'; -- persons whose name not staring with A

-- Row Level Functions
select * from patients; 
select adddate(dob,interval 5 day) from patients;

select year(dob) from patients;
select year(dob), month(dob), monthname(dob) from patients;
select adddate(dob,interval 5 year) as Result from patients;

-- Group Functions
create database newdb3;
use newdb3;
show tables;

select * from cats;

select avg(weight) from cats;
select avg(weight) as avg_wt from cats;

select round(weight) from cats;  -- row level function

select avg(weight), breed from cats group by breed;
select avg(age), breed from cats group by breed;

-- the HAVING clause added to Sql because the WHERE Key word cannot be used with aggregate functions
select avg(age), breed from cats group by breed where avg(age) >3;
select avg(age), breed from cats group by breed having avg(age) >3; -- here we use having keyword

select sum(weight) from cats;
select min(weight) from cats;
select max(weight) from cats;

select count(*) from cats; -- to find out number of rows

select distinct breed from cats;
select count(distinct breed) from cats;

select round (avg(weight),1), breed from cats group by breed;

select * from myemp;

select dep_id ,avg(salary)from myemp group by dep_id;
select dep_id,mgr_id,avg(salary) from myemp group by dep_id, mgr_id;

/* Joins
Types of Joins
 1. Inner Join
 2.Left
 3.Right
 4.Self
 5.Cross
 6.outer - not used 
 */
 
 select * from movies; -- 3 colums are present
 select * from members; -- 4 columns are present
 
 -- inner join
 -- so in inner join we will get all columns 3 from movies and 4 from members= 7 columns but only common records will be there
 select * from movies inner join members on movieid = id;
 
 -- Left Join
 select * from movies left join members on movieid = id; -- entire left table will come and from right column only common reords will come
 
 -- Right Join
  select * from movies right join members on movieid = id; -- opposite of left join
  
  select * from authors;
  select * from books;
  
  select title, name from authors inner join books on authorid = authorid; -- here it is showing error bcz column name is same
  select title, name from authors inner join books on books.authorid = authors.AuthorId; -- so we have to give the name of respective columns
  
  -- Cross Join : does not requir common columns
  
  select * from meals;
  select * from drinks;
  
  select * from meals cross join drinks;
  select mealname, drinkname, meals.rate + drinks.rate as total_rate from meals cross join drinks;
  select mealname, drinkname, m.rate + d.rate as total_rate from meals as m cross join drinks as d;
  
  -- self join : apply in single table only but here we need 2 columns sharing same values
  select * from myemp;
  select first_name, last_name, mgr_id from myemp limit 20;
  
  select emp.emp_id, emp.first_name, emp.last_name, mgr.first_name as mgr_fname, mgr.last_name as mgr_lname from myemp as emp join myemp as mgr on emp.mgr_id = mgr.emp_id;
  
  -- DATABASE CONSTRAINTS, PRIMARY KEY, FOREIGN KEY, SEQUENCE OBJECT
/*Contraints (rules/ restrictions) : Restrictions that are applied on columns of the table
-- Types of contraints
  -- A. Domain Constraints:
         -1.Unique: cant have duplicate values. eg. sid can have unique entries only.
         -2.Not Null: Values should be there. null values not accepted
         -3.Default:
         -4.Check: Allows you to put some conditions. eg. put age only those people whose age is > 18
   
  -- B. key Contraints:
      - There should be atleast 1 column in the table which can uniquely identify records in the table.
	e.g. sid    sname    age    course
          1      tom      20      DA
          2      tammy    19      MySQL
          3      Merry    21      DA
	-SID IS UNIQUE COLUMN WHOSE VALUES ARE NOT GETTING REPEATED. 
    - e.g. In emp table we have empid
           in patients- pid
           in books - book_id
           in authors - author_id
           
	- Key constraints are implemented using 'Primary Key'.
    - Primary key is used to enforce the constraints that will uniquely identified in record in the table.
    - while creating table, we can make a column as a Primary key.

	*/
    
    
  select * from students;
  desc students;
insert into students values(1,'Tom','MySQL',45);
insert into students values(1,'Tammy','MySQL',45);
drop table students;
 select * from students;
 
 create table students(
 sid integer unique,
 sname varchar(20) not null,
 age integer check (age >18),
 course varchar (20));
 
 -- unique constraint
desc students;
insert into students values(1,'Tom',19,'MySQL');
insert into students values(1,'Tammy',19,'MySQL'); -- because we have given consttraint unique, and we are repeating the sid thats why its showing error
select * from students;
insert into students values(2,'Tammy',19,'MySQL');
insert into students values(null,'john',22,'DA');
insert into students values(null,'jim',21,'MySQL'); -- Because we dont know the null value thats why it accepts null. null is uncomparable
select * from students;

-- Check constraint
insert into students values(3,'jack',17,'MySQL'); -- Because we have given the contraint that age should be greater than 18

-- Null constraint
insert into students values(4,Null,25,'MySQL'); -- Because we have given the contraint that sname should not be null
insert into students (sid,age,course) values(4,25,'MySQL');

alter table students modify sname varchar(20) not null default 'Smith';
insert into students (sid,age,course) values(4,25,'MySQL');
select * from students;

/*Foreign key:
  - Foreign key can only point to a primary key in some other table. it cannot point to other column
  - Table that contains foreign key is called the CHILD TABLE.
  - Table to which foreign key is pointing is called PARENT TABLE.
  - Student Tbale : sid is Primary key, cid is foreign key, so it is a child table.
  - Course Table : id is primary key, so it is a parent table.
  - you can add more than one foreign keys in a table
  
  Student Table (CHILD)                               COURSE TABLE (PARENT)
  
  sid    sname    age   cid                    cid    cname     duration    fees
  1       Tom     20    c10                     c10    mysql      2wk        $100
  2       Tim     25    c10                     c20     DA        6wk        $200
  3       Mary    20    c20                     c30     DS        6month     $500
  
  - you cant put c70  in cid of students as it is not available in course. i.e. parent
  - c70 will be an orphan record as it dont have any parent. 
  - this is called referenial integrity. 
  
  - mysql does not allow 
  1. deletion of parent record
  2. updation of parent record
  
  if we want to delete or update record from parent table then use following keywords:
     1.on delete cascade
     2.on update cascade
     
- while creating , parent table should be created first
-while deleting, child table shoud be dropped first.
  */
  
select * from authors; -- parent table as only primary key is present.
select * from books; -- child table contains primary key and  foreign key

drop table authors; -- cannot drop beacause its a parent table
select * from books;

drop table books; -- succesfully deleted bcz it is  a child table
select* from books;

-- now if we delete authors again it will get deleted succesfully beacuse 1st we have deleted the child table
drop table authors;
select* from authors;

-- create both the tables again

CREATE TABLE Authors(AuthorId INTEGER primary key, 
                                Name VARCHAR(70));

insert into Authors values(1,'J K Rowling');
insert into Authors values(2,'Thomas Hardy');
insert into Authors values(3,'Oscar Wilde');
insert into Authors values(4,'Sidney Sheldon');
insert into Authors values(5,'Alistair MacLean');
insert into Authors values(6,'Jane Austen');
insert into Authors values(7,'Chetan Bhagat');
insert into Authors values(88,'Oscar Wilde');

DESC AUTHORS;

 create table books(bookid integer PRIMARY KEY,
 title varchar (255),
 aid integer,
 FOREIGN KEY(aid) REFERENCES authors(authorid)
 on delete cascade
 on update cascade);
 
 insert into Books values(1,'Harry Potter and the Philosopher\'s Stone',1);
insert into Books values(2,'Harry Potter and the Chamber of Secrets',1);
insert into Books values(3,'Harry Potter and the Half-Blood Prince',1);
insert into Books values(4,'Harry Potter and the Goblet of Fire',1);

insert into Books values(5,'Night Without End',5);
insert into Books values(6,'Fear is the Key',5);
insert into Books values(7,'Where Eagles Dare',5);

insert into Books values(8,'Sense and Sensibility',6);
insert into Books values(9,'Pride and Prejudice',6);
insert into Books values(10,'Emma',6);
insert into Books values(11,'Five Point Someone',7);
insert into Books values(12,'Two States',7);
insert into Books values(13,'Salome',8);
insert into Books values(14,'The Happy Prince',8);

SELECT * FROM BOOKS;


-- day 7
 /*SEQUENCE : AUTO INCREMENT
 - It is a special object in mysql.
 - in oracle we can say 'create sequence <sequence>..', but mysql does not support it.
 - in my sql we have to use "Auto Increment" option.
 - we dont have that much flexibility in sequence in mysql like we have in oracle
 - but stll we have basic functionality in mysql
 - sequence is list of numbers like 0,1,2,3,4....
 - we use sequence when we create primary keys because primary keys are unique and not null, and sequence elements are always unique.
 - Sequence will automatically update values of id (Primary Key) column.
  No need to manually remember last id entered.
 */

create table test(id integer PRIMARY key auto_increment, name varchar(20), age integer);
desc test;
insert into test(name,age) values ('Tom',20);
select * from test;
insert into test(name,age) values ('Tim',22),('Jim',25);
select * from test;

set sql_safe_updates = 0;
delete from test;
select * from test;
insert into test(name,age) values ('Tom',20); -- here the id came from 4
select * from test; -- it remebbers the previous id. even thogh we delete records the id will not get repeated.

-- suppoese we want the id number should again start from 1 then instead of delete use truncate commnad.
truncate test;
select* from test;
insert into test(name,age) values ('Tom',20);
insert into test(name,age) values ('Tim',22),('Jim',25);
select* from test;

-- suppose we want the id start from 100
alter table test auto_increment= 100;
insert into test(name,age) values ('John',23),('Jack',21);
select* from test;

/*-- DCL Commands: 
1.GRANT
2.REVOKE
     
- On server there are multiple databases present like newdb3,pdb3, classicmodels
- someone who loga into pdb3 need not to know about classicmodels or vice versa.
- to control such access to databases, some permissions should be given
- this is task of database administrator (dba)
- DBA maintains server backups security recovry etc.
- DBA give you userid and password after joining the organization
- in the backend he will set the permissions that this userid will be access to which databases.
     
Permissions can given using 'GRANT'
 eg. Grant select pdb3.myemp to hruser;  --with this access to only myemp table is given
     
Permissions can be removed using 'REVOKE'
 eg. Revoke select from hruser on pdb3.myemp;
 
 We have installed server here, created databases, created tables.
 
 Who gave us permission?
 -- we could do that because we loggin into the server as 'ROOT USER'.
 -- Root has all the powers
 
 TCL COMMANDS:
 -TCL :Transaction Control Language
1.commit
2.rollback, (-- Rollback: To undo actions that you have done by mistake.)
3.savepoint
     
     */
select * from students;
insert into students values (6,'Harry',44,'Dance');
select * from students;

-- now suppose we want to delete 6th record
rollback; -- here we are expecting that 6th record will be deleted
select * from students; -- but the 6th record is still available in te table

/*
In server there is a parameter called AUTOCOMMIT=1 (TRUE/FALSE) set to true by default
Whenever yoy do any DML operation ( Insert/update/delete) server internally COMMIT and because of commit, record will be written in persistent
memory. Therefore, we will be unable to execute ROLLBACK here.
Here we have to SET AUTOCOMMIT = 0;

*/

set autocommit = 0;
-- Now again insert a record and execute rollback

insert into students values(9,'cherry',23,'dance');
select * from students;

rollback; -- now we wanted the 9th record to be deleted
select * from students; -- 9th record is deleted succesfully because we have set autocommit= 0

insert into students values(10,'snehal',40,'dance');
select * from students;
commit; -- the record will get set permenantly
rollback;
select * from students; 
-- 10th record is still there even after giving rollback commnad bcz we have given the commit command & if we want to rollback work the again set autocommit=0 (set autocommit = 0;) give this command

set autocommit = 1;

-- start transaction
create table tt (id char);
insert into tt values('a');
insert into tt values('b');
select * from tt;

delete from tt;
select * from tt;

start transaction; -- at backend 'autocommit= 0' will be executed
insert into tt values('a');
insert into tt values('b');
select * from tt;

rollback;
select * from tt;
-- here after start transction we use rollback commands and all the records got deleted
-- but we wantonly specific records to be deleted so we will use SAVEPOINT command

/*
-- SAVEPOINT:
- suppose after START TRANSACTION we have executed 20 queries and i want to rollback lasr 2 queries.
- if ROLLBACK is executed, all 20 queries will be rollback.
- we should have control that we could rollback only specific commnds. 
- for that we have SAVEPOIN command
- Consider it as a Marker Point
- Suppose following  is a sequence of transaction:
Insert a;
Insert b;
-Savepoint sb; ( any meaningful name can be given to savepoint)
Insert c;
Insert d;
-Savepoint sd;
Insert E;
Insert F;
--Rollback; (if only ROLLBACK : All commands upto 2 will be rolled back, AUTOCOMMIT = ON automatically)
-- Rollback to sd ; (only 8,9 (e,f)  will be rolleed back . here autocommit = off)
-- Rollback to sb ; ( only c,d,e,f  will be rolled back. Here AUTOCOMMIT= OFF)

If you say only ROLLBACK or COMMIT, then only AOTOCOMMIT = ON

IMP : ALL DDL COMMANDS WILL AUTOMATICALLY COMMIT. YOU CANT CONTROL IT
Eg.
1. Start Transaction
2. Update
*/

START transaction; -- AUNTOMATICALLY AUTOCOMIT= 0
insert into tt values('a');
insert into tt values('b');
savepoint sb;
insert into tt values('c');
insert into tt values('d');
savepoint sd;
insert into tt values('e');
insert into tt values('f');
select * from tt;
rollback to sd; -- e,f will get deleted
select * from tt;
commit; -- automatically auntocommit = 1
select * from tt;
rollback;
select * from tt;

/*-- DATABASE OBJECT : VIEWS (virtual table)
- View is a virtual table . it doesnt take ant space in the memory.
suppose myemp table has 15 columns and you want randomly any 3 columns from it, you can create a view having only those 3 columns.
so view is called 'Window on Data'.
Then you dont need to write query by selecting those 3 column names.
Instead you can write:  select * from viewname;*/


show tables;
select * from myemp limit 10;
create view myview as select emp_id,first_name, last_name,job_id, salary from myemp;
select * from myview;
select * from myview limit 10;

-- Day 8 ( complec view)

select * from movies;
select * from members;

select mv.title, mm.first_name, mm.last_name
from movies as mv left join members as mm
on mv.id = mm.movieid;

-- formatting of output( suppose we want to change those null values to --)
-- then we have to use ifnull function

select mv.title,ifnull(mm.first_name,'----'), ifnull(mm.last_name,'----')
from movies as mv left join members as mm
on mv.id = mm.movieid;

-- now if we want to make view of above query

create view rentals as
select mv.title,
ifnull(mm.first_name,'----') as fname,
ifnull(mm.last_name,'----') as lname
from movies as mv left join members as mm
on mv.id = mm.movieid;

select * from rentals;

-- by using view query becomes compact and clean

-- simple view
select* from authors;
select * from authors where authorid <15;

create view aview as select * from authors where authorid <15;
select * from aview;

-- through view we can insert or delete the record from our original table also.
insert into aview values(21,'john hamm');
select * from aview; -- record did not got inserted into the view bcs view is a virtual table and also we have given the condition of <15
select * from authors; -- but record got inserted in table

drop view aview;

-- so we want that if condition is given eg. authorid<15 then no values <15 should get added in main table also 
-- for that we will use key word WITH CHECK OPTION

create view aview as select * from authors where authorid <15 With check option;
insert into aview values(22,'john hamm'); -- cant add because it is not less than 15
insert into aview values(14,'tom cruize'); -- added
select * from authors;

insert into aview values(13,'john hamm');
select * from authors;
delete from authors where AuthorId = 13;
select * from authors;    -- we can delete from view also

/*-- INDEXES
 -- Indexes takes space in the memory
 5 different type of indexes: 
 based on datatype:
   a. unique index
   b. special index
   c. full text index
base on structure:
a. B-tree (balanced tree) index
b. hash index

-- a. B-tree (balanced tree) index
- it uses the concept of binary search technique.

--b. hash index
- it uses the hash function
- hash function points to the location where you can store record
e.g suppose hash function is ( add 1000 to x)
	if x= 20 then hash (x) = 1020
	if x= 35 then hash (x) = 1035
this hashed value 1020 or 1035 will be used as memory address
QUERY: insert into emp (35,'Jon',40),  this record will be stored at 1035 memory location
QUERY:  select * from myemp where eid=35

-- but in sql we use b tree only not hash index

-- special index
-special data datatype is used to store geometric shapes ( points, rectacgles ,triangles)

*/

show databases;
select count(*) from myemp;
select * from myemp limit 10; -- just to check time

desc myemp;

show indexes from myemp; -- to check the index present in the table
-- ( no index present in myemp)
create index uidx on myemp(salary); -- ( uidx is name of index)
show indexes from myemp;
drop index uidx on myemp;
show indexes from myemp;

select * from students;
desc students;
show indexes from students;
create unique index stu on students(sname, age);
show indexes from students;
drop index stu on students;
show indexes from students;

-- STORE PROCEDURE
/* 2 types of variables:
  PARAMETER : used to pass values to stored procedures, functions
  LOCAL VARIABLES : it is the one that you declare within BEGIN and END
  - it is available in that block only
  - when procedure ends, variable also dies
  - Local variables need to be declared
  eg. "Declare x integer default 0;"

Q. why do we need local variables
--- To store intermediate results
eg. def avg (X1 X2 X3):
     Total = x1 + x2+ x3
     Average = total / 3
Local Variables are : total, avg

Main reason of local variable is you can not take out value of a column outside the selected command

- select authorid as author; -- this line is like print () statement only
- select authorid from books where bookid = authorid; -- this is a actual mysql select command
- when you take authoeid out from actual query , mysql does not understand what authorid is
- when authoeid is part of select command, mysql understands that it is coming from books table.
and authoris is a column in books table
- but when you take out from select command and put it in print command, mysql does not understand it.
Therefore, any column cannot be taken out of the select commandnew_procedurenew_procedure


*/
 
 call new_procedure();
 call Hello(); -- because we have changed the name of the procedure as hello
 
 select * from books;
 call proc1();
 
 select * from books where bookid=5; -- just a example that what we have written in store procedure
 call proc1_1();
 
  call proc1_1(); -- bcz we have applied the changes that bookid= 6
  
  -- in stored procedure the parameter is passed inside the bracket
  
  call proc2(10);
  call proc2(2);
  -- bca here we have given the parameter thats why we dont have to go to procedure and create changes we simply can give the parameter into the bracket and it will show the result.
  
  call proc3(); -- here we have define x as 10 thats the output is coming 10
  
  call myproc(14);
  call myproc(14);
  
  -- proc_if
  call proc_if(-120);
  call proc_if(0);
  
  call proc_if1(0);
call proc_if1(-2);
call proc_if1(2);

-- grades
call grades(90);
call grades(78);
call grades(59);
call grades(39);

-- simple loop
call proc_simpleloop();
call proc_simpleloop(5);
call proc_simpleloop(3);

call proc_simpleloop(5); -- here hello is starting from 0 bcz we have given default value o
call proc_simpleloop(5); -- even though we are givig default as 1 its not working 

call proc_simpleloop(5); -- here we just have made some changes that before select we have given 'set' statement

-- REPEAT LOOP
call Proc_Repeat(5);

-- WHILE LOOP
CALL proc_while(5);

/* EXCEPTIONS

- Runtime errors are exceptions.
- if there is something wrong in the syntax then it is called error.
- Exception ocuur if while executing the code, something went wrong.
- eg. loop is there x=10 y=5
you keep on dividing x by y and keep by decreasing y by 1
Result= x/y
y=y-1;
-There will be a stage when y = 0, here you will get divide by 0 exception. here code was not wrong.
this is a runtime erroe i.e. Exeption.
- Exeptions are raised when you execute the code.
- There should be a way that programe itself should understand that something that has gone wrong.
This facility has called exeption handling*/

select * from abcdefg;
-- we have to write the exeption in store procedure
-- so click on create store procedure
call except1();
call except1();

select * from authors;
select title from authors;

call except2();
call except2();

-- CURSOR
/*
 we have procedure called grades() which gives you grade of students
 if you pass marks of students as parameter (or input).
What is i want to see grades of all 9 students?
-> we have to call grades() for 9 times by passing marks of each students every time

How to see grades of all stidents by calling procedure only once?
-> for this we have a CURSOR variable

- Cursors can hold result of any select command i.e. you can put all records in cursor variable
- cursors are iterable i.e. you can take 1 record at a time outside the data strucure
e.g. to print grades of 9 students we will create a cursor variable which will hold 9 records
      1 Tim 45
      2 Tom 57
      .
      .
      9 John 60  - this is a cursor variable having 9 records
Now we will iterate over the cursor variable one by one
i.e. take first record , compare marks with logic & print grades. Then repeat same for all records

- To declare a normal variable: DECLARE X INTEGER DEFAULT 0;
- To declare Cursor variable : DECLRE X CURSOR FOR Select * from authors;

STEPS FOR CREATING CURSORS:
1. Declare the cursor variable

 ->  " Declare mycur cursor for select * from authors;"
   
   here 1st select query will be executed
   then, result of select query will go in cursor variable mycur
   
2. Open the Cursor

  -> " Open mycur;"Grades
   
3. Fetch the Record
    
   -> close loop (i.e. leave myloop)
    as we want to fetch multiple records we have to put fetch cmd in the loop.
	so one by one all 9 records will be fetched, after 9th record 'Record not found' exception will be raised.
    when exeption is raised we will come out of loop by saying 'leave myloop;'
    
4. Close the cursor

   -> "Close mycur;"

*/

create table marks(sid int PRIMARY KEY, sname varchar(30), mark integer);
insert into marks values (1,'Tom',45),(2,'Tim',87),(3,'Sachin',56),(4,'john',76),(5,'harry',22),(6,'potter',30);
select * from marks;

-- for coursor we have create store procedure

call print_grades;
call print_grades; -- ( after creating cursor the error is not coming)

call print_grades;

use pdb3;
select * from products limit 10;
select * from orders;

call place_order_cursor;
select * from orders;

/* FUNCTIONS & TRIGGERS
-- Procedures are the complex codes as we can add loops, exception handling,select from multiple tables, joins in procedures.
but functions are made to be sweet and short.
 - function should return a value.
 - it should return a single values
 eg. year() fuction (redymade function) is applied on all rows of myemp table.
it extrects only year from date.
"select hire_date, year(hire_date) from myemp limit 10;"

*/

SELECT * FROM MYEMP LIMIT 10;
select hire_date, year(hire_date) from myemp limit 10;

/*
- user defined functions are created in the same way as procedures are created.
- let us write the expirience() function.
How to calculate experience given sid?
- For given eid, take hire date.
- From that extract year
- Take today's date and extract year from today's date
-  Find difference of both dates [year (now()) swar (hire date)
- You will get experience
*/

-- now here we want to calculate the expirience of the employee, so we have created the function 'expirience'
select Expirience(100) as exp;
select Expirience(109) as exp;

-- after creating the function, while executing it you may get error.
-- so execute following code

set global log_bin_trust_function_creators=1;
select Expirience(100) as exp;
select Expirience(109) as exp;

select emp_id, first_name, last_name, hire_date, expirience(emp_id) as exp from myemp limit 10;

select emp_id, first_name, last_name, hire_date, expirience(emp_id) as exp from myemp where expirience(emp_id)<10;
-- people whoe exp is less than 10 years

-- **************************************************************************************************************************************************************************
 /*
 DIFFERENCE BETWEEN STORED PROCEDURE AND FUNCTIONS
 
        STORED PROCEDURE                                       FUNCTION
1. How to call - call myproc()                           1. Call it as a part of command.It is not called separately
   if requred, pass parameter name in bracket                  select....,expirience(eid)...
2. you can write big code.                               2. you have to keep short and to the point code.
*/
-- *****************************************************************************************************************************************************************************
/*-- TRIGGERS
Unlike stored procedure and functions, we dont explicitly call trigger.
- Triggers are fired in response to events.
- events can be any DML commands (Insert, Update, Delete)
- whenever insert command is executed , the trigger associated with it is fired
- when we say that any DML command is executed the trigger associated with it is gets executed at same time
- it may first do insert operation & the trigger code gets executed or vice-versa.
- so depending on this we have 2 ype of triggers
1. Befire Trigger
2. After Trigger

 What all triggers are possible on a table?
 1. Before insert trigger
 2. After insert trigger
 3. Before Update trigger
 4. After Update trigger
 5. Before Delete trigger
 6. After Delete trigger
 ****************************************************************************************************************************************************************************
 2 types of triggers are available :
 - Row level trigger : When we are executing any DML Query, that command can affect multiple rpws at a time depending upon WHERE clause
 
 Eg. "update books where course is null;"
 
 suppose in books table there are 4 records where course is null
 IMP: Row level trigger will be applied once for each row.
 - statement level trigger: will be executed only once irrespective of total no. of rows affected
 
    at the moment mysql does not support statement level trigger
    
- Before Trigger values are accessed using 'old' keyword
- After Trigger values are accessed using 'new' keyword

eg.
               Bookid      Title                 Aid            Sales
	Before       5         NightWithoutEnd        5              3: old values
    After        5         NightWithoutEnd        5              5: new values
*******************************************************************************************************************************************************************************
*/

select * from books;

select * from book_sales;
desc book_sales;

alter table books add column sales integer default 0;
select * from book_sales;

-- now we have created the trigger 
update books set sales = sales + 3 where bookid = 6;
select * from books;
select * from book_sales;

update books set sales = sales + 5 where bookid = 6;
select * from books;
select * from book_sales;


/*-- WINDOW FUNCTIONS

- It is an extension of Group Functions
- In group we have seen 6 aggregate functions: sum(), min(), max(), count(), avg(), std()
- Row Level Function : will give one output for each row
- Group Function : will take a set of rows/ records and give you one output for each group
eg. of group function: avg()
		"select dep_id, avg(salary) from myemp group by dep_id;"
Restrictions of group by:
  you can select only those columns which are part of your group by command 
  i.e. only dep_id column is allowed in select command.
 other than that column we cant use any other columns in select command.
*/
select dep_id, avg(salary) from myemp group by dep_id;
/*
eg. If Tom gets Rs.1000 more than average salary of his department
i.e. department: 90 avg salary of 90 is : Rs. 19333
Tom gets : 20333
Tim gets : 19000 i.e. 333 less than avg salary of department.

How to calculate this?
This is where window functions come in picture.
In window we can do grouping/ ordering.

- when you write a window function , you can think of it like
"you are selecting data from two different sources
i.e. one part selecting from Table and other part from window
In window you can do Grouping of Records, Ordering of Records

eg. I want output og following format:
emp_id   emp_name   salary   dep_id,  avg(sal) difference

1st 4 columns selected from table, avg() grom window
as in window we can do groping/ordering.

dep_id     avg(sal)
 90          19333
 -            -
 -            -
 -            -
 110         10150
 
 Let us see how to write window function
 
 select eid, ename,depid,salary,
 avg(salary) OVER(PARTITION BY depid) as avg_salary
 from myemp;
 
 In this command 1st 4 columns are selected from table
 avg(salary) selected from window
 
 'partition by' is similar to 'group by'
*/

select * from myemp limit 10;

select emp_id, first_name, last_name, dep_id, salary,  -- from table
avg(salary) over (partition by dep_id) as avg_salary    -- window command
from myemp limit 10;

select first_name, last_name, salary, salary*0.2 as bonus from myemp limit 10;

/* Now we want difference column also as below
eid    ename    sal    depid    avg(sal)    diff
1       Tom     20333   90       19333      1000
2       Tim     19000   90       19333      -333

Before that lets have an idea of 'CTE' Concept.
-- CTE: Common Table Expression
- CTE tells that instead of selecting from table, you select from another select command
-eg. A)
     "select * from (select first_name, last_name, salary, salary*0.2 as bonus from myemp) as cte 
     where cte.bonus>3000;"
     
we can use any other name instead of cte.
In this query 1st internal query will be executed and its output will be stored in cte.

eg.B)
with cte as (select first_name, last_name, salary, salary*0.2 as bonus from myemp limit 10)
select * from cte
where cte.bonus > 3000;
*/

with cte as (select first_name, last_name, salary, salary*0.2 as bonus from myemp limit 10)
select * from cte
where cte.bonus > 3000;

WITH CTE AS (select emp_id, first_name, last_name, dep_id, salary,  
avg(salary) over (partition by dep_id) as avg_salary    
from myemp limit 20)
Select cte.emp_id, cte.first_name, cte.salary, cte.avg_salary, cte.salary - cte.avg_salary as diefference from cte; 

WITH CTE AS (select emp_id, first_name, last_name, dep_id, salary,  
avg(salary) over (partition by dep_id) as avg_salary    
from myemp)
Select cte.emp_id, cte.first_name, cte.salary, cte.avg_salary, cte.salary - cte.avg_salary as diefference from cte; 
-- here we have removed the limit only

-- Q. Find who is getting max salary from each dpt
WITH CTE AS (select emp_id, first_name, last_name, dep_id, salary, 
max(salary) over (partition by dep_id) as max_salary
from myemp)
select * from cte 
where salary = max_salary;

use newdb3;
select * from cats;

-- Q. Find out the cats who have below average weight for each breed
with cte as 
(select*, avg(weight) over ( partition by breed) as avg_weight from cats)
select * from cte where weight < avg_weight;

select*, avg(weight) over ( partition by breed) as avg_weight from cats;

-- now we want the round fig of avg weight
with cte as 
(select*, avg(weight) over ( partition by breed) as avg_weight from cats)
select name, breed,weight, age, round(avg_weight,2) from cte where weight < avg_weight;

with cte as 
(select*, avg(weight) over ( partition by breed) as avg_weight from cats)
select name, breed,weight, age, round(avg_weight,2) as avg_wt from cte where weight < avg_weight;

/*-- other functions that are available we can use in windows function along with the aggregation functions are:
- RANK()
- DENSE_RANK()
- PERCENT RANK()
- LEAD()
- LAG ()
- ROW NUMBER()
*/

select * from marks;
select *, rank() over(order by mark desc) as rnk from marks;

insert into marks values (7,'jack',56);
insert into marks values (8,'gill',56);
insert into marks values (9,'lara',59);
select * from marks;
select *, rank() over(order by mark desc) as rnk from marks; -- here the repetative ranks are coming but it is taking the interval

select *, dense_rank() over(order by mark desc) as rnk from marks; -- here the repetative ranks coming but in proper order

-- Q. find out the employees who get the highest salary in the company, use myemp table
select * from myemp;
select *, dense_rank() over(order by salary desc) as rnk from myemp;

-- Q. find out the employees who get the 3rd highest salary in the company, use myemp table
with cte as(select *, dense_rank() over(order by salary desc) as rnk from myemp)
select emp_id, first_name,last_name,salary,rnk from cte
where rnk = 3;

-- Q. FIND 2ND EMPLOYEE WHO JOINED THE COMPANY . EMPID,FNAME, LNAME,HIREDATE, RANK
with cte as(select *, dense_rank() over(order by hire_date) as rnk from myemp)
select emp_id, first_name,last_name,hire_date,rnk from cte
where rnk = 2;

-- Q. find out the employees who 1st joined in each dept in the company from myemp table
select *, dense_rank() over(partition by dep_id order by hire_date) as rnk from myemp limit 30;

with cte as (select *, dense_rank() over(partition by dep_id order by hire_date) as rnk from myemp)
select emp_id, first_name,last_name, dep_id,hire_date from cte where rnk=1;

select * from sales;

-- q. arrange emp as per their sale in every year
select *, dense_rank() over( partition by fiscal_year order by sale desc) as rnk from sales;

use newdb3;
select * from marks;

select *, percent_rank() over(order by mark) as rnk from marks;
select *, row_number() over(order by mark) as rnk from marks; -- row number function gives number to the record (eg. index)

/* Lag : it is widely used when you are calculating profits and all
eg. we have the stock price table. here suppose we are collwcting stock price on periodic basis
  TIME         STOCKPRICE      GAIN/LOSS           LAG(1) i.e. previous price
  jan 2000        150             --                --
  feb 2000        160             10 (160-150=10)    150
  mar 2000        140            -20 (140-160= -20)  160
  ..
  dec 2000     
  
Here you can see you go from one month to another month. how much % gain or loss is there
To calculate gain/loss we need previous month's data
Here, we can use lag() function
lag(1) -> lag of 1 period (month)
lag(2) -> lag of 2 months

** LEAD()
TIME         STOCKPRICE        LEAD(1) i.e. next price
Jan 2000        150              160
feb 2000        160              148
*/

select * from trains;
select *, lead(time,1) over(partition by train_id order by time) as next_station_time from trains;
select *, lead(time,2) over(partition by train_id order by time) as next_station_time from trains;

select *, lag(time,1) over(partition by train_id order by time) as previous_station_time from trains;
select *, lag(time,2) over(partition by train_id order by time) as previous_station_time from trains;

-- sub time
with cte as (select *, lead(time,1) over(partition by train_id order by time) as next_station_time from trains) select *, subtime(next_station_time, time) as journey_time from cte;

select * from students_d;

-- Q. find which students were present for 3 consecutive days?
select *, lead(attendance, 1) over ( partition by student_id order by date_id) as day2,
lead(attendance, 2) over ( partition by student_id order by date_id) as day3 from students_d;

select *, lead(attendance, 1) over ( partition by student_id order by date_id) as day2,
lead(attendance, 2) over ( partition by student_id order by date_id) as day3 from students_d;

with cte as (select *, lead(attendance, 1) over ( partition by student_id order by date_id) as day2,
lead(attendance, 2) over ( partition by student_id order by date_id) as day3 from students_d)
select * from cte where attendance = 'p' and day2 = 'p' and day3 = 'p';

with cte as (select *, lead(attendance, 1) over ( partition by student_id order by date_id) as day2,
lead(attendance, 2) over ( partition by student_id order by date_id) as day3 from students_d)
select distinct student_id from cte where attendance = 'p' and day2 = 'p' and day3 = 'p';

/* SUBQUERY
- it is the query within the query. Its execution is slower than normal query so avoid using subquery.
- 3 types of subqueries :
  1. Single Valued Subquery: it returns the single value as output
  2. Multivalued Subquery: it returns the multiple values as output
  3. Correlated Subquery: In above 2 types we can separately execute inner or subquey and can get result
                           but in case of Correlated Subquery, the Subquery/ inner query cannot be executed separately
                           It depends on some value from main query 
                           eg. select * from myemp e where salary>       -- this is main query
                           (select avg(salary) from myemp where dep_id = e.dep_id);    -- this is subquery
				when we say that select * from myemp e, it takes te 1st record,
                then it checks the dep_id = e.dep_id
                for 1st record e.dep_id=10
                then it will take average of all salaries of dep_id=10 only
*/

USE PDB3;
 -- single valued subquery
select * from myemp where salary = (select max(salary) from myemp); -- single value subquery

select max(salary) from myemp; -- this is inner query we have mentioned above, inner query can be executed separately as well
select * from myemp where salary = 24000; -- this is outer query we have mentioned above, outer query can be executed separately as well

-- multi value subquery
select * from employees;
select * from offices;

select officecode from offices where country = 'USA';
select * from employees where officecode in(select officecode from offices where country = 'USA');

-- we can use inner join also
select emp.firstname, emp. Lastname, emp.officecode, off.country from employees as emp inner join offices as off on emp.officecode = off.officecode and off.country = 'USA';

-- Q. find out employees who earns above average salary. refer my emp table
select avg(salary) from myemp;
select * from myemp where salary > (select avg(salary) from myemp);

-- CORRELATED SUBQERY
-- Here subquery and inner query cannot be executed separately
-- it depends on some value ftom main / outer query

-- Q. find people who get salary above average than their own department (refer myemp table)
select * from myemp e where salary > (select avg(salary) from myemp where dep_id = e.dep_id); -- e is pointing to the 1st record

-- explaination row 1775 photo


/* NORMALIZATION
-- Instead of dumping all the data in one table we make ma=ultiple tables that are connected with common column called normalization.

Students Table
sid          sname          age          course        duration          fees         dept        faculty
1                                         MySql          3wk              10k          CS         Mr. XYZ
2                                         -"-             -"-             -"-         -"-             -"-  
--                                         -"-            -"-             -"-         -"-             -"-  
--                                         -"-            -"-             -"-         -"-             -"-  
100                                        -"-            -"-             -"-         -"-             -"-  

Last 5 column values are called Redudant data
To avoid this repetition we can make separate tables
Student: sid   sname  age  course_id   depid
Department: depid  dname  location......

- How do you come up with such type of splitting that is what NORMALIZATION tells you.

- There are different levels of Normalizations based on which certain conditions have to be satiesfied

- So, we should maintain Data Integrity and avoid Data Redundacy

- Normalization is available upto 6th normal form
- But too much normalization is also not good
- If you split data in too many tables and if you write a songle query,
  you will have to connect those many tables to get the data
- Usually people start with 1NF and reach upto 3NF

1NF: FIRST NORMAL FORM
 - It says every cell should have only one value inside it
 - Composite Primary Key:
   For Example: the combination of house number and street might qualify as a composite key,
   If so, then when someone searches using both the house number and the street,
   they should only get one single record returned.alter
   
2NF: SECOND NORMAL FORM
  - It says that all non-primary attributes should be fully dependent on primary key
  - eid      ename     job_code      job      state_code      home_state
			 NonPri                 NonPri     NonPri           NonPri
             
 - Composite Primary Key: (Eid + Job_code) -> Primary Key
 - Non Primary Attributes: ename, job, state_code, home_state
 - Those 4 non primary atrributes can be identified if you only have eid
 - This should not be the case
 - Non primary attributes should be identified by combination of both eid & job_code
   i.e. they should be tatally dependent on composite primary key
- Then this table is not in 2NF
- If we divide our above table in 3 parts
- 1) eid    job_code             2) eid        ename      state_code     home_state               3)  job_code       job
     PKey    NonPri                  PKey        NP          NP             NP                           PKey         NP
     
- In all 3 tables above, non primary attributes are dependent on primary key.
- So these tables are in 2NF

3NF: THIRD NORMAL FORM
- It says that there should not be any dependency among non primary atrributes
- If it is so, it is called Transitive Partial Dependency
- When a table is in 3NF, it eliminates Transitive Partial Dependency
- eg.  Eid     ename      state_code    home_code
	   PK      NP           NP            NP
- Here, home_state is deoendent on state_code
- Both are non primary attributes 
- Therefore tables is not in 3NF
- So, split the tables as follows:
1) Eid      ename      state_code                     2) state_code          home_state
   PK        NP          NP                                 PK                  NP
   
- Now both tables are in 3NF
- This is applicable when you are designing any application which is not job of a Data Analyst

/*

