/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
语言运行环境：MySQL 8.0
原题链接：https://www.nowcoder.com/practice/74d90728827e44e2864cce8b26882105?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-22
修改日期：

Cicero 的解题思路：
1. 使用 SUBSTRING() 获取 employees.first_name 的最后两个字母；
2，再以 1. 所得数据升序排序。
*/

SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    first_name
FROM
    employees
ORDER BY
    SUBSTRING(first_name, -2, 2);