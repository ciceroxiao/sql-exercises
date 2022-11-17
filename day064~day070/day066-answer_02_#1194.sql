/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/tournament-winners/
 创建者：Cicero
 创建日期：2021-11-16
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 每组的获胜者是每组累计分数最高的选手。如果有多个选手累计分数相同，则按照选手的编号排序，编号较小的选手获胜。
 编写一个 SQL 查询，找出每组的获胜者。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 分组求和：先分别求出各组赛事中每个选手的累计和。
 4.2. 分组排序：再将各组赛事中每个选手的累计和按照累计和降序排序、选手ID升序排序。
 4.3. 分组获胜者：取出每组排第一的选手，即为该组获胜者。
 */
USE sql_daily_exercises;

-- 分组求和：先分别求出各组赛事中每个选手的累计和。
SELECT
    A .group_id,
    A .player_id,
    SUM(
        CASE
            WHEN A .player_id = b.first_player THEN b.first_score
            ELSE b.second_score
        END
    ) AS score
FROM
    Players AS A
    LEFT JOIN Matches AS b ON A .player_id = b.first_player
    OR A .player_id = b.second_player
GROUP BY
    A .group_id,
    A .player_id;

-- 分组排序：再将各组赛事中每个选手的累计和按照累计和降序排序、选手ID升序排序。
SELECT
    C .group_id,
    C .player_id,
    rank() over (
        PARTITION BY C .group_id
        ORDER BY
            C .score DESC,
            C .player_id ASC
    ) AS player_rank
FROM
    (
        SELECT
            A .group_id,
            A .player_id,
            SUM(
                CASE
                    WHEN A .player_id = b.first_player THEN b.first_score
                    ELSE b.second_score
                END
            ) AS score
        FROM
            Players AS A
            LEFT JOIN Matches AS b ON A .player_id = b.first_player
            OR A .player_id = b.second_player
        GROUP BY
            A .group_id,
            A .player_id
    ) AS C;

-- 分组获胜者：取出每组排第一的选手，即为该组获胜者。
SELECT
    d.group_id,
    d.player_id
FROM
    (
        SELECT
            C .group_id,
            C .player_id,
            rank() over (
                PARTITION BY C .group_id
                ORDER BY
                    C .score DESC,
                    C .player_id ASC
            ) AS player_rank
        FROM
            (
                SELECT
                    A .group_id,
                    A .player_id,
                    SUM(
                        CASE
                            WHEN A .player_id = b.first_player THEN b.first_score
                            ELSE b.second_score
                        END
                    ) AS score
                FROM
                    Players AS A
                    LEFT JOIN Matches AS b ON A .player_id = b.first_player
                    OR A .player_id = b.second_player
                GROUP BY
                    A .group_id,
                    A .player_id
            ) AS C
    ) AS d
WHERE
    d.player_rank = 1;