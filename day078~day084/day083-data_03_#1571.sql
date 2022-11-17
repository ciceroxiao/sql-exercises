/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/warehouse-manager/
 创建者：Cicero
 创建日期：2021-12-3
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Warehouse;
create table if not exists Warehouse (
    name        varchar(20) not null,
    product_id  int not null,
    units       int not null,
    primary key (name, product_id)
);
drop table if exists Products;
create table if not exists Products (
    product_id      int not null,
    product_name    varchar(20) not null,
    Width           int not null,
    Length          int not null,
    Height          int not null,
    primary key (product_id)
);
Truncate table Warehouse;
insert into Warehouse values ('LCHouse1', 1, 1);
insert into Warehouse values ('LCHouse1', 2, 10);
insert into Warehouse values ('LCHouse1', 3, 5);
insert into Warehouse values ('LCHouse2', 1, 2);
insert into Warehouse values ('LCHouse2', 2, 2);
insert into Warehouse values ('LCHouse3', 4, 1);
Truncate table Products;
insert into Products values (1, 'LC-TV', 5, 50, 40);
insert into Products values (2, 'LC-KeyChain', 5, 5, 5);
insert into Products values (3, 'LC-Phone', 2, 10, 10);
insert into Products values (4, 'LC-T-Shirt', 4, 10, 20);

-- 核验数据
select * from Warehouse;
select * from Products;
