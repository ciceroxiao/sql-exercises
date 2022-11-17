/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-7
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：19. 按各科平均成绩从低到高和及格率的百分数从高到低顺序
 2. 案例：——
 3. 公式：——
 4. 实现：
 4.1 先找到各科的平均成绩；
 4.2 再找到各科的及格率；
 4.3 最后，以平均成绩升序、及格率降序排列数据。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    cid,
    ROUND(AVG(score), 2) AS avg_score,
    ROUND(COUNT(IF(score >= 60, 1, NULL)) / COUNT(1), 2) AS pass_rate
FROM
    sc
GROUP BY
    cid
ORDER BY
    avg_score,
    pass_rate DESC;