/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/find-the-team-size/
 创建者：Cicero
 创建日期：2021-11-22
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：编写 SQL 语句，查询每个团队的员工数量。结果以任意顺序返回。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 先找到 team_id 对应的人数；
 4.2. 再连表，查询出每个员工对应 team_id 的人数；
 */
USE sql_daily_exercises;

SELECT
    employee_id,
    team_size
FROM
    Employee AS A
    LEFT JOIN (
        SELECT
            team_id,
            COUNT(1) AS team_size
        FROM
            Employee
        GROUP BY
            team_id
    ) AS b ON A .team_id = b.team_id;