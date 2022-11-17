/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/get-the-second-most-recent-activity/
 创建者：Cicero
 创建日期：2021-11-25
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists UserActivity;
Create table If Not Exists UserActivity (username varchar(30), activity varchar(30), startDate date, endDate date);
Truncate table UserActivity;
insert into UserActivity (username, activity, startDate, endDate) values ('Alice', 'Travel', '2020-02-12', '2020-02-20');
insert into UserActivity (username, activity, startDate, endDate) values ('Alice', 'Dancing', '2020-02-21', '2020-02-23');
insert into UserActivity (username, activity, startDate, endDate) values ('Alice', 'Travel', '2020-02-24', '2020-02-28');
insert into UserActivity (username, activity, startDate, endDate) values ('Bob', 'Travel', '2020-02-11', '2020-02-18');

-- 核验数据
select * from UserActivity;