/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/218ae58dfdcd4af195fff264e062138f?tpId=82&&tqId=29753&rp=1&ru=/ta/sql&qru=/ta/sql/question-ranking
创建者：Cicero
创建日期：2021-9-5
修改日期：

Cicero 的解题思路：
思路 A（只适用于该题）：
1. 数据排序：数据按照 hire_date 降序排序；
2. 查询所需数据：选出排在第一位的数据。

思路 B（可扩展）：
1. 使用子查询得到入职最晚的日期；
2. 根据 1. 所得的数据，查询对应的入职员工。
*/
-- 思路 A：
USE vega;
SELECT
    emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
FROM
    employees
ORDER BY hire_date DESC
LIMIT 1;


-- 思路 B：
/* 使用子查询得到入职最晚的日期
SELECT
    max(hire_date)
FROM
    employees;
*/

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
    hire_date = (SELECT
                    max(hire_date)
                 FROM
                    employees);