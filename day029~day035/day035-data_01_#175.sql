/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/combine-two-tables/
 创建者：Cicero
 创建日期：2021-10-10
 修改日期：
 */
SHOW DATABASES;

USE sql_daily_exercises;

CREATE TABLE IF NOT EXISTS Person (
    PersonId INT,
    FirstName VARCHAR(255),
    LastName VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Address (
    AddressId INT,
    PersonId INT,
    City VARCHAR(255),
    State VARCHAR(255)
);

Truncate TABLE Person;

INSERT INTO
    Person (PersonId, LastName, FirstName)
VALUES
    ('1', 'Wang', 'Allen');
INSERT INTO
    Person (PersonId, LastName, FirstName)
VALUES
    ('2', 'Alice', 'Bob');

Truncate TABLE Address;

INSERT INTO
    Address (AddressId, PersonId, City, State)
VALUES
    ('1', '2', 'New York City', 'New York');
INSERT INTO
    Address (AddressId, PersonId, City, State)
VALUES
    ('2', '3', 'Leetcode', 'California');