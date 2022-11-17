/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/number-of-trusted-contacts-of-a-customer/
 创建者：Cicero
 创建日期：2021-11-24
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Customers;
drop table if exists Contacts;
drop table if exists Invoices;
Create table If Not Exists Customers (customer_id int, customer_name varchar(20), email varchar(30));
Create table If Not Exists Contacts (user_id int, contact_name varchar(20), contact_email varchar(30));
Create table If Not Exists Invoices (invoice_id int, price int, user_id int);
Truncate table Customers;
insert into Customers (customer_id, customer_name, email) values ('1', 'Alice', 'alice@leetcode.com');
insert into Customers (customer_id, customer_name, email) values ('2', 'Bob', 'bob@leetcode.com');
insert into Customers (customer_id, customer_name, email) values ('13', 'John', 'john@leetcode.com');
insert into Customers (customer_id, customer_name, email) values ('6', 'Alex', 'alex@leetcode.com');
Truncate table Contacts;
insert into Contacts (user_id, contact_name, contact_email) values ('1', 'Bob', 'bob@leetcode.com');
insert into Contacts (user_id, contact_name, contact_email) values ('1', 'John', 'john@leetcode.com');
insert into Contacts (user_id, contact_name, contact_email) values ('1', 'Jal', 'jal@leetcode.com');
insert into Contacts (user_id, contact_name, contact_email) values ('2', 'Omar', 'omar@leetcode.com');
insert into Contacts (user_id, contact_name, contact_email) values ('2', 'Meir', 'meir@leetcode.com');
insert into Contacts (user_id, contact_name, contact_email) values ('6', 'Alice', 'alice@leetcode.com');
Truncate table Invoices;
insert into Invoices (invoice_id, price, user_id) values ('77', '100', '1');
insert into Invoices (invoice_id, price, user_id) values ('88', '200', '1');
insert into Invoices (invoice_id, price, user_id) values ('99', '300', '2');
insert into Invoices (invoice_id, price, user_id) values ('66', '400', '2');
insert into Invoices (invoice_id, price, user_id) values ('55', '500', '13');
insert into Invoices (invoice_id, price, user_id) values ('44', '60', '6');

-- 核验数据
select * from Customers;
select * from Contacts;
select * from Invoices;