/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/classes-more-than-5-students/
 创建者：Cicero
 创建日期：2021-10-24
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到学生数量大于等于 5 的课程；
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 使用 GROUP BY()、以 class 分组；
 4.2 使用 HAVING(COUNT(DISTINCT student)) 过滤数据即可。
 PS：这里必须要用 COUNT(DISTINCT student)，因为学生可能重复登记或出现 NULL 值。
 */
USE sql_daily_exercises;

SELECT
    class
FROM
    courses
GROUP BY
    class
HAVING
    COUNT(DISTINCT student) >= 5;