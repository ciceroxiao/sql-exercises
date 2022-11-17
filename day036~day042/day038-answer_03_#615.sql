/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/average-salary-departments-vs-company/
 创建者：Cicero
 创建日期：2021-10-12
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：比较部门的平均工资和公司的平均工资，对应的返回 higher/lower/same。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 先连表、格式化日期以得到规范数据
SELECT
    date_format(A .pay_date, "%Y-%m") AS pay_month,
    A .employee_id,
    b.department_id,
    A .amount
FROM
    salary AS A
    LEFT JOIN employee AS b ON A .employee_id = b.employee_id;

-- 再使用窗口函数找到对应的部门平均工资、公司平均工资
SELECT
    date_format(A .pay_date, "%Y-%m") AS pay_month,
    b.department_id,
    AVG(A .amount) over(PARTITION BY date_format(A .pay_date, "%Y-%m")) AS company_avg,
    AVG(A .amount) over(
        PARTITION BY date_format(A .pay_date, "%Y-%m"),
        department_id
    ) AS department_avg
FROM
    salary AS A
    LEFT JOIN employee AS b ON A .employee_id = b.employee_id;

-- 最后，比较部门平均工资和公司平均工资
SELECT
    pay_month,
    department_id,
    (
        CASE
            WHEN department_avg > company_avg THEN "higher"
            WHEN department_avg = company_avg THEN "same"
            ELSE "lower"
        END
    ) AS comparison
FROM
    (
        SELECT
            DISTINCT date_format(A .pay_date, "%Y-%m") AS pay_month,
            b.department_id,
            AVG(A .amount) over(PARTITION BY date_format(A .pay_date, "%Y-%m")) AS company_avg,
            AVG(A .amount) over(
                PARTITION BY date_format(A .pay_date, "%Y-%m"),
                department_id
            ) AS department_avg
        FROM
            salary AS A
            LEFT JOIN employee AS b ON A .employee_id = b.employee_id
    ) AS C
ORDER BY
    pay_month DESC;