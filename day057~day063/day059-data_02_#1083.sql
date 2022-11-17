/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/sales-analysis-ii/
 创建者：Cicero
 创建日期：2021-11-9
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Product;
truncate table Product;
create table if not exists Product(
    product_id int,
    product_name varchar(50),
    unit_price int,
    primary key(product_id)
);
insert into Product values(1, 'S8', 1000);
insert into Product values(2, 'G4', 800);
insert into Product values(3, 'iPhone', 1400);

drop table if exists Sales;
truncate table Sales;
create table if not exists Sales(
    saller_id int,
    product_id int,
    buyer_id int,
    sale_date  date,
    quantity int,
    price int
);
insert into Sales values(1, 1, 1, '2019-01-21', 2, 2000);
insert into Sales values(1, 2, 2, '2019-02-17', 1, 800);
insert into Sales values(2, 1, 3, '2019-06-02', 1, 800);
insert into Sales values(3, 3, 3, '2019-05-13', 2, 2800);