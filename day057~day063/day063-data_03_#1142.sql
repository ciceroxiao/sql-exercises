/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/user-activity-for-the-past-30-days-ii/
 创建者：Cicero
 创建日期：2021-11-13
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Activity;
create table Activity(
    user_id       int,
    session_id    int,
    activity_date date,
    activity_type enum('open_session', 'end_session', 'scroll_down', 'send_message')
);
insert into Activity values(1, 1, '2019-07-20', 'open_session');
insert into Activity values(1, 1, '2019-07-20', 'scroll_down');
insert into Activity values(1, 1, '2019-07-20', 'end_session');
insert into Activity values(2, 4, '2019-07-20', 'open_session');
insert into Activity values(2, 4, '2019-07-21', 'send_message');
insert into Activity values(2, 4, '2019-07-21', 'end_session');
insert into Activity values(3, 2, '2019-07-21', 'open_session');
insert into Activity values(3, 2, '2019-07-21', 'send_message');
insert into Activity values(3, 2, '2019-07-21', 'end_session');
insert into Activity values(3, 5, '2019-07-21', 'open_session');
insert into Activity values(3, 5, '2019-07-21', 'scroll_down');
insert into Activity values(3, 5, '2019-07-21', 'end_session');
insert into Activity values(4, 3, '2019-06-25', 'open_session');
insert into Activity values(4, 3, '2019-06-25', 'end_session');