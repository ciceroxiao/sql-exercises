/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-5
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询课程编号“01”的成绩比课程编号“02”课程低的所有同学的学号、姓名；
 2. 案例：——
 3. 公式：——
 4. 实现：
 4.1 先找到同时学了“01”和“02”的学生的“01”和“02”课程的成绩；
 4.2 其次，再通过 WHERE 字句，筛选出对应数据；
 4.3 最后，联结表 student，找到对应学生的姓名。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    t1.sid,
    sname
FROM
    (
        SELECT
            DISTINCT t1.sid AS sid
        FROM
            (
                SELECT
                    *
                FROM
                    sc
                WHERE
                    cid = '01'
            ) t1
            LEFT JOIN (
                SELECT
                    *
                FROM
                    sc
                WHERE
                    cid = '02'
            ) t2 ON t1.sid = t2.sid
        WHERE
            t1.score > t2.score
    ) t1
    LEFT JOIN student ON t1.sid = student.sid;