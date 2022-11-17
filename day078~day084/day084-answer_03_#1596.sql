/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/the-most-frequently-ordered-products-for-each-customer/
 创建者：Cicero
 创建日期：2021-12-4
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 写一个 SQL 语句，找到每一个顾客最经常订购的商品。
 结果表单应该有每一位至少下过一次单的顾客 customer_id , 他最经常订购的商品的 product_id 和 product_name。
 结果以任意顺序返回。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 根据表 Orders、使用窗口函数 rank() 来获取每个顾客订购各个产品的频率；
 4.2. 再找到每个顾客最经常订购的商品：rank() = 1。
 */
USE sql_daily_exercises;

SELECT
    customer_id,
    product_id,
    product_name
FROM
    (
        SELECT
            A .customer_id,
            A .product_id,
            b.product_name,
            rank() over (
                PARTITION BY customer_id
                ORDER BY
                    COUNT(1) DESC
            ) AS item_rank
        FROM
            Orders AS A
            LEFT JOIN Products AS b ON A .product_id = b.product_id
        GROUP BY
            A .customer_id,
            A .product_id
    ) AS C
WHERE
    item_rank = 1;