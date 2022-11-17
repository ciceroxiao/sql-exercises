/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/students-with-invalid-departments/
 创建者：Cicero
 创建日期：2021-11-24
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：编写 SQL 语句，查询那些所在院系不存在的学生的 id 和 name。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：两表联查，再找到指定条件的数据即可。
 */
USE sql_daily_exercises;

SELECT
    s.id,
    s.name
FROM
    Students s
    LEFT JOIN Departments d ON s.department_id = d.id
WHERE
    d.id IS NULL;
-- 以上代码是 Github Copilot 自动生成的代码。