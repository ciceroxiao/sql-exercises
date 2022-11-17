/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/game-play-analysis-ii/
 创建者：Cicero
 创建日期：
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到每位玩家初次登录所使用的设备。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1. 先使用 GROUP BY(player_id, event_date) 排序；
 4.2. 再联结表，查询出每位玩家的设备；
 4.3. 最后使用 WHERE 条件过滤，过滤出每位玩家的第一次登录的设备。
 */
USE sql_daily_exercises;

-- 先找到每位玩家初次登录的日期
SELECT
    player_id,
    device_id,
    MIN(event_date) AS first_login
FROM
    Activity
GROUP BY
    player_id;

-- 联结表，再使用 WHERE 条件过滤出每位玩家的第一次登录的设备
SELECT
    A .player_id,
    A .device_id,
    A .event_date
FROM
    Activity AS A
    LEFT JOIN (
        SELECT
            player_id,
            device_id,
            MIN(event_date) AS first_login
        FROM
            Activity
        GROUP BY
            player_id
    ) AS b ON A .player_id = b.player_id
WHERE
    A .event_date = b.first_login;