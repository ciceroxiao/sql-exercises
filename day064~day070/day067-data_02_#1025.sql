/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/monthly-transactions-ii/
 创建者：Cicero
 创建日期：2021-11-17
 修改日期：2021-11-18
 */


USE sql_daily_exercises;

create table if not exists Transactions (id int, country varchar(4), state enum('approved', 'declined'), amount int, trans_date date);
create table if not exists Chargebacks (trans_id int, trans_date date);
Truncate table Transactions;
insert into Transactions (id, country, state, amount, trans_date) values ('101', 'US', 'approved', '1000', '2019-05-18');
insert into Transactions (id, country, state, amount, trans_date) values ('102', 'US', 'declined', '2000', '2019-05-19');
insert into Transactions (id, country, state, amount, trans_date) values ('103', 'US', 'approved', '3000', '2019-06-10');
insert into Transactions (id, country, state, amount, trans_date) values ('104', 'US', 'declined', '4000', '2019-06-13');
insert into Transactions (id, country, state, amount, trans_date) values ('105', 'US', 'approved', '5000', '2019-06-15');
Truncate table Chargebacks;
insert into Chargebacks (trans_id, trans_date) values ('102', '2019-05-29');
insert into Chargebacks (trans_id, trans_date) values ('101', '2019-06-30');
insert into Chargebacks (trans_id, trans_date) values ('105', '2019-09-18');





insert into Transactions (id, country, state, amount, trans_date) values ('100',"CB","declined",'4000',"2019-02-04");
insert into Transactions (id, country, state, amount, trans_date) values ('101',"BB","approved",'7000',"2019-02-17");
insert into Transactions (id, country, state, amount, trans_date) values ('102',"CA","declined",'6000',"2019-02-26");
insert into Transactions (id, country, state, amount, trans_date) values ('103',"AA","declined",'7000',"2019-04-01");

insert into Chargebacks (trans_id, trans_date) values ('100', "2019-03-29");
insert into Chargebacks (trans_id, trans_date) values ('102', "2019-02-28");
insert into Chargebacks (trans_id, trans_date) values ('103', "2019-05-09");