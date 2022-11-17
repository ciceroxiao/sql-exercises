/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/consecutive-available-seats/
 创建者：Cicero
 创建日期：2021-10-11
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：找到数据中连续出现 cinema.free = 1 的 cinema.seat_id。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：此题和 #180 是同类题，但此题又有不同，可以取巧。
 4.1 明确需求：此题的目的是找到 ciname.free 连续为 1 的 cinema.seat_id；
 4.2 自连接，找到表 a1 的某个 seat 前或后的 seat 值为 1 的seat.
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    DISTINCT a1.seat_id
FROM
    cinema AS a1
    LEFT JOIN cinema AS a2 ON abs(a1.seat_id - a2.seat_id) = 1 -- 保证是某个 seat 的前或后的 seat
WHERE
    a1.free = 1
    AND a2.free = 1
ORDER BY
    a1.seat_id;