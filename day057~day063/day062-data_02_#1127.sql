/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/user-purchase-platform/
 创建者：Cicero
 创建日期：2021-11-12
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Spending;
create table if not exists Spending(
    user_id     int,
    spend_date  date,
    platform    enum('desktop', 'mobile'),
    amount      int,
    Primary Key(user_id, spend_date, platform)
);
insert into Spending values(1, "2019-07-01", 'mobile',  100);
insert into Spending values(1, "2019-07-01", 'desktop', 100);
insert into Spending values(2, "2019-07-01", 'mobile',  100);
insert into Spending values(2, "2019-07-02", 'mobile',  100);
insert into Spending values(3, "2019-07-01", 'desktop', 100);
insert into Spending values(3, "2019-07-02", 'desktop', 100);
