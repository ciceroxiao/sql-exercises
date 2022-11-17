/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/f456dedf88a64f169aadd648491a27c1?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-29
 修改日期：
 */
SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists grade;
CREATE TABLE  grade(
`id` int(4) NOT NULL,
`job` varchar(32) NOT NULL,
`score` int(10) NOT NULL,
PRIMARY KEY (`id`));

INSERT INTO grade VALUES
(1,'C++',11001),
(2,'C++',10000),
(3,'C++',9000),
(4,'Java',12000),
(5,'Java',13000),
(6,'JS',12000),
(7,'JS',11000),
(8,'JS',9999),
(9,'Java',12500);
