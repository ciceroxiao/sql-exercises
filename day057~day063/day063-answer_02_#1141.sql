/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/user-activity-for-the-past-30-days-i/
 创建者：Cicero
 创建日期：2021-11-13
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 1.1. 找到评价电影数量最多的用户。如果有多个用户评价电影数量一样多，则取按字典序排序最小的用户。
 1.2. 在 2020 年 February 中，找到电影平均评分最高的电影。如果有多个电影平均评分一样高，则取按字典序排序最小的电影。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 此题分两步解决：
 4.1. 找到评价电影数量最多的用户。
 4.2. 找到电影平均评分最高的电影。
 最后使用 union 来求并集即可。
 */
USE sql_daily_exercises;

-- 找到评价电影数量最多的用户。
SELECT
    A .name results
FROM
    Users AS A
    LEFT JOIN Movie_Rating AS b ON A .user_id = b.user_id
GROUP BY
    A .user_id
ORDER BY
    COUNT(b.rating) DESC,
    A .name
LIMIT
    1;

-- 找到电影平均评分最高的电影。
SELECT
    C .title
FROM
    Movies AS C
    LEFT JOIN Movie_Rating AS b2 ON C .movie_id = b2.movie_id
WHERE
    left(b2.created_at, 7) = '2020-02'
GROUP BY
    C .movie_id
ORDER BY
    AVG(b2.rating) DESC,
    C .title
LIMIT
    1;

-- 使用 union 来求并集。
(
    SELECT
        A .name results
    FROM
        Users AS A
        LEFT JOIN Movie_Rating AS b ON A .user_id = b.user_id
    GROUP BY
        A .user_id
    ORDER BY
        COUNT(b.rating) DESC,
        A .name
    LIMIT
        1
)
UNION
(
    SELECT
        C .title
    FROM
        Movies AS C
        LEFT JOIN Movie_Rating AS b2 ON C .movie_id = b2.movie_id
    WHERE
        left(b2.created_at, 7) = '2020-02'
    GROUP BY
        C .movie_id
    ORDER BY
        AVG(b2.rating) DESC,
        C .title
    LIMIT
        1
);