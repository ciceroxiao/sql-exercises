/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/number-of-transactions-per-visit/
 创建者：Cicero
 创建日期：2021-11-23
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 银行想要得到银行客户在一次访问时的交易次数和相应的在一次访问时该交易次数的客户数量的图表
 写一条 SQL 查询多少客户访问了银行但没有进行任何交易，多少客户访问了银行进行了一次交易等等
 结果包含两列：
 transactions_count： 客户在一次访问中的交易次数
 visits_count： 在 transactions_count 交易次数下相应的一次访问时的客户数量 transactions_count 的值从 0 到所有用户一次访问中的 max(transactions_count) 
 按 transactions_count 排序
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. 先连表，得到各个客户在各个日期的访问次数和交易次数；
 4.2. 再根据次数来构建递增“索引”；
 4.3. 最后，根据“索引”来查询各交易次数的客户数量；
 */
USE sql_daily_exercises;

-- 先连表，得到各个客户在各个日期的访问次数和交易次数；
SELECT
    a.user_id,
    a.visit_date,
    COUNT(b.amount) AS transactions_count
FROM
    Visits AS a
    LEFT JOIN Transactions AS b ON a.user_id = b.user_id
    AND a.visit_date = b.transaction_date
GROUP BY
    a.user_id,
    a.visit_date;

-- 构建递增“索引”；
with recursive
    A as (
        SELECT
            a.user_id,
            a.visit_date,
            COUNT(b.amount) AS transactions_counts
        FROM
            Visits AS a
            LEFT JOIN Transactions AS b ON a.user_id = b.user_id
            AND a.visit_date = b.transaction_date
        GROUP BY
            a.user_id,
            a.visit_date
    ),
    B as (
        SELECT 0 as transactions_count
        UNION ALL
        SELECT transactions_count + 1
        FROM B
        where transactions_count < (
            SELECT MAX(transactions_counts)
            FROM A
        ))

SELECT
    transactions_count,
    COUNT(A.transactions_counts) AS visits_count
FROM
    A
    right JOIN B ON A.transactions_counts = B.transactions_count
GROUP BY
    transactions_count;