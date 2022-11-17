/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-8
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：20. 查询学生的总成绩并以总成绩降序排名。
 2. 案例：——
 3. 公式：——
 4. 实现：GROUP BY 对学生分组，SUM(score) 计算每个学生的总成绩。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    sid,
    SUM(score) AS sum_score
FROM
    sc
GROUP BY
    sid
ORDER BY
    sum_score DESC;