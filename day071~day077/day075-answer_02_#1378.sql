/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
 创建者：Cicero
 创建日期：2021-11-25
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
        写一段SQL查询来展示每位用户的唯一标识码（unique ID）；如果某位员工没有唯一标识码，使用 null 填充即可。
        结果以任意顺序返回。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：连表即可。
 */
USE sql_daily_exercises;

SELECT
    b.unique_id,
    A .name
FROM
    Employees A
    LEFT JOIN EmployeeUNI b ON A .id = b.id;