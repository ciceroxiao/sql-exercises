/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/new-users-daily-count/
 创建者：Cicero
 创建日期：2021-11-11
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Traffic;
truncate table Traffic;
create table if not exists Traffic(
    user_id        int,
    activity       enum('login', 'logout', 'jobs', 'groups', 'homepage'),
    activity_date  date
);
insert into Traffic values(1, 'login', '2019-05-01');
insert into Traffic values(1, 'homepage', '2019-05-01');
insert into Traffic values(1, 'logout', '2019-05-01');
insert into Traffic values(2, 'login', '2019-06-21');
insert into Traffic values(2, 'logout', '2019-06-21');
insert into Traffic values(3, 'login', '2019-01-01');
insert into Traffic values(3, 'jobs', '2019-01-01');
insert into Traffic values(3, 'logout', '2019-01-01');
insert into Traffic values(4, 'login', '2019-06-21');
insert into Traffic values(4, 'groups', '2019-06-21');
insert into Traffic values(4, 'logout', '2019-06-21');
insert into Traffic values(5, 'login', '2019-03-01');
insert into Traffic values(5, 'logout', '2019-03-01');
insert into Traffic values(5, 'login', '2019-06-21');
insert into Traffic values(5, 'logout', '2019-06-21');

