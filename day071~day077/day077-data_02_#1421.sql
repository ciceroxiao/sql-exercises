/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/npv-queries/
 创建者：Cicero
 创建日期：2021-11-27
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists NPV;
create table if not exists NPV (
    id      int,
    year    int,
    npv     int,
    primary key (id, year)
);
truncate table NPV;
insert into NPV (id, year, npv) values ('1', '2018', '100');
insert into NPV (id, year, npv) values ('7', '2020', '30');
insert into NPV (id, year, npv) values ('13', '2019', '40');
insert into NPV (id, year, npv) values ('1', '2019', '113');
insert into NPV (id, year, npv) values ('2', '2008', '121');
insert into NPV (id, year, npv) values ('3', '2009', '12');
insert into NPV (id, year, npv) values ('11', '2020', '99');
insert into NPV (id, year, npv) values ('7', '2019', '0');

drop table if exists Queries;
create table if not exists Queries (
    id      int,
    year    int,
    primary key (id, year)
);
truncate table Queries;
insert into Queries (id, year) values ('1', '2019');
insert into Queries (id, year) values ('2', '2008');
insert into Queries (id, year) values ('3', '2009');
insert into Queries (id, year) values ('7', '2018');
insert into Queries (id, year) values ('7', '2019');
insert into Queries (id, year) values ('7', '2020');
insert into Queries (id, year) values ('13', '2019');

-- 核验数据
select * from NPV;
select * from Queries;