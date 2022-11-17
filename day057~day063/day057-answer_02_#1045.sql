/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/customers-who-bought-all-products/
 创建者：Cicero
 创建日期：2021-11-7
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到买下表 Product 中所有商品的客户。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 
 */
USE sql_daily_exercises;

-- 根据各个用户购买的独一无二的商品之数量，找出所有购买这些商品的用户。
SELECT
    customer_id
FROM
    Customer
GROUP BY
    customer_id
HAVING
    COUNT(DISTINCT(product_key)) = (
        SELECT
            COUNT(*)
        FROM
            Product
    );