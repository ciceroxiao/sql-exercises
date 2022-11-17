/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/monthly-transactions-ii/
 创建者：Cicero
 创建日期：2021-11-17
 修改日期：2021-11-18
 
 Cicero 的解题思路：
 1. 需求：
 编写一个 SQL 查询，以查找每个月和每个国家/地区的已批准交易的数量及其总金额、退单的数量及其总金额。
 注意：在您的查询中，给定月份和国家，忽略所有为零的行。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1.1 搜集数据：先连表，找到已批准交易和退单数据；
 4.1.2 查询数据：再根据题目要求，找到指定数据。
 */
USE sql_daily_exercises;

-- 搜集数据：先连表，找到已批准交易和退单数据。
SELECT
    b.trans_id,
    A .country,
    "chargeback" AS state,
    A .amount,
    b.trans_date
FROM
    Transactions AS A
    JOIN Chargebacks AS b ON A .id = b.trans_id
UNION
SELECT
    *
FROM
    Transactions;

-- 查询数据：再根据题目要求，找到指定数据。
SELECT
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    -- 为了代码更直观，下面四行代码没有美化。
    sum(case when state = 'approved' then 1 else 0 end) as approved_count,
    sum(case when state = 'approved' then amount else 0 end) as approved_amount,
    sum(case when state = 'chargeback' then 1 else 0 end) as chargeback_count,
    sum(case when state = 'chargeback' then amount else 0 end) as chargeback_amount
from(
    SELECT
    b.trans_id,
    A .country,
    "chargeback" AS state,
    A .amount,
    b.trans_date
FROM
    Transactions AS A
    JOIN Chargebacks AS b ON A .id = b.trans_id
UNION
SELECT
    *
FROM
    Transactions) AS c
WHERE
    state != "declined" -- 忽略所有为零的行。
GROUP BY
    country, month;