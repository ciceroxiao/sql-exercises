/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/monthly-transactions-i/
 创建者：Cicero
 创建日期：2021-11-16
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写一个 SQL 查询，查找每个月和国家/地区的事务次数及其总额、已批准的事务次数及其总额。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 数据分组：将数据按照月份和国家/地区分组；
 4.2 数据求和：将分组后的数据，按照其事务状态进行计数和求和；
 4.3 数据输出：按题目规定格式输出数据。
 */
USE sql_daily_exercises;

-- 数据分组：将数据按照月份和国家/地区分组；
SELECT
    date_format(trans_date, '%Y-%m') AS MONTH,
    country,
    state,
    amount,
    trans_date
FROM
    Transactions
GROUP BY
    MONTH,
    country;

-- 数据求和：将分组后的数据，按照其事务状态进行计数和求和；
SELECT
    date_format(trans_date, '%Y-%m') AS MONTH,
    country,
    COUNT(1) AS trans_count,
    SUM(
        CASE
            WHEN state = "approved" THEN 1
            ELSE 0
        END
    ) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(
        CASE
            WHEN state = "approved" THEN amount
            ELSE 0
        END
    ) AS approved_total_amount
FROM
    Transactions
GROUP BY
    MONTH,
    country;

-- 数据输出：按题目规定格式输出数据。