/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/user-purchase-platform/
 创建者：Cicero
 创建日期：2021-11-12
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：按照日期，找到每种 platform 的购买人数及其购买总额。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 此题的核心是：找到 "both" 的数据。
 4.2 先给各行数据贴上“mobile”、“desktop”和“both”的标签；
 4.3 再按照日期，将各类的数据分组、求和和计数。
 */
USE sql_daily_exercises;

-- 先按照 user_id 和 spend_date 找到属于 both 的数据；
SELECT
    user_id,
    spend_date,
    IF(total_count > 1, 'both', platform) AS platform,
    amount
FROM
    (
        SELECT
            user_id,
            spend_date,
            COUNT(user_id) AS total_count,
            platform,
            SUM(amount) AS amount
        FROM
            Spending
        GROUP BY
            user_id,
            spend_date
    ) AS A;

-- 再按照日期，塑造每个日期的 platform。
SELECT
    DISTINCT spend_date,
    'mobile' AS platform
FROM
    Spending
UNION
SELECT
    DISTINCT spend_date,
    'desktop' AS platform
FROM
    Spending
UNION
SELECT
    DISTINCT spend_date,
    'both' AS platform
FROM
    Spending;

-- 再连接上面两个表，按照日期，找到每种 platform 的购买人数及其购买总额。
SELECT
    b.spend_date,
    b.platform,
    ifnull(SUM(d.amount), 0) AS amount,
    count(d.user_id) AS total_count
FROM
    (
        SELECT
            DISTINCT spend_date,
            'mobile' AS platform
        FROM
            Spending
        UNION
        SELECT
            DISTINCT spend_date,
            'desktop' AS platform
        FROM
            Spending
        UNION
        SELECT
            DISTINCT spend_date,
            'both' AS platform
        FROM
            Spending
    ) AS b
    LEFT JOIN (
        SELECT
            user_id,
            spend_date,
            IF(total_count > 1, 'both', platform) AS platform,
            amount
        FROM
            (
                SELECT
                    user_id,
                    spend_date,
                    COUNT(user_id) AS total_count,
                    platform,
                    SUM(amount) AS amount
                FROM
                    Spending
                GROUP BY
                    user_id,
                    spend_date
            ) AS A
    ) AS d ON d.spend_date = b.spend_date
    AND d.platform = b.platform
GROUP BY
    b.spend_date,
    b.platform
order by
    b.spend_date;