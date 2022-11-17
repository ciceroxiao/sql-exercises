/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/6e86365af15e49d8abe2c3d4b5126e87?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-23
 修改日期：
 
 Cicero 的解题思路：
 1. 使用 GROUP BY 按照 dept_no 进行汇总；
 2. 其次使用 GROUP_CONCAT 拼接字段 emp_no。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    dept_no,
    GROUP_CONCAT(emp_no SEPARATOR ',') AS employees
FROM
    dept_emp
GROUP BY
    dept_no;