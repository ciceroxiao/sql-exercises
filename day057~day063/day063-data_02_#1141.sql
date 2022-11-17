/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/user-activity-for-the-past-30-days-i/
 创建者：Cicero
 创建日期：2021-11-13
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Movies;
create table Movies(
    movie_id int primary key,
    title    varchar(255)
);
insert into Movies values(1, 'Avengers');
insert into Movies values(2, 'Frozen 2');
insert into Movies values(3, 'Joker');

drop table if exists Users;
create table Users(
    user_id int primary key,
    name    varchar(255)
);
insert into Users values(1, 'Daniel');
insert into Users values(2, 'Monica');
insert into Users values(3, 'Maria');
insert into Users values(4, 'James');

drop table if exists Movie_Rating;
create table Movie_Rating(
    movie_id int,
    user_id int,
    rating  int,
    created_at date,
    primary key(user_id, movie_id)
);
insert into Movie_Rating values(1, 1, 3, '2020-01-12');
insert into Movie_Rating values(1, 2, 4, '2020-02-11');
insert into Movie_Rating values(1, 3, 2, '2020-02-12');
insert into Movie_Rating values(1, 4, 1, '2020-01-01');
insert into Movie_Rating values(2, 1, 5, '2020-02-17');
insert into Movie_Rating values(2, 2, 2, '2020-02-01');
insert into Movie_Rating values(2, 3, 2, '2020-03-01');
insert into Movie_Rating values(3, 1, 3, '2020-02-22');
insert into Movie_Rating values(3, 2, 4, '2020-02-25');
