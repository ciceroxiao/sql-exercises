/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/b626ff9e2ad04789954c2132c74c0512?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：今天星期八ya
 创建日期：2021-9-30
 修改日期：
 
今天星期八ya 的解题思路：
 1. 审题：查询各个岗位分数的中位数位置上的所有 grade 信息。
 2. 案例：见题目。
 3. 公式：None
 4. 实现：
 4.1 先找到各个岗位分数的中位数；
 4.2 其次，找到中位数所对应的 grade 信息。
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 首先，将原数据按照 grade.job 分组、grade.date 排序，其次以 grade.job 计数
SELECT
    id,
    job,
    score,
    row_number() over(
        PARTITION BY job
        ORDER BY
            score DESC
    ) AS t_rank,
    COUNT(1) over(PARTITION BY job) AS job_numbers
FROM
    grade;

-- 其次，如何找到中位数呢？或者说，如何确定某个位置是中位数的位置呢？
-- if abs(t_rank - (job_numbers + 1) / 2) < 1, then t_rank 所在位置的数就是中位数
-- This is a great solution.
SELECT
    id,
    job,
    score,
    t_rank
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
            ) AS t_rank,
            COUNT(1) over(PARTITION BY job) AS job_numbers
        FROM
            grade
    ) AS A
WHERE
    abs(t_rank - (job_numbers + 1) / 2) < 1
ORDER BY
    id;

-- Cicero 从中学到了什么：
-- 首先，确定好需求的核心之后，还是要用公式表达求取核心的过程。
-- 代码的简洁，依赖于公式的简洁。代码的简洁，本质上是算法的简洁。