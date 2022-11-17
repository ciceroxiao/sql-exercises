/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/ae5e8273e73b4413823b676081bd355c?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-3
 修改日期：
 */
SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists class_grade;
CREATE TABLE class_grade (
grade varchar(32) NOT NULL,
number int(4) NOT NULL
);

INSERT INTO class_grade VALUES
('A',2),
('D',1),
('C',2),
('B',2);