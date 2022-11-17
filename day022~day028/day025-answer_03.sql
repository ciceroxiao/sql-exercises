/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/502fb6e2b1ad4e56aa2e0dd90c6edf3c?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-29
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询各个岗位分数升序排列之后的中位数位置的范围。
 2. 案例：
 Python 有三个分数 100、90、110，那么查询结果就是(2, 2)，也就是说第 2 个数是排位中位数；
 Java 有四个分数 100、100、90、90，那么查询结果就是(2, 3)，也就是说第 2、3 个数中间位置是排位中位数。
 3. 公式：None
 4. 实现：
 4.1 使用窗口函数 ROW_NUMBER() 来排序数据；
 4.2 使用 round() 和 floor()+1 找到排名中位数 start 和 end 位置。
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 使用窗口函数 row_rank() 来排序数据
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

-- 使用 round() 获取排名中位数的 star
-- 使用 FLOOR()+1 获取排名中位数的 end
SELECT
    job,
    round(MAX(score_rank) / 2, 0) AS "start",
    floor(MAX(score_rank) / 2) + 1 AS "end"
FROM
    (
        SELECT
            job,
            row_number() over(
                PARTITION BY job
                ORDER BY
                    score DESC
            ) AS score_rank
        FROM
            grade
    ) AS A
GROUP BY
    job;