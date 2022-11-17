/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/find-median-given-frequency-of-numbers/
 创建者：Cicero
 创建日期：2021-10-21
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：给定数字和相应的频率，找到该组数字的中位数。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 先找到各组数字的正序和逆序排名；
 4.2 再找到正序和逆序排名均大于数字总数量一半的数字。
 */
USE sql_daily_exercises;

-- 先计算各个数字的正序和倒序排名
SELECT
    NUMBER,
    Frequency,
    SUM(Frequency) over(
        ORDER BY
            NUMBER ASC
    ) AS asc_rank,
    SUM(Frequency) over(
        ORDER BY
            NUMBER DESC
    ) AS desc_rank
FROM
    numbers
ORDER BY
    NUMBER;

-- 找到正序和倒序排名均大于等于数字总数量一半的数
SELECT
    A .Number
FROM
    (
        SELECT
            NUMBER,
            Frequency,
            SUM(Frequency) over(
                ORDER BY
                    NUMBER ASC
            ) AS asc_rank,
            SUM(Frequency) over(
                ORDER BY
                    NUMBER DESC
            ) AS desc_rank
        FROM
            numbers
        ORDER BY
            NUMBER
    ) AS A
WHERE
    A .asc_rank >= (
        (
            SELECT
                SUM(Frequency)
            FROM
                numbers
        ) / 2
    )
    AND A .desc_rank >= (
        (
            SELECT
                SUM(Frequency)
            FROM
                numbers
        ) / 2
    );