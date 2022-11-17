/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-6
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询至少有一门课与学号为“01”的同学所学相同的同学的学号和姓名；
 2. 案例：——
 3. 公式：——
 4. 实现：
 4.1 先找到学号为“01”的同学所学的课程；
 4.2 再联结表 SC 和表 Student，得到参加过 4.1 所得课程的学生学号和姓名。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    DISTINCT b.sid,
    C .sname
FROM
    (
        SELECT
            cid
        FROM
            sc
        WHERE
            sid = '01'
    ) AS A
    LEFT JOIN sc AS b ON A .cid = b.cid
    LEFT JOIN student AS C ON b.sid = C .sid;