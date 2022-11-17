/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/game-play-analysis-i/
 创建者：Cicero
 创建日期：2021-11-6
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到每位玩家的首次登录日期。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 使用 GROUP BY 分组，求出每个玩家的首次登录日期。
 */
USE sql_daily_exercises;

SELECT
    player_id,
    MIN(event_date) AS first_login
FROM
    Activity
GROUP BY
    1
ORDER BY
    1;