/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/average-selling-price/
 创建者：Cicero
 创建日期：2021-11-21
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：编写 SQL 语句，查询每个产品的平均售价。结果保留两位小数。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：根据 product_id、start_date 和 end_date 连表即可。
 */
USE sql_daily_exercises;

SELECT
    A .product_id,
    round(SUM(A .price * b.units) / SUM(b.units), 2) AS average_price
FROM
    Prices AS A
    LEFT JOIN UnitsSold AS b ON A .product_id = b.product_id
    AND b.purchase_date BETWEEN A .start_date
    AND A .end_date
GROUP BY
    A .product_id;