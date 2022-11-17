/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/unique-orders-and-customers-per-month/
 创建者：Cicero
 创建日期：2021-12-3
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写一个 SQL 语句，查询出每个月中订单金额大于 20 的唯一订单数量和唯一顾客数量。
 结果以任意顺序返回。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：本题的考点是 date_format() 、count(distinct ...)、where 和 group by。
 */
USE sql_daily_exercises;

SELECT
    date_format(o.order_date, '%Y-%m') AS MONTH,
    COUNT(DISTINCT o.order_id) AS orders_count,
    COUNT(DISTINCT o.customer_id) AS customer_count
FROM
    Orders AS o
WHERE
    invoice > 20
GROUP BY
    MONTH;