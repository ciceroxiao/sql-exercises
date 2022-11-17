/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/d323a4c97d1945e0aabe94e4d0bbb25d?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-10-3
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：找到指定条件下的简历数量。
 1.1 date: year(date) = 2025
 1.2 GROUP BY month(date), job
 1.3 简历数量: SUM(num)
 1.4 ORDER BY month DESC, SUM(num) DESC
 2. 案例：见题目。
 3. 公式：
 3.1 GROUP BY MONTH(date), job
 3.2 YEAR(date) = 2025
 3.3 SUM(num)
 4. 实现：
 4.1 先使用 WHERE 找到指定年份内的数据；
 4.2 其次，使用 GROUP BY 对处理后的数据分组；
 4.3 再使用 SUM(num) 来计数；
 4.4 最后，按照 ORDER BY month DESC, SUM(num) DESC 排序。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    job,
    concat(YEAR(DATE), "-", LPAD(MONTH(DATE), 2, 0)) AS mon,
    SUM(num) AS cnt
FROM
    resume_info
WHERE
    YEAR(DATE) = '2025'
GROUP BY
    MONTH(DATE),
    job
ORDER BY
    mon DESC,
    cnt DESC;