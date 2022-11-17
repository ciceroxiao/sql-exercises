/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/market-analysis-ii/
 创建者：Cicero
 创建日期：2021-11-14
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Users;
create table Users(
    user_id int primary key,
    join_date date,
    favorite_brand varchar(20)
);

drop table if exists Orders;
create table Orders(
    order_id int primary key,
    order_date date,
    item_id int,
    buyer_id int,
    seller_id int
);

drop table if exists Items;
create table Items(
    item_id       int primary key,
    item_brand    varchar(20)
);

insert into Users values(1, '2019-01-01', 'Lenovo');
insert into Users values(2, '2019-02-09', 'Samsung');
insert into Users values(3, '2019-01-19', 'LG');
insert into Users values(4, '2019-05-21', 'HP');

insert into Items values(1, 'Samsung');
insert into Items values(2, 'Lenovo');
insert into Items values(3, 'LG');
insert into Items values(4, 'HP');

insert into Orders values(1, '2019-08-01', 4, 1, 2);
insert into Orders values(2, '2018-08-02', 2, 1, 3);
insert into Orders values(3, '2019-08-03', 3, 2, 3);
insert into Orders values(4, '2018-08-04', 1, 4, 2);
insert into Orders values(5, '2018-08-04', 1, 3, 4);
insert into Orders values(6, '2019-08-05', 2, 2, 4);