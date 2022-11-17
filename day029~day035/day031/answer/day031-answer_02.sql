/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-5
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询平均成绩大于60分的同学的学号和平均成绩；
 2. 案例：——
 3. 公式：——
 4. 实现：
 4.1 先找到每个学生的平均成绩；
 4.2 其次，使用 HAVING 筛选平均成绩。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    SId,
    round(AVG(score), 2) AS avg_score
FROM
    SC
GROUP BY
    SId
HAVING
    AVG(score) > 60;