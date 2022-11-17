/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/sales-analysis-iii/
 创建者：Cicero
 创建日期：2021-11-9
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到只在 2019 年春季、即 2019-01-01 到 2019-03-31 之间销售的所有商品。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 连表查询后，再进行筛选，只要在 2019 年春季、即 2019-01-01 到 2019-03-31 之间销售的所有商品。
 */
USE sql_daily_exercises;

SELECT
    A .product_id,
    b.product_name
FROM
    Sales AS A
    JOIN Product AS b ON A .product_id = b.product_id
GROUP BY
    A .product_id
HAVING
    MIN(A .sale_date) >= '2019-01-01'
    AND MAX(A .sale_date) <= '2019-03-31';