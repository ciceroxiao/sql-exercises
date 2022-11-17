/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/6744b90bbdde40209f8ecaac0b0516fe?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-16
修改日期：

Cicero 的解题思路：
None
*/

SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    CONCAT(last_name, " ", first_name) AS "Name"
FROM
    employees;
