/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/cd2e10a588dc4c1db0407d0bf63394f3?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-25
 修改日期：
 
 Cicero 的解题思路：
 1. 依据题意，直接使用窗口函数 DENSE_RANK 即可。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    a.id,
    a.number,
    DENSE_RANK() over(
        ORDER BY
            a.number DESC
    ) AS t_rank
FROM
    passing_number as a
ORDER BY
    t_rank,
    a.id;