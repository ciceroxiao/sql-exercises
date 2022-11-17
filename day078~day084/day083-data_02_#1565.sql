/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/unique-orders-and-customers-per-month/
 创建者：Cicero
 创建日期：2021-12-3
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Orders;
create table if not exists Orders (
    order_id    int,
    order_date  date,
    customer_id int,
    invoice     int,
    primary key (order_id)
);
Truncate table Orders;
insert into Orders values (1, '2020-09-15', 1, 30);
insert into Orders values (2, '2020-09-17', 2, 90);
insert into Orders values (3, '2020-10-06', 3, 20);
insert into Orders values (4, '2020-10-20', 3, 21);
insert into Orders values (5, '2020-11-10', 1, 10);
insert into Orders values (6, '2020-11-21', 2, 15);
insert into Orders values (7, '2020-12-01', 4, 55);
insert into Orders values (8, '2020-12-03', 4, 77);
insert into Orders values (9, '2021-01-07', 3, 31);
insert into Orders values (10, '2021-01-15', 2, 20);

-- 核验数据
select * from Orders;
