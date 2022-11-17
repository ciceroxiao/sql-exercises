/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/create-a-session-bar-chart/
 创建者：Cicero
 创建日期：2021-11-27
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Sessions;
Create table If Not Exists Sessions (session_id int, duration int);
Truncate table Sessions;
insert into Sessions (session_id, duration) values ('1', '30');
insert into Sessions (session_id, duration) values ('2', '199');
insert into Sessions (session_id, duration) values ('3', '299');
insert into Sessions (session_id, duration) values ('4', '580');
insert into Sessions (session_id, duration) values ('5', '1000');

-- 核验数据
select * from Sessions;