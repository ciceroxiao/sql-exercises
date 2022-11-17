/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/
 创建者：Cicero
 创建日期：2021-10-26
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists request_accepted;

Create table If Not Exists request_accepted ( 
      requester_id INT NOT NULL, 
      accepter_id INT NULL, 
      accept_date DATE NULL);

Truncate table request_accepted;
insert into request_accepted (requester_id, accepter_id, accept_date) 
      values ('1', '2', '2016/06/03');
insert into request_accepted (requester_id, accepter_id, accept_date) 
      values ('1', '3', '2016/06/08');
insert into request_accepted (requester_id, accepter_id, accept_date) 
      values ('2', '3', '2016/06/08');
insert into request_accepted (requester_id, accepter_id, accept_date) 
      values ('3', '4', '2016/06/09');