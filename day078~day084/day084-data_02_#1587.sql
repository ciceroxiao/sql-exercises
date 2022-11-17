/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/bank-account-summary-ii/
 创建者：Cicero
 创建日期：2021-12-4
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Users;
create table if not exists Users (
    account int,
    name varchar(20),
    primary key(account)
);
drop table if exists Transactions;
create table if not exists Transactions (
    trans_id int,
    account int,
    amount int,
    transacted_on date,
    primary key(trans_id)
);
Truncate table Users;
insert into Users values (900001, 'Alice');
insert into Users values (900002, 'Bob');
insert into Users values (900003, 'Charlie');
Truncate table Transactions;
insert into Transactions values (1, 900001, 7000, '2020-08-01');
insert into Transactions values (2, 900001, 7000, '2020-09-01');
insert into Transactions values (3, 900001, -3000, '2020-09-02');
insert into Transactions values (4, 900002, 1000, '2020-09-12');
insert into Transactions values (5, 900003, 6000, '2020-08-07');
insert into Transactions values (6, 900003, 6000, '2020-09-07');
insert into Transactions values (7, 900003, -4000, '2020-09-11');

-- 核验数据
select * from Users;
select * from Transactions;
