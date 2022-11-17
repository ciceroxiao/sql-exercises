/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-6
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：检索“01”课程分数小于60，按分数降序排列的学生信息
 2. 案例：
 3. 公式：
 4. 实现：
 4.1 使用 IF 函数来找到“01”课程分数小于 60 的 SId。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    sid,
    IF(cid = '01', score, 60) as less_than_60
FROM
    sc
WHERE
    IF(cid = '01', score, 60) < 60
ORDER BY
    less_than_60 DESC;