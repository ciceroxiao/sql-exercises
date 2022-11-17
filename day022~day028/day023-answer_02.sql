/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/16d41af206cd4066a06a3a0aa585ad3d?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-27
 修改日期：
 
 Cicero 的解题思路：
 1. 确认需求：找到次日成功的留存率。即，找到首次登录后、次日又登录过的用户的频率。
 2. 思路：
 2.1 先找到 user_A 第一次登录的日期 date_1；
 2.2 拍段 user_A 次日是否登录过；
 2.3 如果 user_A 次日登录过，那么视 user_A 为成功留存用户；否则不是。
 2.4 确定用户总数；
 2.5 按照需求要求的格式输出数据。
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 找到每个用户首次登录的日期
SELECT
    user_id,
    MIN(DATE) AS the_first_time
FROM
    login
GROUP BY
    user_id
ORDER BY
    user_id;

-- 找到每个用户首次登录的次日
SELECT
    user_id,
    date_add(MIN(DATE), INTERVAL 1 DAY) AS the_second_time
FROM
    login
GROUP BY
    user_id
ORDER BY
    user_id;

-- 如果某个用户在次日也登录过，那么此用户即为留存成功的用户
SELECT
    user_id,
    DATE
FROM
    login
WHERE
    (user_id, DATE) IN (
        SELECT
            user_id,
            date_add(MIN(DATE), INTERVAL 1 DAY) AS the_second_time
        FROM
            login
        GROUP BY
            user_id
        ORDER BY
            user_id
    );

-- 计算次日留存成功的用户的频率
SELECT
    round(
        COUNT(user_id) / (
            SELECT
                COUNT(DISTINCT user_id)
            FROM
                login
        ),
        3
    ) AS Frequency
FROM
    login
WHERE
    (user_id, DATE) IN (
        SELECT
            user_id,
            date_add(MIN(DATE), INTERVAL 1 DAY) AS the_second_time
        FROM
            login
        GROUP BY
            user_id
        ORDER BY
            user_id
    );