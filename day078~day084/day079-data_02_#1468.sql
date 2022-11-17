/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/calculate-salaries/
 创建者：Cicero
 创建日期：2021-11-29
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Salaries;
create table if not exists Salaries (
    company_id      int,
    employee_id     int,
    employee_name   varchar(255),
    salary          int,
    primary key (company_id, employee_id)
);
insert into Salaries values (1, 1, 'Tony', 2000);
insert into Salaries values (1, 2, 'Pronub', 21300);
insert into Salaries values (1, 3, 'Tyrrox', 10800);
insert into Salaries values (2, 1, 'Pam', 300);
insert into Salaries values (2, 7, 'Bassem', 450);
insert into Salaries values (2, 9, 'Hermione', 700);
insert into Salaries values (3, 7, 'Bocaben', 100);
insert into Salaries values (3, 2, 'Ognjen', 2200);
insert into Salaries values (3, 13, 'Nyancat', 3300);
insert into Salaries values (3, 15, 'Morninngcat', 7777);

-- 核验数据
select * from Salaries;