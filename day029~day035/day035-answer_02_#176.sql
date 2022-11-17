/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/second-highest-salary/
 创建者：Cicero
 创建日期：2021-10-10
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：找到表中薪水次高的信息。如果没有，则返回 null。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：使用子查询：先找到最高薪水，而后再找到次高薪水。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    MAX(Salary) AS SecondHighestSalary
FROM
    Employee
WHERE
    Salary < (
        SELECT
            MAX(Salary)
        FROM
            Employee
    );