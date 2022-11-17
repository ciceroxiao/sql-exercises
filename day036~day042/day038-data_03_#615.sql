/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：
 创建者：Cicero
 创建日期：
 修改日期：
 */
SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists salary;

create table if not exists salary (
    id int(3),
    employee_id int(3),
    amount int(6),
    pay_date date
);

insert into salary (id, employee_id, amount, pay_date) values (1, 1, 9000, "2017-03-31");
insert into salary (id, employee_id, amount, pay_date) values (2, 2, 6000, "2017-03-31");
insert into salary (id, employee_id, amount, pay_date) values (3, 3, 10000, "2017-03-31");
insert into salary (id, employee_id, amount, pay_date) values (4, 1, 7000, "2017-02-28");
insert into salary (id, employee_id, amount, pay_date) values (5, 2, 6000, "2017-02-28");
insert into salary (id, employee_id, amount, pay_date) values (6, 3, 8000, "2017-02-28");

drop table if exists employee;

create table if not exists employee (
    employee_id int(2),
    department_id int(2)
);

insert into employee (employee_id, department_id) values (1, 1);
insert into employee (employee_id, department_id) values (2, 2);
insert into employee (employee_id, department_id) values (3, 2);