/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/find-cumulative-salary-of-an-employee/
 创建者：Cicero
 创建日期：2021-10-16
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：查询员工每个月的工资累计和，但不包括各员工的最近一个月工资。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 先去除表中各员工最近一个月的数据；
 4.2 然后使用窗口函数，得到各个员工的月累计工资。
 */
USE sql_daily_exercises;

-- 先去除表中各员工最近一个月的数据
SELECT
    A .Id,
    A .Month,
    A .Salary
FROM
    Employee AS A
    LEFT JOIN (
        SELECT
            Id,
            MAX(MONTH) AS last_month
        FROM
            Employee
        GROUP BY
            Id
    ) AS b ON A .Id = b.Id
WHERE
    A .Month <> b.last_month
ORDER BY
    Id,
    MONTH;

-- 然后使用窗口函数，得到各个员工的月累计工资
SELECT
    A .Id,
    A .Month,
    SUM(Salary) over(
        PARTITION BY A .Id
        ORDER BY
            A .Salary
    ) AS Salary
FROM
    Employee AS A
    LEFT JOIN (
        SELECT
            Id,
            MAX(MONTH) AS last_month
        FROM
            Employee
        GROUP BY
            Id
    ) AS b ON A .Id = b.Id
WHERE
    A .Month <> b.last_month
ORDER BY
    Id,
    Salary DESC;