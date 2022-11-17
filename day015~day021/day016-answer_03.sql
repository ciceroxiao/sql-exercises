/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/2bec4d94f525458ca3d0ebf3bc8cd240?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
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
    emp_no = REPLACE(emp_no, 10001, 10005)
WHERE
    id = 5;