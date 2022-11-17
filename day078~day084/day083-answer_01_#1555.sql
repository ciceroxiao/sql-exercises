/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/bank-account-summary/
 创建者：Cicero
 创建日期：2021-12-3
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 力扣银行 (LCB) 帮助程序员们完成虚拟支付。我们的银行在表 Transaction 中记录每条交易信息，我们要查询每个用户的当前余额，并检查他们是否已透支（当前额度小于 0）。
 写一条 SQL 语句，查询：
 user_id 用户 ID user_name 用户名 credit 完成交易后的余额 credit_limit_breached 检查是否透支 （"Yes" 或 "No"）。
 结果以任意顺序返回。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1. IF paid_by = user_id , then credit = credit - amount;
 IF paid_to = user_id , then credit = credit + amount;
 4.2. IF credit < 0 , then credit_limit_breached = "Yes";
 ELSE credit_limit_breached = "No";
 */
USE sql_daily_exercises;

SELECT
    user_id,
    user_name,
    credit,
    credit + ifnull(SUM(IF(paid_by = user_id, - amount, amount)), 0) AS credit,
    IF(
        credit + ifnull(SUM(IF(paid_by = user_id, - amount, amount)), 0) < 0,
        "Yes",
        "No"
    ) AS credit_limit_breached
FROM
    Users AS A
    LEFT JOIN Transactions AS b ON A .user_id = b.paid_by
    OR A .user_id = b.paid_to
GROUP BY
    user_id;