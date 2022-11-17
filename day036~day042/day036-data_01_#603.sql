/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：
 创建者：Cicero
 创建日期：2021-10-11
 修改日期：
 */
SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists cinema;

create table if not exists cinema(
    seat_id int(4),
    free int(4)
);

insert into cinema (seat_id, free) values (1, 1);
insert into cinema (seat_id, free) values (2, 0);
insert into cinema (seat_id, free) values (3, 1);
insert into cinema (seat_id, free) values (4, 1);
insert into cinema (seat_id, free) values (5, 1);