/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/reported-posts-ii/
 创建者：Cicero
 创建日期：2021-11-13
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Actions;
create table if not exists Actions(
    user_id     int,
    post_id     int,
    action_date date,
    action      enum('view', 'like', 'reaction', 'comment', 'report', 'share'),
    extra       varchar(255)
);

insert Actions values
(1, 1, '2019-07-01', 'view',    null),
(1, 1, '2019-07-01', 'like',    null),
(1, 1, '2019-07-01', 'share',   null),
(2, 2, '2019-07-04', 'view',    null),
(2, 2, '2019-07-04', 'report', "spam"),
(3, 4, '2019-07-04', 'view',    null),
(3, 4, '2019-07-04', 'report', "spam"),
(4, 3, '2019-07-02', 'view',    null),
(4, 3, '2019-07-02', 'report', "spam"),
(5, 2, '2019-07-03', 'view',    null),
(5, 2, '2019-07-03', 'report', "racism"),
(5, 5, '2019-07-03', 'view',    null),
(5, 5, '2019-07-03', 'report', "racism");

drop table if exists Removals;
create table if not exists Removals(
    post_id      int primary key,
    removal_date date
);

insert Removals values
(2, '2019-07-20'),
(3, '2019-07-18');