/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/user-activity-for-the-past-30-days-ii/
 创建者：Cicero
 创建日期：2021-11-13
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 找到每位用户在过去 30 天内的平均 sessions 数，截止到 2019-07-27（包含）。
 数据保留两位小数。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 过滤数据：限定日期为 2019-07-27 及以前30天的数据；
 4.2. 计数。
 */
USE sql_daily_exercises;

-- 找到每位用户在过去 30 天内的平均 sessions 数，截止到 2019-07-27（包含）。
SELECT
    user_id,
    session_id
FROM
    Activity
WHERE
    date_sub("2019-07-27", INTERVAL 29 DAY) <= DATE(activity_date);

-- 计数。
SELECT
    round(
        ifnull(
            COUNT(DISTINCT session_id) / COUNT(DISTINCT user_id),
            0
        ),
        2
    ) AS average_sessions_per_user
FROM
    Activity
WHERE
    date_sub("2019-07-27", INTERVAL 29 DAY) <= DATE(activity_date);