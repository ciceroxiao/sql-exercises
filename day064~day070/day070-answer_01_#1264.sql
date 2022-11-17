/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/page-recommendations/
 创建者：Cicero
 创建日期：2021-11-21
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：编写 SQL 语句，向 user_id = 1 的用户推荐其好友喜欢的页面。不要推荐该用户已经喜欢的页面。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 先找到 user_id = 1 的用户的好友列表。
 4.2. 再根据其好友列表，找到其好友喜欢的页面。
 4.3. 再从其好友喜欢的页面中删去 user_id = 1 已经喜欢的页面。
 4.4. 最后，结果去重。
 */
USE sql_daily_exercises;

-- 4.1. 先找到 user_id = 1 的用户的好友列表。
SELECT
    user2_id
FROM
    Friendship
WHERE
    user1_id = 1
UNION
SELECT
    user1_id
FROM
    Friendship
WHERE
    user2_id = 1;

-- 4.2. 再根据其好友列表，找到其好友喜欢的页面。
SELECT
    page_id
FROM
    Likes AS A
    LEFT JOIN (
        SELECT
            user2_id
        FROM
            Friendship
        WHERE
            user1_id = 1
        UNION
        SELECT
            user1_id
        FROM
            Friendship
        WHERE
            user2_id = 1
    ) AS b ON A .user_id = b.user2_id;

-- 4.3. 再从其好友喜欢的页面中删去 user_id = 1 已经喜欢的页面。
SELECT
    A .page_id
FROM
    Likes AS A
    LEFT JOIN (
        SELECT
            user2_id
        FROM
            Friendship
        WHERE
            user1_id = 1
        UNION
        SELECT
            user1_id
        FROM
            Friendship
        WHERE
            user2_id = 1
    ) AS b ON A .user_id = b.user2_id,
    (
        SELECT
            page_id
        FROM
            Likes
        WHERE
            user_id = 1
    ) AS C
WHERE
    A .page_id <> C .page_id;

-- 4.4. 最后，结果去重。
SELECT
    A .page_id
FROM
    Likes AS A
    RIGHT JOIN (
        SELECT
            user2_id AS user_id
        FROM
            Friendship
        WHERE
            user1_id = 1
        UNION
        SELECT
            user1_id AS user_id
        FROM
            Friendship
        WHERE
            user2_id = 1
    ) AS b ON A .user_id = b.user_id
WHERE
    A .page_id NOT IN (
        SELECT
            page_id
        FROM
            Likes
        WHERE
            user_id = 1
    )
GROUP BY
    A .page_id;