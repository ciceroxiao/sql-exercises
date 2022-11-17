/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/shortest-distance-in-a-line/
 创建者：Cicero
 创建日期：2021-10-26
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists point;

CREATE TABLE If Not Exists point (
    x INT NOT NULL, 
UNIQUE INDEX x_UNIQUE (x ASC));

Truncate table point;
insert into point (x) values ('-1');
insert into point (x) values ('0');
insert into point (x) values ('2');