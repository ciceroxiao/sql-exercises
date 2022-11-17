/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/immediate-food-delivery-i/
 创建者：Cicero
 创建日期：2021-11-15
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Delivery;
create table Delivery(
    delivery_id                 int,
    customer_id                 int,
    order_date                  date,
    customer_pref_delivery_date date,
    primary key(delivery_id)
);

insert into Delivery values(1, 1, '2019-08-01', '2019-08-02');
insert into Delivery values(2, 5, '2019-08-02', '2019-08-02');
insert into Delivery values(3, 1, '2019-08-11', '2019-08-11');
insert into Delivery values(4, 3, '2019-08-24', '2019-08-26');
insert into Delivery values(5, 4, '2019-08-21', '2019-08-22');
insert into Delivery values(6, 2, '2019-08-11', '2019-08-13');