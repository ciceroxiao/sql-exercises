/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 原题链接：https://www.nowcoder.com/practice/881385f388cf4fe98b2ed9f8897846df?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-18
 修改日期：
 
 Cicero 的解题思路：
 */
SHOW DATABASES;

USE sql_daily_exercises;

CREATE TABLE IF NOT EXISTS actor_name(
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL
);

INSERT INTO
    actor_name (first_name, last_name)
SELECT
    actor.first_name,
    actor.last_name
FROM
    actor;