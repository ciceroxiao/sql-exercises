/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/rectangles-area/
 创建者：Cicero
 创建日期：2021-11-29
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写一个 SQL 语句，查询由表中任意两点可以形成的所有矩形。
 结果表中的每一行包含三列，其含义如下：
 - p1 和 p2 是矩形的两个对角的 id，且 p1 < p2；
 - area 表示矩形的面积；
 结果按照面积降序排列。如果有多个矩形面积相同，则按照 p1 和 p2 升序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 只要 p1 和 p2 的 x 坐标或 y 坐标不相同，就可以形成一个矩形；
 4.2. 使用 where 过滤掉不符合条件的点；
 4.3. 结果按照面积降序排列。如果有多个矩形面积相同，则按照 p1 和 p2 升序排列。
 */
USE sql_daily_exercises;

SELECT
    a1.id AS p1,
    a2.id AS p2,
    abs(
        (a1.x_value - a2.x_value) * (a1.y_valie - a2.y_valie)
    ) AS area
FROM
    Points a1,
    Points a2
WHERE
    a1.id < a2.id
    AND abs(
        (a1.x_value - a2.x_value) * (a1.y_valie - a2.y_valie)
    ) > 0
ORDER BY
    area DESC,
    p1 ASC,
    p2 ASC;