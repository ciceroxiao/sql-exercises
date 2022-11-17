/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：Cicero
 创建日期：2021-10-5
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询姓“李”的老师的个数；
 2. 案例：
 3. 公式：
 4. 实现：
 4.1 使用 WHERE 语句找到姓“李”的老师；
 4.2 使用 COUNT(DISTINCT TId) 计数。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    COUNT(DISTINCT TId) AS teacher_nums
FROM
    Teacher
WHERE
    Tname LIKE '李%';