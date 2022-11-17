/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/active-businesses/
 创建者：Cicero
 创建日期：2021-11-12
 修改日期：
 */
USE sql_daily_exercises;

DROP TABLE IF EXISTS Events;

CREATE TABLE IF NOT EXISTS Events(
    business_id INT,
    event_type VARCHAR(256),
    occurences INT,
    PRIMARY KEY (business_id, event_type)
);

INSERT INTO
    Events(business_id, event_type, occurences)
VALUES
    (1, 'reviews', 7),
    (3, 'reviews', 3),
    (1, 'ads', 11),
    (2, 'ads', 7),
    (3, 'ads', 6),
    (1, 'page views', 3),
    (2, 'page views', 12);