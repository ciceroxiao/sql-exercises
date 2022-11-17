/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/running-total-for-different-genders/
 创建者：Cicero
 创建日期：2021-11-22
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Scores;
create table Scores(
    player_name     varchar(20),
    gender          varchar(20),
    day             date,
    score_points    int,
    primary key(gender, day)
);
insert into Scores values("Aron",       "F", "2020-01-01", 17);
insert into Scores values("Alice",      "F", "2020-01-07", 23);
insert into Scores values("Bajrang",    "M", "2020-01-07", 7);
insert into Scores values("Khali",      "M", "2019-12-25", 11);
insert into Scores values("Slaman",     "M", "2019-12-30", 13);
insert into Scores values("Joe",        "M", "2019-12-31", 3);
insert into Scores values("Jose",       "M", "2019-12-18", 2);
insert into Scores values("Priya",      "F", "2019-12-31", 23);
insert into Scores values("Priyanka",   "F", "2019-12-30", 17);

-- 核验数据
select * from Scores;