/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/find-customer-referee/
 创建者：Cicero
 创建日期：2021-10-23
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists customer;
CREATE TABLE IF NOT EXISTS customer (
    id INT,
    name VARCHAR(25),
    referee_id INT);

Truncate table customer;
insert into customer (id, name, referee_id)
     values ('1', 'Will', null);
insert into customer (id, name, referee_id) 
     values ('2', 'Jane', null);
insert into customer (id, name, referee_id) 
     values ('3', 'Alex', '2');
insert into customer (id, name, referee_id) 
     values ('4', 'Bill', null);
insert into customer (id, name, referee_id) 
     values ('5', 'Zack', '1');
insert into customer (id, name, referee_id) 
     values ('6', 'Mark', '2');