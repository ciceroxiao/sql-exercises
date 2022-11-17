/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/find-cumulative-salary-of-an-employee/
 创建者：Cicero
 创建日期：2021-10-16
 修改日期：
 */
USE sql_daily_exercises;

DROP TABLE IF EXISTS employee;

CREATE TABLE IF NOT EXISTS Employee (Id INT, MONTH INT, Salary INT);

Truncate TABLE Employee;

INSERT INTO
    Employee (Id, MONTH, Salary)
VALUES
    ('1', '1', '20');

INSERT INTO
    Employee (Id, MONTH, Salary)
VALUES
    ('2', '1', '20');

INSERT INTO
    Employee (Id, MONTH, Salary)
VALUES
    ('1', '2', '30');

INSERT INTO
    Employee (Id, MONTH, Salary)
VALUES
    ('2', '2', '30');

INSERT INTO
    Employee (Id, MONTH, Salary)
VALUES
    ('3', '2', '40');

INSERT INTO
    Employee (Id, MONTH, Salary)
VALUES
    ('1', '3', '40');

INSERT INTO
    Employee (Id, MONTH, Salary)
VALUES
    ('3', '3', '60');

INSERT INTO
    Employee (Id, MONTH, Salary)
VALUES
    ('1', '4', '60');

INSERT INTO
    Employee (Id, MONTH, Salary)
VALUES
    ('3', '4', '70');