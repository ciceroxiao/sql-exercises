/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/department-highest-salary/
 创建者：Cicero
 创建日期：2021-10-11
 修改日期：
 
 Cicero 的解题思路：
 1. 审题：找到各部门中薪水最高者的信息。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 先找到各部门中的最高薪水；
 4.2 再找到各部门中，拥有最高薪水的员工信息；
 4.3 最后，再连接表 Department，得到对应的 Department.Name。
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 先找到各部门中的最高薪水
SELECT
    DepartmentId,
    MAX(Salary) AS max_salary
FROM
    Employee
GROUP BY
    DepartmentId;

-- 再找到各部门中拥有最高薪水的员工信息
SELECT
    Id,
    NAME,
    Salary,
    a.DepartmentId
FROM
    Employee AS a
    LEFT JOIN (
        SELECT
            DepartmentId,
            MAX(Salary) AS max_salary
        FROM
            Employee
        GROUP BY
            DepartmentId
    ) AS b ON a.DepartmentId = b.DepartmentId
WHERE
    a.Salary = b.max_salary;

-- 最后，再连接表 Department，得到对应的 Department.Name
SELECT
    c.Name as Department,
    a.NAME as Employee,
    Salary
FROM
    Employee AS a
    LEFT JOIN (
        SELECT
            DepartmentId,
            MAX(Salary) AS max_salary
        FROM
            Employee
        GROUP BY
            DepartmentId
    ) AS b ON a.DepartmentId = b.DepartmentId
    left JOIN
    Department as c on a.DepartmentId = c.Id
WHERE
    a.Salary = b.max_salary;