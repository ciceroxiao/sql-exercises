/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/article-views-ii/
 创建者：Cicero
 创建日期：2021-11-13
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Views;
create table Views(
    article_id int,
    author_id int,
    viewer_id int,
    view_date date
);
insert into Views values(1,3,5,'2019-08-01');
insert into Views values(3,4,5,'2019-08-01');
insert into Views values(1,3,6,'2019-08-02');
insert into Views values(2,7,7,'2019-08-01');
insert into Views values(2,7,6,'2019-08-02');
insert into Views values(4,7,1,'2019-07-22');
insert into Views values(3,4,4,'2019-07-21');
insert into Views values(3,4,4,'2019-07-21');