/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/market-analysis-i/
 创建者：Cicero
 创建日期：2021-11-14
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：编写一个 SQL 语句，找到每位用户的注册日期以及他们在 2019 年作为买家的订单总数。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 */
USE sql_daily_exercises;

-- 先找到每位用户的注册日期
SELECT
    user_id,
    join_date
FROM
    Users;

-- 再找到每位用户在 2019 年作为买家的订单总数
SELECT
    buyer_id,
    COUNT(IF(order_date IS NULL, 0, 1)) AS orders_in_2019
FROM
    Orders
WHERE
    YEAR(order_date) = '2019'
GROUP BY
    buyer_id;

-- 最后，将两个结果进行 join
SELECT
    A .user_id AS buyer_id,
    A .join_date,
    SUM(IF(b.order_date IS NOT NULL, 1, 0)) AS orders_in_2019
FROM
    Users AS A
    LEFT JOIN Orders AS b ON A .user_id = b.buyer_id
    AND YEAR(b.order_date) = 2019
GROUP BY
    A .user_id,
    A .join_date;