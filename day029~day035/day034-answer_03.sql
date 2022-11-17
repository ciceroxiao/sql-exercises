/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-8
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询各科课程的成绩在第2名到第3名的学生信息及该课程成绩。
 2. 案例：
 3. 公式：
 4. 实现：
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    sid,
    rank_num,
    score,
    cid
FROM
    (
        SELECT
            rank() over(
                PARTITION BY cid
                ORDER BY
                    score DESC
            ) AS rank_num,
            sid,
            score,
            cid
        FROM
            sc
    ) t
WHERE
    rank_num IN (2, 3);

SELECT
    cid,
    score,
    sid,
    rank() over(
        PARTITION BY cid
        ORDER BY
            score DESC
    ) AS rank_num
FROM
    sc
ORDER BY
    cid ASC,
    rank_num ASC;