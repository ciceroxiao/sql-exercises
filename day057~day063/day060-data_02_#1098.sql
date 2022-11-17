/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/unpopular-books/
 创建者：Cicero
 创建日期：2021-11-10
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Books;
create table if not exists Books(
    book_id int,
    name varchar(255),
    available_from date,
    Primary Key(book_id)
);
Truncate table Books;
insert into Books values(1, 'Kalila And Demna', '2010-01-01');
insert into Books values(2, '28 Letters',       '2012-05-12');
insert into Books values(3, 'The Hobbit',       '2019-06-10');
insert into Books values(4, '13 Reasons Why',   '2019-06-01');
insert into Books values(5, 'The Hunger Games', '2008-09-21');

drop table if exists Orders;
create table if not exists Orders(
    order_id int,
    book_id int,
    quantity int,
    dispatch_date date,
    Primary Key(order_id)
);
Truncate table Orders;
insert into Orders values(1, 1, 2, '2018-07-26');
insert into Orders values(2, 1, 1, '2018-11-05');
insert into Orders values(3, 3, 8, '2019-06-11');
insert into Orders values(4, 4, 6, '2019-06-05');
insert into Orders values(5, 4, 5, '2019-06-20');
insert into Orders values(6, 5, 9, '2009-02-02');
insert into Orders values(7, 5, 8, '2019-04-13');