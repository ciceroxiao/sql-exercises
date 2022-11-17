/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/monthly-transactions-i/
 创建者：Cicero
 创建日期：2021-11-16
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Transactions;
create table Transactions(
    id          int,
    country     varchar(255),
    state       enum("approved", "declined"),
    amount      int,
    trans_date  date,
    primary key (id)
);

insert into Transactions values(121, "US", "approved", 1000, "2018-12-18");
insert into Transactions values(122, "US", "declined", 2000, "2018-12-19");
insert into Transactions values(123, "US", "approved", 2000, "2019-01-01");
insert into Transactions values(124, "DE", "approved", 2000, "2019-01-07");
