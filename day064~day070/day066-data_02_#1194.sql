/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/tournament-winners/
 创建者：Cicero
 创建日期：2021-11-16
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Players;
create table Players(
    player_id int,
    group_id int,
    primary key(player_id)
);
insert into Players values(15,1);
insert into Players values(25,1);
insert into Players values(30,1);
insert into Players values(45,1);
insert into Players values(10,2);
insert into Players values(35,2);
insert into Players values(50,2);
insert into Players values(20,3);
insert into Players values(40,3);

drop table if exists Matches;
create table Matches(
    match_id int,
    first_player int,
    second_player int,
    first_score int,
    second_score int,
    primary key(match_id)
);
insert into Matches values(1,15,45,3,0);
insert into Matches values(2,30,25,1,2);
insert into Matches values(3,30,15,2,0);
insert into Matches values(4,40,20,5,2);
insert into Matches values(5,35,50,1,1);