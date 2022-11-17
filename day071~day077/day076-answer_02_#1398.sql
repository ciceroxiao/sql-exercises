/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/customers-who-bought-products-a-and-b-but-not-c/
 创建者：Cicero
 创建日期：2021-11-26
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：编写 SQL 查询，以找到购买了 A 和 B 但没有购买 C 的客户之 customer_id 和 customer_name。结果以 customer_id 排序。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 三重嵌套子查询：
 4.2. 单层子查询：
 */
USE sql_daily_exercises;

-- 三重嵌套子查询：
SELECT
    customer_id,
    customer_name
FROM
    Customers C
WHERE
    customer_id IN (
        SELECT
            DISTINCT customer_id
        FROM
            Orders
        WHERE
            product_name = 'A'
            AND customer_id IN (
                SELECT
                    DISTINCT customer_id
                FROM
                    Orders
                WHERE
                    product_name = 'B'
            )
    )
    AND customer_id NOT IN (
        SELECT
            DISTINCT customer_id
        FROM
            Orders
        WHERE
            product_name = 'C'
    );

-- 单层子查询：
SELECT
    temp.customer_id,
    cus.customer_name
FROM
    (
        SELECT
            customer_id,
            MAX(product_name = "A") AS A,
            MAX(product_name = "B") AS B,
            MAX(product_name = "C") AS C
        FROM
            Orders
        GROUP BY
            customer_id
    ) AS temp
    LEFT JOIN Customers cus ON temp.customer_id = cus.customer_id
WHERE
    A = 1
    AND B = 1
    AND C = 0;