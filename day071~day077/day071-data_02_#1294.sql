/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/weather-type-in-each-country/
 创建者：Cicero
 创建日期：2021-11-22
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Countries;
create table Countries(
    country_id      int,
    country_name    varchar(255),
    primary key(country_id)
);

drop table if exists Weather;
create table Weather(
    country_id      int,
    weather_state   varchar(255),
    day             date,
    primary key(country_id, day)
);

insert into Countries values(2, 'USA');
insert into Countries values(3, 'Australia');
insert into Countries values(7, 'Peru');
insert into Countries values(5, 'China');
insert into Countries values(8, 'Morocco');
insert into Countries values(9, 'Spain');

insert into Weather values(2, 15,   '2019-11-01');
insert into Weather values(2, 12,   '2019-10-28');
insert into Weather values(2, 12,   '2019-10-27');
insert into Weather values(3, -2,   '2019-11-10');
insert into Weather values(3, 0,    '2019-11-11');
insert into Weather values(3, 3,    '2019-11-12');
insert into Weather values(5, 16,   '2019-11-07');
insert into Weather values(5, 18,   '2019-11-09');
insert into Weather values(5, 21,   '2019-11-23');
insert into Weather values(7, 25,   '2019-11-28');
insert into Weather values(7, 22,   '2019-12-01');
insert into Weather values(7, 20,   '2019-12-02');
insert into Weather values(8, 25,   '2019-11-05');
insert into Weather values(8, 27,   '2019-11-15');
insert into Weather values(8, 31,   '2019-11-25');
insert into Weather values(9, 7,    '2019-10-23');
insert into Weather values(9, 3,    '2019-12-23');

-- 核验数据
select * from Countries;
select * from Weather;