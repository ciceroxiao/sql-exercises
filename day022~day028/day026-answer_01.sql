/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/b626ff9e2ad04789954c2132c74c0512?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-30
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询各个岗位分数的中位数位置上的所有 grade 信息。
 2. 案例：见题目。
 3. 公式：None
 4. 实现：
    4.1 先找到各个岗位分数的中位数；
    4.2 其次，找到中位数所对应的 grade 信息。
 备注：
    本题的核心是找到中位数。牛客网有个网友的答案比我好：其答案比我的答案要简洁、易于明白。
    其答案与解析记录于 day026-answer_01_02.sql 中。
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 找到各个岗位的中位数位置
SELECT
    job,
    ROUND(MAX(score_rank) / 2, 0) AS t_rank
FROM
    (
        SELECT
            job,
            ROW_NUMBER() over(
                PARTITION BY job
                ORDER BY
                    score DESC
            ) AS score_rank
        FROM
            grade
    ) AS A
GROUP BY
    job
UNION
SELECT
    job,
    FLOOR(MAX(score_rank) / 2) + 1 AS t_rank
FROM
    (
        SELECT
            job,
            ROW_NUMBER() over(
                PARTITION BY job
                ORDER BY
                    score DESC
            ) AS score_rank
        FROM
            grade
    ) AS A
GROUP BY
    job;

-- 使用 ROW_NUMBER() 排序原数据
SELECT
    id,
    job,
    score,
    row_number() over(
        PARTITION BY job
        ORDER BY
            score DESC
    ) AS score_rank
FROM
    grade;

-- 联结上面生成的两个新表，得到对应排名的数据
SELECT
    A .id,
    A .job,
    A .score,
    A .score_rank AS t_rank
FROM
    (
        SELECT
            id,
            job,
            score,
            row_number() over(
                PARTITION BY job
                ORDER BY
                    score DESC
            ) AS score_rank
        FROM
            grade
    ) AS A
    LEFT JOIN (
        SELECT
            job,
            ROUND(MAX(score_rank) / 2, 0) AS t_rank
        FROM
            (
                SELECT
                    job,
                    ROW_NUMBER() over(
                        PARTITION BY job
                        ORDER BY
                            score DESC
                    ) AS score_rank
                FROM
                    grade
            ) AS A
        GROUP BY
            job
        UNION
        SELECT
            job,
            FLOOR(MAX(score_rank) / 2) + 1 AS t_rank
        FROM
            (
                SELECT
                    job,
                    ROW_NUMBER() over(
                        PARTITION BY job
                        ORDER BY
                            score DESC
                    ) AS score_rank
                FROM
                    grade
            ) AS A
        GROUP BY
            job
    ) AS b ON A .job = b.job
WHERE
    A .score_rank = b.t_rank
ORDER BY
    A .id ASC;