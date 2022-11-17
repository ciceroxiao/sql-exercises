/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://www.nowcoder.com/practice/7e920bb2e1e74c4e83750f5c16033e2e?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
 创建者：Cicero
 创建日期：2021-9-19
 修改日期：
 
 Cicero 的解题思路：
 */
SHOW DATABASES;

USE sql_daily_exercises;

CREATE TRIGGER audit_log after
INSERT
    ON employees_test FOR EACH ROW
INSERT INTO
    audit
VALUES
    (NEW .ID, NEW .NAME);

-- 插入下面语句后，执行构造器
INSERT INTO
    employees_test (ID, NAME, AGE, ADDRESS, SALARY)
VALUES
    (1, 'Paul', 32, 'California', 20000.00);