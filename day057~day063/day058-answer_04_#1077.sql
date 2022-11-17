/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/project-employees-iii/
 创建者：Cicero
 创建日期：2021-11-8
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到各个项目中、工作年龄最大的员工。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 先找到工作年龄最大的员工；
 4.2 再连表，在各个项目中找到工作年龄最大的员工。
 */
USE sql_daily_exercises;

-- 使用“表连接”的方式，找到工作年龄最大的员工。
-- 先找到各个项目中最大工作年龄；
SELECT
    a1.project_id,
    MAX(b1.experience_years) AS max_experience_years
FROM
    Project AS a1
    JOIN Employee AS b1 ON a1.employee_id = b1.employee_id
GROUP BY
    project_id;

-- 再找到各个项目中最大工作年龄所对应的的员工；
SELECT
    a2.project_id,
    a2.employee_id
FROM
    Project AS a2
    JOIN Employee AS b2 ON a2.employee_id = b2.employee_id
WHERE
    (a2.project_id, b2.experience_years) IN (
        SELECT
            a1.project_id,
            MAX(b1.experience_years) AS max_experience_years
        FROM
            Project AS a1
            JOIN Employee AS b1 ON a1.employee_id = b1.employee_id
        GROUP BY
            project_id
    );