/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/percentage-of-users-attended-a-contest/
 创建者：Cicero
 创建日期：2021-12-6
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Users;
create table if not exists Users (
    user_id int,
    user_name varchar(255),
    primary key (user_id)
);
drop table if exists Register;
create table if not exists Register (
    contest_id int,
    user_id int,
    primary key (contest_id, user_id)
);
Truncate table Users;
insert into Users values (6, 'Alice');
insert into Users values (2, 'Bob');
insert into Users values (7, 'Alex');
Truncate table Register;
insert into Register values (215, 6);
insert into Register values (209, 2);
insert into Register values (208, 2);
insert into Register values (210, 6);
insert into Register values (208, 6);
insert into Register values (209, 7);
insert into Register values (209, 6);
insert into Register values (215, 7);
insert into Register values (208, 7);
insert into Register values (210, 2);
insert into Register values (207, 2);
insert into Register values (210, 7);

-- 核验数据
select * from Users;
select * from Register;
