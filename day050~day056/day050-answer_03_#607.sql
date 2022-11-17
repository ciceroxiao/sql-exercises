/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/sales-person/
 创建者：Cicero
 创建日期：2021-10-24
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到与“RED”没有销售往来的人员。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：直接连接各表即可。
 */
USE sql_daily_exercises;

SELECT
    C .name
FROM
    orders AS A
    INNER JOIN company AS B ON A .com_id = B.com_id
    AND B.name = "RED"
    RIGHT JOIN salesperson AS C ON C .sales_id = A .sales_id
WHERE
    A .sales_id IS NULL;