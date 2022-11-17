/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
 创建者：Cicero
 创建日期：2021-10-13
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到至少有 5 个 direct report 的部门经理。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 先统计各个 Manager 的 direct report 的数量；
 4.2 再找到至少有 5 个 direct report 的 ManagerId。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    NAME
FROM
    Employee AS A
    INNER JOIN (
        SELECT
            ManagerId
        FROM
            Employee
        GROUP BY
            ManagerId
        HAVING
            COUNT(ManagerId) >= 5
    ) AS b ON A .Id = b.ManagerId;