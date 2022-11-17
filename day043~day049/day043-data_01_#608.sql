/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/tree-node/
 创建者：Cicero
 创建日期：2021-10-17
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists tree;

create table if not exists tree(
    id int(2),
    p_id int(2)
);

insert into tree (id, p_id) values (1, null);
insert into tree (id, p_id) values (2, 1);
insert into tree (id, p_id) values (3, 1);
insert into tree (id, p_id) values (4, 2);
insert into tree (id, p_id) values (5, 2);