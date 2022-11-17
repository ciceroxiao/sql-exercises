/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
 创建者：Cicero
 创建日期：2021-12-4
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 有一些顾客可能光顾了购物中心但没有进行交易。
 编写一个 SQL，来查找这些顾客的 ID ，以及他们只光顾不交易的次数。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：连表查询即可。
 */
USE sql_daily_exercises;

SELECT
    A .customer_id,
    SUM(b.transaction_id IS NULL) count_no_trans
FROM
    Visits AS A
    LEFT JOIN Transactions AS b ON A .visit_id = b.visit_id
GROUP BY
    A .customer_id
HAVING
    count_no_trans > 0;