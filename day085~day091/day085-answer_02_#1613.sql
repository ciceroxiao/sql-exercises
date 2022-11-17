/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/find-the-missing-ids/
 创建者：Cicero
 创建日期：2021-12-5
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 写一个 SQL 语句, 找到所有遗失的顾客 id。
 遗失的顾客 id 是指那些不在 Customers 表中, 值却处于 1 和表中最大 customer_id 之间的 id。
 注意: 最大的 customer_id 值不会超过 100。
 结果按照 ids 升序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 使用递归 with recursive 找到 1 和最大 customer_id 之间的所有 id；
 4.2. 再使用子查询，找到所有遗失的 id；
 4.3. 最后，结果按照 ids 升序排列。
 */
USE sql_daily_exercises;

WITH recursive temp_table AS (
    SELECT
        1 AS ids
    UNION
    ALL
    SELECT
        ids + 1
    FROM
        temp_table
    WHERE
        ids < (
            SELECT
                MAX(customer_id)
            FROM
                customers
        )
)
SELECT
    ids
FROM
    temp_table
WHERE
    ids NOT IN (
        SELECT
            customer_id
        FROM
            customers
    )
ORDER BY
    ids;