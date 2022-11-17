/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/rising-temperature/
 创建者：Cicero
 创建日期：2021-10-19
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到次日温度高于前日温度的 id。
 2. 案例：——
 3. 公式：——
 4. 实现：——
 */
USE sql_daily_exercises;

SELECT
    DISTINCT A1.Id
FROM
    Weather AS A1
    JOIN Weather AS A2 ON DATEDIFF(A1.RecordDate, A2.RecordDate) = 1
    AND A1.Temperature > A2.Temperature;

-- LeetCode 上的网友解答：运行速度很快。
-- 原因：不要在 WHERE 中使用函数；DATEDIFF 比 INTERVAL 慢。
SELECT
    cur.Id
FROM
    Weather cur
    JOIN Weather prev ON prev.RecordDate + INTERVAL 1 DAY = cur.RecordDate
WHERE
    cur.Temperature > prev.Temperature;