/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/exchange-seats/
 创建者：Cicero
 创建日期：2021-10-13
 修改日期：
 */
SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists friend_request;
create table if not exists friend_request (
    sender_id int(2),
    send_to_id int(2),
    request_date date
);

insert into friend_request (sender_id, send_to_id, request_date) values (1, 2, "2016_06-01");
insert into friend_request (sender_id, send_to_id, request_date) values (1, 3, "2016_06-01");
insert into friend_request (sender_id, send_to_id, request_date) values (1, 4, "2016_06-01");
insert into friend_request (sender_id, send_to_id, request_date) values (2, 3, "2016_06-02");
insert into friend_request (sender_id, send_to_id, request_date) values (3, 4, "2016_06-09");

drop table if exists request_accepted;
create table if not exists request_accepted (
    requester_id int(2),
    accepted_id int(2),
    accept_date date
);

insert into request_accepted (requester_id, accepted_id, accept_date) values (1, 2, "2016_06-03");
insert into request_accepted (requester_id, accepted_id, accept_date) values (1, 3, "2016_06-08");
insert into request_accepted (requester_id, accepted_id, accept_date) values (2, 3, "2016_06-08");
insert into request_accepted (requester_id, accepted_id, accept_date) values (3, 4, "2016_06-09");
insert into request_accepted (requester_id, accepted_id, accept_date) values (3, 4, "2016_06-09");
