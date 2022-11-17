/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/859f28f43496404886a77600ea68ef59?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-20
 修改日期：
 
 Cicero 的解题思路：
 */
SHOW DATABASES;

USE sql_daily_exercises;

UPDATE
    titles_test
SET
    to_date = NULL,
    from_date = '2001-01-01'
WHERE
    to_date = '9999-01-01';