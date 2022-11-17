/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/median-employee-salary/
 创建者：Cicero
 创建日期：2021-10-12
 修改日期：
 */
SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists Employee;

create table if not exists Employee(
    Id int(4),
    Company varchar(4),
    Salary int(8)
);

insert into Employee (Id, Company, Salary) values (1,"A",2341);
insert into Employee (Id, Company, Salary) values (2,"A",341);
insert into Employee (Id, Company, Salary) values (3,"A",15);
insert into Employee (Id, Company, Salary) values (4,"A",15314);
insert into Employee (Id, Company, Salary) values (5,"A",451);
insert into Employee (Id, Company, Salary) values (6,"A",513);
insert into Employee (Id, Company, Salary) values (7,"B",15);
insert into Employee (Id, Company, Salary) values (8,"B",13);
insert into Employee (Id, Company, Salary) values (9,"B",1154);
insert into Employee (Id, Company, Salary) values (10,"B",1345);
insert into Employee (Id, Company, Salary) values (11,"B",1221);
insert into Employee (Id, Company, Salary) values (12,"B",234);
insert into Employee (Id, Company, Salary) values (13,"C",2345);
insert into Employee (Id, Company, Salary) values (14,"C",2645);
insert into Employee (Id, Company, Salary) values (15,"C",2645);
insert into Employee (Id, Company, Salary) values (16,"C",2652);
insert into Employee (Id, Company, Salary) values (17,"C",65);

