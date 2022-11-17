/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/
 创建者：Cicero
 创建日期：2021-10-24
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到下单数量最多的顾客。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 先按用户 id 统计各个顾客下单的数量，并使用窗口函数 DENSE_RANK() 按总数量降序排名；
 4.2 找到排名第一的客户。
 */
USE sql_daily_exercises;

SELECT
    customer_number
FROM
    (
        SELECT
            customer_number,
            DENSE_RANK() over(
                ORDER BY
                    COUNT(*) DESC
            ) AS order_number_rank
        FROM
            orders
        GROUP BY
            customer_number
    ) AS A
WHERE
    order_number_rank = 1;