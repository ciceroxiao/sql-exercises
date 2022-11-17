/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/83f84aa5c32b4cf5a75558d02dd7743c?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-3
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：day029_01 的“变体”：找到某一时期同比的数据。
 2. 案例：见题目。
 3. 公式：date_add(date, interval 1 month/year)
 4. 实现：
 4.1 先找到 year=2025 的各个 month
 4.2 先找到 2025 年内，各个月的数据；
 4.3 再找到 4.1 中各数据的同比；
 4.4 最后，按照 ORDER BY first_year_mon DESC, job DESC 排序。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    a.job,
    first_year_mon,
    first_year_cnt,
    second_year_mon,
    second_year_cnt
FROM
    (
        SELECT
            job,
            concat(YEAR(DATE), "-", LPAD(MONTH(DATE), 2, 0)) AS first_year_mon,
            SUM(num) AS first_year_cnt,
            MONTH(DATE) AS mon
        FROM
            resume_info
        WHERE
            YEAR(DATE) = '2025'
        GROUP BY
            MONTH(DATE),
            job
    ) AS a
    LEFT JOIN (
        SELECT
            job,
            concat(YEAR(DATE), "-", LPAD(MONTH(DATE), 2, 0)) AS second_year_mon,
            SUM(num) AS second_year_cnt,
            MONTH(DATE) AS mon
        FROM
            resume_info
        WHERE
            YEAR(DATE) = '2026'
        GROUP BY
            MONTH(DATE),
            job
    ) AS b ON a.job = b.job
    AND a.mon = b.mon
ORDER BY
    first_year_mon DESC,
    job DESC;
-- 备注：这是个“笨”办法。
-- 应该有某种方法，其能实现：将某 column 的值，按照不同的值分为多列。
-- 但我目前时间紧迫（着急完成今日任务），暂时就不做优化。