/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/sales-by-day-of-the-week/
 创建者：Cicero
 创建日期：2021-11-29
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写一个 SQL 语句，报告每一周中每一天的每个商品类别下订购的数量。
 结果按照商品类别排序，每个商品类别的结果以任意顺序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 使用 case when 即可。
 */
USE sql_daily_exercises;

SELECT
    b.item_category,
    SUM(
        CASE
            WHEN weekday(order_date) = 0 THEN quantity
            ELSE 0
        END
    ) AS "Monday",
    SUM(
        CASE
            WHEN weekday(order_date) = 1 THEN quantity
            ELSE 0
        END
    ) AS "Tuesday",
    SUM(
        CASE
            WHEN weekday(order_date) = 2 THEN quantity
            ELSE 0
        END
    ) AS "Wednesday",
    SUM(
        CASE
            WHEN weekday(order_date) = 3 THEN quantity
            ELSE 0
        END
    ) AS "Thursday",
    SUM(
        CASE
            WHEN weekday(order_date) = 4 THEN quantity
            ELSE 0
        END
    ) AS "Friday",
    SUM(
        CASE
            WHEN weekday(order_date) = 5 THEN quantity
            ELSE 0
        END
    ) AS "Saturday",
    SUM(
        CASE
            WHEN weekday(order_date) = 6 THEN quantity
            ELSE 0
        END
    ) AS "Sunday"
FROM
    Orders AS A
    RIGHT JOIN Items AS b ON A .item_id = b.item_id
GROUP BY
    b.item_category
ORDER BY
    b.item_category;