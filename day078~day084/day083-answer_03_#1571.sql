/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/warehouse-manager/
 创建者：Cicero
 创建日期：2021-12-3
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写一个 SQL 语句，查询出每个仓库的存货量。单位：立方英尺。
 结果以任意顺序返回。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：根据题目提供的公式，直接连表查询即可。
 */
USE sql_daily_exercises;

SELECT
    A .name AS WAREHOUSE_NAME,
    SUM(b.Width * b.Length * b.Height * A .units) AS VOLUME
FROM
    Warehouse AS A
    LEFT JOIN Products AS b ON A .product_id = b.product_id
GROUP BY
    A .name;