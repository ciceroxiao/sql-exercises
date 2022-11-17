/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/count-student-number-in-departments/
 创建者：Cicero
 创建日期：2021-10-22
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists student;
drop table if exists department;

CREATE TABLE IF NOT EXISTS student (
    student_id INT,
    student_name VARCHAR(45), 
    gender VARCHAR(6), 
    dept_id INT);
CREATE TABLE IF NOT EXISTS department (
    dept_id INT, 
    dept_name VARCHAR(255));

Truncate table student;
insert into student (student_id, student_name, gender, dept_id) 
    values ('1', 'Jack', 'M', '1');
insert into student (student_id, student_name, gender, dept_id) 
    values ('2', 'Jane', 'F', '1');
insert into student (student_id, student_name, gender, dept_id) 
    values ('3', 'Mark', 'M', '2');

Truncate table department;
insert into department (dept_id, dept_name) 
    values ('1', 'Engineering');
insert into department (dept_id, dept_name) 
    values ('2', 'Science');
insert into department (dept_id, dept_name) 
    values ('3', 'Law');