/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/apples-oranges/
 创建者：Cicero
 创建日期：2021-11-28
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Sales;
create table Sales (
    sale_date date,
    fruit enum('apples','oranges'),
    sold_num int,
    primary key (sale_date, fruit)
);
insert into Sales values ('2020-05-01','apples',10);
insert into Sales values ('2020-05-01','oranges',8);
insert into Sales values ('2020-05-02','apples',15);
insert into Sales values ('2020-05-02','oranges',15);
insert into Sales values ('2020-05-03','apples',20);
insert into Sales values ('2020-05-03','oranges',0);
insert into Sales values ('2020-05-04','apples',15);
insert into Sales values ('2020-05-04','oranges',16);

-- 核验数据
select * from Sales;