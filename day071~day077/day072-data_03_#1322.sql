/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/ads-performance/
 创建者：Cicero
 创建日期：2021-11-22
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Ads;
create table Ads(
    ad_id   int,
    user_id int,
    action  enum('Clicked', 'Viewed', 'Ignored'),
    primary key(ad_id, user_id)
);
insert into Ads (ad_id, user_id, action) values ('1', '1',  'Clicked');
insert into Ads (ad_id, user_id, action) values ('2', '2',  'Clicked');
insert into Ads (ad_id, user_id, action) values ('3', '3',  'Viewed');
insert into Ads (ad_id, user_id, action) values ('5', '5',  'Ignored');
insert into Ads (ad_id, user_id, action) values ('1', '7',  'Ignored');
insert into Ads (ad_id, user_id, action) values ('2', '7',  'Viewed');
insert into Ads (ad_id, user_id, action) values ('3', '5',  'Clicked');
insert into Ads (ad_id, user_id, action) values ('1', '4',  'Viewed');
insert into Ads (ad_id, user_id, action) values ('2', '11', 'Viewed');
insert into Ads (ad_id, user_id, action) values ('1', '2',  'Clicked');

-- 核验数据
select * from Ads;