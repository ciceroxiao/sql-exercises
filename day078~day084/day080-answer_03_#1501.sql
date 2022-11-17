/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/countries-you-can-safely-invest-in/
 创建者：Cicero
 创建日期：2021-11-30
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写 SQL 语句，查询该公司可以投资的国家。
 结果以任意顺序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 可以投资的国家：某国家的平均通话时长 > 全球平均通话时长。
 4.2. 按 country_code 统计各个国家的平均通话时长；
 4.3. 统计全球平均通话时长；
 4.4. 找到可以投资的国家。
 */
USE sql_daily_exercises;

-- 统计各个国家的平均通话时长；
SELECT
    b.name,
    AVG(calls.duration) AS avg_duration
FROM
    Person AS A
    LEFT JOIN Country AS b ON substr(A .phone_number, 1, 3) = b.country_code
    LEFT JOIN calls ON A .id = calls.caller_id
    OR A .id = calls.callee_id
GROUP BY
    b.name;

-- 统计全球平均通话时长：
SELECT
    (SUM(DURATION) * 2) / (COUNT(*) * 2) AS avg_duration
FROM
    Calls;

-- 可以投资的国家：
SELECT
    b.name
FROM
    Person AS A
    LEFT JOIN Country AS b ON substr(A .phone_number, 1, 3) = b.country_code
    LEFT JOIN calls ON A .id = calls.caller_id
    OR A .id = calls.callee_id
GROUP BY
    b.name
HAVING
    AVG(calls.duration) > (
        SELECT
            (SUM(DURATION) * 2) / (COUNT(*) * 2) AS avg_duration
        FROM
            Calls
    );