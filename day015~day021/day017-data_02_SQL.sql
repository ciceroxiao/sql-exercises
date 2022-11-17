/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
语言运行环境：MySQL 8.0
原题链接：https://www.nowcoder.com/practice/aeaa116185f24f209ca4fa40e226de48?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-21
修改日期：
*/


SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists audit;
drop table if exists employees_test;
CREATE TABLE employees_test(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);

CREATE TABLE audit(
    EMP_no INT NOT NULL,
    create_date datetime NOT NULL
);
