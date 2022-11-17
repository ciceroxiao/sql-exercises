/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/f5fc21a0630b4ca6a25ea3a48054ef47?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-2
 修改日期：
 */
SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists resume_info;
CREATE TABLE resume_info (
id int(4) NOT NULL,
job varchar(64) NOT NULL,
date date NOT NULL,
num int(11) NOT NULL,
PRIMARY KEY (id));

INSERT INTO resume_info VALUES
(1,'C++','2025-01-02',53),
(2,'Python','2025-01-02',23),
(3,'Java','2025-01-02',12),
(4,'Java','2025-02-03',24),
(5,'C++','2025-02-03',23),
(6,'Python','2025-02-03',34),
(7,'Python','2025-03-04',54),
(8,'C++','2025-03-04',65),
(9,'Java','2025-03-04',92),
(10,'Java','2026-01-04',230);