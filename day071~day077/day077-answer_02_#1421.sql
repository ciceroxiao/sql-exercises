/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/npv-queries/
 创建者：Cicero
 创建日期：2021-11-27
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
 编写 SQL 查询，找到 Queries 表中每一次查询的 NPV 值。
 结果以任意顺序返回。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：连表查询即可。
 */
USE sql_daily_exercises;

SELECT
    A .id,
    A .year,
    ifnull(b.npv, 0) AS npv
FROM
    Queries AS A
    LEFT JOIN NPV AS b ON A .id = b.id
    AND A .year = b.year
ORDER BY
    A .id,
    A .year;