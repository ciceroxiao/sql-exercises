/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-7
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：18. 查询各科成绩最高分、最低分和平均分：以如下形式显示：课程ID，课程name，最高分，最低分，平均分，及格率
 2. 案例：——
 3. 公式：——
 4. 实现：
 课程ID: sc.cid
 课程name：course.cname
 最高分：max(score)
 最低分：min(score)
 平均分：avg(score)
 及格率：count(if(score>=60,1,null))/count(1)
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    sc.cid,
    cname,
    MAX(score) AS max_score,
    MIN(score) AS min_score,
    ROUND(AVG(score), 2) AS avg_score,
    ROUND(COUNT(IF(score >= 60, 1, NULL)) / COUNT(1), 2) AS pass_rate
FROM
    sc
    LEFT JOIN course ON sc.cid = course.cid
GROUP BY
    sc.cid;