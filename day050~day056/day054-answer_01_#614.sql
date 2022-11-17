/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/second-degree-follower/
 创建者：Cicero
 创建日期：2021-10-28
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找出 follower 的 follower 数量。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1. 查询 follower 中出现在 followee；
 4.2. 使用 GROUP BY 分组，COUNT() 计算出 follower 的 follower 数量。
 */
USE sql_daily_exercises;

SELECT
    a1.followee,
    COUNT(1) AS num
FROM
    follow AS a1
    CROSS JOIN follow AS a2 ON a1.followee = a2.follower
GROUP BY
    a1.followee;