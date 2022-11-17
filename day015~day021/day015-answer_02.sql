/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/119f04716d284cb7a19fba65dd876b03?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-19
 修改日期：
 
 Cicero 的解题思路：
 */
SHOW DATABASES;

USE sql_daily_exercises;

ALTER TABLE
    actor
ADD
    column create_date datetime NOT NULL DEFAULT '2020-10-01 00:00:00' after last_update;
