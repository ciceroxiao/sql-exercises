/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/number-of-comments-per-post/
 创建者：Cicero
 创建日期：2021-11-18
 修改日期：
 */


USE sql_daily_exercises;

drop table if Exists Submissions;
Create table If Not Exists Submissions (sub_id int, parent_id int);
Truncate table Submissions;
insert into Submissions (sub_id, parent_id) values ('1', NULL);
insert into Submissions (sub_id, parent_id) values ('2', NULL);
insert into Submissions (sub_id, parent_id) values ('1', NULL);
insert into Submissions (sub_id, parent_id) values ('12', NULL);
insert into Submissions (sub_id, parent_id) values ('3', '1');
insert into Submissions (sub_id, parent_id) values ('5', '2');
insert into Submissions (sub_id, parent_id) values ('3', '1');
insert into Submissions (sub_id, parent_id) values ('4', '1');
insert into Submissions (sub_id, parent_id) values ('9', '1');
insert into Submissions (sub_id, parent_id) values ('10', '2');
insert into Submissions (sub_id, parent_id) values ('6', '7');

-- 核验数据
select * from Submissions;