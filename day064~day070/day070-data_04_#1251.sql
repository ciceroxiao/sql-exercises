/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/average-selling-price/
 创建者：Cicero
 创建日期：2021-11-18
 修改日期：
 */


USE sql_daily_exercises;

drop table if Exists Prices;
create table Prices(
    product_id  int,
    start_date  date,
    end_date    date,
    price       int,
    primary key(product_id, start_date, end_date)
);
insert into Prices values(1, '2019-02-17', '2019-02-28', 5);
insert into Prices values(1, '2019-03-01', '2019-03-22', 20);
insert into Prices values(2, '2019-02-01', '2019-02-20', 15);
insert into Prices values(2, '2019-02-21', '2019-03-31', 30);

drop table if Exists UnitsSold;
create table UnitsSold(
    product_id      int,
    purchase_date   date,
    units           int
);
insert into UnitsSold values(1, '2019-02-25', 100);
insert into UnitsSold values(1, '2019-03-01', 15);
insert into UnitsSold values(2, '2019-02-10', 200);
insert into UnitsSold values(2, '2019-03-22', 30);

-- 核验数据
select * from Prices;
select * from UnitsSold;