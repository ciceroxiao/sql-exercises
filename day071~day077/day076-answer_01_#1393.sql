/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/capital-gainloss/
 创建者：Cicero
 创建日期：2021-11-26
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写一个 SQL 查询，以报告所有股票的资本损益。股票的资本损益是一次或多次买卖股票后的全部收益或损失。结果以任意顺序返回。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：使用 CASE WHEN 关键字即可。
 */
USE sql_daily_exercises;

SELECT
    stock_name,
    SUM(
        CASE
            WHEN operation = 'Sell' THEN price
            ELSE - price
        END
    ) AS capital_gain_loss
FROM
    Stocks
GROUP BY
    stock_name;