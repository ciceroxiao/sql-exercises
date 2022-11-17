/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/find-the-start-and-end-number-of-continuous-ranges/
 创建者：Cicero
 创建日期：2021-11-22
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Logs;
create table Logs(
    log_id int primary key
);

insert into Logs values(1);
insert into Logs values(2);
insert into Logs values(3);
insert into Logs values(7);
insert into Logs values(8);
insert into Logs values(10);

-- 核验数据
select * from Logs;