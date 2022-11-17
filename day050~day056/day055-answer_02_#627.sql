/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/swap-salary/
 创建者：Cicero
 创建日期：2021-10-29
 修改日期：
 
 Cicero 的解题思路：
 1. 需求：交换表中的 sex 值。
 2. 案例：见题目。
 3. 公式：——
 4. 实现：直接使用 CASE WHEN 即可实现需求。
 */
USE sql_daily_exercises;

-- 使用 CASE WHEN：45.92%
UPDATE
    Salary
SET
    sex = (
        CASE
            WHEN sex = "f" THEN "m"
            ELSE "f"
        END
    );

-- 使用 XOR ^ 和 ASCII：21.82%
UPDATE
    Salary
SET
    sex = CHAR(ASCII('f') + ASCII("m") - ASCII(sex));

-- 使用 XOR ^ 和 ASCII：5.02%
UPDATE
    salary
SET
    sex = CHAR(ASCII('f') ^ ASCII('m') ^ ASCII(sex));