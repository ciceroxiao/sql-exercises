/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 原题链接：https://www.nowcoder.com/practice/ac233de508ef4849b0eeb4f38dcf09cf?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-17
 
 Cicero 的解题思路：
 */
SHOW DATABASES;

USE sql_daily_exercises;

DROP TABLE IF EXISTS actor;

CREATE TABLE IF NOT EXISTS actor(
    actor_id SMALLINT(5) NOT NULL DEFAULT '0',
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    last_update TIMESTAMP NOT NULL,
    PRIMARY KEY (actor_id)
);