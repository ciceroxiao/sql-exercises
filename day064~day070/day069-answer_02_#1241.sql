/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/number-of-comments-per-post/
 创建者：Cicero
 创建日期：2021-11-21
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写 SQL 语句以查找每个帖子的评论数。
 结果表应包含帖子的 post_id 和对应的评论数 number_of_comments 并且按 post_id 升序排列。
 Submissions 可能包含重复的评论。您应该计算每个帖子的唯一评论数。
 Submissions 可能包含重复的帖子。您应该将它们视为一个帖子。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 先根据 parent_id 找到帖子的 sub_id；
 4.2. 再连表，找到每个帖子的评论数。
 */
USE sql_daily_exercises;

-- 先根据 parent_id 找到帖子的 sub_id；
SELECT
    sub_id
FROM
    Submissions
WHERE
    parent_id IS NULL
GROUP BY
    sub_id;

-- 再连表，找到每个帖子的评论数。
SELECT
    A .sub_id,
    COUNT(DISTINCT b.sub_id) AS number_of_comments
FROM
    (
        SELECT
            sub_id
        FROM
            Submissions
        WHERE
            parent_id IS NULL
        GROUP BY
            sub_id
    ) AS A
    LEFT JOIN Submissions AS b ON A .sub_id = b.parent_id
GROUP BY
    A .sub_id
ORDER BY
    A .sub_id;