/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-5
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询所有课程成绩小于60分的同学的学号、姓名；
 2. 案例：——
 3. 公式：——
 4. 实现：
 4.1 先找到所有课程成绩均小于 60 份的 SId；
 4.1.1 如何知道某个学生的所有成绩都小于 60 分？如果该学生的最高成绩都小于 60 分，那么他的所有成绩肯定都小于 60 分。
 4.2 再联结表 Student 得到对应学生的姓名。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    t1.sid,
    sname
FROM
    (
        SELECT
            sid,
            MAX(score)
        FROM
            sc
        GROUP BY
            sid
        HAVING
            MAX(score < 60)
    ) t1
    LEFT JOIN student ON t1.sid = student.sid;