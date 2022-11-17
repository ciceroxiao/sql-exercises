/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/sales-analysis-i/
 创建者：Cicero
 创建日期：2021-11-9
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到总销售额最大的销售员，并输出其总销售额。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：
 4.1 使用 sum() over(partition by saller_id) 公式，计算每个销售员的总销售额。
 */
USE sql_daily_exercises;

-- 先找到最大的总销售额
SELECT
    SUM(price) AS max_saller_total_price
FROM
    Sales
GROUP BY
    saller_id
ORDER BY
    max_saller_total_price DESC
LIMIT
    1;

-- 再找到最大总销售额对应的销售员
SELECT
    saller_id
FROM
    Sales
GROUP BY
    saller_id
HAVING
    SUM(price) = (
        SELECT
            SUM(price) AS max_saller_total_price
        FROM
            Sales
        GROUP BY
            saller_id
        ORDER BY
            max_saller_total_price DESC
        LIMIT
            1
    );