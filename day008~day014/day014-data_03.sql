/*
所属项目：SQL-daily-exercises
所属数据库：SQL_daily_exercises
原题链接：https://www.nowcoder.com/practice/b9db784b5e3d488cbd30bd78fdb2a862?tpId=82&tags=&title=&difficulty=0&judgeStatus=0&rp=1
创建者：Cicero
创建日期：2021-9-18
修改日期：
*/


SHOW DATABASES;

USE sql_daily_exercises;

drop table if exists actor;
CREATE TABLE  actor  (
   actor_id  smallint(5)  NOT NULL PRIMARY KEY,
   first_name  varchar(45) NOT NULL,
   last_name  varchar(45) NOT NULL,
   last_update datetime NOT NULL);
insert into actor values ('1', 'PENELOPE', 'GUINESS', '2006-02-15 12:34:33'), ('2', 'NICK', 'WAHLBERG', '2006-02-15 12:34:33');
