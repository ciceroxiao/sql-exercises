/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-5
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询学过“01”并且也学过编号“02”课程的同学的学号、姓名；
 2. 案例：——
 3. 公式：——
 4. 实现：
 4.1 先在 SC 表中找到学过“01”和“02”的 SId；
 4.2 再联结表 Student，找到对应学生的姓名。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    A .SId,
    sname
FROM
    (
        SELECT
            SId,
            COUNT(IF(CId = '01', score, NULL)) AS count_01,
            COUNT(IF(CId = '02', score, NULL)) AS count_02
        FROM
            SC
        GROUP BY
            SId
        HAVING
            COUNT(IF(CId = '01', score, NULL)) > 0
            AND COUNT(IF(CId = '02', score, NULL)) > 0
    ) A
    LEFT JOIN student ON A .SId = student.SId;