/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/employees-earning-more-than-their-managers/
 创建者：Cicero
 创建日期：2021-10-15
 修改日期：
 */
SHOW DATABASES;

USE sql_daily_exercises;

DROP TABLE IF EXISTS Employee;

Create table If Not Exists Employee (
Id int, 
Name varchar(255), 
Salary int, 
ManagerId int);

Truncate table Employee;

insert into Employee (Id, Name, Salary, ManagerId)
 values ('1', 'Joe', '70000', '3');
insert into Employee (Id, Name, Salary, ManagerId)
 values ('2', 'Henry', '80000', '4');
insert into Employee (Id, Name, Salary, ManagerId)
 values ('3', 'Sam', '60000', null);
insert into Employee (Id, Name, Salary, ManagerId)
 values ('4', 'Max', '90000', null);