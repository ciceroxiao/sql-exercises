/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/the-most-recent-orders-for-each-product/
 创建者：Cicero
 创建日期：2021-12-2
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Customers;
create table if not exists Customers (
    customer_id int,
    name varchar(255),
    primary key (customer_id)
);
drop table if exists Orders;
create table if not exists Orders (
    order_id int,
    order_date date,
    customer_id int,
    product_id int,
    primary key (order_id)
);
drop table if exists Products;
create table if not exists Products (
    product_id int,
    product_name varchar(255),
    price int,
    primary key (product_id)
);
Truncate table Customers;
insert into Customers values (1, 'Winston');
insert into Customers values (2, 'Jonathan');
insert into Customers values (3, 'Annabelle');
insert into Customers values (4, 'Marwan');
insert into Customers values (5, 'Khaled');
Truncate table Orders;
insert into Orders values (1, '2020-07-31', 1, 1);
insert into Orders values (2, '2020-07-30', 2, 2);
insert into Orders values (3, '2020-08-29', 3, 3);
insert into Orders values (4, '2020-07-29', 4, 1);
insert into Orders values (5, '2020-06-10', 1, 2);
insert into Orders values (6, '2020-08-01', 2, 1);
insert into Orders values (7, '2020-08-01', 3, 1);
insert into Orders values (8, '2020-08-03', 1, 2);
insert into Orders values (9, '2020-08-07', 2, 3);
insert into Orders values (10, '2020-07-15', 1, 2);
Truncate table Products;
insert into Products values (1, 'keyboard', 120);
insert into Products values (2, 'mouse', 80);
insert into Products values (3, 'screen', 600);
insert into Products values (4, 'hard disk', 450);

-- 核验数据
select * from Customers;
select * from Orders;
select * from Products;
