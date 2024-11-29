#create a database named company
create database Company1;
use Company1;

#create a table named Employees/
create table Employees (
id int primary key,
name varchar(100),
position varchar(100),
salary decimal(10,2),
date_of_joining date);

#insert the date in the table/
insert into Employees (id,name,position,salary,date_of_joining) values
(1,"John Doe","Manager",55000.00,"2020-01-15"),
(2, "Jane Smith","Developer",48000.00,"2019-07-10"),
(3,"Alice Johnson","Designer",45000.00,"2021-03-22"),
(4,"Bob Brown","Developer",50000.00,"2018-11-01");

#Write a Query to retrieve all employees who are developers/
select * from Employees where position="Developer";

set sql_safe_updates=0;

#Write a query to update the salary of Alice Johnson to 46000.00/
update Employees 
set salary=46000.00 where id = 3;

#Write a query to delete the employee record for Bob Brown/
delete from Employees where name="Bob Brown";

#Write a query to find the employees who have a salary greater than 48000/
select * from Employees where salary>48000;

#Write a query to add a new column email to the employees table/
alter table Employees add Email varchar(50);

#Write a query to update the email for John Doe to john.doe@company.com/
update Employees 
set Email="john.doe@company.com" where name = "John Doe";

#Write a query to retrieve only the name and salary of all employees/
select name , salary from Employees;

#Write a query to count the number of employees who joined after January 1,2020/


#Write a query to order the employees by salary in descending order/
select * from Employees order by salary desc;

#Write a query to drop the email column from the employees table/
alter table Employees
Drop column Email;

#Write a query to find the employees with highest salary/
select max(salary) from Employees;