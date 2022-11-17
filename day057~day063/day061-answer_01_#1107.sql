/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/new-users-daily-count/
 创建者：Cicero
 创建日期：2021-11-11
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：假设今日是 2019-06-30。找到近 90 日之内，有新增用户的日期及其新增用户数量。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 先筛选数据：属于新增用户的数据；90 日以内的数据；
 4.2 再统计数据：按照日期分组，统计新增用户数量；
 */
USE sql_daily_exercises;

-- 先筛选数据：属于新增用户的数据；90 日以内的数据；
SELECT
    user_id,
    activity,
    MIN(activity_date) AS min_date
FROM
    Traffic
GROUP BY
    user_id
HAVING
    date_sub("2019-06-30", INTERVAL 90 DAY) <= min_date;

-- 再统计数据：按照日期分组，统计新增用户数量；
SELECT
    min_date AS login_date,
    COUNT(user_id) AS user_count
FROM
    (
        SELECT
            user_id,
            activity,
            MIN(activity_date) AS min_date
        FROM
            Traffic
        GROUP BY
            user_id
        HAVING
            date_sub("2019-06-30", INTERVAL 90 DAY) <= min_date
    ) AS A
GROUP BY
    min_date;