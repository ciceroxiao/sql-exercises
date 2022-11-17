/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/shortest-distance-in-a-line/
 创建者：Cicero
 创建日期：2021-10-26
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：给定多个点，求最短距离
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 交叉连接：比较非自身值以外的值的差值；
 4.2 找到 min(abs(x1-x2)) 即可。
 */
USE sql_daily_exercises;

-- 自连接
SELECT
    MIN(abs(A1.x - A2.x)) AS shortest
FROM
    point AS A1,
    point AS A2
WHERE
    A1.x <> A2.x;

SELECT
    A1.x,
    A2.x
FROM
    point AS A1
        cross join
    point AS A2
WHERE
    A1.x <> A2.x;