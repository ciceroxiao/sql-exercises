/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 原题链接：https://www.nowcoder.com/practice/51c12cea6a97468da149c04b7ecf362e?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-17
 修改日期：
 */
SHOW DATABASES;

USE sql_daily_exercises;

DROP TABLE IF EXISTS actor;

CREATE TABLE actor (
    actor_id SMALLINT(5) NOT NULL PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    last_update DATETIME NOT NULL
)