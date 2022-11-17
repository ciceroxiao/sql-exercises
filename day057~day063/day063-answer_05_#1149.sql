/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/article-views-ii/
 创建者：Cicero
 创建日期：2021-11-13
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到“在同一时期内，浏览文章次数不止一次的用户”。结果以 viewer_id 升序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 先以 viewer_id, view_date 为分组键，统计每个用户在每天浏览文章的次数。
 4.2 再找到在每个日期里浏览文章的次数大于 1 的用户。
 */
USE sql_daily_exercises;

-- 先以 viewer_id, view_date 为分组键，统计每个用户在每天浏览文章的次数。
SELECT
    viewer_id,
    view_date,
    COUNT(DISTINCT article_id) AS view_count
FROM
    VIEWS
GROUP BY
    viewer_id,
    view_date;

-- 再找到在每个日期里浏览文章的次数大于 1 的用户。
SELECT
    viewer_id as id
FROM
    (
        SELECT
            viewer_id,
            view_date,
            COUNT(DISTINCT article_id) AS view_count
        FROM
            VIEWS
        GROUP BY
            viewer_id,
            view_date
    ) AS A
WHERE
    A .view_count > 1
ORDER BY
    viewer_id;