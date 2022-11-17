/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/the-most-recent-orders-for-each-product/
 创建者：Cicero
 创建日期：2021-12-2
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 写一个 SQL 语句, 找到每件商品的最新订单(可能有多个)。
 返回的结果以 product_name 升序排列, 如果有排序相同, 再以 product_id 升序排列。如果还有排序相同, 再以 order_id 升序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 这题与 #1532 的思路是一样的。
 */
USE sql_daily_exercises;

SELECT
    product_name,
    product_id,
    order_id,
    order_date
FROM
    (
        SELECT
            product_name,
            A .product_id,
            order_id,
            order_date,
            rank() over (
                PARTITION BY product_name
                ORDER BY
                    order_date DESC
            ) AS order_rank
        FROM
            Orders AS A
            LEFT JOIN Products AS b ON A .product_id = b.product_id
    ) AS C
WHERE
    order_rank = 1
ORDER BY
    product_name,
    product_id,
    order_id;