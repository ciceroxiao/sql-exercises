/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/
 创建者：Cicero
 创建日期：2021-10-26
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到好友数量最多的用户，并且返回其好友数量。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 UNION ALL 
 4.2 GROUP BY 关键字：id
 4.3 COUNT(*) 关键字：好友数量
 4.4 LIMIT 1 关键字：只返回一个结果
 */
USE sql_daily_exercises;

SELECT
    id,
    COUNT(*) AS num
FROM
    (
        SELECT
            requester_id AS id
        FROM
            request_accepted
        UNION
        ALL
        SELECT
            accepter_id
        FROM
            request_accepted
    ) AS A
GROUP BY
    id
ORDER BY
    num DESC
LIMIT
    1;