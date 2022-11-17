/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/list-the-products-ordered-in-a-period/
 创建者：Cicero
 创建日期：2021-11-23
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Products;
drop table if exists Orders;
create table if not exists Products (
    product_id int,
    product_name varchar(255),
    product_category varchar(255),
    primary key (product_id));
create table if not exists Orders (
    product_id int,
    order_date date,
    unit int
);
truncate table Products;
truncate table Orders;
insert into Products (product_id, product_name, product_category) values ('1', 'Leetcode Solutions',    'Book');
insert into Products (product_id, product_name, product_category) values ('2', 'Jewels of Stringology', 'Book');
insert into Products (product_id, product_name, product_category) values ('3', 'HP',                    'Laptop');
insert into Products (product_id, product_name, product_category) values ('4', 'Lenovo',                'Laptop');
insert into Products (product_id, product_name, product_category) values ('5', 'Leetcode Kit',          'T-shirt');
insert into Orders (product_id, order_date, unit) values ('1', '2020-02-05', '60');
insert into Orders (product_id, order_date, unit) values ('1', '2020-02-10', '70');
insert into Orders (product_id, order_date, unit) values ('2', '2020-01-18', '30');
insert into Orders (product_id, order_date, unit) values ('2', '2020-02-11', '80');
insert into Orders (product_id, order_date, unit) values ('3', '2020-02-17', '2');
insert into Orders (product_id, order_date, unit) values ('3', '2020-02-24', '3');
insert into Orders (product_id, order_date, unit) values ('4', '2020-03-01', '20');
insert into Orders (product_id, order_date, unit) values ('4', '2020-03-04', '30');
insert into Orders (product_id, order_date, unit) values ('4', '2020-03-04', '60');
insert into Orders (product_id, order_date, unit) values ('5', '2020-02-25', '50');
insert into Orders (product_id, order_date, unit) values ('5', '2020-02-27', '50');
insert into Orders (product_id, order_date, unit) values ('5', '2020-03-01', '50');

-- 核验数据
select * from Products;
select * from Orders;