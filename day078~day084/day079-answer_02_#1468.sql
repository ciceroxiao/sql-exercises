/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/calculate-salaries/
 创建者：Cicero
 创建日期：2021-11-29
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写一个 SQL 语句，查询每个员工的税后工资。
 每个公司的税率计算方式如下：
 - 如果员工的最高工资不到 1000，则税率为 0%；
 - 如果员工的最高工资在 1000 到 10000 之间，则税率为 24%；
 - 如果员工的最高工资大于 10000，则税率为 49%。
 结果以任意顺序排列。税后工资取整。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 使用 case when 即可实现。
 */
USE sql_daily_exercises;

-- 使用临时表，查询每个员工的税后工资。
WITH salary_tax_rate AS (
    SELECT
        company_id,
        employee_id,
        employee_name,
        CASE
            WHEN MAX(salary) < 1000 THEN 0
            WHEN MAX(salary) >= 1000
            AND MAX(salary) < 10000 THEN 0.24
            WHEN MAX(salary) >= 10000 THEN 0.49
        END AS tax_rate
    FROM
        Salaries
    GROUP BY
        company_id
)
SELECT
    A .company_id,
    A .employee_id,
    A .employee_name,
    round(A .salary - A .salary * tax_rate) AS salary
FROM
    Salaries AS A
    LEFT JOIN salary_tax_rate AS b ON A .company_id = b.company_id;

-- 使用子查询，查询每个员工的税后工资。
SELECT
    A .company_id,
    A .employee_id,
    A .employee_name,
    round(A .salary - A .salary * b.tax_rate) AS salary
FROM
    Salaries AS A
    LEFT JOIN (
        SELECT
            company_id,
            CASE
                WHEN MAX(salary) < 1000 THEN 0
                WHEN MAX(salary) >= 1000
                AND MAX(salary) < 10000 THEN 0.24
                WHEN MAX(salary) >= 10000 THEN 0.49
            END AS tax_rate
        FROM
            Salaries
        GROUP BY
            company_id
    ) AS b ON A .company_id = b.company_id;