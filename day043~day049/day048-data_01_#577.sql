/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/employee-bonus/
 创建者：Cicero
 创建日期：2021-10-22
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists employee;
drop table if exists bonus;

Create table If Not Exists Employee (
    EmpId int, 
    Name varchar(255), 
    Supervisor int, 
    Salary int);
Create table If Not Exists Bonus (
    EmpId int, 
    Bonus int);

Truncate table Employee;
insert into Employee (EmpId, Name, Supervisor, Salary) 
    values ('3', 'Brad', null, '4000');
insert into Employee (EmpId, Name, Supervisor, Salary) 
    values ('1', 'John', '3', '1000');
insert into Employee (EmpId, Name, Supervisor, Salary) 
    values ('2', 'Dan', '3', '2000');
insert into Employee (EmpId, Name, Supervisor, Salary) 
    values ('4', 'Thomas', '3', '4000');

Truncate table Bonus;
insert into Bonus (EmpId, Bonus) 
    values ('2', '500');
insert into Bonus (EmpId, Bonus) 
    values ('4', '2000');