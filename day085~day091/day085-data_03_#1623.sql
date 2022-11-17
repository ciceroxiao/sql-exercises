/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/all-valid-triplets-that-can-represent-a-country/
 创建者：Cicero
 创建日期：2021-12-5
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists SchoolA;
create table if not exists SchoolA (
    student_id      int,
    student_name    varchar(20),
    primary key (student_id)
);
drop table if exists SchoolB;
create table if not exists SchoolB (
    student_id      int,
    student_name    varchar(20),
    primary key (student_id)
);
drop table if exists SchoolC;
create table if not exists SchoolC (
    student_id      int,
    student_name    varchar(20),
    primary key (student_id)
);
Truncate table SchoolA;
Truncate table SchoolB;
Truncate table SchoolC;
insert into SchoolA values (1, 'Alice');
insert into SchoolA values (2, 'Bob');
insert into SchoolB values (3, 'Tom');
insert into SchoolC values (3, 'Tom');
insert into SchoolC values (2, 'Jerry');
insert into SchoolC values (10, 'Alice');

-- 核验数据
select * from SchoolA;
select * from SchoolB;
select * from SchoolC;
