/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/page-recommendations/
 创建者：Cicero
 创建日期：2021-11-18
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Friendship;
create table Friendship(
    user1_id      int,
    user2_id      int,
    primary key(user1_id, user2_id)
);
Truncate table Friendship;
insert into Friendship values(1,2);
insert into Friendship values(1,3);
insert into Friendship values(1,4);
insert into Friendship values(2,3);
insert into Friendship values(2,4);
insert into Friendship values(2,5);
insert into Friendship values(6,1);

drop table if exists Likes;
create table Likes(
    user_id       int,
    page_id       int,
    primary key(user_id, page_id)
);
Truncate table Likes;
insert into Likes values(1,88);
insert into Likes values(2,23);
insert into Likes values(3,24);
insert into Likes values(4,56);
insert into Likes values(5,11);
insert into Likes values(6,33);
insert into Likes values(2,77);
insert into Likes values(3,77);
insert into Likes values(6,88);

--核验数据
select * from Friendship;
select * from Likes;