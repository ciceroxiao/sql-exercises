/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-7
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：17. 按平均成绩从高到低显示所有学生的平均成绩
 2. 案例：——
 3. 公式：——
 4. 实现：——
 4.1 使用 GROUP BY、AVG() 找到各个学生的平均成绩；
 4.2 再使用平均成绩降序排序。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    sid,
    ROUND(AVG(score), 2)
FROM
    sc
GROUP BY
    sid
ORDER BY
    AVG(score) DESC;