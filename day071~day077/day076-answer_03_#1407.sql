/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/top-travellers/
 创建者：Cicero
 创建日期：2021-11-26
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写 SQL 语句，以找到每个用户的旅行距离。
 返回的结果以 travelled_distance 降序排序。如果有不止一个用户旅行了相同距离，则按 name 升序排序。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 先按 user_id 统计每个用户的旅行距离 travelled_distance，并以 travelled_distance 降序排序；
 4.2. 再连表查询每个 user_id 的 name，并以 name 升序排序；
 */
USE sql_daily_exercises;

SELECT
    u.name,
    ifnull(SUM(r.distance), 0) AS travelled_distance
FROM
    Users u
    LEFT JOIN Rides r ON u.id = r.user_id
GROUP BY
    u.id
ORDER BY
    travelled_distance DESC,
    u.name ASC;