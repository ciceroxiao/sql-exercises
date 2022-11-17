/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/5cdbf1dcbe8d4c689020b6b2743820bf?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-24
 修改日期：
 
 Cicero 的解题思路：
 1. 先观察表，总共有三张表：
 employees:
    emp_no(Primary Key)
    birth_date
    first_name
    last_name
    gender
    hire_date
 emp_bonus:
    emp_no
    received
    btype
 salaries:
    emp_no(Primary Key)
    salary
    from_date(Primary Key)
    to_date
 2. 再联结各个表，找到各个员工对应的 emp_no、first_name、last_name、btype、和 salary；
 3. 使用限定条件 salaries.to_date = '9999-01-01' 得到员工的最新工资 salary；
 4，最后使用 CASE 语法来获取 btype 对应的奖金 bonus。
 */
SHOW DATABASES;

USE sql_daily_exercises;

SELECT
    A .emp_no,
    A .first_name,
    A .last_name,
    C .btype,
    b.salary,
    (
        CASE
            C .btype
            WHEN 1 THEN b.salary * 0.1
            WHEN 2 THEN b.salary * 0.2
            ELSE b.salary * 0.3
        END
    ) AS bonus
FROM
    employees AS A
    LEFT JOIN salaries AS b ON A .emp_no = b.emp_no
    LEFT JOIN emp_bonus AS C ON A .emp_no = C .emp_no
WHERE
    b.to_date = '9999-01-01';