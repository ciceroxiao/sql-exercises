/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/game-play-analysis-v/
 创建者：Cicero
 创建日期：2021-11-10
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：如果当天有新增用户，则找到当日新增用户的数量及其次日留存率。次日留存率保留两位小数。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 先统计各个用户的首日注册日期与次日登录日期，并将结果存入临时表；
 4.2 再按照日期分组，统计每个日期的新增用户数量，并将结果存入临时表；
 4.3 再按照日期分组，统计每个日期的次日留存率，并将结果存入临时表；
 4.4 按要求格式化输出结果。
 */
USE sql_daily_exercises;

-- 先统计各个用户的首日注册日期：只需要统计这些日期的次日留存率
SELECT
    player_id,
    MIN(event_date) AS first_day
FROM
    Activity
GROUP BY
    player_id;

-- 再统计次日登录过的用户
SELECT
    first_day AS install_dt,
    A .player_id,
    b.event_date
FROM
    (
        SELECT
            player_id,
            MIN(event_date) AS first_day
        FROM
            Activity
        GROUP BY
            player_id
    ) AS A
    LEFT JOIN Activity AS b ON A .player_id = b.player_id
    AND A .first_day = b.event_date - 1;

-- 再按照日期分组，统计每个日期的新增用户数量，并将结果存入临时表；
SELECT
    first_day AS install_dt,
    COUNT(1) AS installs
FROM
    (
        SELECT
            player_id,
            MIN(event_date) AS first_day
        FROM
            Activity
        GROUP BY
            player_id
    ) AS A
    LEFT JOIN Activity AS b ON A .player_id = b.player_id
    AND A .first_day = b.event_date + 1
GROUP BY
    A .first_day;

-- 再统计次日留存率
SELECT
    first_day AS install_dt,
    COUNT(1) AS installs,
    round(COUNT(b.player_id) / COUNT(1), 2) AS Day1_retention
FROM
    (
        SELECT
            player_id,
            MIN(event_date) AS first_day
        FROM
            Activity
        GROUP BY
            player_id
    ) AS A
    LEFT JOIN Activity AS b ON A .player_id = b.player_id
    AND A .first_day = b.event_date - 1
GROUP BY
    A .first_day;