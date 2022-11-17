/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/duplicate-emails/
 创建者：Cicero
 创建日期：2021-10-17
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到重复出现的电邮。
 2. 案例：——
 3. 公式：——
 4. 实现：——
 */
USE sql_daily_exercises;

-- 使用 GROUP BY
SELECT
    Email
FROM
    Person
GROUP BY
    Email
HAVING
    COUNT(*) > 1;

-- 使用嵌套查询
SELECT
    DISTINCT A .Email
FROM
    (
        SELECT
            Email,
            COUNT(*) over(PARTITION BY Email) AS emails_fre
        FROM
            Person
    ) AS A
WHERE
    A .emails_fre > 1;

-- group by
SELECT
    A .Email
FROM
(
        SELECT
            Email,
            COUNT(*) AS emails_fre
        FROM
            Person
        GROUP BY
            Email
    ) AS A
WHERE
    A .emails_fre > 1;

-- Fastest!
SELECT distinct a.Email
FROM Person a,Person b
WHERE a.Id>b.Id
AND a.Email=b.Email;