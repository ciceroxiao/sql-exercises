/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/c39cbfbd111a4d92b221acec1c7c1484?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-24
 修改日期：
 
 Cicero 的解题思路：
 1. 找到“未分配具体部门的员工”，即找到有 emp_no、但没有 dept_no 的员工；
 2. 使用 EXISTS 查询目标数据。
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
    employees AS A
WHERE
    NOT EXISTS (
        SELECT
            b.emp_no
        FROM
            dept_emp AS b
        WHERE
            A .emp_no = b.emp_no
    );