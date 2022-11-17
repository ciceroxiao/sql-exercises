/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 原题链接：https://www.nowcoder.com/practice/e1824daa0c49404aa602cf0cb34bdd75?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-18
 修改日期：
 
 Cicero 的解题思路：
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 创建唯一索引 
CREATE UNIQUE INDEX uniq_idx_firstname ON actor(first_name);

-- 创建普通索引 
CREATE INDEX idx_lastname ON actor(last_name);