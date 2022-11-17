/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-5
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询学过“张三”老师所教的课的同学的学号、姓名；
 2. 案例：——
 3. 公式：——
 4. 实现：
 4.1 先找到“张三”所教的学生
 4.2 再联结表 sc 和表 student，找到对应学生的姓名。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    student.sid,
    sname
FROM
    (
        SELECT
            DISTINCT cid
        FROM
            course
            LEFT JOIN teacher ON course.tid = teacher.tid
        WHERE
            teacher.tname = '张三'
    ) course
    LEFT JOIN sc ON course.cid = sc.cid
    LEFT JOIN student ON sc.sid = student.sid
GROUP BY
    student.sid,
    sname;