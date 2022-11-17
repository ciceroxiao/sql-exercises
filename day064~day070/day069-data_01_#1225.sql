/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/report-contiguous-dates/
 创建者：Cicero
 创建日期：2021-11-18
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Failed;
create table Failed(
    fail_date date primary key
);
Truncate table Failed;
insert into Failed values('2018-12-28');
insert into Failed values('2018-12-29 ');
insert into Failed values('2019-01-04');
insert into Failed values('2019-01-05');

drop table if exists Succeeded;
create table Succeeded(
    success_date date primary key
);
Truncate table Succeeded;
insert into Succeeded values('2018-12-30');
insert into Succeeded values('2018-12-31');
insert into Succeeded values('2019-01-01');
insert into Succeeded values('2019-01-02');
insert into Succeeded values('2019-01-03');
insert into Succeeded values('2019-01-06');

-- 核验数据
select * from Failed;
select * from Succeeded;