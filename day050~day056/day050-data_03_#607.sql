/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/sales-person/
 创建者：Cicero
 创建日期：2021-10-24
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists salesperson;
drop table if exists company;
drop table if exists orders;


create table if not exists salesperson (
    sales_id int(2),
    name varchar(10),
    salary int(10),
    commission_rate int(4),
    hire_date varchar(15)
);

truncate table salesperson;

insert into salesperson (sales_id, name, salary, commission_rate, hire_date) values (1, 'John', 100000, 6, '4/1/2006');
insert into salesperson (sales_id, name, salary, commission_rate, hire_date) values (2, 'Amy', 120000, 5, '5/1/2010');
insert into salesperson (sales_id, name, salary, commission_rate, hire_date) values (3, 'Mark', 65000, 12, '12/25/2008');
insert into salesperson (sales_id, name, salary, commission_rate, hire_date) values (4, 'Pam', 25000, 25, '1/1/2005');
insert into salesperson (sales_id, name, salary, commission_rate, hire_date) values (5, 'Alex', 50000, 10, '2/3/2007');


create table if not exists company (
    com_id int(2),
    name varchar(10),
    city varchar(10)
);

truncate table company;

insert into company (com_id, name, city) values (1, 'RED', 'Boston');
insert into company (com_id, name, city) values (2, 'ORANGE', 'New York');
insert into company (com_id, name, city) values (3, 'YELLOW', 'Boston');
insert into company (com_id, name, city) values (4, 'GREEN', 'Austin');


create table if not exists orders (
    order_id int(2),
    date varchar(15),
    com_id int(2),
    sales_id int(2),
    amount int(10)
);

truncate table orders;

insert into orders (order_id, date, com_id, sales_id, amount) values (1, '1/1/2014', 3, 4, 100000);
insert into orders (order_id, date, com_id, sales_id, amount) values (2, '2/1/2014', 4, 5, 5000);
insert into orders (order_id, date, com_id, sales_id, amount) values (3, '3/1/2014', 1, 1, 50000);
insert into orders (order_id, date, com_id, sales_id, amount) values (4, '4/1/2014', 1, 4, 25000);