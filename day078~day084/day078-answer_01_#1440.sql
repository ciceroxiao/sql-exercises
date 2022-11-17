/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/evaluate-boolean-expression/
 创建者：Cicero
 创建日期：2021-11-28
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：
        写一个 SQL 查询,  以计算表 Expressions 中的布尔表达式。
        结果以任意顺序返回。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：使用 case when 实现需求。
 */
USE sql_daily_exercises;

SELECT
    left_operand,
    OPERATOR,
    right_operand,
    CASE
        WHEN OPERATOR = ">"
        AND b1.value > b2.value THEN "true"
        WHEN OPERATOR = "<"
        AND b1.value < b2.value THEN "true"
        WHEN OPERATOR = "="
        AND b1.value = b2.value THEN "true"
        ELSE "false"
    END AS VALUE
FROM
    Expressions AS A
    LEFT JOIN Variables AS b1 ON b1.name = A .left_operand
    LEFT JOIN Variables AS b2 ON b2.name = A .right_operand;