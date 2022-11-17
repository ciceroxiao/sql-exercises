/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/the-most-recent-three-orders/
 创建者：Cicero
 创建日期：2021-12-2
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 写一个 SQL 语句，找到每个用户的最近三笔订单。如果用户的订单少于 3 笔，则返回该用户的全部订单。
 返回的结果按照 customer_name 升序排列。如果排名有相同，则继续按照 customer_id 升序排列。如果排名还有相同，则继续按照 order_date 降序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 先使用窗口函数 rank() 来计算每个用户的订单排名，以日期降序排列；
 4.2. 选出每个用户的 rank 值小于等于 3 的记录；
 4.3. 将结果按照 customer_name 升序排列、customer_id 升序排列、order_date 降序排列。
 */
USE sql_daily_exercises;

SELECT
    NAME AS customer_name,
    customer_id,
    order_id,
    order_date
FROM
    (
        SELECT
            b.name,
            A .customer_id,
            A .order_id,
            A .order_date,
            rank() over (
                PARTITION BY customer_id
                ORDER BY
                    order_date DESC
            ) AS date_rank
        FROM
            Orders AS A
            LEFT JOIN Customers AS b ON A .customer_id = b.customer_id
    ) AS C
WHERE
    date_rank <= 3
ORDER BY
    customer_name,
    customer_id,
    order_date DESC;