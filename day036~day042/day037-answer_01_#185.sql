/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/department-top-three-salaries/
 创建者：Cicero
 创建日期：2021-10-11
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到各个部门中，收入前三的员工信息。
 2. 案例：——
 3. 公式：——
 4. 实现：
 4.1 先找到各部门中，排名前三的薪水；
 4.2 再找到对应部门、对应薪水的员工。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    C .Name AS Department,
    A .Name AS Employee,
    A .Salary
FROM
    Employee AS A
    LEFT JOIN (
        SELECT
            Id,
            Salary,
            DepartmentId,
            dense_Rank() over(
                PARTITION BY DepartmentId
                ORDER BY
                    Salary DESC
            ) AS salary_rank
        FROM
            Employee
    ) AS b ON A .Id = b.Id
    LEFT JOIN Department AS C ON b .DepartmentId = C .Id
WHERE
    A .DepartmentId = b.DepartmentId
    AND b.salary_rank <= 3;
