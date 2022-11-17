/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/game-play-analysis-iv/
 创建者：Cicero
 创建日期：2021-11-9
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到首日登录过、次日又登录过的用户之比例。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 先找到所有的用户数量；
 4.2 再找到次日又登录过的用户数量；
 4.3 最后计算出首日登录过、次日又登录过的用户之比例。
 */
USE sql_daily_exercises;

-- 先找到所有的用户数量；
SELECT
    COUNT(DISTINCT player_id) AS total_user_count
FROM
    Activity;

-- 再找到次日又登录过的用户数量；
SELECT
    a1.player_id,
    a1.event_date,
    a2.event_date,
    COUNT(DISTINCT a2.player_id) AS login_count
FROM
    Activity AS a1
    JOIN Activity AS a2 ON a1.player_id = a2.player_id
    AND a1.event_date = DATE_ADD(a2.event_date, INTERVAL 1 DAY);

-- 最后计算出首日登录过、次日又登录过的用户之比例。
SELECT
    round(
        COUNT(DISTINCT a2.player_id) / (
            SELECT
                COUNT(DISTINCT player_id)
            FROM
                Activity
        ),
        2
    ) AS fraction
FROM
    Activity AS a1
    JOIN Activity AS a2 ON a1.player_id = a2.player_id
    AND a1.event_date = DATE_ADD(a2.event_date, INTERVAL 1 DAY);