/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/rank-scores/
 创建者：Cicero
 创建日期：2021-10-15
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：分数排名。同分数同一排名，不跳排名。
 2. 案例：见题目。
 3. 公式：dense_rank()
 4. 实现：直接使用窗口函数 dense_rank() 即可实现排名。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    Score,
    DENSE_RANK() over(
        ORDER BY
            Score DESC
    ) AS "Rank"
FROM
    Scores;