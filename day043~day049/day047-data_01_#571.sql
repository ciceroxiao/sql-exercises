/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/find-median-given-frequency-of-numbers/
 创建者：Cicero
 创建日期：2021-10-21
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists numbers;
Create table If Not Exists Numbers (
       Number int, 
       Frequency int);

Truncate table Numbers;
insert into Numbers (Number, Frequency) values ('0', '7');
insert into Numbers (Number, Frequency) values ('1', '1');
insert into Numbers (Number, Frequency) values ('2', '3');
insert into Numbers (Number, Frequency) values ('3', '1');