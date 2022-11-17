/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/article-views-i/
 创建者：Cicero
 创建日期：2021-11-13
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到至少读过一次自己文章的用户。结果以 author_id 升序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：先使用 where 语句找到结果，再使用 group by 去重，最后使用 order by 升序排列。
 */
USE sql_daily_exercises;

SELECT
    author_id AS id
FROM
    VIEWS
WHERE
    author_id = viewer_id
GROUP BY
    id
ORDER BY
    id