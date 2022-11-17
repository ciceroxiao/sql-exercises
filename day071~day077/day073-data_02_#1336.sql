/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/number-of-transactions-per-visit/
 创建者：Cicero
 创建日期：2021-11-23
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Visits;
drop table if exists Transactions;
Create table If Not Exists Visits (user_id int, visit_date date);
Create table If Not Exists Transactions (user_id int, transaction_date date, amount int);
Truncate table Visits;
insert into Visits (user_id, visit_date) values ('1', '2020-01-01');
insert into Visits (user_id, visit_date) values ('2', '2020-01-02');
insert into Visits (user_id, visit_date) values ('12', '2020-01-01');
insert into Visits (user_id, visit_date) values ('19', '2020-01-03');
insert into Visits (user_id, visit_date) values ('1', '2020-01-02');
insert into Visits (user_id, visit_date) values ('2', '2020-01-03');
insert into Visits (user_id, visit_date) values ('1', '2020-01-04');
insert into Visits (user_id, visit_date) values ('7', '2020-01-11');
insert into Visits (user_id, visit_date) values ('9', '2020-01-25');
insert into Visits (user_id, visit_date) values ('8', '2020-01-28');
Truncate table Transactions;
insert into Transactions (user_id, transaction_date, amount) values ('1', '2020-01-02', '120');
insert into Transactions (user_id, transaction_date, amount) values ('2', '2020-01-03', '22');
insert into Transactions (user_id, transaction_date, amount) values ('7', '2020-01-11', '232');
insert into Transactions (user_id, transaction_date, amount) values ('1', '2020-01-04', '7');
insert into Transactions (user_id, transaction_date, amount) values ('9', '2020-01-25', '33');
insert into Transactions (user_id, transaction_date, amount) values ('9', '2020-01-25', '66');
insert into Transactions (user_id, transaction_date, amount) values ('8', '2020-01-28', '1');
insert into Transactions (user_id, transaction_date, amount) values ('9', '2020-01-25', '99');

-- 核验数据
select * from Visits;
select * from Transactions;