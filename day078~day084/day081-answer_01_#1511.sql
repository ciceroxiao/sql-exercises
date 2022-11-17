/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/customer-order-frequency/
 创建者：Cicero
 创建日期：2021-12-1
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 写一个 SQL 语句,  报告消费者的 id 和名字, 其中消费者在 2020 年 6 月和 7 月, 每月至少花费了$100。
 结果以任意顺序返回。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 连表查询 id 和 name；
 4.2. where 限定日期；
 4.3. group by id；
 4.4. having 限定花费。 
 */
USE sql_daily_exercises;

SELECT
    A .customer_id,
    C .name
FROM
    Orders AS A
    LEFT JOIN Product AS b ON A .product_id = b.product_id
    LEFT JOIN Customers AS C ON A .customer_id = C .customer_id
WHERE
    order_date LIKE '2020-06%'
    OR '2020-07%'
GROUP BY
    A .customer_id
HAVING
    SUM(
        IF(order_date LIKE '2020-06%', quantity * price, 0)
    ) >= 100
    AND SUM(
        IF(order_date LIKE '2020-07%', quantity * price, 0)
    ) >= 100;