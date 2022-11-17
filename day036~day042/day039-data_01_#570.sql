/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
 创建者：Cicero
 创建日期：2021-10-13
 修改日期：
 */
SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists Employee;
create table if not exists Employee(
    Id int(3),
    Name varchar(10),
    Department varchar(1),
    ManagerId int(3)
);

insert into Employee (Id, Name, Department, ManagerId) values (101, "John", "A", null);
insert into Employee (Id, Name, Department, ManagerId) values (102, "Dan", "A", 101);
insert into Employee (Id, Name, Department, ManagerId) values (103, "James", "A", 101);
insert into Employee (Id, Name, Department, ManagerId) values (104, "Amy", "A", 101);
insert into Employee (Id, Name, Department, ManagerId) values (105, "Anne", "A", 101);
insert into Employee (Id, Name, Department, ManagerId) values (106, "Ron", "B", 101);
