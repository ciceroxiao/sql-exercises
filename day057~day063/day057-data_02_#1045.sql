/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/customers-who-bought-all-products/
 创建者：Cicero
 创建日期：2021-11-7
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Customer;
truncate table Customer;
create table if not exists Customer(
    customer_id int,
    product_key int
);
insert into Customer values(1,5);
insert into Customer values(2,6);
insert into Customer values(3,5);
insert into Customer values(3,6);
insert into Customer values(1,6);

drop table if exists Product;
truncate table Product;
create table if not exists Product(
    product_key int
);
insert into Product values(5);
insert into Product values(6);
