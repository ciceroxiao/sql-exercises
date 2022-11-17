/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/sales-analysis-ii/
 创建者：Cicero
 创建日期：2021-11-9
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到购买了 S8、但却没有购买 iPhone 的用户。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 先找到购买了 S8 的用户；
 4.2 再找到没有购买 iPhone 的用户。
 */
USE sql_daily_exercises;

-- 先找到购买了 S8 的用户
SELECT
    buyer_id
FROM
    Sales AS A
    LEFT JOIN Product AS b ON a1.product_id = b.product_id
WHERE
    b.product_name = 'S8';

-- 再找到没有购买 iPhone 的用户
SELECT
    a1.buyer_id
FROM
    Sales AS a1
    LEFT JOIN Product AS b1 ON a1.product_id = b1.product_id
WHERE
    b1.product_name = 'S8'
    AND a1.buyer_id NOT IN (
        SELECT
            a2.buyer_id
        FROM
            Sales AS a2
            LEFT JOIN Product AS b2 ON a2.product_id = b2.product_id
        WHERE
            b2.product_name = 'iPhone'
    );