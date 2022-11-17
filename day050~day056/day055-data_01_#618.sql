/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/students-report-by-geography/
 创建者：Cicero
 创建日期：2021-10-29
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists student;
Create table If Not Exists student (name varchar(50), continent varchar(7));
Truncate table student;

insert into student (name, continent) values ('Jane', 'America');
insert into student (name, continent) values ('Pascal', 'Europe');
insert into student (name, continent) values ('Xi', 'Asia');
insert into student (name, continent) values ('Jack', 'America');