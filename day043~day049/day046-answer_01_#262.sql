/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/trips-and-users/
 创建者：Cicero
 创建日期：2021-10-20
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到，在 2013-10-01~2013-10-03 期间，每天由 unbanned user 取消的“订单取消率”。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 先去除数据中 banned users 参与的订单；
 4.2 再选出 2013-10-01~2013-10-03 期间的订单；
 4.3 标记所选数据中的 cancelled 订单；
 4.4 以日期分组，统计各日的“订单取消率”。
 
 */
USE sql_daily_exercises;

-- 去除数据中有 banned user 参与的订单
SELECT
    Client_Id,
    Driver_Id,
    Status,
    Request_at
FROM
    Trips AS A
WHERE
    A.Client_Id not in (select Users_Id FROM Users where Banned = 'Yes')
        and
    A.Driver_Id not in (select Users_Id FROM Users where Banned = 'Yes');

-- 标记 cancelled 订单
SELECT
    Client_Id,
    Driver_Id,
    Status,
    Request_at,
    IF(Status <> "completed", 1, 0) AS Flag
FROM
    Trips AS A
WHERE
    A.Client_Id not in (select Users_Id FROM Users where Banned = 'Yes')
        and
    A.Driver_Id not in (select Users_Id FROM Users where Banned = 'Yes');

-- 以日期分组，统计各日的“订单取消率”
-- 在 LeetCode 上，这个方法超过 24.78%
SELECT
    DISTINCT Request_at AS "Day",
    round(
        SUM(Flag) over (PARTITION BY Request_at) / COUNT(*) over (PARTITION BY Request_at),
        2
    ) AS "Cancellation Rate"
FROM
    (
        SELECT
            Client_Id,
            Driver_Id,
            Status,
            Request_at,
            IF(Status <> "completed", 1, 0) AS Flag
        FROM
            Trips AS A
        WHERE
            A.Client_Id not in (select Users_Id FROM Users where Banned = 'Yes')
                and
            A.Driver_Id not in (select Users_Id FROM Users where Banned = 'Yes')
    ) AS A
WHERE
    Request_at BETWEEN '2013-10-01'
    AND '2013-10-03'
ORDER BY
    Request_at;


-- 新尝试：在 LeetCode 上，这个方法超过 70.46%
SELECT
    DISTINCT Request_at AS "Day",
    round(
        SUM(Flag) over (PARTITION BY Request_at) / COUNT(*) over (PARTITION BY Request_at),
        2
    ) AS "Cancellation Rate"
FROM
    (
        SELECT
            Client_Id,
            Driver_Id,
            Status,
            Request_at,
            IF(Status <> "completed", 1, 0) AS Flag
        FROM
            Trips AS A
        WHERE
            A.Client_Id not in (select Users_Id FROM Users where Banned = 'Yes')
                and
            A.Driver_Id not in (select Users_Id FROM Users where Banned = 'Yes')
                AND
            A.Request_at BETWEEN '2013-10-01' AND '2013-10-03'
    ) AS A;
