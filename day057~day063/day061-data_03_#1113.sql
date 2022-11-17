/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/reported-posts/
 创建者：Cicero
 创建日期：2021-11-11
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Actions;
truncate table Actions;
create table if not exists Actions(
    user_id     int,
    post_id     int,
    action_date date,
    action      enum('view', 'like', 'reaction', 'comment', 'report', 'share'),
    extra       varchar(255)
);

insert Actions values(1, 1, '2019-07-01', 'view',   null);
insert Actions values(1, 1, '2019-07-01', 'like',   null);
insert Actions values(1, 1, '2019-07-01', 'share',  null);
insert Actions values(2, 4, '2019-07-04', 'view',   null);
insert Actions values(2, 4, '2019-07-04', 'report', "spam");
insert Actions values(3, 4, '2019-07-04', 'view',   null);
insert Actions values(3, 4, '2019-07-04', 'report', "spam");
insert Actions values(4, 3, '2019-07-02', 'view',   null);
insert Actions values(4, 3, '2019-07-02', 'report', "spam");
insert Actions values(5, 2, '2019-07-04', 'view',   null);
insert Actions values(5, 2, '2019-07-04', 'report', "racism");
insert Actions values(5, 5, '2019-07-04', 'view',   null);
insert Actions values(5, 5, '2019-07-04', 'report', "racism");