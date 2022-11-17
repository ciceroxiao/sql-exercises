/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/83f84aa5c32b4cf5a75558d02dd7743c?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-3
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
(4,'C++','2025-01-03',54),
(5,'Python','2025-01-03',43),
(6,'Java','2025-01-03',41),
(7,'Java','2025-02-03',24),
(8,'C++','2025-02-03',23),
(9,'Python','2025-02-03',34),
(10,'Java','2025-02-04',42),
(11,'C++','2025-02-04',45),
(12,'Python','2025-02-04',59),
(13,'C++','2026-01-04',230),
(14,'Java','2026-01-04',764),
(15,'Python','2026-01-04',644),
(16,'C++','2026-01-06',240),
(17,'Java','2026-01-06',714),
(18,'Python','2026-01-06',624),
(19,'C++','2026-02-14',260),
(20,'Java','2026-02-14',721),
(21,'Python','2026-02-14',321),
(22,'C++','2026-02-24',134),
(23,'Java','2026-02-24',928),
(24,'Python','2026-02-24',525),
(25,'C++','2027-02-06',231);