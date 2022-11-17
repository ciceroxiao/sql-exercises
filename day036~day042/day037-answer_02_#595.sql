/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/big-countries/
 创建者：Cicero
 创建日期：2021-10-11
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到“Big Countries”：area > 3000000 or population > 25000000
 2. 案例：——
 3. 公式：——
 4. 实现：直接使用 where 条件过滤即可。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    NAME,
    population,
    area
FROM
    world
WHERE
    area > 3000000
    OR population > 25000000;