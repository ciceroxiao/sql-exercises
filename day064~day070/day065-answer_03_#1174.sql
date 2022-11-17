/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/immediate-food-delivery-ii/
 创建者：Cicero
 创建日期：2021-11-15
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 如果顾客期望的配送日期和下单日期相同，则该订单称为 「即时订单」，否则称为「计划订单」。
 「首次订单」是顾客最早创建的订单。我们保证一个顾客只会有一个「首次订单」。
 写一条 SQL 查询语句获取即时订单在所有用户的首次订单中的比例。保留两位小数。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 找到每位用户的「首次订单」及其数量；
 4.2 找到每位用户的「首次订单」中的「即时订单」及其数量；
 4.3 前述两者相除，得到「即时订单」在「首次订单」中的比例。
 */
USE sql_daily_exercises;

-- 找到每位用户的「首次订单」；
SELECT
    customer_id,
    MIN(order_date) AS first_order_date
FROM
    Delivery
GROUP BY
    customer_id;

-- 找到每位用户的「首次订单」中的「即时订单」及其数量；
-- 前述两者相除，得到「即时订单」在「首次订单」中的比例。
SELECT
    round(
        SUM(
            IF(order_date = customer_pref_delivery_date, 1, 0)
        ) / COUNT(1) * 100,
        2
    ) AS immediate_percentage
FROM
    Delivery
WHERE
    (customer_id, order_date) IN (
        SELECT
            customer_id,
            MIN(order_date) AS first_order_date
        FROM
            Delivery
        GROUP BY
            customer_id
    );