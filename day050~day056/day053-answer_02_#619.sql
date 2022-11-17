/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/biggest-single-number/
 创建者：Cicero
 创建日期：2021-10-27
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：给定一系列数字，找到只出现过一次的最大数字。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 先找到只出现过一次的数字：group by(num) having count(*) = 1；
 4.2 再找到最大的数字：order by num desc limit 1。
 */
USE sql_daily_exercises;

SELECT
    num
FROM
    NUMBER
GROUP BY
    num
HAVING
    COUNT(*) = 1
ORDER BY
    num DESC
LIMIT
    1;