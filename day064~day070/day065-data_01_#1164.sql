/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/product-price-at-a-given-date/
 创建者：Cicero
 创建日期：2021-11-15
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Products;
create table Products(
    product_id int,
    new_price int,
    change_date date,
    primary key(product_id, change_date)
);
insert into Products values(1, 20, '2019-08-14');
insert into Products values(2, 50, '2019-08-14');
insert into Products values(1, 30, '2019-08-15');
insert into Products values(1, 35, '2019-08-16');
insert into Products values(2, 65, '2019-08-17');
insert into Products values(3, 20, '2019-08-18');