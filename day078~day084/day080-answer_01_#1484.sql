/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/group-sold-products-by-the-date/
 创建者：Cicero
 创建日期：2021-11-30
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写 SQL 语句，查询每个日期、销售的不同产品的数量及其名称。
 每个日期的销售产品名称应该按词典序排列。
 结果以 sell_date 升序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：使用 GROUP_CONCAT 函数即可。
 */
USE sql_daily_exercises;

SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    group_concat(
        DISTINCT product
        ORDER BY
            product
    ) AS products
FROM
    Activities
GROUP BY
    sell_date
ORDER BY
    sell_date;