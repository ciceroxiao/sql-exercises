/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/game-play-analysis-iii/
 创建者：Cicero
 创建日期：2021-11-6
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：查询每个用户玩过的游戏数量，随日期累计，先按照用户 id 排序，再按照日期排序
 2. 案例：——
 3. 公式：sum(games_played) over(partition by player_id order by event_date)
 4. 实现：直接使用窗口函数即可。
 */
USE sql_daily_exercises;

SELECT
    player_id,
    event_date,
    SUM(games_played) over(
        PARTITION BY player_id
        ORDER BY
            event_date
    ) AS games_played_so_far
FROM
    Activity
ORDER BY
    player_id,
    event_date;