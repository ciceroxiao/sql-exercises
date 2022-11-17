/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：
创建者：Cicero
创建日期：
修改日期：
*/


SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists actor;
CREATE TABLE actor (
   actor_id  smallint(5)  NOT NULL PRIMARY KEY,
   first_name  varchar(45) NOT NULL,
   last_name  varchar(45) NOT NULL,
   last_update  DATETIME NOT NULL);
insert into actor values ('3', 'WD', 'GUINESS', '2006-02-15 12:34:33');
