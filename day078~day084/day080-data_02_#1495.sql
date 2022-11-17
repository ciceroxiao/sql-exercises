/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/friendly-movies-streamed-last-month/
 创建者：Cicero
 创建日期：2021-11-30
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists TVProgram;
create table if not exists TVProgram (
    program_date    date,
    content_id      int,
    channel         varchar(10),
    primary key (program_date, content_id)
);
drop table if exists Content;
create table if not exists Content (
    content_id      int,
    title           varchar(50),
    Kids_content    enum('Y', 'N'),
    content_type    varchar(10),
    primary key (content_id)
);
insert into TVProgram (program_date, content_id, channel) values ('2020-06-10 08:00', '1', 'LC-Channel');
insert into TVProgram (program_date, content_id, channel) values ('2020-05-11 12:00', '2', 'LC-Channel');
insert into TVProgram (program_date, content_id, channel) values ('2020-05-12 12:00', '3', 'LC-Channel');
insert into TVProgram (program_date, content_id, channel) values ('2020-05-13 14:00', '4', 'Disney Ch');
insert into TVProgram (program_date, content_id, channel) values ('2020-06-18 14:00', '4', 'Disney Ch');
insert into TVProgram (program_date, content_id, channel) values ('2020-07-15 16:00', '5', 'Disney Ch');
insert into Content (content_id, title, Kids_content, content_type) values ('1', 'Leetcode Movie',  'N', 'Movies');
insert into Content (content_id, title, Kids_content, content_type) values ('2', 'Alg. for Kids',   'Y', 'Series');
insert into Content (content_id, title, Kids_content, content_type) values ('3', 'Database Sols',   'N', 'Series');
insert into Content (content_id, title, Kids_content, content_type) values ('4', 'Aladdin',         'Y', 'Movies');
insert into Content (content_id, title, Kids_content, content_type) values ('5', 'Cinderella',      'Y', 'Movies');

-- 核验数据
select * from TVProgram;
select * from Content;
