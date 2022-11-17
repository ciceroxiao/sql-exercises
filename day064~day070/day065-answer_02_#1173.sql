/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/immediate-food-delivery-i/
 创建者：Cicero
 创建日期：2021-11-15
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 如果顾客期望的配送日期和下单日期相同，则该订单称为「即时订单」，否则称为「计划订单」。
 写一条 SQL 查询语句获取即时订单所占的百分比，结果保留两位小数。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 获取即时订单的数量；
 4.2 获取所有订单的数量；
 4.3 前述两者相除，得到即时订单所占的百分比。
 */
USE sql_daily_exercises;

-- 获取即时订单的数量
SELECT
    COUNT(*) AS num_of_immediate_orders
FROM
    Delivery
WHERE
    customer_pref_delivery_date = order_date;

-- 获取所有订单的数量
-- 前述两者相除，得到即时订单所占的百分比
SELECT
    round(A .num_of_immediate_orders / COUNT(1), 2) AS immediate_percentage
FROM
    Delivery,
    (
        SELECT
            COUNT(*) AS num_of_immediate_orders
        FROM
            Delivery
        WHERE
            customer_pref_delivery_date = order_date
    ) AS A;