/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/combine-two-tables/
 创建者：Cicero
 创建日期：2021-10-10
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询 FirstName、LastName、City 和 State。如果 Person.PersonId 没有对应的 Address.AddressId，则返回 null。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：直接使用左连接就可实现需求。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    a.FirstName,
    a.LastName,
    b.City,
    b.State
FROM
    Person AS A
    LEFT JOIN Address AS b ON a.PersonId = b.PersonId;