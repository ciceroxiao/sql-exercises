/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/e524dc7450234395aa21c75303a42b0a?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-27
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：找到每日新登录用户。
 2. 步骤：
 2.1 先找到每个用户首次登陆的日期；
 2.2 再按日期，分别打印每个日期里新用户的数量；
 2.3 由于答案要求显示没有新用户的日期，因此，自联结以得到每个日期的新用户数量。
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 找到每位用户第一次登陆的日期
SELECT
    user_id,
    MIN(DATE) AS first_login
FROM
    login
GROUP BY
    user_id;

-- 自联结后，再按日期对数据分组
SELECT
    A .date,
    COUNT(DISTINCT(b.user_id)) AS nums
FROM
    login AS A
    LEFT JOIN (
        SELECT
            user_id,
            MIN(DATE) AS first_login
        FROM
            login
        GROUP BY
            user_id
    ) AS b ON A .date = b.first_login
GROUP BY
    A .date;