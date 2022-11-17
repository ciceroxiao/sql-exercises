/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-6
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询没学过”张三”老师讲授的任一门课程的学生姓名
 2. 案例：——
 3. 公式：——
 4. 实现：
 4.1 先找到“张三”讲授的课程；
 4.2 再联结表 sc ，找到学过 4.1 所得课程的学生；
 4.3 最后，找到 SID 不在 4.2 中的学生。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    sname
FROM
    student
WHERE
    sid NOT IN (
        SELECT
            DISTINCT sid
        FROM
            sc
            LEFT JOIN course ON sc.cid = course.cid
            LEFT JOIN teacher ON course.tid = teacher.tid
        WHERE
            tname = '张三'
    );