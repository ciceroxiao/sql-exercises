/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/product-sales-analysis-ii/
 创建者：Cicero
 创建日期：2021-11-7
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：根据 product_id，统计每个 product_id 的总销售量。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 先根据 product_id 联结两表；
 4.2 统计每个 product_id 的总销售量；
 */
USE sql_daily_exercises;

SELECT
    A .product_id,
    SUM(quantity) AS total_quantity
FROM
    Sales AS A
    JOIN Product AS b ON A .product_id = b.product_id
GROUP BY
    product_id;