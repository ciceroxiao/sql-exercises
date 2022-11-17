/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/b83f8b0e7e934d95a56c24f047260d91?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-29
 修改日期：
 */
SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists grade;
drop table if exists language;
CREATE TABLE `grade` (
`id` int(4) NOT NULL,
`language_id` int(4) NOT NULL,
`score` int(4) NOT NULL,
PRIMARY KEY (`id`));

CREATE TABLE `language` (
`id` int(4) NOT NULL,
`name` varchar(32) NOT NULL,
PRIMARY KEY (`id`));

INSERT INTO grade VALUES
(1,1,12000),
(2,1,13000),
(3,2,11000),
(4,2,10000),
(5,3,11000),
(6,1,11000),
(7,2,11000);

INSERT INTO language VALUES
(1,'C++'),
(2,'JAVA'),
(3,'Python');
