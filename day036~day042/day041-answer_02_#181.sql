/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/employees-earning-more-than-their-managers/
 创建者：Cicero
 创建日期：2021-10-15
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到其工资高于其经理工资的员工。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 使用自连接，找到对应的员工即可。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    a1.Name AS Employee
FROM
    Employee AS a1
    INNER JOIN Employee AS a2 ON a1.ManagerId = a2.Id
WHERE
    a1.Salary > a2.Salary;