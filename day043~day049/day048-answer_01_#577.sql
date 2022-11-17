/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/employee-bonus/
 创建者：Cicero
 创建日期：2021-10-22
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：找到 bonus < 1000 的员工信息。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：
 4.1 连接表 Employee 和表 Bonus，得到各个员工的 bonus 信息；
 4.2 bonus < 1000 有两种情况：bonus < 1000 和 bonus is null；

 */

USE sql_daily_exercises;

-- 连接表 Employee 和表 Bonus
select
    A.EmpId,
    A.name,
    A.salary,
    B.bonus
from
    Employee as A
        left join
    Bonus as B on A.EmpId = B.EmpId;

--找到 bonus < 1000 的用户：
select
    A.name,
    B.bonus
from
    Employee as A
        left join
    Bonus as B on A.EmpId = B.EmpId
where
    B.bonus < 1000
        or
    B.bonus is null;

-- 一般来说，不建议数据表中留有空值或 NUll 值。比如此处，用 0 代替 NULL 可能会比较好。