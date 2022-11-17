/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/bank-account-summary/
 创建者：Cicero
 创建日期：2021-12-3
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Users;
create table if not exists Users(
    user_id     int,
    user_name   varchar(255),
    credit      int,
    primary key(user_id)
);
drop table if exists Transactions;
create table if not exists Transactions (
    trans_id        int,
    paid_by         int,
    paid_to         int,
    amount          int,
    transacted_on   date,
    primary key (trans_id)
);
Truncate table Users;
insert into Users values (1, "Moustafa", 100);
insert into Users values (2, "Jonathan", 200);
insert into Users values (3, "Winston", 10000);
insert into Users values (4, "Luis", 800);
Truncate table Transactions;
insert into Transactions values (1, 1, 3, 400, '2020-08-01');
insert into Transactions values (2, 3, 2, 500, '2020-08-02');
insert into Transactions values (3, 2, 1, 200, '2020-08-03');

-- 核验数据
select * from Users;
select * from Transactions;
