/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/consecutive-numbers/
 创建者：Cicero
 创建日期：2021-10-11
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询至少连续出现 3 次的数字；
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 直接自连接三次，找到对应 Id 和 Num 相等的数据
-- 不足：扩展性差。如果要查询连续十次的数据，那该怎么办呢？
SELECT
    DISTINCT a1.Num AS ConsecutiveNums
FROM
    Logs AS a1,
    Logs AS a2,
    Logs AS a3
WHERE
    a1.Id = a2.Id -1
    AND a2.Id = a3.Id -1
    AND a1.Num = a2.Num
    AND a2.Num = a3.Num;

-- 更有扩展性的答案：这是个典型的“gaps-and-islands”问题。
-- 这是 LeetCode 上 @siyu14 的答案，Cicero 个人的理解附在这个答案下面。
SELECT
    DISTINCT b.num AS consecutiveNums
FROM
    (
        SELECT
            A .id,
            A .num,
            SUM(A .C) over (
                ORDER BY
                    id
            ) AS flag
        FROM
            (
                SELECT
                    id,
                    num,
                    LAG(Num) OVER (
                        ORDER BY
                            id
                    ) AS lag_data,
                    CASE
                        WHEN LAG(Num) OVER (
                            ORDER BY
                                id
                        ) - Num = 0 THEN 0
                        ELSE 1
                    END AS C
                FROM
                    logs
            ) A
    ) b
GROUP BY
    b.num,
    b.flag
HAVING
    COUNT(*) >= 3;

-- Cicero 的理解
-- 找到 island 和 gap
SELECT
    id,
    num,
    CASE
        WHEN num - lag(Num) over(
            ORDER BY
                id
        ) = 0 THEN 0
        ELSE 1
    END AS island_flag
FROM
    logs;

-- “分岛”，将各组连续数字分块。使用窗口函数 SUM()，使得同一“岛屿”的数字拥有同样的 flag
SELECT
    A .id,
    A .num,
    SUM(A .island_flag) over(
        ORDER BY
            A .id
    ) AS flag
FROM
    (
        SELECT
            id,
            num,
            CASE
                WHEN num - lag(Num) over(
                    ORDER BY
                        id
                ) = 0 THEN 0
                ELSE 1
            END AS island_flag
        FROM
            logs
    ) AS A;

-- 按题目要求，找到至少连续出现三次以上的数字。记得去重。
SELECT
    DISTINCT b.num AS consecutiveNums
FROM
    (
        SELECT
            A .id,
            A .num,
            SUM(A .island_flag) over(
                ORDER BY
                    A .id
            ) AS flag
        FROM
            (
                SELECT
                    id,
                    num,
                    CASE
                        WHEN num - lag(Num) over(
                            ORDER BY
                                id
                        ) = 0 THEN 0
                        ELSE 1
                    END AS island_flag
                FROM
                    logs
            ) AS A
    ) AS b
GROUP BY
    b.num,
    b.flag
HAVING
    COUNT(*) >= 3;