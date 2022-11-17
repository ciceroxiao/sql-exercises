/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/customers-who-never-order/
 创建者：Cicero
 创建日期：2021-10-18
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：查询从未下过订单的用户。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：——
 */
USE sql_daily_exercises;

SELECT
    A .Name AS Customers
FROM
    Customers AS A
    LEFT JOIN Orders AS b ON A .Id = b.CustomerId
WHERE
    b.CustomerId IS NULL;
