/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/bank-account-summary-ii/
 创建者：Cicero
 创建日期：2021-12-4
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 写一个 SQL,  报告余额高于 10000 的所有用户的名字和余额。
 账户的余额等于包含该账户的所有交易的总和。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：连表即可。
 */
USE sql_daily_exercises;

SELECT
    a.name,
    SUM(b.amount) balance
FROM
    Users as a 
    JOIN Transactions as b on a.account = b.account
GROUP BY
    a.account
HAVING
    balance > 10000;