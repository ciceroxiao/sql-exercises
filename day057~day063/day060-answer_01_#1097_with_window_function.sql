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
 4.1 使用 LEAD() 函数，找到每个用户的首日注册日期与次日登录日期，并将结果存入临时表；
 4.2 找到次日登录过的用户数据；
 4.3 再以 event_date 分组，统计每个日期的新增用户数量与次日留存率。
 */
USE sql_daily_exercises;

-- 使用 LEAD() 函数，找到每个用户的首日注册日期与次日登录日期，并将结果存入临时表；
SELECT
    player_id,
    event_date,
    LEAD(event_date) OVER (
        PARTITION BY player_id
        ORDER BY
            event_date
    ) AS next_event_date
FROM
    Activity;

-- 找到次日登录过的用户数据
SELECT
    player_id,
    MIN(event_date),
    IF(
        datediff(next_event_date, event_date) = 1,
        next_event_date,
        NULL
    ) AS next_event_date
FROM
    (
        SELECT
            player_id,
            event_date,
            LEAD(event_date) OVER (
                PARTITION BY player_id
                ORDER BY
                    event_date
            ) AS next_event_date
        FROM
            Activity
    ) AS tmp
GROUP BY
    player_id;

-- 再以 event_date 分组，统计每个日期的新增用户数量与次日留存率
SELECT
    install_dt,
    COUNT(1) AS installs,
    ROUND(
        COUNT(
            IF(
                next_event_date IS NOT NULL,
                1,
                NULL
            )
        ) / COUNT(1),
        2
    ) AS retention
FROM
    (
        SELECT
            player_id,
            MIN(event_date) as install_dt,
            IF(
                datediff(next_event_date, event_date) = 1,
                next_event_date,
                NULL
            ) AS next_event_date
        FROM
            (
                SELECT
                    player_id,
                    event_date,
                    LEAD(event_date) OVER (
                        PARTITION BY player_id
                        ORDER BY
                            event_date
                    ) AS next_event_date
                FROM
                    Activity
            ) AS tmp
        GROUP BY
            player_id
    ) AS tmp2
GROUP BY
    install_dt;