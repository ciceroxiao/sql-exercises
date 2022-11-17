/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/f858d74a030e48da8e0f69e21be63bef?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-15
修改日期：
*/


SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists  `dept_emp` ; 
drop table if exists  `dept_manager` ; 
drop table if exists  `salaries` ; 
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `dept_manager` (
`dept_no` char(4) NOT NULL,
`emp_no` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
INSERT INTO dept_emp VALUES(10001,'d001','1986-06-26','9999-01-01');
INSERT INTO dept_emp VALUES(10002,'d001','1996-08-03','9999-01-01');
INSERT INTO dept_manager VALUES('d001',10002,'1996-08-03','9999-01-01');
INSERT INTO salaries VALUES(10001,88958,'2002-06-22','9999-01-01');
INSERT INTO salaries VALUES(10002,72527,'1996-08-03','9999-01-01');
