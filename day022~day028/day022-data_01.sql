/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
语言运行环境：MySQL 8.0
原题链接：https://www.nowcoder.com/practice/9dd9182d029a4f1d8c1324b63fc719c9?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-26
修改日期：
*/


SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists person;
drop table if exists task;
CREATE TABLE `person` (
`id` int(4) NOT NULL,
`name` varchar(32) NOT NULL,
PRIMARY KEY (`id`));

CREATE TABLE `task` (
`id` int(4) NOT NULL,
`person_id` int(4) NOT NULL,
`content` varchar(32) NOT NULL,
PRIMARY KEY (`id`));

INSERT INTO person VALUES
(1,'fh'),
(2,'tm');

INSERT INTO task VALUES
(1,2,'tm works well'),
(2,2,'tm works well');
