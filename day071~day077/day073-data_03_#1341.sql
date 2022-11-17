/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/movie-rating/
 创建者：Cicero
 创建日期：2021-11-23
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Movies;
drop table if exists Users;
drop table if exists Movie_Rating;
create table if not exists Movies(
    movie_id int,
    title varchar(255),
    primary key (movie_id)
);
create table if not exists Users(
    user_id int,
    name varchar(255),
    primary key (user_id)
);
create table if not exists Movie_Rating(
    movie_id int,
    user_id int,
    rating int,
    created_at date,
    primary key (movie_id, user_id)
);
truncate table Movies;
truncate table Users;
truncate table Movie_Rating;
insert into Movies (movie_id, title) values ('1', 'Avengers');
insert into Movies (movie_id, title) values ('2', 'Frozen 2');
insert into Movies (movie_id, title) values ('3', 'Joker');
insert into Users (user_id, name) values ('1', 'Daniel');
insert into Users (user_id, name) values ('2', 'Monica');
insert into Users (user_id, name) values ('3', 'Maria');
insert into Users (user_id, name) values ('4', 'James');
insert into Movie_Rating (movie_id, user_id, rating, created_at) values ('1', '1', '3', '2020-01-12');
insert into Movie_Rating (movie_id, user_id, rating, created_at) values ('1', '2', '4', '2020-02-11');
insert into Movie_Rating (movie_id, user_id, rating, created_at) values ('1', '3', '2', '2020-02-12');
insert into Movie_Rating (movie_id, user_id, rating, created_at) values ('1', '4', '1', '2020-01-01');
insert into Movie_Rating (movie_id, user_id, rating, created_at) values ('2', '1', '5', '2020-02-17');
insert into Movie_Rating (movie_id, user_id, rating, created_at) values ('2', '2', '2', '2020-02-01');
insert into Movie_Rating (movie_id, user_id, rating, created_at) values ('2', '3', '2', '2020-03-01');
insert into Movie_Rating (movie_id, user_id, rating, created_at) values ('3', '1', '3', '2020-02-22');
insert into Movie_Rating (movie_id, user_id, rating, created_at) values ('3', '2', '4', '2020-02-25');

-- 核验数据
select * from Movies;
select * from Users;
select * from Movie_Rating;