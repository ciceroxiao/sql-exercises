/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/f5fc21a0630b4ca6a25ea3a48054ef47?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：r2021-10-2
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询在2025年内投递简历的岗位和数量，并且按数量降序排序。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 先使用 WHERE 筛选出 2025 年以内的数据；
 4.2 其次使用 GROUP BY、以 job 字段为依据分组数据，SUM(num) 以各组中的项目数量；
 4.3 最后，以数量降序排序。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    job,
    SUM(num) AS cnt
FROM
    resume_info
WHERE
    DATE >= '2025-01-01'
    AND DATE <= '2025-12-31'
GROUP BY
    job
ORDER BY
    SUM(num) DESC;