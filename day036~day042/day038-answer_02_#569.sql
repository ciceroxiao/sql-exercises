/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/median-employee-salary/
 创建者：Cicero
 创建日期：2021-10-12
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到各个公司的工资中位数。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 题目建议：不使用 SQL 内置函数的话，会有奖励。那么，Cicero 就从两个角度来解决这个需求：
 4.2 使用 SQL 内置函数：
 4.2.1 使用窗口函数 ROW_NUMBER() 按照 Salary 得到各公司中各工资的正序、逆序；
 4.2.2 再使用 COUNT(*) 的窗口函数，得到各公司的工资数量；
 4.2.3 而后找到正序、逆序均大于工资总数的一半的 Id，此 Id 对应的 Salary 即为对应的中位数 Salary；
 4.2.4 最后，联结表 Employee，使用 GROUP BY 找到对应工资的员工（这一步，目的是输出数据与题目要求一致。实际上，题目的 C 输出是错的。）
 4.3 不使用 SQL 内置函数：
 4.3.1 “中位数”是什么？中位数的本质是：（大于这个数的数字的个数）等于（小于这个数的数字的个数）。
 4.3.2 因此，在此处，可以通过自连接，找到找个数。
 4.3.3 为什么要自连接？自连接可以实现：显示一个表的数据，但实际存在两个表的数据。至少有两个对象，彼此才可以比较。
 4.3.4 在此处，提供两种写法。
 */
SHOW DATABASES;

USE sql_daily_exercises;

-- 4.2 使用 SQL 内置函数
SELECT
    b.Id,
    b.Company,
    b.Salary
FROM
    Employee AS b
    LEFT JOIN (
        SELECT
            Company,
            Salary
        FROM
            (
                SELECT
                    Id,
                    Company,
                    Salary,
                    row_number() over(
                        PARTITION BY Company
                        ORDER BY
                            Salary
                    ) AS t_rank_asc,
                    row_number() over(
                        PARTITION BY Company
                        ORDER BY
                            Salary DESC
                    ) AS t_rank_desc,
                    COUNT(*) over(PARTITION BY Company) AS total
                FROM
                    Employee
            ) AS A
        WHERE
            t_rank_asc >= (total / 2)
            AND t_rank_desc >= (total / 2)
    ) AS C ON b.Company = C .Company
WHERE
    b.Salary = C .Salary
GROUP BY
    Company,
    Salary;

-- 分割线
-- 分割线
-- 4.3 不使用 SQL 内置函数
-- 第一种写法
SELECT
    a1.Company,
    a1.Id,
    a1.Salary
FROM
    Employee AS a1
WHERE
    1 >= abs(
        (
            SELECT
                COUNT(*)
            FROM
                Employee AS a2
            WHERE
                a1.Company = a2.Company
                AND a1.Salary >= a2.Salary
        ) - (
            SELECT
                COUNT(*)
            FROM
                Employee AS a3
            WHERE
                a1.Company = a3.Company
                AND a1.Salary <= a3.Salary
        )
    )
GROUP BY
    Company,
    Salary;

-- 4.3 不使用 SQL 内置函数
-- 第二种写法
SELECT
    a1.Id,
    a1.Company,
    a1.Salary
FROM
    Employee AS a1,
    Employee AS a2
WHERE
    a1.Company = a2.Company
GROUP BY
    a1.Company,
    a1.Salary
HAVING
    SUM(
        CASE
            WHEN a1.Salary = a2.Salary THEN 1
            ELSE 0
        END
    ) >= ABS(SUM(SIGN(a1.Salary - a2.Salary)))
ORDER BY
    a1.Id;