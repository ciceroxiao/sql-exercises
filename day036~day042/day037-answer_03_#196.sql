/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/delete-duplicate-emails/submissions/
 创建者：Cicero
 创建日期：2021-10-11
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：删除所有重复邮箱，且只保留最小 Person.Id 对应的 Person.Email。
 2. 案例：——
 3. 公式：——
 4. 实现：
 4.1 先使用等值连接；
 4.2 再条件过滤，删去非最小值对应的 Person.Id 和 Person.Email。
 */
SHOW DATABASES;

USE sql_daily_exercises;

DELETE
    P1
FROM
    Person AS P1,
    Person AS P2
WHERE
    P1.email = P2.email
    AND P1.Id > P2.Id;