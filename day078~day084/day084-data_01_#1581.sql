/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
 创建者：Cicero
 创建日期：2021-12-4
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Visits;
create table if not exists Visits (
    visit_id int,
    customer_id int,
    primary key (visit_id)
);
drop table if exists Transactions;
create table if not exists Transactions (
    transaction_id int,
    visit_id int,
    amount int,
    primary key (transaction_id)
);
Truncate table Visits;
insert into Visits values (1, 23);
insert into Visits values (2, 9);
insert into Visits values (4, 30);
insert into Visits values (5, 54);
insert into Visits values (6, 96);
insert into Visits values (7, 54);
insert into Visits values (8, 54);
Truncate table Transactions;
insert into Transactions values (2, 5, 310);
insert into Transactions values (3, 5, 300);
insert into Transactions values (9, 5, 200);
insert into Transactions values (12, 1, 910);
insert into Transactions values (13, 2, 970);

-- 核验数据
select * from Visits;
select * from Transactions;
