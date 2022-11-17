/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/58824cd644ea47d7b2b670c506a159a6?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-24
 修改日期：
 
 Cicero 的解题思路：
 1. 读懂题目要求：找到当前 to_date = '9999-01-01' 的 salary 累和；
 2. 使用窗口函数聚合 salary 即可得到目标数据。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    emp_no,
    salary,
    SUM(salary) over(
        ORDER BY
            emp_no
    ) AS running_total
FROM
    salaries
WHERE
    to_date = '9999-01-01';