/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/customer-order-frequency/
 创建者：Cicero
 创建日期：2021-12-1
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Customers;
create table if not exists Customers (
    customer_id int primary key,
    name        varchar(255),
    country     varchar(255)
);
drop table if exists Product;
create table if not exists Product (
    product_id      int primary key,
    description     varchar(255),
    price           int
);
drop table if exists Orders;
create table if not exists Orders (
    order_id        int primary key,
    customer_id     int,
    product_id      int,
    order_date      date,
    quantity        int
);
truncate table Customers;
insert into Customers values (1, 'Winston', 'USA');
insert into Customers values (2, 'Jonathan', 'Peru');
insert into Customers values (3, 'Moustafa', 'Egypt');
truncate table Product;
insert into Product values (10, 'LC iPhone', 300);
insert into Product values (20, 'LC T-Shirt', 10);
insert into Product values (30, 'LC Book', 45);
insert into Product values (40, 'LC Keychain', 2);
truncate table Orders;
insert into Orders values (1, 1, 10, '2020-06-10', 1);
insert into Orders values (2, 1, 20, '2020-07-01', 1);
insert into Orders values (3, 1, 30, '2020-07-08', 2);
insert into Orders values (4, 2, 10, '2020-06-15', 2);
insert into Orders values (5, 2, 40, '2020-07-01', 10);
insert into Orders values (6, 3, 20, '2020-06-24', 2);
insert into Orders values (7, 3, 30, '2020-06-25', 2);
insert into Orders values (9, 3, 30, '2020-05-08', 3);

--核验数据
select * from Customers;
select * from Product;
select * from Orders;
