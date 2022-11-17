/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/c69ac94335744480aa50646864b7f24d?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-25
 修改日期：
 
 Cicero 的解题思路：
 1. 先使用 GROUP BY 将数据按照 grade.number 分类；
 2. 其次，使用 HAVING 找到 COUNT(grade.number) > 2 的类别。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    NUMBER
FROM
    grade
GROUP BY
    NUMBER
HAVING
    COUNT(NUMBER) > 2;