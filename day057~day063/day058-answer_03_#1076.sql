/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/project-employees-ii/
 创建者：Cicero
 创建日期：2021-11-8
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到员工数量最多的项目。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：直接分组计数即可。
 */
USE sql_daily_exercises;

SELECT
    project_id
FROM
    Project
GROUP BY
    project_id
HAVING
    COUNT(project_id) = (
        SELECT
            COUNT(DISTINCT employee_id) AS max_employee_count
        FROM
            Project
        GROUP BY
            project_id
        ORDER BY
            max_employee_count DESC
        LIMIT
            1
    );