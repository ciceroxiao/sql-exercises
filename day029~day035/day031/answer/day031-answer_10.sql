/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-5
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询没有学全所有课的同学的学号、姓名；
 2. 案例：
 3. 公式：
 4. 实现：
 4.1 统计课程的总数量;
 4.2 找到所学课程数量小于课程总数量的 SId；
 4.3 联结表 Student，找到对应学生的姓名。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    t1.sid,
    sname
FROM
    (
        SELECT
            COUNT(cid),
            sid
        FROM
            sc
        GROUP BY
            sid
        HAVING
            COUNT(cid) < (
                SELECT
                    COUNT(DISTINCT cid)
                FROM
                    course
            )
    ) t1
    LEFT JOIN student ON t1.sid = student.sid;