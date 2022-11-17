/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/running-total-for-different-genders/
 创建者：Cicero
 创建日期：2021-11-22
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：编写 SQL 语句，查询每种性别在每一天的总分。结果以性别和日期升序排列。
 2. 案例：见题目示例。
 3. 公式：——
 4. 实现：直接使用窗口函数即可。
 */
USE sql_daily_exercises;

SELECT
    gender,
    DAY,
    SUM(score_points) over(
        PARTITION BY gender
        ORDER BY
            DAY
    ) AS total
FROM
    Scores;