/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
语言运行环境：MySQL 8.0
原题链接：https://www.nowcoder.com/practice/572a027e52804c058e1f8b0c5e8a65b4?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-28
修改日期：
*/


SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists login;
drop table if exists passing_number;
drop table if exists user;
drop table if exists client;
CREATE TABLE `login` (
`id` int(4) NOT NULL,
`user_id` int(4) NOT NULL,
`client_id` int(4) NOT NULL,
`date` date NOT NULL,
PRIMARY KEY (`id`));

CREATE TABLE `passing_number` (
`id` int(4) NOT NULL,
`user_id` int(4) NOT NULL,
`number` int(4) NOT NULL,
`date` date NOT NULL,
PRIMARY KEY (`id`));

CREATE TABLE `user` (
`id` int(4) NOT NULL,
`name` varchar(32) NOT NULL,
PRIMARY KEY (`id`));

CREATE TABLE `client` (
`id` int(4) NOT NULL,
`name` varchar(32) NOT NULL,
PRIMARY KEY (`id`));

INSERT INTO login VALUES
(1,2,1,'2020-10-12'),
(2,3,2,'2020-10-12'),
(3,1,2,'2020-10-12'),
(4,1,3,'2020-10-13'),
(5,3,2,'2020-10-13');

INSERT INTO passing_number VALUES
(1,2,4,'2020-10-12'),
(2,3,1,'2020-10-12'),
(3,1,0,'2020-10-13'),
(4,3,2,'2020-10-13');

INSERT INTO user VALUES
(1,'tm'),
(2,'fh'),
(3,'wangchao');

INSERT INTO client VALUES
(1,'pc'),
(2,'ios'),
(3,'anroid'),
(4,'h5');
