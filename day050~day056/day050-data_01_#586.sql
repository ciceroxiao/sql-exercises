/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/
 创建者：Cicero
 创建日期：2021-10-24
 修改日期：
 */
USE sql_daily_exercises;

DROP TABLE IF EXISTS orders;

CREATE TABLE IF NOT EXISTS orders (
    order_number INT,
    customer_number INT,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    status CHAR(15),
    COMMENT CHAR(200),
    key(order_number)
);

Truncate TABLE orders;

INSERT INTO
    orders (order_number, customer_number)
VALUES
    ('1', '1');

INSERT INTO
    orders (order_number, customer_number)
VALUES
    ('2', '2');

INSERT INTO
    orders (order_number, customer_number)
VALUES
    ('3', '3');

INSERT INTO
    orders (order_number, customer_number)
VALUES
    ('4', '3');