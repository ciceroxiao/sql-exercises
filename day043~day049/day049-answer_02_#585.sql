/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/investments-in-2016/
 创建者：Cicero
 创建日期：2021-10-23
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到指定条件下的投资总和。
 1.1 WHAT：SUM(TIV_2016)
 1.2 WHO：A. LAT 和 LON 不相同；B. TIV_2015 是相同的
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 先找到 LAT 和 LON 不同的数据；
 4.2 再找到 TIV_2015 的数据；
 4.3 SUM(TIV_2016)
 */
USE sql_daily_exercises;

SELECT
    SUM(TIV_2016) AS "TIV_2016"
FROM
    insurance
WHERE
    PID IN (
        SELECT
            PID
        FROM
            insurance
        GROUP BY
            LAT,
            LON
        HAVING
            COUNT(*) = 1
    )
    AND TIV_2015 IN (
        SELECT
            TIV_2015
        FROM
            insurance
        GROUP BY
            TIV_2015
        HAVING
            COUNT(*) > 1
    );