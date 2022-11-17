/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/c93d2079282f4943a3771ca6fd081c23?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-1
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：2025-10-15 以后，成功购买 2 次或 2 次以上课程的 user_id；前述所求 user_id 对应的第一次成功购买相关课程的日期、购买相关课程的次数。
 2. 案例：见题目。
 3. 公式：核心公式：MIN(date)、COUNT(1)
 4. 实现：
 4.1 先使用 WHERE 语句筛选出符合要求的数据：
    4.1.1 date > '2025-10-15'
    4.1.2 status = 'completed'
    4.1.3 product_id IN ('C++', 'Java', 'Python')
4.2 其次，使用 GROUP BY user_id 对用户分组；
4.3 再其次，使用 MIN(date) 得到用户初次成功购买相关课程的日期；使用 COUNT(1) 计算用户成功购买相关课程的总次数。
4.4 最后，将数据按照 ORDER BY user_id ASC 排序。
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 先使用 WHERE 筛选数据
SELECT
    id,
    user_id,
    product_name,
    status,
    client_id,
    DATE
FROM
    order_info
WHERE
    DATE > '2025-10-15'
    AND status = 'completed'
    AND product_name IN ('C++', 'Java', 'Python');

-- 其次，使用 GROUP BY 统计符合要求的 user_id
SELECT
    user_id,
    MIN(DATE) AS first_buy_date,
    COUNT(1) AS cnt
FROM
    order_info
WHERE
    DATE > '2025-10-15'
    AND status = 'completed'
    AND product_name IN ('C++', 'Java', 'Python')
GROUP BY
    user_id
HAVING
    COUNT(1) >= 2
ORDER BY
    user_id ASC;