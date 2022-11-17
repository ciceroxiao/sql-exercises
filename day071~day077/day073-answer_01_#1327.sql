/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/list-the-products-ordered-in-a-period/
 创建者：Cicero
 创建日期：2021-11-23
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写 SQL 语句，查找在 2020 年 2 月份下单数量不少于 100 的产品名字及其数量。
 返回结果以任意顺序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 筛选数据：只选择 2020-02-01 到 2020-02-29 的数据；
 4.2. 查找数据：使用 GROUP BY 和 HAVING 分组，并使用 SUM(unit) 和 >= 100 进行筛选；
 4.3. 输出数据：连表输出产品名字和数量。
 */
USE sql_daily_exercises;

SELECT
    product_name,
    SUM(unit) AS unit
FROM
    Products AS A
    LEFT JOIN Orders AS b ON A .product_id = b.product_id
WHERE
    date_format(b.order_date, '%Y-%m') = '2020-02'
GROUP BY
    product_name
HAVING
    SUM(unit) >= 100;