/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/exchange-seats/
 创建者：Cicero
 创建日期：2021-10-13
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：统计好友申请的通过率。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 统计接受好友请求的数量；
 4.2 统计发送好友请求的数量；
 4.3 计算好友通过率。
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 统计接受好友请求的数量
SELECT
    COUNT(DISTINCT requester_id, accepted_id) AS accepted_fre
FROM
    request_accepted;

-- 统计发送好友请求的数量
SELECT
    COUNT(DISTINCT sender_id, send_to_id) AS sent_fre
FROM
    friend_request;

-- 计算好友通过率
SELECT
    IF(
        sent_fre <> 0,
        round(accepted_fre / sent_fre, 2),
        0.00
    ) AS accept_rate
FROM
    (
        SELECT
            COUNT(DISTINCT requester_id, accepted_id) AS accepted_fre
        FROM
            request_accepted
    ) AS A,
    (
        SELECT
            COUNT(DISTINCT sender_id, send_to_id) AS sent_fre
        FROM
            friend_request
    ) AS B;