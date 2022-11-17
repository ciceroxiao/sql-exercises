/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/not-boring-movies/
 创建者：Cicero
 创建日期：2021-10-28
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到：id 为奇数、description 不是 boring 的电影，结果以 rating 降序排列。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 先使用 WHERE 语句过滤；
 4.2 再使用 ORDER BY 语句排序。
 */
USE sql_daily_exercises;

SELECT
    id,
    movie,
    description,
    rating
FROM
    cinema
WHERE
    id % 2 = 1
    AND description <> 'boring'
ORDER BY
    rating DESC;