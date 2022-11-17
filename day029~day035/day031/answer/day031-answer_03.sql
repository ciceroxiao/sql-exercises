/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-5
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询所有同学的学号、姓名、选课数、总成绩
 2. 案例：——
 3. 公式：——
 4. 实现：
 4.1 先在表 SC 中使用 GROUP BY，对学生分组；
 4.2 其次使用 COUNT(CId)、SUM(score)得到每个学生的选课数和总成绩；
 4.3 最后，再联结表 Student，得到学生的姓名。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    A .SId,
    b.Sname,
    COUNT(CId) AS sourse_num,
    SUM(score) AS total_score
FROM
    SC AS A
    LEFT JOIN STudent AS b ON A .SId = b.SId
GROUP BY
    SId;