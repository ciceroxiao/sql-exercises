/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
语言运行环境：MySQL 8.0
原题链接：https://www.nowcoder.com/practice/d6dd656483b545159d3aa89b4c26004e?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-26
修改日期：
*/


SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists email;
drop table if exists user;
CREATE TABLE `email` (
`id` int(4) NOT NULL,
`send_id` int(4) NOT NULL,
`receive_id` int(4) NOT NULL,
`type` varchar(32) NOT NULL,
`date` date NOT NULL,
PRIMARY KEY (`id`));

CREATE TABLE `user` (
`id` int(4) NOT NULL,
`is_blacklist` int(4) NOT NULL,
PRIMARY KEY (`id`));

INSERT INTO email VALUES
(4,3,1,'no_completed','2020-01-12'),
(5,3,4,'completed','2020-01-12'),
(6,4,1,'completed','2020-01-12');


INSERT INTO user VALUES
(1,0),
(2,1),
(3,0),
(4,0);
