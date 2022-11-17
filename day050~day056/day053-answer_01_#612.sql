/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/shortest-distance-in-a-plane/
 创建者：Cicero
 创建日期：2021-10-27
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：给定一系列点，求最短距离。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 自连接；
 4.2 先求出所有点之间的距离，再求最小值。
 */
USE sql_daily_exercises;

SELECT
    round(MIN(sqrt(pow(A1.x - A2.x, 2) + pow(A1.y - A2.y, 2))),2) AS shortest
FROM
    point_2d AS A1,
    point_2d AS A2
WHERE
    A1.x <> A2.x
    OR A1.y <> A2.y;