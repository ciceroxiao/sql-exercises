/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/project-employees-i/
 创建者：Cicero
 创建日期：2021-11-8
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Project;
truncate table Project;
create table if not exists Project(
    project_id int,
    employee_id int,
    primary key(project_id, employee_id)
);
insert into Project values(1, 1);
insert into Project values(1, 2);
insert into Project values(1, 3);
insert into Project values(2, 1);
insert into Project values(2, 4);

drop table if exists Employee;
truncate table Employee;
create table if not exists Employee(
    employee_id int,
    name varchar(20),
    experience_years int,
    primary key(employee_id)
);
insert into Employee values(1, 'Khaled', 3);
insert into Employee values(2, 'Ali', 2);
insert into Employee values(3, 'John', 1);
insert into Employee values(4, 'Doe', 2);
