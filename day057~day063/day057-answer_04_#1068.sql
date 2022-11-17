/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/product-sales-analysis-i/
 创建者：Cicero
 创建日期：2021-11-7
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：根据 product_id 找到对应的 product_name 及其销售日期和销售价。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：直接使用 left join 查询。
 */
USE sql_daily_exercises;

SELECT
    b .product_name,
    A .year,
    A .price
FROM
    Sales AS A
    LEFT JOIN Product AS b ON A .product_id = b.product_id;