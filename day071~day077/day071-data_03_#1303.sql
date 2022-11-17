/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/find-the-team-size/
 创建者：Cicero
 创建日期：2021-11-22
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Employee;
create table Employee(
    employee_id int,
    team_id int,
    primary key(employee_id)
);
insert into Employee values(1,8);
insert into Employee values(2,8);
insert into Employee values(3,8);
insert into Employee values(4,7);
insert into Employee values(5,9);
insert into Employee values(6,9);

-- 核验数据
select * from Employee;