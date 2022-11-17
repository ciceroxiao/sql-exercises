/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/project-employees-i/
 创建者：Cicero
 创建日期：2021-11-8
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到各项目中所有员工的平均工作年龄，保留两位小数。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 先连表，找到各项目中各个员工的工作年龄，并统计各项目的员工总数；
 4.2 再分组，找到各项目的平均工作年龄，并保留两位小数。
 */
USE sql_daily_exercises;

SELECT
    project_id,
    round(AVG(experience_years), 2) AS average_years
FROM
    Project AS A
    JOIN Employee AS b ON A .employee_id = b.employee_id
GROUP BY
    project_id;