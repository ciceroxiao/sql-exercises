/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/product-sales-analysis-ii/
 创建者：Cicero
 创建日期：2021-11-7
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Sales;
truncate table Sales;
create table if not exists Sales(
    sale_id int primary key,
    product_id  int,
    year int,
    quantity int,
    price int
);

insert into Sales values(1, 100, 2008, 10, 5000);
insert into Sales values(2, 100, 2009, 12, 5000);
insert into Sales values(7, 200, 2011, 15, 9000);

drop table if exists Product;
truncate table Product;
create table if not exists Product(
    product_id int primary key,
    product_name varchar(50)
);

insert into Product values(100, 'Nokia');
insert into Product values(200, 'Apple');
insert into Product values(300, 'Samsung');
