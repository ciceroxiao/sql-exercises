/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/a32669eb1d1740e785f105fa22741d5c?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-12
修改日期：

Cicero 的解题思路：
1. employees 表所有 emp_no 为奇数：emp_no % 2 = 1
2. last_name 不为 Mary 的员工信息：last name NOT LIKE "Mary"
3. 并按照hire_date逆序排列：ORDER BY hire_date DESC

他人思路（使用 "&" 判断某个数是否为奇偶数）：
1. employees 表所有 emp_no 为奇数：emp_no & 1 = 1
2. last_name 不为 Mary 的员工信息：last name NOT LIKE "Mary"
3. 并按照hire_date逆序排列：ORDER BY hire_date DESC
*/

/* Cicero 的思路：
SELECT
    emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
FROM
    employees
WHERE
    emp_no % 2 = 1
        AND
    last_name != "Mary" 
    -- 此处别用 NOT LIKE，因为其执行速度是 <> 的两倍
    -- 原因大概是：系统先执行 LIKE，而后再执行 NOT
    -- 执行速度比较：
    -- NOT REGEXP: 0.07450100
    -- NOT LIKE  : 0.00292700
    -- <>        : 0.00626650
    -- !=        : 0.00067050
ORDER BY
    hire_date DESC;
*/

-- 使用 “&” 运算：
-- Cicero：此法的运行速度自然要快许多，但不便于人类理解阅读，因此要谨慎使用 “&”
SELECT
    emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
FROM
    employees
WHERE
    emp_no & 1 = 1
        AND
    last_name != "Mary"
ORDER BY
    hire_date DESC;