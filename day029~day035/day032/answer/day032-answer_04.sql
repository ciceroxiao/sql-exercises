/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-6
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩
 2. 案例：——
 3. 公式：——
 4. 实现：
 4.1 先找到不及格课程的数据；
 4.2 其次，找到两门及两门以上不及格课程的 SId；
 4.3 再联结表 SC 和表 Student，分别找到对应学生的姓名和平均成绩。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    A .sid,
    b.sname,
    C .avg_score
FROM
    sc AS A
    LEFT JOIN student AS b ON A .sid = b.sid
    LEFT JOIN (
        SELECT
            sid,
            round(AVG(score), 2) AS avg_score
        FROM
            sc
        GROUP BY
            sid
    ) AS C ON A .sid = C .sid
WHERE
    score < 60
GROUP BY
    A .sid
HAVING
    COUNT(A .sid) >= 2
ORDER BY
    A .sid,
    score;

-- 博主使用 IF 来统计不及格的课程数
SELECT
    t1.sid,
    sname,
    avg_score
FROM
    (
        SELECT
            sid,
            COUNT(IF(score < 60, cid, NULL)),
            AVG(score) AS avg_score
        FROM
            sc
        GROUP BY
            sid
        HAVING
            COUNT(IF(score < 60, cid, NULL)) >= 2
    ) t1
    LEFT JOIN student ON t1.sid = student.sid;