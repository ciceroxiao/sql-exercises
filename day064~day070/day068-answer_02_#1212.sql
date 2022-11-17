/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/team-scores-in-football-tournament/
 创建者：Cicero
 创建日期：2021-11-18
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 积分规则：
 - 在一场比赛中，如果某支球队进球数量大于对手进球数量，则该支球队获得3分；
 - 在一场比赛中，如果某支球队进球数量等于对手进球数量，则该支球队获得1分；
 - 在一场比赛中，如果某支球队进球数量小于对手进球数量，则该支球队获得0分。
 编写一个 SQL 查询，查询出每只球队的 team_id、team_name 和 num_points。
 结果按照 num_points 降序排序。如果有多个球队的 num_points 相同，则按照 team_id 升序排序。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 先连表，查询出每个球队的 team_id 和 team_name；
 4.2. 再根据积分规则，使用 case when 语句，查询出每个球队的 num_points；
 4.3. 最后，按照 num_points 降序排序，再按照 team_id 升序排序。
 */
USE sql_daily_exercises;

-- 查询出每个球队的 team_id 和 team_name；
SELECT
    A .team_id,
    A .team_name,
    SUM(
        CASE
            WHEN A .team_id = b.host_team
            AND b.host_goals > b.guest_goals THEN 3
            WHEN A .team_id = b.host_team
            AND b.host_goals = b.guest_goals THEN 1
            WHEN A .team_id = b.host_team
            AND b.host_goals < b.guest_goals THEN 0
            WHEN A .team_id = b.guest_team
            AND b.host_goals < b.guest_goals THEN 3
            WHEN A .team_id = b.guest_team
            AND b.host_goals = b.guest_goals THEN 1
            WHEN A .team_id = b.guest_team
            AND b.host_goals > b.guest_goals THEN 0
            ELSE 0
        END
    ) AS num_points
FROM
    Teams AS A
    LEFT JOIN Matches AS b ON A .team_id = b.host_team
    OR A .team_id = b.guest_team
GROUP BY
    A .team_id,
    A .team_name
ORDER BY
    num_points DESC,
    A .team_id ASC;