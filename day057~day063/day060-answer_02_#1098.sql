/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/unpopular-books/
 创建者：Cicero
 创建日期：2021-11-10
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到近一年内，销售量小于 10 的书籍，不包含近一月内上市的书籍。假设今日是“2019-06-23”。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 先排除近一月内上市的书籍；
 4.2 选取近一年内的销售数据；
 4.3 找到销售量小于 10 的书籍：
 4.3.1 total_sales_amount < 10;
 4.3.2 total_sales_amount is NULL。
 */
USE sql_daily_exercises;

-- 先排除近一月内上市的书籍；
SELECT
    book_id,
    NAME
FROM
    Books
WHERE
    date_sub('2019-06-23', INTERVAL 30 DAY) > available_from;

-- 选取近一年内的销售数据；
SELECT
    book_id,
    quantity
FROM
    Orders
WHERE
    datediff('2019-06-23', dispatch_date) <= 365;

-- 找到各书籍的销售量；
SELECT
    book_id,
    SUM(quantity) AS total_sales_amount
FROM
    Orders
WHERE
    date_sub('2019-06-23', INTERVAL 365 DAY) <= dispatch_date
GROUP BY
    book_id;

-- 联合查询，找到销售量小于 10 的书籍之信息：
SELECT
    A .book_id,
    A .NAME
FROM
    Books AS A
    LEFT JOIN (
        SELECT
            book_id,
            SUM(quantity) AS total_sales_amount
        FROM
            Orders
        WHERE
            date_sub('2019-06-23', INTERVAL 365 DAY) <= dispatch_date
        GROUP BY
            book_id
    ) AS b ON A .book_id = b .book_id
WHERE
    date_sub('2019-06-23', INTERVAL 30 DAY) > available_from
    AND (
        total_sales_amount < 10
        OR total_sales_amount IS NULL
    );