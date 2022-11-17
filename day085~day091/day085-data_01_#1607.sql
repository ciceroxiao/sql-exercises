/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/sellers-with-no-sales/
 创建者：Cicero
 创建日期：2021-12-5
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Customers;
create table if not exists Customers (
    customer_id     int,
    customer_name   varchar(255),
    primary key (customer_id)
);
drop table if exists Orders;
create table if not exists Orders (
    order_id    int,
    sale_date   date,
    order_cost  int,
    customer_id int,
    seller_id   int,
    primary key (order_id)
);
drop table if exists Sellers;
create table if not exists Sellers (
    seller_id   int,
    seller_name varchar(255),
    primary key (seller_id)
);
Truncate table Customers;
insert into Customers values (101, 'Alice');
insert into Customers values (102, 'Bob');
insert into Customers values (103, 'Charlie');
Truncate table Orders;
insert into Orders values (1, '2020-03-01', 1500, 101, 1);
insert into Orders values (2, '2020-05-25', 2400, 102, 2);
insert into Orders values (3, '2019-05-25', 800, 101, 3);
insert into Orders values (4, '2020-09-13', 1000, 103, 2);
insert into Orders values (5, '2019-02-11', 700, 101, 2);
Truncate table Sellers;
insert into Sellers values (1, 'Daniel');
insert into Sellers values (2, 'Elizabeth');
insert into Sellers values (3, 'Frank');

-- 核验数据
select * from Customers;
select * from Orders;
select * from Sellers;
