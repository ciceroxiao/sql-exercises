/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/find-the-missing-ids/
 创建者：Cicero
 创建日期：2021-12-5
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Customers;
create table if not exists Customers (
    customer_id         int,
    customer_name       varchar(255),
    primary key (customer_id)
);
Truncate table Customers;
insert into Customers values (1, 'Alice');
insert into Customers values (4, 'Bob');
insert into Customers values (5, 'Charlie');

-- 核验数据
select * from Customers;