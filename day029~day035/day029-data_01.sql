/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/d323a4c97d1945e0aabe94e4d0bbb25d?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-3
 修改日期：
 */s
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
(4,'C++','2025-01-03',54),
(5,'Python','2025-01-03',43),
(6,'Java','2025-01-03',41),
(7,'Java','2025-02-03',24),
(8,'C++','2025-02-03',23),
(9,'Python','2025-02-03',34),
(10,'Java','2025-02-04',42),
(11,'C++','2025-02-04',45),
(12,'Python','2025-02-04',59),
(13,'Python','2025-03-04',54),
(14,'C++','2025-03-04',65),
(15,'Java','2025-03-04',92),
(16,'Python','2025-03-05',34),
(17,'C++','2025-03-05',34),
(18,'Java','2025-03-05',34),
(19,'Python','2026-01-04',230),
(20,'C++','2026-02-06',231);