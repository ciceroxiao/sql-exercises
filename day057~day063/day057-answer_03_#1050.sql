/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/
 创建者：Cicero
 创建日期：2021-11-7
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到至少合作过三次的演员和导演。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 先使用 GROUP BY 分组，然后再使用 HAVING COUNT(1) >= 3 来判断。
 */
USE sql_daily_exercises;

SELECT
    actor_id,
    director_id
FROM
    ActorDirector
GROUP BY
    actor_id,
    director_id
HAVING
    COUNT(1) >= 3;