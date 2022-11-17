/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
语言运行环境：MySQL 8.0
原题链接：https://www.nowcoder.com/practice/c69ac94335744480aa50646864b7f24d?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-25
修改日期：
*/


SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists grade;
CREATE TABLE `grade` (
`id` int(4) NOT NULL,
`number` int(4) NOT NULL,
PRIMARY KEY (`id`));

INSERT INTO grade VALUES
(1,111),
(2,333),
(3,111),
(4,111),
(5,333);
