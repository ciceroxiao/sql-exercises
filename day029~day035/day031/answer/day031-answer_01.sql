/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-5
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询“01”课程比“02”课程成绩高的所有学生的学号；
 2. 案例：——
 3. 公式：——
 4. 实现：
 4.1 先分别找到 SC.CId = 01、SC.CId = 02 的学生；
 4.2 再筛选出“01”比“02”成绩高的学生学号。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    A .SId
FROM
    (
        SELECT
            SId,
            CId,
            score
        FROM
            SC
        WHERE
            CId = "01"
    ) AS A
    LEFT JOIN (
        SELECT
            SId,
            CId,
            score
        FROM
            SC
        WHERE
            CId = "02"
    ) AS b ON A .SId = b.SId
WHERE
    A .score > b.score;