/*
 所属项目：SQL-daily-exercises
 所属数据库：SQL_daily_exercises
 语言运行环境：MySQL 8.0
 原题链接：https://leetcode.com/problems/fix-product-name-format/
 创建者：Cicero
 创建日期：2021-12-2
 修改日期：
 */


USE sql_daily_exercises;

drop table if exists Sales;
create table if not exists Sales(
    sale_id         int,
    product_name    varchar(100),
    sale_date       date,
    primary key (sale_id)
);
insert into Sales values(1, '     LCPHONE    ', '2020-01-16');
insert into Sales values(2, '   LCPhone      ', '2020-01-17');
insert into Sales values(3, '    LcPhOnE     ', '2020-02-18');
insert into Sales values(4, '     LCKeyCHAiN ', '2020-02-19');
insert into Sales values(5, '  LCKeyChain    ', '2020-02-28');
insert into Sales values(6, 'Matryoshka      ', '2020-03-31');

-- 核验数据
select * from Sales;
