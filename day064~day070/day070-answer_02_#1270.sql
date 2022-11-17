/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/all-people-report-to-the-given-manager/
 创建者：Cicero
 创建日期：2021-11-21
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写 SQL 语句，查询出所有直接或间接向公司 CEO 汇报工作的职工 employee_id。
 由于公司规模较小，经理之间的间接关系不超过 3 个经理。
 可以以任何顺序返回的结果，不需要去重。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：经理之间的间接关系不超过 3 个经理，那么就只需要查询三层子查询即可。
 */
USE sql_daily_exercises;

SELECT
    A .employee_id
FROM
    Employees A,
    Employees b,
    Employees C
WHERE
    A .manager_id = b.employee_id
    AND b.manager_id = C .employee_id
    AND C .manager_id = 1
    AND A .employee_id != 1;