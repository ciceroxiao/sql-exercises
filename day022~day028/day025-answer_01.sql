/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/f456dedf88a64f169aadd648491a27c1?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-29
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询用户分数大于其所在工作分数的平均分的所有员工信息
 2. 案例：A 的 job 是“Java”，A.score 是 10000，而 avg(A.job.score) 是 9000，那么选取 A 的信息。
 3. 公式：if A.score > avg(A.job.socre), then print(A.info)
 4. 实现：
    4.1 先找到各个 grade.job 的平均分数 avg_score；
    4.2 而后将各个 grade.job 下的每个用户的 grade.score 与 avg_score 作比较，以筛选出目标数据。
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 以 grade.job 为分类依据，找到各个 grade.job 的平均分数为 avg_score
SELECT
    AVG(score) AS avg_score
FROM
    grade
GROUP BY
    job;
-- 联结表格，找到对应 grade.job 中，grade.score 超过对应 avg_score 的员工信息
SELECT
    A .id,
    A .job,
    A .score
FROM
    grade AS A
    LEFT JOIN (
        SELECT
            job,
            AVG(score) AS avg_score
        FROM
            grade
        GROUP BY
            job
    ) AS b ON A .job = b. job
WHERE
    A .score > b.avg_score;