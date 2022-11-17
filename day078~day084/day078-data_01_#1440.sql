/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/evaluate-boolean-expression/
 创建者：Cicero
 创建日期：2021-11-28
 修改日期：
 */

USE sql_daily_exercises;

drop table if exists Variables;
drop table if exists Expressions;
Create Table If Not Exists Variables (name varchar(3), value int);
Create Table If Not Exists Expressions (left_operand varchar(3), operator ENUM('>', '<', '='), right_operand varchar(3));
Truncate table Variables;
insert into Variables (name, value) values ('x', '66');
insert into Variables (name, value) values ('y', '77');
Truncate table Expressions;
insert into Expressions (left_operand, operator, right_operand) values ('x', '>', 'y');
insert into Expressions (left_operand, operator, right_operand) values ('x', '<', 'y');
insert into Expressions (left_operand, operator, right_operand) values ('x', '=', 'y');
insert into Expressions (left_operand, operator, right_operand) values ('y', '>', 'x');
insert into Expressions (left_operand, operator, right_operand) values ('y', '<', 'x');
insert into Expressions (left_operand, operator, right_operand) values ('x', '=', 'x');

-- 核验数据
select * from Variables;
select * from Expressions;