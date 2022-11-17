/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/product-price-at-a-given-date/
 创建者：Cicero
 创建日期：2021-11-15
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：假设所有产品在被修改前的价格都是 10。请写出 SQL 语句，找到在 2019-08-16 时，所有产品的价格。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 筛选数据：去除数据中晚于 2019-08-16 的数据；
 4.2 查询数据：GROUP BY 分组，查询每种产品的最后价格。
 */
USE sql_daily_exercises;

-- 筛选数据：去除数据中晚于 2019-08-16 的数据
SELECT
    product_id,
    new_price,
    change_date
FROM
    Products
WHERE
    change_date <= '2019-08-16';

-- 查询数据：GROUP BY 分组，查询每种产品的最后价格
SELECT
    product_id,
    new_price,
    change_date,
    rank() over (
        PARTITION BY product_id
        ORDER BY
            change_date DESC
    ) AS change_date_rank
FROM
    Products
WHERE
    change_date <= '2019-08-16';

-- 连表查询：将查询结果与 Products 表连接，查询未在 2019-08-16 之前修改的产品之价格
SELECT
    A .product_id,
    ifnull(b.new_price, 10) AS price
FROM
    Products A
    LEFT JOIN (
        SELECT
            product_id,
            new_price,
            change_date,
            rank() over (
                PARTITION BY product_id
                ORDER BY
                    change_date DESC
            ) AS change_date_rank
        FROM
            Products
        WHERE
            change_date <= '2019-08-16'
    ) AS b ON A .product_id = b.product_id
    AND b.change_date_rank = 1
GROUP BY
    A .product_id;