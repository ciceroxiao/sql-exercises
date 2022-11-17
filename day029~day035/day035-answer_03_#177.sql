/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/nth-highest-salary/
 创建者：Cicero
 创建日期：2021-10-10
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：查询表中第 N 高薪水。如果没有对应的薪水，则返回 Null。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 Salary 去重；
 4.2 按 Salary 降序排序；
 4.3 使用 LIMIT OFF 输出指定位置的 Salary。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    DISTINCT Salary
FROM
    Employee
ORDER BY
    Salary DESC
LIMIT
    0, 1;