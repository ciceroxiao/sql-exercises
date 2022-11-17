/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
 创建者：Cicero
 创建日期：2021-11-25
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Employees;
drop table if exists EmployeeUNI;
create table if not exists Employees (id int, name varchar(30), primary key (id));
create table if not exists EmployeeUNI (id int, unique_id int, primary key (id, unique_id));
truncate table Employees;
truncate table EmployeeUNI;
insert into Employees (id, name) values (1, 'Alice');
insert into Employees (id, name) values (7, 'Bob');
insert into Employees (id, name) values (11, 'Meir');
insert into Employees (id, name) values (90, 'Winston');
insert into Employees (id, name) values (3, 'Jonathan');
insert into EmployeeUNI (id, unique_id) values (3, 1);
insert into EmployeeUNI (id, unique_id) values (11, 2);
insert into EmployeeUNI (id, unique_id) values (90, 3);

-- 核验数据
select * from Employees;
select * from EmployeeUNI;