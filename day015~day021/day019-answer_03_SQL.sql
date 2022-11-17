/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/f24966e0cb8a49c192b5e65339bc8c03?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-23
 修改日期：
 
 Cicero 的解题思路：
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
FROM
    employees
LIMIT
    5 offset 5;