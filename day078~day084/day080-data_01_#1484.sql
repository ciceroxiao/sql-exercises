/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/group-sold-products-by-the-date/
 创建者：Cicero
 创建日期：2021-11-30
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Activities;
create table if not exists Activities (
    sell_date   date,
    product     varchar(20)
);
insert into Activities values ('2020-05-30', 'Headphone');
insert into Activities values ('2020-06-01', 'Pencil');
insert into Activities values ('2020-06-02', 'Mask');
insert into Activities values ('2020-05-30', 'Basketball');
insert into Activities values ('2020-06-01', 'Bible');
insert into Activities values ('2020-06-02', 'Mask');
insert into Activities values ('2020-05-30', 'T-Shirt');

-- 核验数据
select * from Activities;
