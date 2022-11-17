/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/d3b058dcc94147e09352eb76f93b3274?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-21
 修改日期：
 
 Cicero 的解题思路：
 1. 找到 emp_bonus 中的员工 emp_no；
 2. 更新对应 emp_no 的薪水数据。
 */
SHOW DATABASES;

USE sql_daily_exercises;

UPDATE
    salaries
SET
    salary = salary * 1.1
WHERE
    to_date = "9999-01-01"
        AND
    emp_no IN (
        SELECT
            emp_no
        FROM
            emp_bonus
    );