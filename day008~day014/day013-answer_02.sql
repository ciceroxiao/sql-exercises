/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 原题链接：https://www.nowcoder.com/practice/51c12cea6a97468da149c04b7ecf362e?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-17
 修改日期：
 
 Cicero 的解题思路：
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 请你对于表actor批量插入如下数据(不能有2条insert语句哦!)
INSERT INTO
    actor (actor_id, first_name, last_name, last_update)
VALUES
    (1, "PENELOPE", "GUINESS", "2006-02-15 12:34:33"),
    (2, "NICK", "WAHLBERG", "2006-02-15 12:34:33");