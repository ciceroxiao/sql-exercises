/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/rectangles-area/
 创建者：Cicero
 创建日期：2021-11-29
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Points;
create table if not exists Points (
    id            int,
    x_value       int,
    y_valie       int,
    primary key (id)
);
insert into Points values (1, 2, 7);
insert into Points values (2, 4, 8);
insert into Points values (3, 2, 10);

-- 核验数据
select * from Points;