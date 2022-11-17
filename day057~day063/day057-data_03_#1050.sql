/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/
 创建者：Cicero
 创建日期：2021-11-7
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists ActorDirector;
truncate table ActorDirector;
create table if not exists ActorDirector(
    actor_id int,
    director_id int,
    timestamp int);
insert into ActorDirector values(1,1,0);
insert into ActorDirector values(1,1,1);
insert into ActorDirector values(1,1,2);
insert into ActorDirector values(1,2,3);
insert into ActorDirector values(1,2,4);
insert into ActorDirector values(2,1,5);
insert into ActorDirector values(2,1,6);