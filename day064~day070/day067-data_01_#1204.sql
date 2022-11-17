/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/last-person-to-fit-in-the-bus/
 创建者：Cicero
 创建日期：2021-11-17
 修改日期：2021-11-18
 */

USE sql_daily_exercises;

drop table if exists Queue;
create table Queue(
    person_id   int,
    person_name varchar(20),
    weight      int,
    turn        int,
    primary key(person_id)
);
insert into Queue values(5, 'George Washington', 250, 1);
insert into Queue values(3, 'John Adams',        350, 2);
insert into Queue values(6, 'Thomas Jefferson',  400, 3);
insert into Queue values(2, 'Will Johnliams',    200, 4);
insert into Queue values(4, 'Thomas Jefferson',  175, 5);
insert into Queue values(1, 'James Elephant',    500, 6);