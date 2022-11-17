/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/restaurant-growth/
 创建者：Cicero
 创建日期：
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 你是餐馆主人。你想知道你的餐馆每天的可能营业增长（假设每天至少有一位顾客）
 编写一个 SQL 查询，计算出以 7 天（当前日期 + 该日期的前 6 天）的顾客平均消费额。
 查询结果的格式如题目示例。
 结果以 visited_on 排序。
 average_amount 应该保留两位小数，所有的日期格式为“YYYY-MM-DD”。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 先统计每天的顾客总消费额；
 4.2. 再将日期以 7 天为单位分组，求每组的总消费额和平均值；
 */
USE sql_daily_exercises;

-- 先统计每天的顾客总消费额；
SELECT
    visited_on,
    SUM(amount) AS every_day_amount
FROM
    Customer
GROUP BY
    visited_on
ORDER BY
    visited_on;

-- 再将日期以 7 天为单位分组，求每组的总消费额和平均值；
SELECT
    visited_on,
    SUM(every_day_amount) over(
        ORDER BY
            visited_on rows 6 preceding
    ) AS total_amount,
    AVG(every_day_amount) over(
        ORDER BY
            visited_on rows 6 preceding
    ) AS average_amount
FROM
    (
        SELECT
            visited_on,
            SUM(amount) AS every_day_amount
        FROM
            Customer
        GROUP BY
            visited_on
        ORDER BY
            visited_on
    ) AS A;

-- 按题目要求格式化输出；
SELECT
    visited_on,
    total_amount AS amount,
    round(average_amount, 2) AS average_amount
FROM
    (
        SELECT
            visited_on,
            SUM(every_day_amount) over(
                ORDER BY
                    visited_on rows 6 preceding
            ) AS total_amount,
            AVG(every_day_amount) over(
                ORDER BY
                    visited_on rows 6 preceding
            ) AS average_amount
        FROM
            (
                SELECT
                    visited_on,
                    SUM(amount) AS every_day_amount
                FROM
                    Customer
                GROUP BY
                    visited_on
                ORDER BY
                    visited_on
            ) AS A
    ) AS b
WHERE
    -- 确保从第 7 天开始；
    DATEDIFF(
        visited_on,
        (
            SELECT
                MIN(visited_on)
            FROM
                Customer
        )
    ) >= 6;