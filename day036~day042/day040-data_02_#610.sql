/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/triangle-judgement/
 创建者：Cicero
 创建日期：2021-10-14
 修改日期：
 */
SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists triangle;
Create table If Not Exists triangle (x int, y int, z int);
Truncate table triangle;

insert into triangle (x, y, z) values ('13', '15', '30');
insert into triangle (x, y, z) values ('10', '20', '15');