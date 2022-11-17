/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
语言运行环境：MySQL 8.0
原题链接：https://www.nowcoder.com/practice/cd2e10a588dc4c1db0407d0bf63394f3?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-25
修改日期：
*/


SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists passing_number;
CREATE TABLE `passing_number` (
`id` int(4) NOT NULL,
`number` int(4) NOT NULL,
PRIMARY KEY (`id`));

INSERT INTO passing_number VALUES
(1,4),
(2,3),
(3,3),
(4,2),
(6,4),
(5,5);
