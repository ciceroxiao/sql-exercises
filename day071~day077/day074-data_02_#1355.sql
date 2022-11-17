/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/activity-participants/
 创建者：Cicero
 创建日期：2021-11-24
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Friends;
drop table if exists Activitys;
create table if not exists Friends (
    id int,
    name varchar(30),
    activity varchar(30),
    primary key (id)
);
create table if not exists Activitys (
    id int,
    name varchar(30),
    primary key (id)
);
truncate table Friends;
insert into Friends (id, name, activity) values ('1', 'Jonathan D.', 'Eating');
insert into Friends (id, name, activity) values ('2', 'Jade W.', 'Singing');
insert into Friends (id, name, activity) values ('3', 'Victor J.', 'Singing');
insert into Friends (id, name, activity) values ('4', 'Elvis Q.', 'Eating');
insert into Friends (id, name, activity) values ('5', 'Daniel A.', 'Eating');
insert into Friends (id, name, activity) values ('6', 'Bob B.', 'Horse Riding');
truncate table Activitys;
insert into Activitys (id, name) values ('1', 'Eating');
insert into Activitys (id, name) values ('2', 'Singing');
insert into Activitys (id, name) values ('3', 'Horse Riding');

-- 核验数据
select * from Friends;
select * from Activitys;