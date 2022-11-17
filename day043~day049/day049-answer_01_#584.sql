/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/find-customer-referee/
 创建者：Cicero
 创建日期：2021-10-23
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到非 id=2 的用户所引荐的顾客。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：直接使用 WHERE 过滤即可。
 */
USE sql_daily_exercises;

SELECT
    NAME
FROM
    customer
WHERE
    referee_id != 2
    OR referee_id IS NULL;