/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/sales-by-day-of-the-week/
 创建者：Cicero
 创建日期：2021-11-29
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Orders;
drop table if exists Items;
Create table If Not Exists Orders (order_id int, customer_id int, order_date date, item_id varchar(30), quantity int);
Create table If Not Exists Items (item_id varchar(30), item_name varchar(30), item_category varchar(30));
Truncate table Orders;
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('1', '1', '2020-06-01', '1', '10');
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('2', '1', '2020-06-08', '2', '10');
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('3', '2', '2020-06-02', '1', '5');
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('4', '3', '2020-06-03', '3', '5');
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('5', '4', '2020-06-04', '4', '1');
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('6', '4', '2020-06-05', '5', '5');
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('7', '5', '2020-06-05', '1', '10');
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('8', '5', '2020-06-14', '4', '5');
insert into Orders (order_id, customer_id, order_date, item_id, quantity) values ('9', '5', '2020-06-21', '3', '5');
Truncate table Items;
insert into Items (item_id, item_name, item_category) values ('1', 'LC Alg. Book', 'Book');
insert into Items (item_id, item_name, item_category) values ('2', 'LC DB. Book', 'Book');
insert into Items (item_id, item_name, item_category) values ('3', 'LC SmarthPhone', 'Phone');
insert into Items (item_id, item_name, item_category) values ('4', 'LC Phone 2020', 'Phone');
insert into Items (item_id, item_name, item_category) values ('5', 'LC SmartGlass', 'Glasses');
insert into Items (item_id, item_name, item_category) values ('6', 'LC T-Shirt XL', 'T-shirt');

-- 核验数据
select * from Orders;
select * from Items;