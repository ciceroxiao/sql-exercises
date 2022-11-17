/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/product-sales-analysis-iii/
 创建者：Cicero
 创建日期：2021-11-8
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到每种产品第一年的销售情况。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 先分组，找到每种产品首次销售的年份；
 4.2 再连表，找到每种产品首次销售的年份对应的销售情况。
 */
USE sql_daily_exercises;

-- 先分组，找到每种产品首次销售的年份；
SELECT
    product_id,
    MIN(YEAR) AS first_year
FROM
    Sales
GROUP BY
    product_id;

-- 连表，找到每种产品首次销售的年份对应的销售情况。
SELECT
    a.product_id,
    a.year,
    a.quantity,
    a.price
FROM
    Sales as a
    LEFT JOIN (
        SELECT
            product_id,
            MIN(YEAR) AS first_year
        FROM
            Sales
        GROUP BY
            product_id
    ) as b ON a.product_id = b.product_id
WHERE
    a.year = b.first_year;