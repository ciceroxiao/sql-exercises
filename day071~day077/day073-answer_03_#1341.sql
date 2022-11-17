/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/movie-rating/
 创建者：Cicero
 创建日期：2021-11-23
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 - 查找评论电影数量最多的用户。如果有多个用户评论数量相同，则按照词典序取靠前的用户名。
 - 查找在 2020 年 2 月平均评分最高的电影。如果有多个电影平均评分相同，则按照词典序取靠前的电影名。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 查找评论电影数量最多的用户；
 4.2. 查找在 2020 年 2 月平均评分最高的电影；
 4.3. 使用 union 联结数据。
 */
USE sql_daily_exercises;

-- 查找评论电影数量最多的用户。
SELECT
    C .name AS results
FROM
    Users AS C
    LEFT JOIN Movie_rating AS b ON C .user_id = b.user_id
GROUP BY
    b.user_id
ORDER BY
    COUNT(b.user_id) DESC,
    C .name ASC
LIMIT
    1;

-- 查找在 2020 年 2 月平均评分最高的电影。
SELECT
    C .title AS results
FROM
    Movies AS C
    LEFT JOIN Movie_Rating AS b ON C .movie_id = b.movie_id
WHERE
    date_format(b.created_at, '%Y-%m') = '2020-02'
GROUP BY
    b.movie_id
ORDER BY
    AVG(b.rating) DESC,
    C .title ASC
LIMIT
    1;

-- 使用 union 联结数据。
(
    SELECT
        C .name AS results
    FROM
        Users AS C
        LEFT JOIN Movie_rating AS b ON C .user_id = b.user_id
    GROUP BY
        b.user_id
    ORDER BY
        COUNT(b.user_id) DESC,
        C .name ASC
    LIMIT
        1
)
UNION
(
    SELECT
        C .title AS results
    FROM
        Movies AS C
        LEFT JOIN Movie_Rating AS b ON C .movie_id = b.movie_id
    WHERE
        date_format(b.created_at, '%Y-%m') = '2020-02'
    GROUP BY
        b.movie_id
    ORDER BY
        AVG(b.rating) DESC,
        C .title ASC
    LIMIT
        1
);