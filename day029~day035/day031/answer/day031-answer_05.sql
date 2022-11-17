/*
 所属项目：SQL-daily-exerCIses
 所属数据库：SQL_daily_exerCIses
 语言运行环境：MySQL 8.0
 原题链接：http://smilecoc.vip/2020/04/04/SQL%E9%9D%A2%E8%AF%9544%E9%A2%98/
 创建者：CIcero
 创建日期：2021-10-5
 修改日期：
 
 CIcero 的解题思路：
 1. 审题：查询没学过“张三”老师课的同学的学号、姓名；
 2. 案例：
 3. 公式：
 4. 实现：
 4.1 先找到学过“张三”老师课的同学的学号；
 4.2 再使用子查询，排除 4.1 所得的学号，即为所求数据。
 */
SHOW DATABASES;

USE sql_daily_exerCIses;

SELECT
    SId,
    sname
FROM
    Student
WHERE
    SId NOT IN (
        SELECT
            C .SId
        FROM
            Teacher AS A
            LEFT JOIN Course AS b ON A .TId = b.TId
            LEFT JOIN Sc AS C ON b.CId = C .CId
        WHERE
            A .Tname = '张三'
    );